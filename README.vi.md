# tv-clean — TV của bạn, trừ quảng cáo

Một repo hợp nhất 2 engine dọn TV qua ADB là
[tv-detox](https://github.com/Ansub/tv-detox) và
[cleanyourtv](https://github.com/Gathin23/cleanyourtv), cộng thêm các
track hỗ trợ thật cho những TV 2 project kia không làm được (Samsung
Tizen, LG webOS, Roku, VIDAA).

## Làm được gì

- **Android TV / Google TV (đầy đủ):** dọn rác qua Wi-Fi bằng ADB +
  thay home screen sạch. Không gỡ app nào — chỉ tắt cho user, 1 lệnh
  là khôi phục nguyên trạng.
- **Samsung Tizen / LG webOS (một phần, nói thẳng):** 2 nền tảng này
  không có ADB, không thay được launcher. Làm được: tắt ACR/quảng cáo
  cá nhân hóa trong Settings, chặn quảng cáo bằng DNS, quản lý app
  bằng sdb/ares trong phạm vi TV cho phép. Xem
  `brands/tizen/samsung.md` và `brands/webos/lg.md`.
- **Roku / Hisense VIDAA (chỉ settings + DNS):** xem
  `brands/closed/roku-vidaa.md`.

## Bắt đầu nhanh (Android TV / Google TV)

1. Trên TV: Settings → Device Preferences → About → bấm **Build** 7
   lần → Developer options → bật **USB debugging** (thêm Network /
   Wireless debugging nếu có). TV và máy tính cùng Wi-Fi.
2. `sh scripts/detect.sh <TV_IP>` — kiểm tra trước (hãng, model,
   Android, RAM, Home hiện tại), không sửa gì.
3. `sh scripts/candidates.sh <TV_IP>` — phân loại chỉ-đọc: never /
   keep / safe / review.
4. Lập danh sách debloat từ nhóm `safe` (mỗi dòng 1 package) rồi chạy:
   `sh scripts/clean.sh <TV_IP> <list.txt> [--launcher cleanyourtv|tvhome]`
   Script hỏi YES rõ ràng trước khi sửa gì.
5. Kiểm tra: `sh scripts/check.sh <TV_IP>` (sau firmware update dùng
   `--fix` — update bật lại rác).
6. Khôi phục bất cứ lúc nào: `sh tools/restore.sh <list.txt>` hoặc
   `sh scripts/undo.sh <TV_IP>`.
7. Xong thì TẮT USB/network debugging trên TV.

Launcher mặc định là cleanyourtv (kiểu Apple TV, themes, menu inputs,
screensaver đồng hồ chống burn-in). `tvhome` là bản nhẹ (app + HDMI +
đồng hồ). Build từ `launchers/cleanyourtv/` (Gradle) và
`launchers/tvhome/` (build.sh).

## An toàn

Đọc [SAFETY.md](SAFETY.md) trước. Tóm tắt: tắt không xóa; không bao giờ
đụng Play services, Settings, System UI, setup app, HDMI/tuner, Home
hiện tại; vài TV từng bootloop vì tắt sai app — đó là lý do backup +
restore tồn tại.
