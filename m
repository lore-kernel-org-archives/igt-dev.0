Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5066410E5EC
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:30:15 +0530
Message-Id: <20230104170023.3355190-44-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 43/51] tests/i915/kms_flip_scaled_crc: Add
 support for Bigjoiner
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
V3: - Fix dangling pointer

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 10465ca7..7f7a59b9 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -648,8 +648,13 @@ igt_main
 			for_each_pipe(&data.display, pipe) {
 				bool found = false;
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_display_reset(&data.display);
+
 					modetoset = find_mode(&data, output);
-					if (modetoset) {
+					igt_output_set_pipe(output, pipe);
+					igt_output_override_mode(output, modetoset);
+
+					if (modetoset && i915_pipe_output_combo_valid(&data.display)) {
 						found = true;
 						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
 							run_tests(&data, index, pipe, output, modetoset);
@@ -658,6 +663,13 @@ igt_main
 				}
 				if (!found) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_display_reset(&data.display);
+
+						igt_output_set_pipe(output, pipe);
+						if (!i915_pipe_output_combo_valid(&data.display))
+							continue;
+
+						modetoset = NULL;
 						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
 							run_tests(&data, index, pipe, output, modetoset);
 					}
-- 
2.39.0
