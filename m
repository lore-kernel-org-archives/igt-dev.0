Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E5810E425
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 07:33:27 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 May 2022 13:05:48 +0530
Message-Id: <20220512073549.5535-2-nidhi1.gupta@intel.com>
In-Reply-To: <20220512073549.5535-1-nidhi1.gupta@intel.com>
References: <20220512073549.5535-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/kms_bw : Added dynamic test cases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Modified kms_bw to include dynamic test cases
for better reporting of the results.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_bw.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index a4553cde..60f87537 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -195,6 +195,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 igt_main
 {
 	data_t data;
+	igt_output_t *output;
 	int i = 0, j = 0;
 
 	memset(&data, 0, sizeof(data));
@@ -215,9 +216,11 @@ igt_main
 	 * _amount_ of pipes */
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
 		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
-			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
-			      test_mode[j].name)
-			run_test_linear_tiling(&data, i, &test_mode[j]);
+			igt_subtest_with_dynamic_f("linear-tiling-%d-displays-%s", i+1,
+			      test_mode[j].name) {
+				igt_dynamic_f("pipe-%s", igt_output_name(output))
+					run_test_linear_tiling(&data, i, &test_mode[j]);
+			}
 		}
 	}
 
-- 
2.26.2
