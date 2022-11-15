Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CEC10E044
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:10:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:38:14 +0530
Message-Id: <20221115170855.196572-12-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v5 11/52] tests/kms_content_protection: Add
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
---
 tests/kms_content_protection.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index aa28b7bf..0aa2a8a2 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -502,6 +502,13 @@ test_content_protection(enum igt_commit_style s, int content_type)
 				continue;
 
 			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!i915_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
+			}
+
 			modeset_with_fb(pipe, output, s);
 
 			if (!output_hdcp_capable(output, content_type))
@@ -623,6 +630,14 @@ test_content_protection_mst(int content_type)
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
 		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(display)){
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
+		}
+
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(pipe), igt_output_name(output));
+
 		prepare_modeset_on_mst_output(output);
 		mst_output[dp_mst_outputs++] = output;
 	}
-- 
2.38.0
