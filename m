Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAC610E6D7
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 17:15:32 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 22:45:26 +0530
Message-Id: <20230825171526.1182193-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/feature_discovery: detect mst
 configuration
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

Add test to detect if we have mst configuration.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/feature_discovery.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/feature_discovery.c b/tests/feature_discovery.c
index d1f4b1633..738719e16 100644
--- a/tests/feature_discovery.c
+++ b/tests/feature_discovery.c
@@ -113,5 +113,17 @@ igt_main {
 		igt_subtest("psr2") {
 			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2));
 		}
+
+		igt_describe("Make sure that we have DP-MST configuration.");
+		igt_subtest("dp-mst") {
+			igt_output_t *output;
+			enum pipe pipe;
+			int ret;
+			for_each_valid_output_on_pipe(&display, pipe, output) {
+				igt_output_set_pipe(output, pipe);
+				ret = igt_check_output_is_dp_mst(output);
+			}
+			igt_require( ret !=0 );
+		}
 	}
 }
-- 
2.25.1
