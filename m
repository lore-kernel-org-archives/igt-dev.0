Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2349C10E0A7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 17:20:45 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <sunpeng.li@amd.com>
Date: Wed, 22 Nov 2023 12:20:34 -0500
Message-ID: <20231122172034.65982-2-hersenxs.wu@amd.com>
In-Reply-To: <20231122172034.65982-1-hersenxs.wu@amd.com>
References: <20231122172034.65982-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] [i-g-t] tests/amdgpu: Fix display tests be
 skipped intermittently
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use igt_amd_display_require_retry to re-try igt_display_require
if igt dislay require output is not valid. If previous test
run suspend-resume test, current test igt display require
output may not be valid after initial igt_display_require.
This will cause current test be skipped. By re-try
igt_display_require, igt display require output could be
valid.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_abm.c                 | 4 +++-
 tests/amdgpu/amd_assr.c                | 4 ++--
 tests/amdgpu/amd_bypass.c              | 3 +--
 tests/amdgpu/amd_color.c               | 4 ++--
 tests/amdgpu/amd_dp_dsc.c              | 6 +++---
 tests/amdgpu/amd_freesync_video_mode.c | 4 ++--
 tests/amdgpu/amd_hotplug.c             | 3 +--
 tests/amdgpu/amd_ilr.c                 | 3 +--
 tests/amdgpu/amd_link_settings.c       | 3 +--
 tests/amdgpu/amd_mall.c                | 3 +--
 tests/amdgpu/amd_max_bpc.c             | 4 ++--
 tests/amdgpu/amd_mem_leak.c            | 3 +--
 tests/amdgpu/amd_mode_switch.c         | 6 +++---
 tests/amdgpu/amd_odm.c                 | 6 ++----
 tests/amdgpu/amd_plane.c               | 4 ++--
 tests/amdgpu/amd_psr.c                 | 5 ++---
 tests/amdgpu/amd_subvp.c               | 5 ++---
 tests/amdgpu/amd_vrr_range.c           | 3 +--
 18 files changed, 32 insertions(+), 41 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 082da7ed6..0036a83c4 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -23,6 +23,7 @@
 #include "igt.h"
 #include "drmtest.h"
 #include "igt_kms.h"
+#include "igt_amd.h"
 #include <limits.h>
 #include <errno.h>
 #include <stdbool.h>
@@ -360,7 +361,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.drm_fd);
+		igt_amd_display_require_retry(&data.display, data.drm_fd, 2, 2);
+		igt_require(data.display.is_atomic);
 
 		test_init(&data);
 	}
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index fc2367f99..008cb54b2 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -22,6 +22,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "igt_amd.h"
 #include <dirent.h>
 #include <fcntl.h>
 #include <limits.h>
@@ -281,9 +282,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Test ASSR on connected DP/eDP links");
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index d192a30ea..0dd11ac93 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -387,9 +387,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.drm_fd);
+		igt_amd_display_require_retry(&data.display, data.drm_fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_subtest("8bpc-bypass-mode")
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 4a98df3be..1a3f238dc 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -21,6 +21,7 @@
  */
 
 #include "igt.h"
+#include "igt_amd.h"
 
 IGT_TEST_DESCRIPTION("Test Color Features for DRM conformance");
 
@@ -406,9 +407,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Tests correctness of linear degamma on CRTC");
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index e782ce84a..b4acdf4fb 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -526,12 +526,12 @@ igt_main
 	{
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
-		igt_display_require(&data.display, data.fd);
+		kmstest_set_vt_graphics_mode();
+
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 
 		igt_amd_require_dsc(&data.display, data.fd);
-		kmstest_set_vt_graphics_mode();
 	}
 
 	igt_describe("Forces DSC on/off & ensures it is reset properly");
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 7716598dc..932153354 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -21,6 +21,7 @@
  */
 
 #include "igt.h"
+#include "igt_amd.h"
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
@@ -871,9 +872,8 @@ igt_main {
 			igt_skip("Not an amdgpu driver.\n");
 		}
 		kmstest_set_vt_graphics_mode();
-		igt_display_require(&data.display, data.drm_fd);
+		igt_amd_display_require_retry(&data.display, data.drm_fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	/* Expectation: Modeset happens instantaneously without blanking */
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index c13bf49d3..6f44ad0e9 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -165,9 +165,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 
 		igt_amd_require_hpd(&data.display, data.fd);
 	}
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 50ca93a14..6249c1dce 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -264,9 +264,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.drm_fd);
+		igt_amd_display_require_retry(&data.display, data.drm_fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Test ILR by trying training link rate at all supported ILRs");
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 6a7e8cc53..8844e7a1a 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -237,9 +237,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.drm_fd);
+		igt_amd_display_require_retry(&data.display, data.drm_fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Retrieves all link settings configurations and retrains "
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index c21fcc27f..6a95f1f11 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -142,9 +142,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Tests whether display scanout is triggered from MALL cache instead "
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index effe830a2..1e3bb1f3c 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -21,6 +21,7 @@
  */
 
 #include "igt.h"
+#include "igt_amd.h"
 #include <fcntl.h>
 
 IGT_TEST_DESCRIPTION("Test 4K HDMI regression if max bpc is too high");
@@ -132,9 +133,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Tests overly high 'max bpc' should not affect 4K modes on HDMI");
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index e4a4b5c47..bb3ae420e 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -219,9 +219,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
+		igt_amd_display_require_retry(&data.display, data.fd, 5, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Test memory leaks after resume from suspend");
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index 270b1b9f6..445c00be7 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -21,6 +21,7 @@
  */
 
 #include "igt.h"
+#include "igt_amd.h"
 #include <xf86drmMode.h>
 
 #define MAX_PIPES 6
@@ -191,9 +192,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
-		igt_require(&data.display.is_atomic);
-		igt_display_require_output(&data.display);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
+		igt_require(data.display.is_atomic);
 	}
 
 	for (i = 0; i < MAX_PIPES; i++) {
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 839f2de3f..db6aaec58 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -172,10 +172,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
-		igt_require(&data.display.is_atomic);
-		igt_display_require_output(&data.display);
-
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
+		igt_require(data.display.is_atomic);
 	}
 
 	igt_subtest_f("odm-combine-2-to-1-%s", test_mode[TEST_MODE_IDX_ODMC_2_TO_1].name)
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index ee7de5778..e152d307e 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -21,6 +21,7 @@
  */
 
 #include "igt.h"
+#include "igt_amd.h"
 #include "libdrm/amdgpu.h"
 #include "libdrm/amdgpu_drm.h"
 
@@ -910,9 +911,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("MPO with 4K planes");
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 9da161a09..7b4f3f629 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -715,9 +715,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
-		igt_require(&data.display.is_atomic);
-		igt_display_require_output(&data.display);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
+		igt_require(data.display.is_atomic);
 
 		/* check if visual confirm option available */
 		if (opt.visual_confirm) {
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index f9915784b..ce90d0493 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -163,11 +163,10 @@ igt_main
 	igt_fixture
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
-		igt_display_require(&data.display, data.fd);
-		igt_display_require_output(&data.display);
-		igt_require(data.display.is_atomic);
 
 		kmstest_set_vt_graphics_mode();
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
+		igt_require(data.display.is_atomic);
 	}
 
 	igt_describe("Tests whether system enables sub-viewport when a specific mode is committed");
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index a77895622..a394a6e50 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -388,9 +388,8 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.fd);
+		igt_amd_display_require_retry(&data.display, data.fd, 2, 2);
 		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Hard coded Freesync EDID parsing");
-- 
2.25.1
