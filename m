Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B1010E627
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 07:39:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:00:51 +0530
Message-Id: <20230825073059.856371-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
References: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 08/16] tests/kms_rotation_crc: Add tiling
 support for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove the tiling restrictions in Xe specific tests

V2: - Update XE blocklist
V3: - New patch for blocklist changes

Fixes: e1d5b831e (tests/kms_rotation_crc: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_rotation_crc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index b80cf695e..f08d31e37 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -977,10 +977,6 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_pipe_crc_start(data->pipe_crc);
 
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
-			if (is_xe_device(data->gfx_fd) &&
-			    planeconfigs[i].modifier != DRM_FORMAT_MOD_LINEAR)
-				continue;
-
 			p[0].fbinfo = &planeconfigs[i];
 			pointlocation(data, p, mode, 0);
 
@@ -1351,7 +1347,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_describe("Tiling and Rotation test for gen 10+ for primary plane");
 	for (reflect_x = reflect_x_subtests; reflect_x->modifier; reflect_x++) {
 		igt_fixture
-			igt_require_i915(data.gfx_fd);
+			igt_require_intel(data.gfx_fd);
 
 		igt_subtest_f("primary-%s-reflect-x-%s",
 			      modifier_test_str(reflect_x->modifier),
@@ -1412,7 +1408,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		enum pipe pipe;
 		igt_output_t *output;
 
-		igt_require_i915(data.gfx_fd);
+		igt_require_intel(data.gfx_fd);
 		igt_display_require_output(&data.display);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-- 
2.40.0
