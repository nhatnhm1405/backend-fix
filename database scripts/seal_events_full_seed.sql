USE seal_hackathon;

-- =====================================================
-- SEAL — FULL DATA SEED cho event_id 2, 3, 4, 5
-- Run AFTER:
--   1. seal_hackathon.sql   (schema)
--   2. seal_seed.sql        (seed gốc — event_id 1, user_id 1-12)
--   3. seal_events_seed.sql (4 event mới + tracks + rounds)
-- =====================================================


-- =====================================================
-- THÊM USERS mới cho event 2, 3, 4
-- user_id tự tăng từ 13 trở đi
-- ALL password: Test@1234 (BCrypt cost 10)
-- =====================================================
INSERT INTO `User` (email, password_hash, full_name, user_type, student_id, university, is_approved, is_active) VALUES

  -- ── Dùng cho event 2 (FUHCM Spring 2026 - CLOSED) ──
  -- user_id 13: FPT_STUDENT leader
  ('leader3@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Bui Thi Thu', 'FPT_STUDENT', 'SE211001', NULL, TRUE, TRUE),

  -- user_id 14: FPT_STUDENT member
  ('member5@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Ngo Van Hieu', 'FPT_STUDENT', 'HE201002', NULL, TRUE, TRUE),

  -- user_id 15: FPT_STUDENT leader
  ('leader4@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Tran Thi Mai', 'FPT_STUDENT', 'DE211003', NULL, TRUE, TRUE),

  -- user_id 16: EXTERNAL_STUDENT member (UIT)
  ('member6@uit.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Dang Van Tuan', 'EXTERNAL_STUDENT', 'UIT2100301', 'UIT', TRUE, TRUE),

  -- user_id 17: FPT_STUDENT leader (top winner event 2)
  ('leader5@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Le Van Nam', 'FPT_STUDENT', 'CE211004', NULL, TRUE, TRUE),

  -- user_id 18: FPT_STUDENT member
  ('member7@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Hoang Thi Ly', 'FPT_STUDENT', 'SE201005', NULL, TRUE, TRUE),

  -- user_id 19: STAFF — Internal judge cho event 2 (thêm giám khảo nữa)
  ('judge.cam@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Nguyen Thi Cam', 'STAFF', NULL, NULL, TRUE, TRUE),

  -- ── Dùng cho event 3 (FUHCM Summer 2026 - OPEN) ──
  -- user_id 20: FPT_STUDENT leader (đã đăng ký Summer)
  ('leader6@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Pham Van Dat', 'FPT_STUDENT', 'SE211006', NULL, TRUE, TRUE),

  -- user_id 21: FPT_STUDENT member
  ('member8@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Vo Thi Lan', 'FPT_STUDENT', 'HE211007', NULL, TRUE, TRUE),

  -- user_id 22: FPT_STUDENT member
  ('member9@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Nguyen Van Phuc', 'FPT_STUDENT', 'AI211008', NULL, TRUE, TRUE),

  -- user_id 23: EXTERNAL_STUDENT leader (chưa approved — test pending flow)
  ('leader7@hust.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Dinh Van Khang', 'EXTERNAL_STUDENT', 'HUST2100901', 'HUST', FALSE, TRUE),

  -- ── Dùng cho event 4 (FUHN Summer 2026 - OPEN) ──
  -- user_id 24: FPT_STUDENT leader (campus HN)
  ('leader8@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Tran Van Quan', 'FPT_STUDENT', 'SE211010', NULL, TRUE, TRUE),

  -- user_id 25: FPT_STUDENT member (campus HN)
  ('member10@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Nguyen Thi Bich', 'FPT_STUDENT', 'HE211011', NULL, TRUE, TRUE),

  -- user_id 26: STAFF — Mentor cho event 3 & 4
  ('mentor.hung@fpt.edu.vn',
   '$2a$10$eMfJGvnhoPcIlzEvQ5FPmunpn/DSf1KK.u89I.LtAR3v6sXeESFK.',
   'Nguyen Minh Hung', 'STAFF', NULL, NULL, TRUE, TRUE);


