Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4522598E4C
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:13:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:39:03 +0530
Message-Id: <20220814180908.2553394-47-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 46/51] tests/i915/kms_mmap_write_crc: Add support
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
 tests/i915/kms_mmap_write_crc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index a57938b5..1bc249b9 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -276,6 +276,12 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 
 	igt_subtest_with_dynamic("main") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_display_reset(&data.display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!igt_test_constraint(&data.display))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
 				      igt_output_name(output)) {
 				data.output = output;
-- 
2.35.1
