Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7D8CF8552
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 08:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9718610E708;
	Thu, 20 Nov 2025 08:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AR1GJjNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD0D10E708
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 08:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763626203; x=1795162203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQK9kN4HGb5/CzQk0bK+PtxvuWhjWTzbEoQJ5OOT3pM=;
 b=AR1GJjNJZXhmHdOlDJ2fFsdfs2YTdCo2rg0KdyQD4UmqIDTOMmH9Bt/e
 MKxR+4iwpc1KOl0FzQxuTpu4NyXmmMie5dZ6gR0qXp+xU6Ajqi11ivkdx
 HhPP11U9K3lPJNvN9A0VAoEUswQGVp2pR5aTJ6Rg4KLx9Vy8Ev4Yoot6m
 aWmWNFQ3iJbPk0NgWV3NUaah7p8o57c49c/6e149ii/fg8Pv6xCMMmOZ3
 lHoBDcDkbebrevrn1c4ZNbpCVIxgVgvjY59vgENmG/li7pobPUc22P1lT
 e5YEB3mUFK8g4j+PY6XDJrc15cy0Uh1ffdTPPiSh8EOnNpRdgsJfgtSSq g==;
X-CSE-ConnectionGUID: tVEKfPyGTwG63EKUgPqB3A==
X-CSE-MsgGUID: tg+/zJNOQOe54tphtjIohw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65618219"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65618219"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:10:03 -0800
X-CSE-ConnectionGUID: BsF1RNtAR1yhcz5kdNqXxA==
X-CSE-MsgGUID: I+N8Jwx1Sf6D4wAFEUXMcw==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2025 00:10:01 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v4 3/3] tools/intel_gpu_frequency: Add Xe driver support
Date: Thu, 20 Nov 2025 13:22:39 +0530
Message-Id: <20251120075239.1372105-4-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120075239.1372105-1-s.sebinraj@intel.com>
References: <20251120075239.1372105-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This change enhances intel_gpu_frequency to add compatibility with
Xe drivers.

Key improvements:
- Add runtime GT detection using xe_number_gt()
- Auto-detect driver type using is_xe_device()
- Driver-agnostic frequency management with unified interface

Driver-specific implementations:
- Automatic frequency name mapping (RP1→rpe, RP0→rp0, RPn→rpn for Xe)

The tool now auto-detects Xe drivers and uses appropriate
interfaces.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tools/intel_gpu_frequency.c | 92 ++++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 22 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 1931db72b..73793d5b8 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -33,11 +33,13 @@
 #include "igt_device.h"
 #include "igt_sysfs.h"
 #include "intel_chipset.h"
+#include "xe/xe_gt.h"
 
 #define VERSION "1.0"
 #define SYSFS_PATH_MAX 96
 
 static int device, devid;
