Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D4B10E395
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 03:58:00 +0000 (UTC)
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 May 2023 09:20:52 +0530
Message-Id: <20230517035052.1099227-2-arun.r.murthy@intel.com>
In-Reply-To: <20230517035052.1099227-1-arun.r.murthy@intel.com>
References: <20230516062206.1064604-1-arun.r.murthy@intel.com>
 <20230517035052.1099227-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCHv2 i-g-t 2/4] tests/kms_async_flips: Run the test
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

No real reason to iterate over all the outputs here. Just
do the test once per pipe.

v2: corrected commit message

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/kms_async_flips.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index fe27a9ec..1c036426 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -548,27 +548,20 @@ static void test_crc(data_t *data)
 
 static void run_test(data_t *data, void (*test)(data_t *))
 {
-	igt_output_t *output;
-	enum pipe pipe;
 	igt_display_t *display = &data->display;
 
-	for_each_pipe(display, pipe) {
-		for_each_valid_output_on_pipe(display, pipe, output) {
-			igt_display_reset(display);
+	for_each_valid_output_on_pipe(display, data->pipe, data->output) {
+		igt_display_reset(display);
 
-			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
-				continue;
+		igt_output_set_pipe(data->output, data->pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
-				data->output = output;
-				data->pipe = pipe;
-				test(data);
-			}
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
+			test(data);
 
-			if (!data->extended)
-				break;
-		}
+		if (!data->extended)
+			break;
 	}
 }
 
-- 
2.25.1
