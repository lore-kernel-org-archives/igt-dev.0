Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2464510E5D3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:29:40 +0530
Message-Id: <20230104170023.3355190-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 08/51] tests/kms_color: Add support for
 Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_color.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index e0c6a8bf..a9bfda81 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -724,9 +724,13 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
+	if (!pipe_output_combo_valid(data, p))
+		goto out;
+
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
 		igt_assert(test_t(data, data->primary));
 
+out:
 	test_cleanup(data);
 }
 
@@ -754,6 +758,9 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
+	if (!pipe_output_combo_valid(data, p))
+		goto out;
+
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
 		bool success = false;
 		int i;
@@ -782,6 +789,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		igt_assert(success);
 	}
 
+out:
 	test_cleanup(data);
 }
 
@@ -822,7 +830,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_display_reset(&data->display);
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_pipe(output, p);
-		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		if (is_i915_device(data->drm_fd) &&
 		    !igt_max_bpc_constraint(&data->display, p, output, 10))
-- 
2.39.0
