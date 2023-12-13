Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC3C10E6D6
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 04:48:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t V8 3/7] tests/kms_vrr: Move all config constaints to new
 function
Date: Wed, 13 Dec 2023 10:07:37 +0530
Message-Id: <20231213043741.3640374-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231213043741.3640374-1-bhanuprakash.modem@intel.com>
References: <20231213043741.3640374-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

No functional change, cleanup only. Move all config checks
to new function.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 13e7f3ca6..df241aa6c 100644
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