-- =====================================================
-- USER EVENT ROLE cho event 2, 3, 4, 5
-- role_id: 1=EVENT_COORDINATOR, 2=MENTOR, 3=JUDGE
-- Lưu ý track_id & round_id tương ứng với event mới:
--   Event 2 tracks: 4=Web, 5=Mobile, 6=AI  | rounds: 4=Prelim, 5=Semi, 6=Final
--   Event 3 tracks: 7=Web, 8=AI, 9=Social, 10=Green | rounds: 7=Prelim, 8=Semi, 9=Final
--   Event 4 tracks: 11=Web, 12=AI, 13=EdTech | rounds: 10=Prelim, 11=Semi, 12=Final
--   Event 5: chưa có track/round
-- =====================================================
INSERT INTO UserEventRole (user_id, role_id, event_id, track_id, round_id, judge_type, assigned_by) VALUES

  -- ── EVENT 2 (CLOSED) ──
  -- Coordinator
  (1,  1, 2, NULL, NULL, NULL,       1),
  -- Thầy An: MENTOR Web App
  (2,  2, 2, 4,    NULL, NULL,       1),
  -- Thầy Binh: JUDGE Web App, Preliminary (INTERNAL)
  (3,  3, 2, 4,    4,    'INTERNAL', 1),
  -- Thầy Binh: JUDGE Web App, Semi-final (INTERNAL)
  (3,  3, 2, 4,    5,    'INTERNAL', 1),
  -- Thầy Binh: JUDGE Web App, Final (INTERNAL)
  (3,  3, 2, 4,    6,    'INTERNAL', 1),
  -- Cô Cam: JUDGE Mobile App, tất cả rounds (INTERNAL)
  (19, 3, 2, 5,    4,    'INTERNAL', 1),
  (19, 3, 2, 5,    5,    'INTERNAL', 1),
  (19, 3, 2, 5,    6,    'INTERNAL', 1),
  -- Thầy An: JUDGE AI Solution, Preliminary (INTERNAL)
  (2,  3, 2, 6,    4,    'INTERNAL', 1),
  -- Guest judge: JUDGE AI Solution, Preliminary (GUEST)
  (4,  3, 2, 6,    4,    'GUEST',    1),

  -- ── EVENT 3 (OPEN - FUHCM Summer) ──
  (1,  1, 3, NULL, NULL, NULL,       1),
  -- Thầy Hung: MENTOR Web App
  (26, 2, 3, 7,    NULL, NULL,       1),
  -- Thầy An: MENTOR AI Solution
  (2,  2, 3, 8,    NULL, NULL,       1),

  -- ── EVENT 4 (OPEN - FUHN Summer) ──
  (1,  1, 4, NULL, NULL, NULL,       1),
  -- Thầy Hung: MENTOR Web App
  (26, 2, 4, 11,   NULL, NULL,       1),
  -- Cô Cam: MENTOR EdTech
  (19, 2, 4, 13,   NULL, NULL,       1),

  -- ── EVENT 5 (DRAFT) ──
  (1,  1, 5, NULL, NULL, NULL,       1);


-- =====================================================
-- TEAM & TEAM MEMBER cho EVENT 2 (CLOSED)
-- 5 teams (Preliminary top_n_advance=5, Semi=2, Final champion=1)
-- track 4=Web, 5=Mobile, 6=AI
-- =====================================================
INSERT INTO Team (event_id, track_id, name, description, status) VALUES
  (2, 4, 'Team Phoenix',  'Web app quản lý ký túc xá thông minh',    'APPROVED'),  -- team_id 5
  (2, 4, 'Team Dragon',   'Nền tảng học tập trực tuyến',              'APPROVED'),  -- team_id 6
  (2, 5, 'Team Tiger',    'App theo dõi sức khỏe sinh viên',          'APPROVED'),  -- team_id 7
  (2, 6, 'Team Eagle',    'AI chấm điểm bài tập tự động',             'APPROVED'),  -- team_id 8
  (2, 4, 'Team Falcon',   'Web marketplace trao đổi sách cũ',         'APPROVED');  -- team_id 9

INSERT INTO TeamMember (team_id, user_id, member_role) VALUES
  (5, 5,  'LEADER'), -- Hoang Van Leader (dùng lại từ event 1)
  (5, 13, 'MEMBER'), -- Bui Thi Thu
  (5, 14, 'MEMBER'), -- Ngo Van Hieu
  (6, 15, 'LEADER'), -- Tran Thi Mai
  (6, 16, 'MEMBER'), -- Dang Van Tuan
  (7, 11, 'LEADER'), -- Pham Thi Bich (dùng lại từ event 1)
  (7, 12, 'MEMBER'), -- Nguyen Van Khoa
  (8, 17, 'LEADER'), -- Le Van Nam
  (8, 18, 'MEMBER'), -- Hoang Thi Ly
  (9, 8,  'LEADER'), -- Do Van Long (dùng lại từ event 1)
  (9, 9,  'MEMBER'); -- Vo Thi Hoa


