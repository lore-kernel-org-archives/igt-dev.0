Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EE710EC80
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 07:19:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 12:43:28 +0530
Message-Id: <20230428071350.2561575-26-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
References: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 25/47] tests/i915/kms_flip_scaled_crc: Add XE
 support
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
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 7f7a59b93..f5dc430e3 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -623,7 +623,7 @@ igt_main
 	drmModeModeInfoPtr modetoset = NULL;
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 		igt_require(data.gen >= 9);
 		igt_display_require(&data.display, data.drm_fd);
@@ -644,6 +644,12 @@ igt_main
 	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
 		igt_describe(flip_scenario_test[index].describe);
 		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
+			/* No tiling support in XE. */
+			if (is_xe_device(data.drm_fd) &&
+			    (flip_scenario_test[index].firstmodifier != DRM_FORMAT_MOD_LINEAR ||
+			     flip_scenario_test[index].secondmodifier != DRM_FORMAT_MOD_LINEAR))
+				continue;
+
 			free_fbs(&data);
 			for_each_pipe(&data.display, pipe) {
 				bool found = false;
-- 
2.40.0
