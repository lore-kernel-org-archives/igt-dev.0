Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3473D10F107
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 06:54:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Fri, 31 Mar 2023 12:20:26 +0530
Message-Id: <20230331065029.3869109-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230331065029.3869109-1-bhanuprakash.modem@intel.com>
References: <20230331065029.3869109-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 4/7] tests/i915/kms_dsc: Drop bigjoiner check
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

Drop bigjoiner specific check, instead use the generic check
i915_pipe_output_combo_valid() which will take care of bigjoiner
too.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_dsc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 9c6a7780acd..2c49ded4dfc 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -71,7 +71,7 @@ static drmModeModeInfo *get_highres_mode(igt_output_t *output)
 	return highest_mode;
 }
 
-static bool check_big_joiner_pipe_constraint(data_t *data)
+static bool pipe_output_combo_valid(data_t *data)
 {
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = get_highres_mode(output);
@@ -80,11 +80,9 @@ static bool check_big_joiner_pipe_constraint(data_t *data)
 	igt_output_set_pipe(output, data->pipe);
 	igt_output_override_mode(output, mode);
 
-	if (!igt_check_bigjoiner_support(&data->display)) {
-		igt_debug("Pipe-%s not supported due to bigjoiner limitation\n",
-			   kmstest_pipe_name(data->pipe));
+	if (!i915_pipe_output_combo_valid(&data->display))
 		ret = false;
-	}
+
 	igt_output_set_pipe(output, PIPE_NONE);
 
 	return ret;
@@ -193,7 +191,7 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 		if (!check_gen11_bpc_constraint(data->drm_fd, data->output, data->input_bpc))
 			continue;
 
-		if (!check_big_joiner_pipe_constraint(data))
+		if (!pipe_output_combo_valid(data))
 			continue;
 
 		if (test_type == TEST_DSC_BPC)
-- 
2.40.0