-- =====================================================
-- SCORING CRITERIA cho event 2
-- Dùng lại template_id=1, thêm criteria mới theo round 4,5,6
-- =====================================================
INSERT INTO ScoringCriteria (event_id, round_id, template_id, name, description, weight, max_score, order_number) VALUES
  -- Round 4 (Preliminary event 2)
  (2, 4, 1, 'Innovation',    'Tính sáng tạo và độc đáo của ý tưởng',   1.5, 10.0, 1),
  (2, 4, 1, 'Technical',     'Chất lượng kỹ thuật và implementation',   2.0, 10.0, 2),
  (2, 4, 1, 'UI/UX',         'Giao diện và trải nghiệm người dùng',     1.0, 10.0, 3),
  (2, 4, 1, 'Presentation',  'Kỹ năng thuyết trình và demo',            1.0, 10.0, 4),
  (2, 4, 1, 'Completeness',  'Mức độ hoàn thiện của sản phẩm',         1.5, 10.0, 5),
  -- Round 5 (Semi-final event 2) — thêm tiêu chí Market Viability
  (2, 5, 1, 'Innovation',    'Tính sáng tạo và độc đáo của ý tưởng',   1.5, 10.0, 1),
  (2, 5, 1, 'Technical',     'Chất lượng kỹ thuật và implementation',   2.0, 10.0, 2),
  (2, 5, 1, 'UI/UX',         'Giao diện và trải nghiệm người dùng',     1.0, 10.0, 3),
  (2, 5, 1, 'Presentation',  'Kỹ năng thuyết trình và demo',            1.5, 10.0, 4),
  (2, 5, 1, 'Market',        'Tiềm năng thị trường và khả năng scale',  1.0, 10.0, 5),
  -- Round 6 (Final event 2) — tiêu chí tương tự Semi
  (2, 6, 1, 'Innovation',    'Tính sáng tạo và độc đáo của ý tưởng',   1.5, 10.0, 1),
  (2, 6, 1, 'Technical',     'Chất lượng kỹ thuật và implementation',   2.0, 10.0, 2),
  (2, 6, 1, 'UI/UX',         'Giao diện và trải nghiệm người dùng',     1.0, 10.0, 3),
  (2, 6, 1, 'Presentation',  'Kỹ năng thuyết trình và demo',            1.5, 10.0, 4),
  (2, 6, 1, 'Market',        'Tiềm năng thị trường và khả năng scale',  1.0, 10.0, 5);


-- =====================================================
-- SUBMISSION cho event 2
-- Preliminary (round_id=4): cả 5 teams nộp
-- Semi-final  (round_id=5): top 2 Web = team 5 (Phoenix) & team 6 (Dragon), team 7 (Tiger Mobile)
-- Final       (round_id=6): winner từ mỗi track
-- =====================================================
INSERT INTO Submission (team_id, round_id, repo_url, demo_url, slide_url, submitted_by, status) VALUES
  -- Preliminary round (round_id=4)
  (5, 4, 'https://github.com/team-phoenix/seal-spring-2026', 'https://demo.teamphoenix.io', 'https://slides.com/phoenix-seal', 5,  'SUBMITTED'),  -- sub_id 4
  (6, 4, 'https://github.com/team-dragon/seal-spring-2026',  'https://demo.teamdragon.io',  'https://slides.com/dragon-seal',  15, 'SUBMITTED'),  -- sub_id 5
  (7, 4, 'https://github.com/team-tiger/seal-spring-2026',   'https://demo.teamtiger.io',   'https://slides.com/tiger-seal',   11, 'SUBMITTED'),  -- sub_id 6
  (8, 4, 'https://github.com/team-eagle/seal-spring-2026',   'https://demo.teameagle.io',   'https://slides.com/eagle-seal',   17, 'SUBMITTED'),  -- sub_id 7
  (9, 4, 'https://github.com/team-falcon/seal-spring-2026',  'https://demo.teamfalcon.io',  'https://slides.com/falcon-seal',  8,  'SUBMITTED'),  -- sub_id 8
  -- Semi-final round (round_id=5): Phoenix & Dragon (Web), Tiger (Mobile), Eagle (AI)
  (5, 5, 'https://github.com/team-phoenix/seal-spring-2026', 'https://demo.teamphoenix.io/v2', 'https://slides.com/phoenix-semi', 5,  'SUBMITTED'),  -- sub_id 9
  (6, 5, 'https://github.com/team-dragon/seal-spring-2026',  'https://demo.teamdragon.io/v2',  'https://slides.com/dragon-semi',  15, 'SUBMITTED'),  -- sub_id 10
  (7, 5, 'https://github.com/team-tiger/seal-spring-2026',   'https://demo.teamtiger.io/v2',   'https://slides.com/tiger-semi',   11, 'SUBMITTED'),  -- sub_id 11
  (8, 5, 'https://github.com/team-eagle/seal-spring-2026',   'https://demo.teameagle.io/v2',   'https://slides.com/eagle-semi',   17, 'SUBMITTED'),  -- sub_id 12
  -- Final round (round_id=6): Phoenix (Web Champion), Tiger (Mobile Champion), Eagle (AI Champion)
  (5, 6, 'https://github.com/team-phoenix/seal-spring-2026', 'https://demo.teamphoenix.io/final', 'https://slides.com/phoenix-final', 5,  'SUBMITTED'),  -- sub_id 13
  (7, 6, 'https://github.com/team-tiger/seal-spring-2026',   'https://demo.teamtiger.io/final',   'https://slides.com/tiger-final',   11, 'SUBMITTED'),  -- sub_id 14
  (8, 6, 'https://github.com/team-eagle/seal-spring-2026',   'https://demo.teameagle.io/final',   'https://slides.com/eagle-final',   17, 'SUBMITTED');  -- sub_id 15


