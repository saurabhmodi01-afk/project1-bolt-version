/*
# Create event_registrations table (single-tenant, no auth)

1. New Tables
- `event_registrations`
  - `id` (uuid, primary key)
  - `name` (text, not null) — participant full name
  - `email` (text, not null) — participant email
  - `phone` (text) — optional phone number
  - `university_id` (text) — student ID / roll number
  - `track` (text, not null) — chosen event track (iron-man, hulk, thor, spider-man)
  - `team_name` (text) — optional team name
  - `message` (text) — optional message
  - `created_at` (timestamptz, default now())

2. Security
- Enable RLS on `event_registrations`.
- Allow anon + authenticated to INSERT (public registration form, no sign-in).
- Allow anon + authenticated to SELECT count only via the app (we allow SELECT for simplicity in a public event registration demo).
*/

CREATE TABLE IF NOT EXISTS event_registrations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL,
  phone text,
  university_id text,
  track text NOT NULL,
  team_name text,
  message text,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE event_registrations ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "anon_select_registrations" ON event_registrations;
CREATE POLICY "anon_select_registrations"
ON event_registrations FOR SELECT
TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "anon_insert_registrations" ON event_registrations;
CREATE POLICY "anon_insert_registrations"
ON event_registrations FOR INSERT
TO anon, authenticated WITH CHECK (true);
