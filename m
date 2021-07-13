Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7034C89FD9
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jul 2021 12:01:03 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Tue, 13 Jul 2021 20:00:16 +0800
Message-ID: <20210713120016.463320-3-stylon.wang@amd.com>
In-Reply-To: <20210713120016.463320-1-stylon.wang@amd.com>
References: <20210713120016.463320-1-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/amdgpu: Add suspend and DPMS
 subtests to ASSR test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: petri.latvala@intel.com, arek@hiler.eu, markyacoub@google.com, igt-dev@lists.freedesktop.org
Cc: Anson.Jacob@amd.com, Nicholas.Choi@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

Test if ASSR is correctly enabled/disabled after suspend and DPMS.

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tests/amdgpu/amd_assr.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index bcddbaad..f101c632 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -40,6 +40,13 @@ typedef struct data {
 	int fd;
 } data_t;
 
+/* Test flags. */
+enum {
+	TEST_NONE = 1 << 0,
+	TEST_DPMS = 1 << 1,
+	TEST_SUSPEND = 1 << 2,
+};
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
@@ -181,7 +188,24 @@ static void present_visual_pattern(data_t *data, igt_output_t *output)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
-static void test_assr(data_t *data, igt_output_t *output)
+static void test_cycle_flags(data_t *data, igt_output_t *output, uint32_t test_flags)
+{
+	if (test_flags & TEST_DPMS) {
+		igt_info("Link DPMS off then on\n");
+		kmstest_set_connector_dpms(data->fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_ON);
+	}
+
+	if (test_flags & TEST_SUSPEND)
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+}
+
+static void test_assr(data_t *data, igt_output_t *output, uint32_t test_flags)
 {
 	drmModeConnector *connector = output->config.connector;
 	int connector_type = connector->connector_type;
@@ -191,6 +215,8 @@ static void test_assr(data_t *data, igt_output_t *output)
 
 	igt_info("Test ASSR on link %s\n", output->name);
 
+	test_cycle_flags(data, output, test_flags);
+
 	aux_dev = find_aux_dev(data, output);
 	igt_info("Link %s aux %s\n", output->name, aux_dev);
 	igt_require_f(aux_dev, "Cannot find AUX device for link %s\n", output->name);
@@ -214,7 +240,7 @@ static void test_assr(data_t *data, igt_output_t *output)
 		igt_assert(!assr_enabled);
 }
 
-static void test_assr_links(data_t *data)
+static void test_assr_links(data_t *data, uint32_t test_flags)
 {
 	for (int i = 0; i < data->display.n_outputs; ++i) {
 		drmModeConnector *connector = data->display.outputs[i].config.connector;
@@ -229,7 +255,7 @@ static void test_assr_links(data_t *data)
 
 		test_init(data);
 
-		test_assr(data, output);
+		test_assr(data, output, test_flags);
 
 		test_fini(data);
 	}
@@ -257,7 +283,13 @@ igt_main
 
 	igt_describe("Test ASSR on connected DP/eDP links");
 	igt_subtest("assr-links")
-		test_assr_links(&data);
+		test_assr_links(&data, TEST_NONE);
+	igt_describe("Test ASSR with DPMS ");
+	igt_subtest("assr-links-dpms")
+		test_assr_links(&data, TEST_DPMS);
+	igt_describe("Test ASSR with suspend ");
+	igt_subtest("assr-links-suspend")
+		test_assr_links(&data, TEST_SUSPEND);
 
 	igt_fixture
 	{
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
