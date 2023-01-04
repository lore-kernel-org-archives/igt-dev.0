Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1390510E5F1
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:30:13 +0530
Message-Id: <20230104170023.3355190-42-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 41/51] tests/i915/kms_draw_crc: Add support for
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
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_draw_crc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index c2ac4721..01c3808c 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -59,16 +59,14 @@ static void find_modeset_params(void)
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
+		if (!i915_pipe_output_combo_valid(&display))
 			continue;
 
+		mode = igt_output_get_mode(output);
 		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
 		/*Only one pipe/output is enough*/
 		break;
-- 
2.39.0