-- =====================================================
-- SCORE cho event 2
-- criteria_id mapping (từ INSERT ScoringCriteria event 2 ở trên):
--   Round 4 Prelim:  criteria 6=Innov, 7=Tech, 8=UX, 9=Pres, 10=Complete
--   Round 5 Semi:    criteria 11=Innov, 12=Tech, 13=UX, 14=Pres, 15=Market
--   Round 6 Final:   criteria 16=Innov, 17=Tech, 18=UX, 19=Pres, 20=Market
-- =====================================================

-- ── Preliminary: Thầy Binh chấm Web (sub 4=Phoenix, 5=Dragon, 8=Falcon)
INSERT INTO Score (submission_id, judge_user_id, criteria_id, value, comment, is_draft) VALUES
  -- Binh chấm Phoenix (sub 4)
  (4, 3, 6,  9.0, 'Ý tưởng KTX thông minh rất thực tiễn',     FALSE),
  (4, 3, 7,  9.5, 'Code sạch, kiến trúc tốt, có CI/CD',        FALSE),
  (4, 3, 8,  8.5, 'UI hiện đại, UX mượt mà',                   FALSE),
  (4, 3, 9,  9.0, 'Demo live rất ấn tượng',                     FALSE),
  (4, 3, 10, 9.0, 'Sản phẩm gần như hoàn chỉnh',               FALSE),
  -- Binh chấm Dragon (sub 5)
  (5, 3, 6,  7.5, 'Ý tưởng học tập trực tuyến khá phổ biến',   FALSE),
  (5, 3, 7,  8.0, 'Backend ổn định, có authentication',         FALSE),
  (5, 3, 8,  8.5, 'UI đẹp, responsive tốt',                     FALSE),
  (5, 3, 9,  7.5, 'Trình bày ổn',                               FALSE),
  (5, 3, 10, 7.5, 'Còn thiếu tính năng thanh toán',             FALSE),
  -- Binh chấm Falcon (sub 8)
  (8, 3, 6,  7.0, 'Ý tưởng marketplace bình thường',            FALSE),
  (8, 3, 7,  7.5, 'Kỹ thuật cơ bản, thiếu tối ưu',              FALSE),
  (8, 3, 8,  7.0, 'UI cần cải thiện thêm',                      FALSE),
  (8, 3, 9,  7.5, 'Demo khá ổn',                                FALSE),
  (8, 3, 10, 6.5, 'Còn nhiều tính năng dở dang',                FALSE);

-- ── Preliminary: Cô Cam chấm Mobile (sub 6=Tiger)
INSERT INTO Score (submission_id, judge_user_id, criteria_id, value, comment, is_draft) VALUES
  (6, 19, 6,  8.0, 'Ý tưởng health tracking thực tế',           FALSE),
  (6, 19, 7,  8.5, 'Native app, performance tốt',               FALSE),
  (6, 19, 8,  9.0, 'UI mobile rất đẹp, UX tự nhiên',            FALSE),
  (6, 19, 9,  8.0, 'Thuyết trình tự tin',                       FALSE),
  (6, 19, 10, 7.5, 'Thiếu tính năng sync cloud',                FALSE);

-- ── Preliminary: Thầy An chấm AI (sub 7=Eagle) + Guest judge
INSERT INTO Score (submission_id, judge_user_id, criteria_id, value, comment, is_draft) VALUES
  -- An chấm Eagle (sub 7)
  (7, 2, 6,  8.5, 'Ứng dụng AI vào chấm bài rất sáng tạo',     FALSE),
  (7, 2, 7,  8.0, 'Model NLP đạt accuracy khá',                 FALSE),
  (7, 2, 8,  7.5, 'UI teacher dashboard cần cải thiện',         FALSE),
  (7, 2, 9,  8.0, 'Demo live AI chạy tốt',                      FALSE),
  (7, 2, 10, 7.0, 'Chưa có tính năng phân tích báo cáo',        FALSE),
  -- Guest chấm Eagle (sub 7)
  (7, 4, 6,  9.0, 'Very innovative use of NLP',                  FALSE),
  (7, 4, 7,  8.0, 'Good model performance',                      FALSE),
  (7, 4, 8,  7.0, 'UI needs improvement',                        FALSE),
  (7, 4, 9,  8.5, 'Great live demo',                             FALSE),
  (7, 4, 10, 7.5, 'Core features solid',                         FALSE);

