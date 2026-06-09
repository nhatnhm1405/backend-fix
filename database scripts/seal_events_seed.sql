USE seal_hackathon;

-- =====================================================
-- ADDITIONAL HACKATHON EVENTS SEED
-- Run AFTER the main seed file (seal_seed.sql)
-- created_by → user_id 1 (coordinator)
--
-- Event IDs (auto-increment continues from event_id=1):
--   event_id 2: SEAL FUHCM Spring 2026  → CLOSED  (event cũ)
--   event_id 3: SEAL FUHCM Summer 2026  → OPEN    (đang mở đăng ký)
--   event_id 4: SEAL FUHN Summer 2026   → OPEN    (campus Hà Nội)
--   event_id 5: SEAL FUHCM Fall 2026    → DRAFT
-- =====================================================

INSERT INTO HackathonEvent
  (name, season, year, description,
   registration_start, registration_end,
   start_date, end_date,
   status, created_by)
VALUES
  -- ── event_id 2 ──────────────────────────────────────
  -- Mùa cũ đã kết thúc, dùng để test lịch sử / archive
  ('SEAL FUHCM Spring 2026', 'SPRING', 2026,
   'Sự kiện SEAL Spring 2026 tại FPT University HCM — đã kết thúc. '
   'Mở cho sinh viên FPT và các trường đối tác khu vực phía Nam.',
   '2025-12-15 00:00:00', '2026-01-31 23:59:59',
   '2026-02-01 08:00:00', '2026-04-30 23:59:59',
   'CLOSED', 1),

  -- ── event_id 3 ──────────────────────────────────────
  -- Campus HCM — Hè 2026, đang mở đăng ký
  ('SEAL FUHCM Summer 2026', 'SUMMER', 2026,
   'Sự kiện SEAL Summer 2026 tại FPT University HCM — đang mở đăng ký. '
   'Chủ đề: "Build for Tomorrow" — khuyến khích giải pháp AI và bền vững.',
   '2026-05-01 00:00:00', '2026-06-30 23:59:59',
   '2026-07-01 08:00:00', '2026-09-30 23:59:59',
   'OPEN', 1),

  -- ── event_id 4 ──────────────────────────────────────
  -- Campus Hà Nội — Hè 2026, đang mở đăng ký (song song với HCM)
  ('SEAL FUHN Summer 2026', 'SUMMER', 2026,
   'Sự kiện SEAL Summer 2026 tại FPT University Hà Nội — đang mở đăng ký. '
   'Chủ đề: "Build for Tomorrow" — dành cho sinh viên khu vực phía Bắc và các trường đối tác.',
   '2026-05-15 00:00:00', '2026-07-15 23:59:59',
   '2026-07-20 08:00:00', '2026-09-30 23:59:59',
   'OPEN', 1),

  -- ── event_id 5 ──────────────────────────────────────
  -- Campus HCM — Thu 2026, còn đang lên kế hoạch
  ('SEAL FUHCM Fall 2026', 'FALL', 2026,
   'Sự kiện SEAL Fall 2026 tại FPT University HCM — đang trong giai đoạn lên kế hoạch. '
   'Chủ đề và thể lệ sẽ được công bố sau.',
   '2026-09-01 00:00:00', '2026-10-15 23:59:59',
   '2026-10-20 08:00:00', '2026-12-20 23:59:59',
   'DRAFT', 1);


-- =====================================================
-- TRACKS cho 3 event có nội dung (CLOSED + 2 OPEN)
-- event DRAFT chưa cần track (hoặc thêm sau)
-- =====================================================

-- Tracks cho SEAL FUHCM Spring 2026 (event_id = 2) — đã đóng
INSERT INTO Track (event_id, name, description) VALUES
  (2, 'Web Application', 'Ứng dụng web full-stack'),
  (2, 'Mobile App',      'Ứng dụng di động iOS/Android'),
  (2, 'AI Solution',     'Sản phẩm ứng dụng AI/ML');

-- Tracks cho SEAL FUHCM Summer 2026 (event_id = 3)
INSERT INTO Track (event_id, name, description) VALUES
  (3, 'Web Application', 'Ứng dụng web full-stack'),
  (3, 'AI Solution',     'Sản phẩm ứng dụng AI/ML'),
  (3, 'Social Impact',   'Giải pháp công nghệ cho vấn đề xã hội'),
  (3, 'Green Tech',      'Giải pháp công nghệ xanh, bền vững');

