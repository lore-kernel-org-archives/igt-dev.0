Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5281688FBD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:40:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 22:01:57 +0530
Message-Id: <20230816163206.402705-12-bhanuprakash.modem@intel.com>
In-Reply-To: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
References: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 11/20] tests/i915/kms_flip_scaled_crc: Add
 tiling support for XE
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

Remove the tiling restrictions in Xe specific tests

V2: - Update XE blocklist

Fixes: 113fc78d0 (tests/i915/kms_flip_scaled_crc: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 6 ------
 tests/intel-ci/xe.blocklist.txt  | 1 -
 2 files changed, 7 deletions(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index ad68f2474..3d7991890 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -835,12 +835,6 @@ igt_main
 	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
 		igt_describe(flip_scenario_test[index].describe);
 		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
-			/* No tiling support in XE. */
-			if (is_xe_device(data.drm_fd) &&
-			    (flip_scenario_test[index].firstmodifier != DRM_FORMAT_MOD_LINEAR ||
-			     flip_scenario_test[index].secondmodifier != DRM_FORMAT_MOD_LINEAR))
-				continue;
-
 			free_fbs(&data);
 			for_each_pipe(&data.display, pipe) {
 				bool found = false;
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 20a6c976b..ffba73e02 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -64,7 +64,6 @@ igt@kms_busy@.*
 igt@kms_psr@.*_mmap_(cpu|gtt)
 igt@kms_legacy_colorkey@basic
 igt@kms_legacy_colorkey@invalid-plane
-igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf|tileccs)tile-.*
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
 igt@kms_addfb_basic@clobberred-modifier
-- 
2.40.0
