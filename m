Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9889486E
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:39:00 +0530
Message-Id: <20220814180908.2553394-44-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 43/51] tests/i915/kms_flip_scaled_crc: Add support
 for Bigjoiner
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 764eb70f..bc9d8cb4 100644
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
+					if (modetoset && igt_test_constraint(&data.display)) {
 						found = true;
 						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
 							run_tests(&data, index, pipe, output, modetoset);
@@ -658,6 +663,12 @@ igt_main
 				}
 				if (!found) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_display_reset(&data.display);
+
+						igt_output_set_pipe(output, pipe);
+						if (!igt_test_constraint(&data.display))
+							continue;
+
 						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
 							run_tests(&data, index, pipe, output, modetoset);
 					}
-- 
2.35.1
