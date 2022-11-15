Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB9310E436
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:10:43 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:38:39 +0530
Message-Id: <20221115170855.196572-37-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v5 36/52] tests/kms_vrr: Add support for Bigjoiner
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
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_vrr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 8976d4a6..619b3789 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -444,6 +444,12 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 
 		for_each_pipe(&data->display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
+				igt_display_reset(&data->display);
+
+				igt_output_set_pipe(output, pipe);
+				if (!i915_pipe_output_combo_valid(&data->display))
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name)
 					test(data, pipe, output, flags);
-- 
2.38.0
