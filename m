Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7260398CEB
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:49 +0530
Message-Id: <20220814180908.2553394-33-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 32/51] tests/kms_scaling_modes: Add support for
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
 tests/kms_scaling_modes.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 8e80189a..a0b268ae 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -93,13 +93,17 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_display_reset(display);
+
 		if (!has_scaling_mode(output))
 			continue;
 
+		igt_output_set_pipe(output, pipe);
+		if (!igt_test_constraint(display))
+			continue;
+
 		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
 			test_scaling_mode_on_output(display, pipe, output, flags);
-
-		igt_display_reset(display);
 	}
 }
 
-- 
2.35.1
