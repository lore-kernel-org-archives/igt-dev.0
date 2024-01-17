Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CF010E652
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 09:49:30 +0000 (UTC)
From: soumya prabhu nidoni <soumya.prabhu.nidoni@intel.com>
Subject: [PATCH] [i-g-t] lib/kms_psr: Honour PSR OS capability alongside Sink
 capability
Date: Wed, 17 Jan 2024 15:19:07 +0530
Message-Id: <20240117094907.401866-1-soumya.prabhu.nidoni@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Currently IGT code is checking only the Sink Support it's not verifying
OS capability.So this patch is verifying OS PSR capability.

Signed-off-by: soumya prabhu nidoni <soumya.prabhu.nidoni@intel.com>
---
 lib/igt_psr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 663bac163..f43d46dfb 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -208,7 +208,8 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 {
 	char *line;
 	char debugfs_file[128] = {0};
-	char buf[PSR_STATUS_MAX_LEN];
+	char debugfs_file1[128] = {0};
+	char buf[PSR_STATUS_MAX_LEN], buf1[5000];
 	int ret;
 
 	if (output)
@@ -216,10 +217,16 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 	else
 		sprintf(debugfs_file, "%s", "i915_edp_psr_status");
 
+	sprintf(debugfs_file1, "%s", "i915_capabilities");
+
 	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				      sizeof(buf));
 	if (ret < 1)
 		return false;
+	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file1, buf1,
+				      sizeof(buf1));
+	if (ret < 1)
+		return false;
 
 	line = strstr(buf, "Sink support: ");
 	if (!line)
@@ -227,9 +234,10 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 
 	switch (mode) {
 	case PSR_MODE_1:
-		return strstr(line, "PSR = yes") ||
+		return ((strstr(line, "PSR = yes") ||
 		       strstr(buf, "Sink_Support: yes\n") ||
-		       strstr(buf, "Sink support: yes");
+		       strstr(buf, "Sink support: yes")) &&
+		       strstr(buf1, "i915.enable_psr=1"));
 	case PSR_MODE_2:
 	case PSR_MODE_2_SEL_FETCH:
 		/*
@@ -240,10 +248,11 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		 * PSR version 0x4 that is PSR2 + SU w/ Y-coordinate and SU
 		 * Region Early Transport to support PSR2 (eDP 1.5)
 		 */
-		return strstr(buf, "Sink support: yes [0x03]") ||
+		return ((strstr(buf, "Sink support: yes [0x03]") ||
 		       strstr(buf, "Sink support: yes [0x04]") ||
 		       (strstr(line, "PSR = yes") &&
-		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
+		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")))) &&
+			strstr(buf1, "i915.enable_psr=2"));
 	case PR_MODE:
 		return strstr(line, "Panel Replay = yes");
 	default:
-- 
2.25.1


