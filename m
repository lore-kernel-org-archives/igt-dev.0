Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A074610E04B
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 06:49:07 +0000 (UTC)
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 12:19:05 +0530
Message-Id: <20230109064905.280139-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
References: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v2] tests/kms_cursor_crc: Skip for invalid pipe
 connector connection
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

Added a skip condition that checks for the valid pipe connection. This is a 
generic skip on pipe which checks for valid connector connection mask bit. 
This condition helps to skip tests for MSO panels on non supported pipes
(C and D).This condition was missed for cursor-size-change,
cursor-alpha-opaque and cursor-alpha-transparent testcases.

--v2
- Change commit messege  from "Add Gaurd for MSO eDP for Pipe C and D"
to "Skip condition for non valid pipe connector connection" [Kamil]
- skip condition using igt_pipe_connector_valid() [Juha-Pekka]

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

---
 tests/kms_cursor_crc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 17f294d6..87497b9e 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -786,6 +786,13 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-size-change") {
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
+			
+			if(!igt_pipe_connector_valid(pipe, data->output)) {
+				igt_debug("Invalid connector on pipe-%s-%s",
+				      kmstest_pipe_name(pipe),
+				      data->output->name);
+				continue;
+			}
 
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
@@ -800,6 +807,13 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-alpha-opaque") {
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
+			
+			if(!igt_pipe_connector_valid(pipe, data->output)) {
+				igt_debug("Invalid connector on pipe-%s-%s",
+				      kmstest_pipe_name(pipe),
+				      data->output->name);
+				continue;
+			}
 
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
@@ -814,6 +828,13 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-alpha-transparent") {
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
+			
+			if(!igt_pipe_connector_valid(pipe, data->output)) {
+				igt_debug("Invalid connector on pipe-%s-%s",
+				      kmstest_pipe_name(pipe),
+				      data->output->name);
+				continue;
+			}
 
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
-- 
2.35.1