-- ── Semi-final: Binh chấm Phoenix & Dragon (sub 9,10), Cam chấm Tiger (sub 11), An chấm Eagle (sub 12)
INSERT INTO Score (submission_id, judge_user_id, criteria_id, value, comment, is_draft) VALUES
  -- Binh chấm Phoenix semi (sub 9) — criteria 11-15
  (9,  3, 11, 9.0, 'Phát triển thêm nhiều tính năng mới',       FALSE),
  (9,  3, 12, 9.5, 'Refactor tốt, thêm unit test',              FALSE),
  (9,  3, 13, 9.0, 'UX cải thiện rõ rệt',                       FALSE),
  (9,  3, 14, 9.0, 'Pitch deck chuyên nghiệp',                   FALSE),
  (9,  3, 15, 8.5, 'Có kế hoạch triển khai thực tế',            FALSE),
  -- Binh chấm Dragon semi (sub 10)
  (10, 3, 11, 8.0, 'Bổ sung thêm tính năng quiz',               FALSE),
  (10, 3, 12, 8.5, 'Thêm payment integration',                   FALSE),
  (10, 3, 13, 8.5, 'Dark mode mới trông chuyên nghiệp',          FALSE),
  (10, 3, 14, 8.0, 'Cải thiện so với vòng trước',                FALSE),
  (10, 3, 15, 7.5, 'Thị trường cạnh tranh cao',                  FALSE),
  -- Cam chấm Tiger semi (sub 11)
  (11, 19, 11, 8.5, 'Thêm tích hợp wearable device',            FALSE),
  (11, 19, 12, 9.0, 'Performance cải thiện đáng kể',             FALSE),
  (11, 19, 13, 9.0, 'UI được polish kỹ',                         FALSE),
  (11, 19, 14, 8.0, 'Demo wearable rất ấn tượng',                FALSE),
  (11, 19, 15, 8.0, 'Tiềm năng mở rộng tốt',                    FALSE),
  -- An chấm Eagle semi (sub 12)
  (12, 2, 11, 9.0, 'Model accuracy tăng lên 92%',                FALSE),
  (12, 2, 12, 8.5, 'Thêm API integration với LMS',               FALSE),
  (12, 2, 13, 8.0, 'Dashboard analytics mới rất hữu ích',        FALSE),
  (12, 2, 14, 8.5, 'Giải thích model AI rất thuyết phục',        FALSE),
  (12, 2, 15, 8.0, 'Thị trường EdTech tiềm năng',               FALSE);

-- ── Final: Binh chấm Phoenix (sub 13), Cam chấm Tiger (sub 14), An+Guest chấm Eagle (sub 15)
INSERT INTO Score (submission_id, judge_user_id, criteria_id, value, comment, is_draft) VALUES
  -- Binh chấm Phoenix final (sub 13) — criteria 16-20
  (13, 3, 16, 9.5, 'Sản phẩm xuất sắc, rất sáng tạo',          FALSE),
  (13, 3, 17, 9.5, 'Kiến trúc microservice hoàn chỉnh',         FALSE),
  (13, 3, 18, 9.0, 'UI/UX đạt chuẩn production',                FALSE),
  (13, 3, 19, 9.5, 'Pitch hoàn hảo, Q&A trả lời tốt',           FALSE),
  (13, 3, 20, 9.0, 'Kế hoạch go-to-market chi tiết',            FALSE),
  -- Cam chấm Tiger final (sub 14)
  (14, 19, 16, 8.5, 'Sản phẩm health tech hoàn thiện',          FALSE),
  (14, 19, 17, 9.0, 'Native app performance xuất sắc',           FALSE),
  (14, 19, 18, 9.5, 'UX mobile tốt nhất trong tất cả team',     FALSE),
  (14, 19, 19, 8.5, 'Demo wearable trực tiếp gây ấn tượng',     FALSE),
  (14, 19, 20, 8.0, 'Thị trường rộng nhưng cạnh tranh cao',     FALSE),
  -- An chấm Eagle final (sub 15)
  (15, 2, 16, 9.0, 'AI grading là giải pháp rất cần thiết',     FALSE),
  (15, 2, 17, 8.5, 'Model fine-tuned tốt, latency thấp',        FALSE),
  (15, 2, 18, 8.5, 'Teacher UX cải thiện nhiều',                 FALSE),
  (15, 2, 19, 9.0, 'Thuyết trình mạch lạc, có số liệu rõ ràng', FALSE),
  (15, 2, 20, 9.0, 'EdTech market rất tiềm năng',               FALSE),
  -- Guest chấm Eagle final (sub 15)
  (15, 4, 16, 9.5, 'Most innovative solution overall',           FALSE),
  (15, 4, 17, 8.5, 'Robust API and model pipeline',             FALSE),
  (15, 4, 18, 8.0, 'Good but could be more intuitive',          FALSE),
  (15, 4, 19, 9.5, 'Best presentation of the final round',      FALSE),
  (15, 4, 20, 9.0, 'Clear monetization strategy',               FALSE);