+static bool is_xe;
 
 enum {
 	CUR=0,
@@ -58,27 +60,55 @@ struct freq_info {
 static struct freq_info info[] = {
 	{ "cur", "r"  },
 	{ "min", "rb+" },
-	{ "RP1", "r" },
+	{ "RP1", "r" },    /* i915: RP1, xe: rpe */
 	{ "max", "rb+" },
-	{ "RP0", "r" },
-	{ "RPn", "r" }
+	{ "RP0", "r" },    /* i915: RP0, xe: rp0 */
+	{ "RPn", "r" }     /* i915: RPn, xe: rpn */
 };
 
+static int driver_get_num_gts(int fd)
+{
+	if (is_xe) {
+		return xe_number_gt(fd);
+	} else {
+		return igt_sysfs_get_num_gt(fd);
+	}
+}
+
 static char *
 get_sysfs_path(int fd, int gt_id, const char *which)
 {
 	static char path[SYSFS_PATH_MAX];
 	char *gt_path;
 	int path_len, ret;
+	const char *freq_name;
+
+	/* Get driver-specific GT path */
+	if (is_xe)
+		gt_path = xe_sysfs_gt_path(fd, gt_id, path, sizeof(path));
+	else
+		gt_path = igt_sysfs_gt_path(fd, gt_id, path, sizeof(path));
 
-	gt_path = igt_sysfs_gt_path(fd, gt_id, path, sizeof(path));
 	if (gt_path == NULL) {
-		fprintf(stderr, "igt_sysfs_gt_path returned NULL for GT%d\n", gt_id);
+		fprintf(stderr, "sysfs_gt_path returned NULL for GT%d\n", gt_id);
 		return NULL;
 	}
+
 	path_len = strlen(gt_path);
-	ret = snprintf(path + path_len, sizeof(path) - path_len,
-		       "/rps_%s_freq_mhz", which);
+
+	if (is_xe) {
+		/* Xe uses /freq0/ directory with different file names */
+		freq_name = !strcmp(which, "RP1") ? "rpe" :
+			    !strcmp(which, "RP0") ? "rp0" :
+			    !strcmp(which, "RPn") ? "rpn" : which;
+
+		ret = snprintf(path + path_len, sizeof(path) - path_len,
+			       "/freq0/%s_freq", freq_name);
+	} else {
+		/* i915 uses /rps_*_freq_mhz files */
+		ret = snprintf(path + path_len, sizeof(path) - path_len,
+			       "/rps_%s_freq_mhz", which);
+	}
 
 	if (ret >= sizeof(path) - path_len) {
 		fprintf(stderr, "Path truncated\n");
@@ -168,6 +198,8 @@ usage(const char *prog, int err)
 	printf("   intel_gpu_frequency --get --gt 1\tGet frequencies for GT1\n");
 	printf("   intel_gpu_frequency --list\t\tList all available GTs\n");
 	printf("\n");
+	printf("Auto-detects i915 vs Xe driver and uses appropriate interfaces.\n");
+	printf("\n");
 	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
 	exit(err);
 }
@@ -286,7 +318,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 			}
 			break;
 		case 'e': /* efficient */
-			if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)) {
+			if (!is_xe && (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))) {
 				/* the LP parts have special efficient frequencies */
 				fprintf(stderr,
 					"FIXME: Warning efficient frequency information is incorrect.\n");
@@ -402,8 +434,13 @@ static void list_available_gts(int fd, int num_gts)
 	for (i = 0; i < num_gts; i++) {
 		char path[SYSFS_PATH_MAX];
 
-		if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
-			printf("  GT%d: %s\n", i, path);
+		if (is_xe) {
+			if (xe_sysfs_gt_path(fd, i, path, sizeof(path)))
+				printf("  GT%d: %s\n", i, path);
+		} else {
+			if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
+				printf("  GT%d: %s\n", i, path);
+		}
 	}
 }
 
@@ -431,11 +468,15 @@ static void execute_frequency_operations(int argc, int fd, int specified_gt, boo
 		/* Process single specified GT */
 		process_gt_frequencies(argc, fd, specified_gt, write, reader, targets, set_freq);
 	} else {
-		/* Process all GTs */
-		int num_gts = igt_sysfs_get_num_gt(fd);
-
-		for (target_gt = 0; target_gt < num_gts; target_gt++)
-			process_gt_frequencies(argc, fd, target_gt, write, reader, targets, set_freq);
+		/* Process all GTs using driver-specific for_each_gt pattern */
+		if (is_xe) {
+			xe_for_each_gt(fd, target_gt)
+				process_gt_frequencies(argc, fd, target_gt, write, reader, targets, set_freq);
+		} else {
+			int gt_dir;
+			i915_for_each_gt(fd, gt_dir, target_gt)
+				process_gt_frequencies(argc, fd, target_gt, write, reader, targets, set_freq);
+		}
 	}
 }
 
@@ -503,17 +544,24 @@ again:
 
 int main(int argc, char *argv[])
 {
-	bool write, reader = false, list_gts = false, targets[MAX+1] = {false};
-	int i, fd, set_freq[MAX+1] = {0};
+	bool write, reader = false, targets[MAX+1] = {false}, list_gts = false;
+	int i, fd, set_freq[MAX+1] = {0}, num_gts;
 	int specified_gt = -1;
-	int num_gts;
 
 	parse_version_or_help(argc, argv);
 
-	fd = __drm_open_driver(DRIVER_INTEL);
-	devid = intel_get_drm_devid(fd);
-	device = igt_device_get_card_index(fd);
-	num_gts = igt_sysfs_get_num_gt(fd);
+	fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+	is_xe = is_xe_device(fd);
+
+	if (is_xe) {
+		igt_debug("Using Xe driver\n");
+	} else {
+		devid = intel_get_drm_devid(fd);
+		device = igt_device_get_card_index(fd);
+		igt_debug("Using i915 driver\n");
+	}
+
+	num_gts = driver_get_num_gts(fd);
 
 	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq, &reader,
 		      &specified_gt, &list_gts, fd);
-- 
2.43.0