-- Tracks cho SEAL FUHN Summer 2026 (event_id = 4)
INSERT INTO Track (event_id, name, description) VALUES
  (4, 'Web Application', 'Ứng dụng web full-stack'),
  (4, 'AI Solution',     'Sản phẩm ứng dụng AI/ML'),
  (4, 'EdTech',          'Công nghệ giáo dục');


-- =====================================================
-- ROUNDS cho SEAL FUHCM Spring 2026 (event_id = 2)
-- Đã CLOSED → cả 3 rounds đều FINALIZED
-- =====================================================
INSERT INTO Round
  (event_id, name, order_number, start_time, end_time, submission_deadline,
   top_n_advance, is_calibration, status)
VALUES
  (2, 'Preliminary', 1,
   '2026-02-01 08:00:00', '2026-02-28 23:59:59', '2026-02-28 23:59:59',
   5, FALSE, 'FINALIZED'),
  (2, 'Semi-final', 2,
   '2026-03-10 08:00:00', '2026-03-31 23:59:59', '2026-03-31 23:59:59',
   2, FALSE, 'FINALIZED'),
  (2, 'Final', 3,
   '2026-04-10 08:00:00', '2026-04-30 23:59:59', '2026-04-30 23:59:59',
   NULL, FALSE, 'FINALIZED');

-- =====================================================
-- ROUNDS cho SEAL FUHCM Summer 2026 (event_id = 3)
-- Đang OPEN → registration chưa kết thúc, rounds PENDING
-- =====================================================
INSERT INTO Round
  (event_id, name, order_number, start_time, end_time, submission_deadline,
   top_n_advance, is_calibration, status)
VALUES
  (3, 'Preliminary', 1,
   '2026-07-01 08:00:00', '2026-07-31 23:59:59', '2026-07-31 23:59:59',
   5, FALSE, 'PENDING'),
  (3, 'Semi-final', 2,
   '2026-08-10 08:00:00', '2026-08-31 23:59:59', '2026-08-31 23:59:59',
   2, FALSE, 'PENDING'),
  (3, 'Final', 3,
   '2026-09-10 08:00:00', '2026-09-30 23:59:59', '2026-09-30 23:59:59',
   NULL, FALSE, 'PENDING');

-- =====================================================
-- ROUNDS cho SEAL FUHN Summer 2026 (event_id = 4)
-- Đang OPEN → rounds PENDING
-- =====================================================
INSERT INTO Round
  (event_id, name, order_number, start_time, end_time, submission_deadline,
   top_n_advance, is_calibration, status)
VALUES
  (4, 'Preliminary', 1,
   '2026-07-20 08:00:00', '2026-08-15 23:59:59', '2026-08-15 23:59:59',
   5, FALSE, 'PENDING'),
  (4, 'Semi-final', 2,
   '2026-08-25 08:00:00', '2026-09-15 23:59:59', '2026-09-15 23:59:59',
   2, FALSE, 'PENDING'),
  (4, 'Final', 3,
   '2026-09-20 08:00:00', '2026-09-30 23:59:59', '2026-09-30 23:59:59',
   NULL, FALSE, 'PENDING');


-- =====================================================
-- PRIZES template cho các event mới
-- =====================================================

-- Prizes cho SEAL FUHCM Spring 2026 (event_id = 2) — đã closed, giả lập đã trao
INSERT INTO Prize (event_id, track_id, name, description, rank_position, team_id, awarded_at) VALUES
  (2, 4, 'Champion',      'Web Application — Quán quân',     1, NULL, '2026-04-30 18:00:00'),
  (2, 4, '1st Runner-up', 'Web Application — Á quân',        2, NULL, '2026-04-30 18:00:00'),
  (2, 5, 'Champion',      'Mobile App — Quán quân',          1, NULL, '2026-04-30 18:00:00'),
  (2, 6, 'Champion',      'AI Solution — Quán quân',         1, NULL, '2026-04-30 18:00:00'),
  (2, NULL, 'Best Overall', 'Đội xuất sắc nhất FUHCM Spring 2026', 1, NULL, '2026-04-30 18:00:00');

