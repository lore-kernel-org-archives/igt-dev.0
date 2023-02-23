Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3626888FAE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 15:16:22 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 20:40:09 +0530
Message-Id: <20230223151018.2565040-43-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v8 42/51] tests/i915/kms_fence_pin_leak: Add
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/i915/kms_fence_pin_leak.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 1972a699b..63657a742 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -124,6 +124,9 @@ static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	struct igt_fb fb[2];
 	int i;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 
 	mode = igt_output_get_mode(output);
@@ -196,6 +199,12 @@ static void run_test(data_t *data)
 	enum pipe p;
 
 	for_each_pipe_with_valid_output(display, p, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, p);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
+
 		run_single_test(data, p, output);
 
 		return; /* one time ought to be enough */
-- 
2.39.1
