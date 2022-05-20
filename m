Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E5B10E167
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 01:09:50 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 May 2022 06:42:25 +0530
Message-Id: <20220520011226.24017-2-nidhi1.gupta@intel.com>
In-Reply-To: <20220520011226.24017-1-nidhi1.gupta@intel.com>
References: <20220520011226.24017-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/kms_invalid_mode : Convert tests to
 dynamic
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

Modified kms_invalid_mode to include dynamic test cases
for better reporting of the results.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_invalid_mode.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index bb92a94e..bb524037 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -296,8 +296,11 @@ static const struct {
 
 static data_t data;
 
-igt_main
-{
+igt_main {
+
+igt_output_t *output;
+enum pipe pipe;
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -312,9 +315,15 @@ igt_main
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
-		igt_subtest(subtests[i].name) {
-			data.adjust_mode = subtests[i].adjust_mode;
-			test(&data);
+		igt_subtest_with_dynamic(subtests[i].name) {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+						data.adjust_mode = subtests[i].adjust_mode;
+						test(&data);
+					}
+				}
+			}
 		}
 	}
 
-- 
2.26.2
