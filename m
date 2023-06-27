Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42D710E2E8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 12:21:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:50:25 +0530
Message-Id: <20230627122030.675526-5-swati2.sharma@intel.com>
In-Reply-To: <20230627122030.675526-1-swati2.sharma@intel.com>
References: <20230627122030.675526-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/9] tests/i915/kms_dsc: add get_status()
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
index 84bd5dbbc..793c4409d 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -112,12 +112,18 @@ static void test_cleanup(data_t *data)
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
@@ -203,11 +209,17 @@ static void update_display(data_t *data, uint32_t test_type)
 
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
