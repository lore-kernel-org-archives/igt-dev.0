Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B1610E079
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jan 2023 13:03:39 +0000 (UTC)
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Jan 2023 18:33:25 +0530
Message-Id: <20230124130325.13163-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
References: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t,
 v4] tests/kms_cursor_crc: skip pipe on invalid connector in cursor
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

--v4
- Used for_each_pipe_with_single_output [Bhanuprakash]
- Removed usless assigment to date->output in igt_fixture
- Removed igt_pipe_connector_valid(),It is already verified in the loop macro

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

---
 tests/kms_cursor_crc.c | 47 ++++++------------------------------------
 1 file changed, 6 insertions(+), 41 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index d5a4b30b..0b5aac30 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -749,7 +749,7 @@ static void run_size_tests(data_t *data, int w, int h)
 				}
 			}
 
-			for_each_pipe(&data->display, pipe) {
+			for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 				data->pipe = pipe;
 
 				if (require_cursor_size(data, w, h)) {
@@ -774,8 +774,6 @@ static void run_tests_on_pipe(data_t *data)
 	int cursor_size;
 
 	igt_fixture {
-		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
-		igt_require(data->output);
 		data->alpha = 1.0;
 		data->flags = 0;
 	}
@@ -784,16 +782,9 @@ static void run_tests_on_pipe(data_t *data)
 		     "flight to smaller ones to see that the size is applied "
 		     "correctly.");
 	igt_subtest_with_dynamic("cursor-size-change") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
-			if(!igt_pipe_connector_valid(pipe, data->output)) {
-				igt_debug("Invalid connector on pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
-				      data->output->name);
-				continue;
-			}
-
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -805,16 +796,9 @@ static void run_tests_on_pipe(data_t *data)
 	igt_describe("Validates the composition of a fully opaque cursor "
 		     "plane, i.e., alpha channel equal to 1.0.");
 	igt_subtest_with_dynamic("cursor-alpha-opaque") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
-			if(!igt_pipe_connector_valid(pipe, data->output)) {
-				igt_debug("Invalid connector on pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
-				      data->output->name);
-				continue;
-			}
-
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -826,16 +810,9 @@ static void run_tests_on_pipe(data_t *data)
 	igt_describe("Validates the composition of a fully transparent cursor "
 		     "plane, i.e., alpha channel equal to 0.0.");
 	igt_subtest_with_dynamic("cursor-alpha-transparent") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
-			if(!igt_pipe_connector_valid(pipe, data->output)) {
-				igt_debug("Invalid connector on pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
-				      data->output->name);
-				continue;
-			}
-
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -850,16 +827,10 @@ static void run_tests_on_pipe(data_t *data)
 
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
-
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -871,16 +842,10 @@ static void run_tests_on_pipe(data_t *data)
 
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
-
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
-- 
2.35.1