-- =====================================================
-- ROUND RESULT cho event 2
-- Tính điểm có trọng số (weight × value), tổng hợp theo công thức:
--   Weighted sum = Σ(value_i × weight_i) / Σ(weight_i) × max_score (nếu normalize)
--   Ở đây dùng raw weighted sum để nhất quán với event 1
--
-- Preliminary (round 4, top_n=5 → all advance):
--   Phoenix (sub4, Binh): 9*1.5+9.5*2+8.5*1+9*1+9*1.5 = 13.5+19+8.5+9+13.5 = 63.5
--   Dragon  (sub5, Binh): 7.5*1.5+8*2+8.5*1+7.5*1+7.5*1.5 = 11.25+16+8.5+7.5+11.25 = 54.5
--   Tiger   (sub6, Cam):  8*1.5+8.5*2+9*1+8*1+7.5*1.5 = 12+17+9+8+11.25 = 57.25
--   Eagle   (sub7, An+Guest avg): An=8.5*1.5+8*2+7.5*1+8*1+7*1.5=12.75+16+7.5+8+10.5=54.75
--                                  Guest=9*1.5+8*2+7*1+8.5*1+7.5*1.5=13.5+16+7+8.5+11.25=56.25
--                                  avg = (54.75+56.25)/2 = 55.5
--   Falcon  (sub8, Binh): 7*1.5+7.5*2+7*1+7.5*1+6.5*1.5 = 10.5+15+7+7.5+9.75 = 49.75
-- =====================================================
INSERT INTO RoundResult (team_id, round_id, total_score, rank_position, advanced, is_published, finalized_at, finalized_by) VALUES
  -- Preliminary (round 4), top_n=5 → all 5 advance
  (5, 4, 63.50, 1, TRUE, TRUE, '2026-02-28 22:00:00', 1),  -- Phoenix
  (7, 4, 57.25, 2, TRUE, TRUE, '2026-02-28 22:00:00', 1),  -- Tiger
  (8, 4, 55.50, 3, TRUE, TRUE, '2026-02-28 22:00:00', 1),  -- Eagle
  (6, 4, 54.50, 4, TRUE, TRUE, '2026-02-28 22:00:00', 1),  -- Dragon
  (9, 4, 49.75, 5, TRUE, TRUE, '2026-02-28 22:00:00', 1),  -- Falcon (5th, loại sau vì top_n=2 per track ở semi)

  -- Semi-final (round 5), top_n=2 overall:
  -- Phoenix semi (sub9, Binh): 9*1.5+9.5*2+9*1+9*1.5+8.5*1 = 13.5+19+9+13.5+8.5 = 63.5
  -- Dragon  semi (sub10, Binh): 8*1.5+8.5*2+8.5*1+8*1.5+7.5*1 = 12+17+8.5+12+7.5 = 57.0
  -- Tiger   semi (sub11, Cam): 8.5*1.5+9*2+9*1+8*1.5+8*1 = 12.75+18+9+12+8 = 59.75
  -- Eagle   semi (sub12, An): 9*1.5+8.5*2+8*1+8.5*1.5+8*1 = 13.5+17+8+12.75+8 = 59.25
  (5, 5, 63.50, 1, TRUE, TRUE, '2026-03-31 22:00:00', 1),  -- Phoenix → Final
  (7, 5, 59.75, 2, TRUE, TRUE, '2026-03-31 22:00:00', 1),  -- Tiger → Final
  (8, 5, 59.25, 3, FALSE, TRUE, '2026-03-31 22:00:00', 1), -- Eagle (dừng... nhưng vì khác track → tham gia Final)
  (6, 5, 57.00, 4, FALSE, TRUE, '2026-03-31 22:00:00', 1), -- Dragon loại

  -- Final (round 6):
  -- Phoenix final (sub13, Binh): 9.5*1.5+9.5*2+9*1+9.5*1.5+9*1 = 14.25+19+9+14.25+9 = 65.5
  -- Tiger   final (sub14, Cam):  8.5*1.5+9*2+9.5*1+8.5*1.5+8*1 = 12.75+18+9.5+12.75+8 = 61.0
  -- Eagle   final (sub15, An+Guest avg): An=9*1.5+8.5*2+8.5*1+9*1.5+9*1=13.5+17+8.5+13.5+9=61.5
  --                                       Guest=9.5*1.5+8.5*2+8*1+9.5*1.5+9*1=14.25+17+8+14.25+9=62.5
  --                                       avg=62.0
  (5, 6, 65.50, 1, TRUE,  TRUE, '2026-04-30 20:00:00', 1),  -- Phoenix 🏆 Web Champion
  (8, 6, 62.00, 2, FALSE, TRUE, '2026-04-30 20:00:00', 1),  -- Eagle 🏆 AI Champion
  (7, 6, 61.00, 3, FALSE, TRUE, '2026-04-30 20:00:00', 1);  -- Tiger 🏆 Mobile Champion


