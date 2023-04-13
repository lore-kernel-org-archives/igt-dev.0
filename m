Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B306810EBB5
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 16:32:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Apr 2023 21:57:29 +0530
Message-Id: <20230413162732.1155058-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
References: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 4/7] tests/kms_cursor_legacy: Add XE support
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_legacy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5f430090815..cd247cf0088 100644
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
 
@@ -1708,6 +1708,7 @@ igt_main
 	igt_describe("this test perform a busy bo update followed by a cursor update");
 	igt_subtest_group {
 		igt_fixture {
+			igt_require_i915(display.drm_fd);
 			igt_require_pipe_crc(display.drm_fd);
 			igt_display_require_output(&display);
 		}
-- 
2.40.0
