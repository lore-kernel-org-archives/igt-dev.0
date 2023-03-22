Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A898410E274
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 06:05:53 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 11:38:18 +0530
Message-Id: <20230322060818.11415-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Fix copy-paste
 error
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Luca Coelho <luciano.coelho@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This fixes downscaling factor 0.5 (2:1) tests which were
skipping before and were expected to pass since max downscaling
supported is 3:1
Even after these fixes, few tests still can skip because of
CDCLK limitations which is expected.

Reported-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 71586efba..8e988058d 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -130,7 +130,7 @@ const struct {
 	{
 		"Tests downscaling with rotation for 0.5 scaling factor.",
 		"plane-downscale-with-rotation-factor-0-5",
-		0.25,
+		0.5,
 		false,
 	},
 	{
@@ -1181,9 +1181,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							drmModeModeInfo *mode = igt_output_get_mode(output);
 
 							test_scaler_with_modifier_pipe(&data,
-								get_width(mode, scaler_with_rotation_tests[index].sf),
-								get_height(mode, scaler_with_rotation_tests[index].sf),
-								scaler_with_rotation_tests[index].is_upscale,
+								get_width(mode, scaler_with_modifiers_tests[index].sf),
+								get_height(mode, scaler_with_modifiers_tests[index].sf),
+								scaler_with_modifiers_tests[index].is_upscale,
 								pipe, output);
 						}
 						break;
-- 
2.25.1
