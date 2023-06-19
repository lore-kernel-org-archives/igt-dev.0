Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60FB10E1FE
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:52 +0530
Message-Id: <20230619115858.2013195-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 12/18] tests/i915/kms_flip_scaled_crc: Add tiling
 support for XE
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

Fixes: 113fc78d0 (tests/i915/kms_flip_scaled_crc: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index f5dc430e3..63dc095e0 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -644,12 +644,6 @@ igt_main
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
-- 
2.40.0
