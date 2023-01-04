Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAF910E5DF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:29:51 +0530
Message-Id: <20230104170023.3355190-20-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 19/51] tests/kms_lease: Add support for
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
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 67e8d3be..a52d8bfc 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1213,10 +1213,14 @@ igt_main
 			igt_describe(f->desc);
 			igt_subtest_with_dynamic_f("%s", f->name) {
 				for_each_pipe_with_valid_output(display, data.pipe, output) {
+					igt_display_reset(display);
+
+					igt_output_set_pipe(output, data.pipe);
+					if (!i915_pipe_output_combo_valid(display))
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
 						      igt_output_name(output)) {
-						igt_display_reset(display);
-						igt_display_commit(display);
 						data.crtc_id = display->pipes[data.pipe].crtc_id;
 						data.connector_id = output->id;
 						data.plane_id =
-- 
2.39.0
