Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CE910E351
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 13:31:20 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 19:06:53 +0530
Message-Id: <20230131133658.21970-3-nidhi1.gupta@intel.com>
In-Reply-To: <20230131133658.21970-1-nidhi1.gupta@intel.com>
References: <20230131133658.21970-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 2/7] tests/kms_async_flips: Limit the execution
 to single pipe
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

As the execution is taking more time, limit the execution to single
pipe.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_async_flips.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 7cb71f6b..d516e3e2 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -543,17 +543,15 @@ static void run_test(data_t *data, void (*test)(data_t *))
 	igt_output_t *output;
 	enum pipe pipe;
 
-	for_each_pipe(&data->display, pipe) {
-		for_each_valid_output_on_pipe(&data->display, pipe, output) {
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
-				data->output = output;
-				data->pipe = pipe;
-				test(data);
-			}
-
-			if (!data->extended)
-				break;
+	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+			data->output = output;
+			data->pipe = pipe;
+			test(data);
 		}
+
+		if (!data->extended)
+			break;
 	}
 }
 
-- 
2.39.0
