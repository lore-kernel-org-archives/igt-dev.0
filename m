Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B1B10EB42
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 17:20:33 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 10 Dec 2021 09:20:06 -0800
Message-ID: <20211210172006.28654-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Remove vblank
 counter check immediately after flip_nonblocking
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, quic_khsieh@quicinc.com, swboyd@chromium.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

Currently, there is a check that the vblank counter shouldn't change after
a nonblocking page flip and DRM_IOCTL_MODE_CURSOR call. This assumes
that ioctl is performed before the commit from the nonblocking flip is
dequeued.

The DRM_IOCTL_MODE_CURSOR callstack is as such:
	drm_mode_cursor_ioctl
	drm_mode_cursor_common
	drm_mode_cursor_universal
	__setplane_atomic
	drm_atomic_helper_update_plane
	drm_atomic_commit

Becuase the commit work queue is scheduled earlier than
DRM_CURSOR_IOCTL, it will finish before the ioctl. Thus, we can't
assume that the current vblank count will match vblank_start after the
cursor ioctl finishes.

Tested-on: Chromebook Lazor (Trogdor)

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_cursor_legacy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index d50155e8..82c01bc8 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1307,8 +1307,6 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 		flip_nonblocking(display, pipe, atomic, &fb_info, NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
-
 		igt_set_timeout(1, "Stuck page flip");
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 		igt_reset_timeout();
-- 
2.31.0
