Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F188F593
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:37 +0530
Message-Id: <20220814180908.2553394-21-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 20/51] tests/kms_multipipe_modeset: Find the
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
2.35.1