-- =====================================================
-- CẬP NHẬT PRIZE event 2 — gán team thắng & awarded_at
-- Prize track_id 4=Web, 5=Mobile, 6=AI (từ file events_seed)
-- Chú ý: dùng WHERE để không phụ thuộc prize_id cụ thể
-- =====================================================
UPDATE Prize
SET team_id = 5, awarded_at = '2026-04-30 20:00:00'
WHERE event_id = 2 AND track_id = 4 AND rank_position = 1;  -- Phoenix: Web Champion

UPDATE Prize
SET team_id = 6, awarded_at = '2026-04-30 20:00:00'
WHERE event_id = 2 AND track_id = 4 AND rank_position = 2;  -- Dragon: Web 1st Runner-up

UPDATE Prize
SET team_id = 7, awarded_at = '2026-04-30 20:00:00'
WHERE event_id = 2 AND track_id = 5 AND rank_position = 1;  -- Tiger: Mobile Champion

UPDATE Prize
SET team_id = 8, awarded_at = '2026-04-30 20:00:00'
WHERE event_id = 2 AND track_id = 6 AND rank_position = 1;  -- Eagle: AI Champion

UPDATE Prize
SET team_id = 5, awarded_at = '2026-04-30 20:00:00'
WHERE event_id = 2 AND track_id IS NULL AND rank_position = 1;  -- Phoenix: Best Overall


-- =====================================================
-- TEAM & TEAM MEMBER cho EVENT 3 (FUHCM Summer - OPEN)
-- Đang giai đoạn đăng ký → mix APPROVED + PENDING
-- =====================================================
INSERT INTO Team (event_id, track_id, name, description, status) VALUES
  (3, 7,  'Team Horizon',  'Web app hỗ trợ tìm việc làm cho sinh viên', 'APPROVED'),  -- team_id 10
  (3, 8,  'Team Nexus',    'AI tóm tắt tài liệu học tập tự động',       'APPROVED'),  -- team_id 11
  (3, 9,  'Team Verde',    'App kết nối tình nguyện viên và dự án xã hội','APPROVED'), -- team_id 12
  (3, 10, 'Team EcoSmart', 'IoT monitoring chất lượng không khí campus', 'PENDING'),   -- team_id 13
  (3, 7,  'Team Pixel',    'Platform thiết kế portfolio cho sinh viên',  'PENDING');   -- team_id 14

INSERT INTO TeamMember (team_id, user_id, member_role) VALUES
  (10, 20, 'LEADER'), -- Pham Van Dat
  (10, 21, 'MEMBER'), -- Vo Thi Lan
  (10, 22, 'MEMBER'), -- Nguyen Van Phuc
  (11, 5,  'LEADER'), -- Hoang Van Leader (đa event)
  (11, 6,  'MEMBER'), -- Nguyen Thi Lan
  (12, 11, 'LEADER'), -- Pham Thi Bich (đa event)
  (12, 12, 'MEMBER'), -- Nguyen Van Khoa
  (13, 23, 'LEADER'), -- Dinh Van Khang (chưa approved)
  (14, 17, 'LEADER'), -- Le Van Nam
  (14, 18, 'MEMBER'); -- Hoang Thi Ly


-- =====================================================
-- TEAM & TEAM MEMBER cho EVENT 4 (FUHN Summer - OPEN)
-- Mới mở, ít team hơn
-- =====================================================
INSERT INTO Team (event_id, track_id, name, description, status) VALUES
  (4, 11, 'Team Polaris', 'Web platform kết nối mentor và sinh viên HN', 'APPROVED'),  -- team_id 15
  (4, 12, 'Team Aurora',  'AI chatbot tư vấn tuyển sinh đại học',        'APPROVED'),  -- team_id 16
  (4, 13, 'Team Spark',   'LMS gamification cho học sinh cấp 3',         'PENDING');   -- team_id 17

INSERT INTO TeamMember (team_id, user_id, member_role) VALUES
  (15, 24, 'LEADER'), -- Tran Van Quan
  (15, 25, 'MEMBER'), -- Nguyen Thi Bich
  (16, 8,  'LEADER'), -- Do Van Long (đa event)
  (16, 9,  'MEMBER'), -- Vo Thi Hoa
  (17, 13, 'LEADER'), -- Bui Thi Thu
  (17, 14, 'MEMBER'); -- Ngo Van Hieu


