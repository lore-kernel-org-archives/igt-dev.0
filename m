Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5751810F1AC
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 08:46:58 +0000 (UTC)
From: Wayne Lin <Wayne.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 2 Mar 2022 16:46:31 +0800
Message-ID: <20220302084631.10605-3-Wayne.Lin@amd.com>
In-Reply-To: <20220302084631.10605-1-Wayne.Lin@amd.com>
References: <20220302084631.10605-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/amdgpu/amd_link_settings: Change
 the flow when exit test
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

[Why]
No need to capture original lane count and link rate for setting back
when exit the test. What we actually need to do is clean up the
preferred link_setting of driver.

[How]
Clean up unnecessary steps.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 tests/amdgpu/amd_link_settings.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index c8c45c88..14c8c4d7 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -163,9 +163,6 @@ static void test_link_training_configs(data_t *data)
 {
 	const drmModeModeInfo *orig_mode;
 	igt_output_t *output;
-	int lane_count[4], link_rate[4], link_spread[4];
-	int orig_lc, orig_lr;
-	const int current = 0;
 
 	igt_enable_connectors(data->drm_fd);
 
@@ -184,12 +181,6 @@ static void test_link_training_configs(data_t *data)
 		igt_assert(orig_mode);
 		igt_output_override_mode(output, orig_mode);
 
-		/* Collect original mode's LC and LR */
-		igt_amd_read_link_settings(data->drm_fd, output->name, lane_count,
-					   link_rate, link_spread);
-		orig_lc = lane_count[current];
-		orig_lr = link_rate[current];
-
 		/* Set display pattern */
 		igt_create_pattern_fb(data->drm_fd, orig_mode->hdisplay,
 				      orig_mode->vdisplay, DRM_FORMAT_XRGB8888,
@@ -200,12 +191,10 @@ static void test_link_training_configs(data_t *data)
 		/* Change link settings. */
 		run_link_training_config(data, output);
 
-		/* Revert mode back. */
-		igt_info("%s: Reverting to lane count: %d, link rate: 0x%02x\n", output->name, orig_lc, orig_lr);
-		igt_amd_write_link_settings(data->drm_fd, output->name, orig_lc, orig_lr,
-					    LINK_TRAINING_DEFAULT);
-
-		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		/* Clean up preferred link_setting of driver */
+		igt_info("%s: Clean up preferred link_setting\n", output->name);
+		igt_amd_write_link_settings(data->drm_fd, output->name, 0, 0,
+			LINK_TRAINING_DEFAULT);
 
 		igt_remove_fb(data->drm_fd, &data->fb);
 	}
-- 
2.25.1
