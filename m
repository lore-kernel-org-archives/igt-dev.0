Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7673E10E0EE
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 10:49:16 +0000 (UTC)
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 16:19:16 +0530
Message-Id: <20230125104916.37626-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
References: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t, v5] tests/kms_cursor_crc:
 s/for_each_pipe/for_each_pipe_with_single_output/
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: suresh.kumar.kurmi@intel.com, dnyaneshwar.bhadane@intel.com,
 juha-pekka.heikkila@intel.com, chaitanya.kumar.borah@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Changed all testcase to loop over the valid pipe and output connector
combination using for_each_pipe_with_single_output instead of for_each_pipe.
Removed igt_pipe_connector_valid as it is already checked in the above
mentioned loop macro.
Removed redundant assigment in igt_fixture for data->output.

--v1
- Remove cursor size check from the cursor_dpms and cursor_suspend.

--v2
- Used for_each_pipe_with_single_output() to iterate for valid pipe and 
output [Ville]

--v3
- Added for_each_pipe_valid_connector() to check for valid connection.
- pipe variable should initilize with default 0, [Petri]

--v4
- Used for_each_pipe_with_single_output [Bhanuprakash]
- Removed unused assigment to date->output in igt_fixture
- Removed igt_pipe_connector_valid(),It is already verified in the loop macro

--v5
- fixed commit messege.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

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
