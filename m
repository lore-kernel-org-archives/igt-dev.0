Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3C710E67D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 07:49:31 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jul 2023 13:19:08 +0530
Message-Id: <20230728074913.939188-6-swati2.sharma@intel.com>
In-Reply-To: <20230728074913.939188-1-swati2.sharma@intel.com>
References: <20230728074913.939188-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 05/10] tests/i915/kms_dsc: use
 igt_get_pipe_current_bpc()
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

Use igt_get_pipe_current_bpc() to get current bpc when
TEST_DSC_BPC test flag is used. If input bpc is not equal to
current bpc, skip test.

v2: -use helper directly (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/i915/kms_dsc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 266918f74..00e2ed1a8 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -117,6 +117,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	int ret;
 	bool enabled;
 	int index = 0;
+	int current_bpc = 0;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_output_t *output = data->output;
@@ -202,11 +203,17 @@ static void update_display(data_t *data, uint32_t test_type)
 
 	restore_force_dsc_en();
 
+	if (test_type & TEST_DSC_BPC) {
+		current_bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe);
+		igt_skip_on_f(data->input_bpc != current_bpc,
+			      "Input bpc = %d is not equal to current bpc = %d\n",
+			      data->input_bpc, current_bpc);
+	}
+
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on connector: %s pipe: %s\n",
 		     output->name,
 		     kmstest_pipe_name(data->pipe));
-
 reset:
 	test_reset(data);
 
-- 
2.25.1
