Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BB010EB24
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 16:04:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 21:29:32 +0530
Message-Id: <20220922160004.2041598-21-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 20/52] tests/kms_multipipe_modeset: Find the
 suitable mode instead of using default
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
 tests/kms_multipipe_modeset.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 6358d930..6ba6943e 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -46,6 +46,15 @@ static void run_test(data_t *data, int valid_outputs)
 	drmModeModeInfo *mode;
 	int i = 0;
 
+	/* Find suitable mode/resolution combo */
+	for_each_connected_output(display, output) {
+		pipe = &display->pipes[i];
+		igt_output_set_pipe(output, i);
+
+		i++;
+	}
+	igt_require(igt_override_all_active_output_modes_to_fit_bw(display));
+
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
-- 
2.37.3
