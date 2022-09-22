Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D360410EC82
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 16:04:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 21:29:54 +0530
Message-Id: <20220922160004.2041598-43-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 42/52] tests/i915/kms_draw_crc: Add support for
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
---
 tests/i915/kms_draw_crc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index b99f348d..09ec190d 100644
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
+		if (!i915_pipe_output_combo_valid(&display))
 			continue;
 
+		mode = igt_output_get_mode(output);
 		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+
 		/*Only one pipe/output is enough*/
 		break;
 	}
-- 
2.37.3
