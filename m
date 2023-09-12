Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFAD10E35C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 07:01:56 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 12:31:49 +0530
Message-Id: <20230912070149.1305060-5-swati2.sharma@intel.com>
In-Reply-To: <20230912070149.1305060-1-swati2.sharma@intel.com>
References: <20230912070149.1305060-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 4/4] tests/kms_feature_discovery: detect mst
 configuration
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

Add test to detect if we have mst configuration.

v2: -use for_each_connected_output() (Bhanu)
    -don't use helper (Bhanu)
    -add documentation
v3: -add message on skip (Bhanu)
    -initialize ret (Bhanu)
v4: -remove run type (Bhanu)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_feature_discovery.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 5ee481c4b..3a1f6d21d 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -66,6 +66,13 @@
  * Mega feature: PSR
  * Test category: functionality test
  *
+ * SUBTEST: dp-mst
+ * Description: Make sure that we have DP-MST configuration.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery, mst
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
  * arg[1].values: 2, 3, 4
  */
 
@@ -159,5 +166,23 @@ igt_main {
 		igt_subtest("psr2") {
 			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2));
 		}
+
+		igt_describe("Make sure that we have DP-MST configuration.");
+		igt_subtest("dp-mst") {
+			struct kmstest_connector_config config;
+			igt_output_t *output;
+			const char *encoder;
+			int ret = -1;
+
+			for_each_connected_output(&display, output) {
+				kmstest_get_connector_config(fd, output->config.connector->connector_id, -1, &config);
+				encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
+
+				ret = strcmp(encoder, "DP MST");
+				if (ret == 0)
+					break;
+			}
+			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
+		}
 	}
 }
-- 
2.25.1
