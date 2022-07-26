Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881CB1A0C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 22:59:35 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 26 Jul 2022 15:59:15 -0700
Message-ID: <20220726225915.195-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_cursor_legacy: Update cursor
 before page flip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As suggested here [1], switch the order of the page flip and cursor
update for flip-vs-cursor-crc-* subtests. Also, update the descriptions
for these subtests to reflect the change in implementation.

For DRM_IOCTL_MODE_CURSOR, there is some latency within the DRM
framework that causes MODE_CURSOR to wait for
drm_atomic_helper_commit_hw_done() to be called from the nonblocking
flip [1]. As this latency is within the DRM framework itself, we cannot
guarantee that the cursor update won't be blocked by the pending page
flip.

Since the page flip will not be blocked by a pending cursor update, we
can still perform a check for nonblocking page flip by doing the page
flip after the cursor update.

[1] https://lists.freedesktop.org/archives/igt-dev/2022-July/044081.html
[2]
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_helper.c#L2787

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_cursor_legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 1b69766781c4..a7f7a24eb827 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1376,8 +1376,8 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	for (int i = 1; i >= 0; i--) {
 		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
 
-		flip_nonblocking(display, pipe, atomic, &fb_info, NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
+		flip_nonblocking(display, pipe, atomic, &fb_info, NULL);
 
 		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
 
@@ -1634,7 +1634,7 @@ igt_main
 		}
 	}
 
-	igt_describe("Test will first does a page flip and then cursor update");
+	igt_describe("Test will first does a cursor update and then a page flip");
 	igt_subtest_group {
 		igt_fixture {
 			igt_require_pipe_crc(display.drm_fd);
-- 
2.31.0
