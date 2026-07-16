-- Rebrand to the burgundy + gold palette.
--   primary  #7B1E2B   deep #4A0E1A   gold #C9A227
--   bg       #FBF6F4   ink  #2A1418
-- Gold / background / ink are fixed design tokens in the frontend; only the
-- admin-controllable colors live in the database (primary, secondary, hero).

-- New defaults for fresh installs
alter table public.site_settings
  alter column primary_color set default '#7B1E2B',
  alter column default_hero_color set default '#7B1E2B';

alter table public.hero_settings
  alter column background_color set default '#7B1E2B';

-- Update the existing singleton row to the new palette, but ONLY if it is still
-- on the original red. This preserves any colours the admin has since tuned.
update public.site_settings
  set primary_color = '#7B1E2B',
      secondary_color = '#FFFFFF',
      default_hero_color = '#7B1E2B'
  where id = 1
    and primary_color = '#E10600';

update public.hero_settings
  set background_color = '#7B1E2B'
  where id = 1
    and (background_color = '#E10600' or background_color is null);
