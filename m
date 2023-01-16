Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538810E451
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jan 2023 14:32:22 +0000 (UTC)
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 Jan 2023 20:02:19 +0530
Message-Id: <20230116143219.35162-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
References: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] [i-g-t,
 v2] tests/kms_cursor_crc: skip pipe on invalid connector in cursor
 size test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: suresh.kumar.kurmi@intel.com, dnyaneshwar.bhadane@intel.com,
 juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Only the valid pipe connector combination reach to the igt commit.
Cursor max-size test will not affect existing flow as only skip
for invalid connector.
For cursor-dpms and cursor-suspend not require to check require_cursor_size
becuase the cursor height and width used from drm capablities.

--v2
- Used for_each_pipe_with_single_output() to iterate for valid pipe and output.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 tests/kms_cursor_crc.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index d5a4b30b..a4afcff3 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -749,7 +749,7 @@ static void run_size_tests(data_t *data, int w, int h)
 				}
 			}
 
-			for_each_pipe(&data->display, pipe) {
+			for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 				data->pipe = pipe;
 
 				if (require_cursor_size(data, w, h)) {
@@ -850,15 +850,10 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Check random placement of a cursor with DPMS.");
 	igt_subtest_with_dynamic("cursor-dpms") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
-			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
-				igt_debug("Cursor size %dx%d not supported by driver\n",
-					  data->cursor_max_w, data->cursor_max_h);
-				continue;
-			}
 
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
@@ -871,15 +866,10 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Check random placement of a cursor with suspend.");
 	igt_subtest_with_dynamic("cursor-suspend") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 			data->flags = TEST_SUSPEND;
 
-			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
-				igt_debug("Cursor size %dx%d not supported by driver\n",
-					  data->cursor_max_w, data->cursor_max_h);
-				continue;
-			}
 
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
-- 
2.35.1
