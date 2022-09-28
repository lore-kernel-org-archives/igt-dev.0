Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDED10E290
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 06:37:45 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 12:09:09 +0530
Message-Id: <20220928063912.2963498-3-kunal1.joshi@intel.com>
In-Reply-To: <20220928063912.2963498-1-kunal1.joshi@intel.com>
References: <20220928063912.2963498-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/5] tests/i915/kms_pipe_b_c_ivb: test
 cleanup
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

v1:
Sanitize the state before starting the subtest and close drm_fd.

v2:
Corrected commit subject. (Swati)
Removed comments (Swati)

CC: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_pipe_b_c_ivb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
index 5823ae2a..495a484f 100644
--- a/tests/i915/kms_pipe_b_c_ivb.c
+++ b/tests/i915/kms_pipe_b_c_ivb.c
@@ -142,6 +142,7 @@ test_dpms(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -164,6 +165,8 @@ test_lane_reduction(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
+
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -187,6 +190,7 @@ test_disable_pipe_B(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -213,6 +217,7 @@ test_from_C_to_B_with_3_lanes(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -236,6 +241,7 @@ test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -291,5 +297,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
 	}
 }
-- 
2.25.1
