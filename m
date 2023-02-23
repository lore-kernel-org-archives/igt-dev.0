Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9084210E4D0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 15:16:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 20:39:58 +0530
Message-Id: <20230223151018.2565040-32-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v8 31/51] tests/kms_scaling_modes: Add support for
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
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_scaling_modes.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 039e4a8d9..cf6377122 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -93,13 +93,17 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_display_reset(display);
+
 		if (!has_scaling_mode(output))
 			continue;
 
+		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
+
 		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
 			test_scaling_mode_on_output(display, pipe, output, flags);
-
-		igt_display_reset(display);
 	}
 }
 
-- 
2.39.1
