Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8ED10E81C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:50:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:46 +0530
Message-Id: <20230418164501.1687266-31-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 30/45] tests/kms_cursor_legacy: Add XE support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add XE driver support for kms tests.

V2: - Drop redundant check for i915 device

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_cursor_legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5f4300908..7df6a6125 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -308,7 +308,7 @@ enum flip_test {
 static bool cursor_slowpath(igt_display_t *display, enum flip_test mode)
 {
 	/* Intel display 9 and newer will handle cursor movement as fastsets */
-	if (is_i915_device(display->drm_fd) &&
+	if (is_intel_device(display->drm_fd) &&
 	    intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 9)
 	    return true;
 
@@ -1465,7 +1465,6 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	igt_output_t *output;
 	igt_plane_t *cursor;
 
-	igt_require_intel(display->drm_fd);
 	ahnd = get_reloc_ahnd(display->drm_fd, 0);
 
 	if (atomic)
@@ -1708,6 +1707,7 @@ igt_main
 	igt_describe("this test perform a busy bo update followed by a cursor update");
 	igt_subtest_group {
 		igt_fixture {
+			igt_require_i915(display.drm_fd);
 			igt_require_pipe_crc(display.drm_fd);
 			igt_display_require_output(&display);
 		}
-- 
2.40.0
