Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D8310E381
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 23:44:22 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 13 Dec 2022 16:43:32 -0700
Message-ID: <20221213234332.364224-2-alex.hung@amd.com>
In-Reply-To: <20221213234332.364224-1-alex.hung@amd.com>
References: <20221213234332.364224-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] tests/kms_bw: Run tests on available pipes
 only
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

This cleans up unnecessary skips during executions.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_bw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 27100587..ac801746 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -145,17 +145,9 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	igt_output_t *output;
 	struct igt_fb buffer[IGT_MAX_PIPES];
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
-	int i = 0, num_pipes = 0;
-	enum pipe p;
+	int i = 0;
 	int ret;
 
-	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
-	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
-	for_each_pipe(display, p) num_pipes++;
-
-	igt_skip_on_f(pipe > num_pipes,
-                      "ASIC does not have %d pipes\n", pipe);
-
 	test_init(data);
 
 	/* create buffers */
@@ -204,6 +196,7 @@ igt_main
 {
 	data_t data;
 	int i = 0, j = 0;
+	enum pipe p;
 
 	memset(&data, 0, sizeof(data));
 
@@ -219,14 +212,13 @@ igt_main
 
 	}
 
-	/* We're not using for_each_pipe_static because we need the
-	 * _amount_ of pipes */
-	for (i = 0; i < IGT_MAX_PIPES; i++) {
+	for_each_pipe(&data.display, p) {
 		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
 			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
 			      test_mode[j].name)
 			run_test_linear_tiling(&data, i, &test_mode[j]);
 		}
+		i++;
 	}
 
 	igt_fixture
-- 
2.38.1
