Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B3710E60E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 09:53:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:20:20 +0530
Message-Id: <20220906095030.486152-43-bhanuprakash.modem@intel.com>
In-Reply-To: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
References: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 42/52] tests/i915/kms_draw_crc: Add support for
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_draw_crc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index b99f348d..5a89dc58 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -59,17 +59,16 @@ static void find_modeset_params(void)
 {
 	enum pipe pipe;
 
-	igt_display_reset(&display);
-	igt_display_commit(&display);
-
 	for_each_pipe_with_valid_output(&display, pipe, output) {
-		igt_output_set_pipe(output, pipe);
+		igt_display_reset(&display);
 
-		mode = igt_output_get_mode(output);
-		if (!mode)
+		igt_output_set_pipe(output, pipe);
+		if (!igt_test_constraint(&display))
 			continue;
 
+		mode = igt_output_get_mode(output);
 		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+
 		/*Only one pipe/output is enough*/
 		break;
 	}
-- 
2.35.1
