Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8B210ED92
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 14:06:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 19:32:56 +0530
Message-Id: <20220909140331.1041095-18-bhanuprakash.modem@intel.com>
In-Reply-To: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 17/52] tests/kms_flip_event_leak: Add support
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

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip_event_leak.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index ac201293..87f05052 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -48,6 +48,9 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	struct igt_fb fb[2];
 	int fd, ret;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, pipe);
 
@@ -102,6 +105,13 @@ igt_simple_main
 	igt_display_require(&data.display, data.drm_fd);
 
 	for_each_pipe_with_valid_output(&data.display, pipe, output) {
+		igt_display_reset(&data.display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(&data.display))
+			continue;
+
+		igt_output_set_pipe(output, PIPE_NONE);
 		test(&data, pipe, output);
 		valid_tests++;
 	}
-- 
2.35.1
