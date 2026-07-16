-- TikTok profile link (admin-editable; feeds the footer + sameAs structured data).
alter table public.site_settings
  add column if not exists tiktok_url text default '';