-- Prizes cho SEAL FUHCM Summer 2026 (event_id = 3) — chưa trao
INSERT INTO Prize (event_id, track_id, name, description, rank_position, team_id, awarded_at) VALUES
  (3, 7,  'Champion',      'Web Application — Quán quân',    1, NULL, NULL),
  (3, 7,  '1st Runner-up', 'Web Application — Á quân',       2, NULL, NULL),
  (3, 8,  'Champion',      'AI Solution — Quán quân',        1, NULL, NULL),
  (3, 9,  'Champion',      'Social Impact — Quán quân',      1, NULL, NULL),
  (3, 10, 'Champion',      'Green Tech — Quán quân',         1, NULL, NULL),
  (3, NULL, 'Best Overall', 'Đội xuất sắc nhất FUHCM Summer 2026', 1, NULL, NULL);

-- Prizes cho SEAL FUHN Summer 2026 (event_id = 4) — chưa trao
INSERT INTO Prize (event_id, track_id, name, description, rank_position, team_id, awarded_at) VALUES
  (4, 11, 'Champion',      'Web Application — Quán quân',    1, NULL, NULL),
  (4, 11, '1st Runner-up', 'Web Application — Á quân',       2, NULL, NULL),
  (4, 12, 'Champion',      'AI Solution — Quán quân',        1, NULL, NULL),
  (4, 13, 'Champion',      'EdTech — Quán quân',             1, NULL, NULL),
  (4, NULL, 'Best Overall', 'Đội xuất sắc nhất FUHN Summer 2026', 1, NULL, NULL);


-- =====================================================
-- AUDIT LOG cho các event mới
-- =====================================================
INSERT INTO AuditLog (actor_user_id, action, target_type, target_id, reason, metadata_json, ip_address) VALUES
  (1, 'CREATE_EVENT', 'EVENT', 2, NULL,
   '{"event_name":"SEAL FUHCM Spring 2026","status":"CLOSED"}',    '192.168.1.1'),
  (1, 'CLOSE_EVENT',  'EVENT', 2, 'Sự kiện đã kết thúc theo lịch',
   '{"event_name":"SEAL FUHCM Spring 2026","closed_at":"2026-04-30T23:59:59"}', '192.168.1.1'),
  (1, 'CREATE_EVENT', 'EVENT', 3, NULL,
   '{"event_name":"SEAL FUHCM Summer 2026","status":"OPEN"}',      '192.168.1.1'),
  (1, 'OPEN_EVENT',   'EVENT', 3, 'Mở đăng ký chính thức',
   '{"event_name":"SEAL FUHCM Summer 2026","opened_at":"2026-05-01T00:00:00"}', '192.168.1.1'),
  (1, 'CREATE_EVENT', 'EVENT', 4, NULL,
   '{"event_name":"SEAL FUHN Summer 2026","status":"OPEN"}',       '192.168.1.1'),
  (1, 'OPEN_EVENT',   'EVENT', 4, 'Mở đăng ký chính thức',
   '{"event_name":"SEAL FUHN Summer 2026","opened_at":"2026-05-15T00:00:00"}',  '192.168.1.1'),
  (1, 'CREATE_EVENT', 'EVENT', 5, NULL,
   '{"event_name":"SEAL FUHCM Fall 2026","status":"DRAFT"}',       '192.168.1.1');


-- =====================================================
-- NOTIFICATION cho event OPEN mới
-- =====================================================
INSERT INTO Notification (recipient_user_id, title, content, type, related_event_id) VALUES
  -- Thông báo cho leader hiện có về Summer 2026 HCM
  (5,  'SEAL FUHCM Summer 2026 đã mở đăng ký',
       'Sự kiện SEAL Summer 2026 tại FPT University HCM chính thức mở đăng ký. '
       'Hạn đăng ký: 30/06/2026. Đăng nhập để đăng ký ngay!',
       'ANNOUNCEMENT', 3),
  (8,  'SEAL FUHCM Summer 2026 đã mở đăng ký',
       'Sự kiện SEAL Summer 2026 tại FPT University HCM chính thức mở đăng ký. '
       'Hạn đăng ký: 30/06/2026. Đăng nhập để đăng ký ngay!',
       'ANNOUNCEMENT', 3),
  (11, 'SEAL FUHCM Summer 2026 đã mở đăng ký',
       'Sự kiện SEAL Summer 2026 tại FPT University HCM chính thức mở đăng ký. '
       'Hạn đăng ký: 30/06/2026. Đăng nhập để đăng ký ngay!',
       'ANNOUNCEMENT', 3);
