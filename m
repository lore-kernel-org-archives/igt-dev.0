Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E51F10E307
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 17:31:44 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 23:01:02 +0530
Message-Id: <20230704173107.842296-5-swati2.sharma@intel.com>
In-Reply-To: <20230704173107.842296-1-swati2.sharma@intel.com>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 4/9] tests/i915/kms_dsc: add get_status()
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

Use get_status() to get current bpc when TEST_DSC_BPC test
flag is used. If input bpc is not equal to current bpc,
skip test.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 7b9bae91a..df9b27225 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -111,12 +111,18 @@ static void test_cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
 }
 
+static int get_status(int drmfd, enum pipe pipe)
+{
+	return igt_get_pipe_current_bpc(drmfd, pipe);
+}
+
 /* re-probe connectors and do a modeset with DSC */
 static void update_display(data_t *data, uint32_t test_type)
 {
 	int ret;
 	bool enabled;
 	int index = 0;
+	int current_bpc = 0;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_output_t *output = data->output;
@@ -202,11 +208,17 @@ static void update_display(data_t *data, uint32_t test_type)
 
 	restore_force_dsc_en();
 
+	if (test_type & TEST_DSC_BPC) {
+		current_bpc = get_status(data->drm_fd, data->pipe);
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
