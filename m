Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C9210E33D
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 12:07:02 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 14:06:44 +0200
Message-Id: <20230131120646.27434-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] tests/kms_async_flips: Run the test
 only once per pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

No real reason to iterate over all the outputs here. Just
do the test once per pipe.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index f8c97e029c59..54611f66350d 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -544,20 +544,12 @@ static void test_crc(data_t *data)
 
 static void run_test(data_t *data, void (*test)(data_t *))
 {
-	igt_output_t *output;
-	enum pipe pipe;
+	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+		igt_dynamic_f("pipe-%s", kmstest_pipe_name(data->pipe))
+			test(data);
 
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
-		}
+		if (!data->extended)
+			break;
 	}
 }
 
-- 
2.39.1
