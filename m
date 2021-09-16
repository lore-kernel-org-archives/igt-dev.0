Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE5C6EB8C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 14:39:22 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 16 Sep 2021 19:57:22 +0530
Message-Id: <20210916142722.17881-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Fix CRC mismatch
 for flip-vs-cursor-busy-crc-*
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
Cc: Bhanuprakash.Modem@intel.com, markyacoub@google.com, Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Few variants of Intel devices are failing randomly with CRC mismatch for
flip-vs-cursor-busy-crc-atomic and flip-vs-cursor-busy-crc-legacy.
Patch adds stop of CRC collection to fix this issue.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_cursor_legacy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 3ddea9c35340..8136280701e6 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1401,6 +1401,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_assert_crc_equal(&crcs[i], &test_crc);
 	}
 
+	igt_pipe_crc_stop(pipe_crc);
 	igt_remove_fb(display->drm_fd, &fb_info[1]);
 	igt_remove_fb(display->drm_fd, &fb_info[0]);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
-- 
2.33.0
