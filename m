Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09B610E1C6
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 09:04:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 14:28:00 +0530
Message-Id: <20230619085800.1994271-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619085800.1994271-1-bhanuprakash.modem@intel.com>
References: <20230619085800.1994271-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] tests/kms_cursor_legacy: Allow busy tests to
 run on XE
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

As busy tests supports both i915 & XE, update the intel specific
checks to allow them to run on XE.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 1f0f3b7e6..d55d96067 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1752,7 +1752,7 @@ igt_main
 	igt_describe("this test perform a busy bo update followed by a cursor update");
 	igt_subtest_group {
 		igt_fixture {
-			igt_require_i915(display.drm_fd);
+			igt_require_intel(display.drm_fd);
 			igt_require_pipe_crc(display.drm_fd);
 			igt_display_require_output(&display);
 		}
-- 
2.40.0
