Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586E310E433
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:01:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:28:52 +0530
Message-Id: <20221115165916.196084-30-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115165916.196084-1-bhanuprakash.modem@intel.com>
References: <20221115165916.196084-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v5 28/52] tests/kms_prime: Add support for
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
 tests/kms_prime.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 097c2f2a..d4a92651 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -89,14 +89,17 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	bool found = false;
 
 	for_each_pipe_with_valid_output(display, *pipe, output) {
-		found = true;
-		break;
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, *pipe);
+		if (i915_pipe_output_combo_valid(display)) {
+			found = true;
+			break;
+		}
 	}
 
 	igt_require_f(found, "No valid connector/pipe found\n");
 
-	igt_display_reset(display);
-	igt_output_set_pipe(output, *pipe);
 	return output;
 }
 
-- 
2.38.0
