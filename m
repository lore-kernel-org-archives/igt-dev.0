Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D41010E8B3
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 14:27:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 19:46:59 +0530
Message-Id: <20231201141703.3013801-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
References: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 3/7] tests/kms_vrr: Move all config constaints
 to new function
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

No functional change, cleanup only. Move all config checks
to new function.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 1765991c6..4cad663e4 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -483,6 +483,21 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &data->fb0);
 }
 
+static bool config_constraint(igt_output_t *output, uint32_t flags)
+{
+	if (!has_vrr(output))
+		return false;
+
+	/* For Negative tests, panel should be non-vrr. */
+	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
+		return false;
+
+	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
+		return false;
+
+	return true;
+}
+
 /* Runs tests on outputs that are VRR capable. */
 static void
 run_vrr_test(data_t *data, test_t test, uint32_t flags)
@@ -492,14 +507,7 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 	for_each_connected_output(&data->display, output) {
 		enum pipe pipe;
 
-		if (!has_vrr(output))
-			continue;
-
-		/* For Negative tests, panel should be non-vrr. */
-		if ((flags & TEST_NEGATIVE) && vrr_capable(output))
-			continue;
-
-		if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
+		if (!config_constraint(output, flags))
 			continue;
 
 		for_each_pipe(&data->display, pipe) {
-- 
2.40.0