-- =====================================================
-- NOTIFICATION bổ sung
-- =====================================================
INSERT INTO Notification (recipient_user_id, title, content, type, related_event_id) VALUES
  -- Event 2 kết thúc
  (5,  'SEAL FUHCM Spring 2026 đã kết thúc — Team Phoenix đoạt giải Quán quân!',
       'Chúc mừng Team Phoenix đã xuất sắc giành giải Champion hạng Web Application '
       'và Best Overall tại SEAL FUHCM Spring 2026!', 'RESULT', 2),
  (17, 'SEAL FUHCM Spring 2026 đã kết thúc — Team Eagle đoạt giải AI Champion!',
       'Chúc mừng Team Eagle đã xuất sắc giành giải Champion hạng AI Solution!', 'RESULT', 2),
  (11, 'SEAL FUHCM Spring 2026 đã kết thúc — Team Tiger đoạt giải Mobile Champion!',
       'Chúc mừng Team Tiger đã xuất sắc giành giải Champion hạng Mobile App!', 'RESULT', 2),
  -- Event 3 team approved
  (20, 'Team Horizon đã được duyệt',
       'Team của bạn đã được ban tổ chức phê duyệt tham gia SEAL FUHCM Summer 2026.', 'APPROVAL', 3),
  (5,  'Team Nexus đã được duyệt',
       'Team của bạn đã được ban tổ chức phê duyệt tham gia SEAL FUHCM Summer 2026.', 'APPROVAL', 3),
  (11, 'Team Verde đã được duyệt',
       'Team của bạn đã được ban tổ chức phê duyệt tham gia SEAL FUHCM Summer 2026.', 'APPROVAL', 3),
  -- Event 4 team approved
  (24, 'Team Polaris đã được duyệt',
       'Team của bạn đã được ban tổ chức phê duyệt tham gia SEAL FUHN Summer 2026.', 'APPROVAL', 4),
  (8,  'Team Aurora đã được duyệt',
       'Team của bạn đã được ban tổ chức phê duyệt tham gia SEAL FUHN Summer 2026.', 'APPROVAL', 4);


-- =====================================================
-- AUDIT LOG bổ sung cho event 2 (team approvals, results)
-- =====================================================
INSERT INTO AuditLog (actor_user_id, action, target_type, target_id, reason, metadata_json, ip_address) VALUES
  (1, 'APPROVE_TEAM',   'TEAM',  5, NULL,
   '{"team_name":"Team Phoenix","event_id":2,"before":"PENDING","after":"APPROVED"}', '192.168.1.1'),
  (1, 'APPROVE_TEAM',   'TEAM',  6, NULL,
   '{"team_name":"Team Dragon","event_id":2,"before":"PENDING","after":"APPROVED"}',  '192.168.1.1'),
  (1, 'APPROVE_TEAM',   'TEAM',  7, NULL,
   '{"team_name":"Team Tiger","event_id":2,"before":"PENDING","after":"APPROVED"}',   '192.168.1.1'),
  (1, 'APPROVE_TEAM',   'TEAM',  8, NULL,
   '{"team_name":"Team Eagle","event_id":2,"before":"PENDING","after":"APPROVED"}',   '192.168.1.1'),
  (1, 'APPROVE_TEAM',   'TEAM',  9, NULL,
   '{"team_name":"Team Falcon","event_id":2,"before":"PENDING","after":"APPROVED"}',  '192.168.1.1'),
  (1, 'PUBLISH_RESULT', 'ROUND', 4, NULL,
   '{"round_name":"Preliminary","event_id":2,"published_at":"2026-02-28T22:00:00"}',  '192.168.1.1'),
  (1, 'PUBLISH_RESULT', 'ROUND', 5, NULL,
   '{"round_name":"Semi-final","event_id":2,"published_at":"2026-03-31T22:00:00"}',   '192.168.1.1'),
  (1, 'PUBLISH_RESULT', 'ROUND', 6, NULL,
   '{"round_name":"Final","event_id":2,"published_at":"2026-04-30T20:00:00"}',        '192.168.1.1'),
  (1, 'AWARD_PRIZE',    'PRIZE', NULL, NULL,
   '{"event_id":2,"team":"Team Phoenix","prize":"Champion Web + Best Overall"}',      '192.168.1.1'),
  -- Event 3 approvals
  (1, 'APPROVE_TEAM',   'TEAM', 10, NULL,
   '{"team_name":"Team Horizon","event_id":3,"before":"PENDING","after":"APPROVED"}', '192.168.1.1'),
  (1, 'APPROVE_TEAM',   'TEAM', 11, NULL,
   '{"team_name":"Team Nexus","event_id":3,"before":"PENDING","after":"APPROVED"}',   '192.168.1.1'),
  (1, 'APPROVE_TEAM',   'TEAM', 12, NULL,
   '{"team_name":"Team Verde","event_id":3,"before":"PENDING","after":"APPROVED"}',   '192.168.1.1'),
  -- Event 4 approvals
  (1, 'APPROVE_TEAM',   'TEAM', 15, NULL,
   '{"team_name":"Team Polaris","event_id":4,"before":"PENDING","after":"APPROVED"}', '192.168.1.1'),
  (1, 'APPROVE_TEAM',   'TEAM', 16, NULL,
   '{"team_name":"Team Aurora","event_id":4,"before":"PENDING","after":"APPROVED"}',  '192.168.1.1');
