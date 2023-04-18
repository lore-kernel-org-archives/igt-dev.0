Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F4C10E810
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:49:52 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:36 +0530
Message-Id: <20230418164501.1687266-21-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 20/45] tests/i915/kms_flip_tiling: Add XE support
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
 tests/i915/kms_flip_tiling.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 4cc063f63..a22f12382 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -177,7 +177,7 @@ igt_output_t *output;
 igt_main
 {
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 
 		data.testformat = DRM_FORMAT_XRGB8888;
@@ -217,6 +217,12 @@ igt_main
 					if (plane->formats[j] != data.testformat)
 						continue;
 
+					/* No tiling support in XE. */
+					if (is_xe_device(data.drm_fd) &&
+					    (plane->modifiers[i] != DRM_FORMAT_MOD_LINEAR ||
+					     plane->modifiers[j] != DRM_FORMAT_MOD_LINEAR))
+						continue;
+
 					igt_dynamic_f("%s-pipe-%s-%s-to-%s",
 						      igt_output_name(output),
 						      kmstest_pipe_name(pipe),
-- 
2.40.0
