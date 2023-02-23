Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7402210EBCB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 15:16:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 20:40:14 +0530
Message-Id: <20230223151018.2565040-48-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v8 47/51] tests/i915/kms_psr2_sf: Add support for
 Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_sf.c | 55 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 2d761d311..51a36a469 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -870,6 +870,22 @@ static int check_psr2_support(data_t *data)
 	return status;
 }
 
+static bool
+pipe_output_combo_valid(igt_display_t *display,
+			enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!i915_pipe_output_combo_valid(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 igt_main
 {
 	data_t data = {};
@@ -930,6 +946,9 @@ igt_main
 	igt_describe("Test that selective fetch works on primary plane");
 	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -956,6 +975,9 @@ igt_main
 	igt_describe("Test that selective fetch works on primary plane with big fb");
 	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -982,6 +1004,9 @@ igt_main
 	igt_describe("Test that selective fetch works on overlay plane");
 	igt_subtest_with_dynamic_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1008,6 +1033,9 @@ igt_main
 	igt_describe("Test that selective fetch works on cursor plane");
 	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1030,6 +1058,9 @@ igt_main
 	igt_describe("Test that selective fetch works on moving cursor plane (no update)");
 	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1052,6 +1083,9 @@ igt_main
 	igt_describe("Test that selective fetch works on moving cursor plane exceeding partially visible area (no update)");
 	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1074,6 +1108,9 @@ igt_main
 	igt_describe("Test that selective fetch works on moving cursor plane exceeding fully visible area (no update)");
 	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1098,6 +1135,9 @@ igt_main
 	igt_describe("Test that selective fetch works on moving overlay plane");
 	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1123,6 +1163,9 @@ igt_main
 	igt_describe("Test that selective fetch works on moving overlay plane (no update)");
 	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1145,6 +1188,9 @@ igt_main
 	igt_describe("Test that selective fetch works on moving overlay plane partially exceeding visible area (no update)");
 	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1167,6 +1213,9 @@ igt_main
 	igt_describe("Test that selective fetch works on moving overlay plane fully exceeding visible area (no update)");
 	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1191,6 +1240,9 @@ igt_main
 		     "with blended overlay plane");
 	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
@@ -1221,6 +1273,9 @@ igt_main
 	igt_describe("Test that selective fetch works on overlay plane");
 	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
+			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+				continue;
+
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-- 
2.39.1
