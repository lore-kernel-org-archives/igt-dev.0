Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8108110E14F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 05:14:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:41:37 +0530
Message-Id: <20220922051142.2003118-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
References: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 3/8] Revert "tests/kms_color: Fix multiple
 failures in deep-color tests"
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

This reverts commit 333ca8f6be43044d71ecf15d37a3e88e7a3ce821.
---
 tests/kms_color.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 8c15c7be..6ea721f1 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -839,7 +839,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		if (!panel_supports_deep_color(data->drm_fd, output->name))
 			continue;
 
-		igt_display_reset(&data->display);
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_pipe(output, p);
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -851,10 +850,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		data->color_depth = 10;
 		data->drm_format = DRM_FORMAT_XRGB2101010;
 		data->output = output;
-
-		data->mode = malloc(sizeof(drmModeModeInfo));
-		igt_assert(data->mode);
-		memcpy(data->mode, igt_output_get_mode(data->output), sizeof(drmModeModeInfo));
+		data->mode = igt_output_get_mode(data->output);
 
 		igt_dynamic_f("pipe-%s-%s-gamma", kmstest_pipe_name(p), output->name) {
 			igt_display_reset(&data->display);
@@ -888,8 +884,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			igt_assert(ret);
 		}
 
-		free(data->mode);
-
 		break;
 	}
 
-- 
2.37.3
