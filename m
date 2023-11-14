Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCA910E1D4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 08:45:19 +0000 (UTC)
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 10:45:04 +0200
Message-Id: <20231114084504.159561-2-vinod.govindapillai@intel.com>
In-Reply-To: <20231114084504.159561-1-vinod.govindapillai@intel.com>
References: <20231114084504.159561-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 1/1] tests/kms_flip: add possibility to
 ignore long HPDs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In some CI environments, spurious long HPDs are impacting the
kms_flip test results. The provision to set ignore long HPDs was
not being used by the kms_flip tests. Call igt_display_require
for kms_flip as well which will track the usage of environment
variable IGT_KMS_IGNORE_HPD

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/kms_flip.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index fc7cee050..c32b19412 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -2116,12 +2116,13 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		{ 0, TEST_BO_TOOBIG | TEST_NO_2X_OUTPUT, "bo-too-big" },
 		{ 10, TEST_FLIP | TEST_SUSPEND, "flip-vs-suspend" },
 	};
+	igt_display_t display;
 	int i;
 
 	igt_fixture {
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-		igt_enable_connectors(drm_fd);
+		igt_display_require(&display, drm_fd);
 
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_flip_exit_handler);
@@ -2192,6 +2193,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 	igt_stop_signal_helper();
 
-	igt_fixture
+	igt_fixture {
+		igt_display_fini(&display);
 		drm_close_driver(drm_fd);
+	}
 }
-- 
2.34.1
