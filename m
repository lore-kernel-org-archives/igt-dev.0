Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333D010E00D
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 10:51:06 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Apr 2022 16:21:03 +0530
Message-Id: <20220401105103.17183-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Skip this test on
 DP MST config
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

currently this test fails on dp-mst setup. so, with this fix
test will skip which is expected for extended mode test case.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index eff30cbb..4701c3ef 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -135,6 +135,8 @@ igt_main
 	int valid_output = 0, i, j = 0;
 	igt_output_t *output;
 	int pipe[IGT_MAX_PIPES];
+	struct kmstest_connector_config config;
+	const char *encoder;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -146,6 +148,11 @@ igt_main
 
 			if (valid_output > 1)
 				break;
+
+			kmstest_get_connector_config(data.drm_fd,
+						     output->config.connector->connector_id,
+						     -1, &config);
+			encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
 		}
 
 		data.n_pipes = 0;
@@ -160,6 +167,10 @@ igt_main
 
 	igt_describe("Test for validating display extended mode with a pair of connected displays");
 	igt_subtest_with_dynamic("extended-mode-basic") {
+
+		if (strcmp(encoder, "DP MST") == 0)
+			igt_skip("Test dosen't support DP MST\n");
+
 		for (i = 0; i < data.n_pipes - 1; i++) {
 			igt_dynamic_f("pipe-%s%s", kmstest_pipe_name(pipe[i]),
 					kmstest_pipe_name(pipe[i+1]));
-- 
2.35.1
