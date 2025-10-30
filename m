Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D97CCF9FA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 15:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A73710E9F9;
	Thu, 30 Oct 2025 15:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4an0SXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167E610E9F9
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 15:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761838719; x=1793374719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/YBEjU/qlDj6j6hhUn8WjIh/BQ5wVPhX1gnz0+0fjeY=;
 b=J4an0SXDwlqJ8wm2nIajkyjW1tS5gsuvHZv4SUrEAhtFVw2GKAtdZ0kD
 LeG4SRzkwqeWjkrqHTsl7hxWwwk7DXaZhyv/2nOO3dnhSnHNVo/yYZ5Wo
 NfmWGAaalVCrxMNqQXKiwVADW0TOKfQkfwHQhaiBUb8JF4BYYlH6ce0Th
 HayqPqnvzbhUouDq0TFswVW/2LGxNGHf81gAUNJgNonyr47Ud1x9enwhX
 o5NtJldEmtBXa0rTCe+iqe9g4Mjv/xNmSUnQbnIs/ldkyDmIFoTODv/+G
 Fpj3k5nh52eW3QTwAZSlEu63jP0R8lEkGee/9N38AfPV+JZyCSABUpM5h w==;
X-CSE-ConnectionGUID: 3rEgvJeMRj+3PqyRvHHIwQ==
X-CSE-MsgGUID: LALPIH3tTq2DgLeGrMgJ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67845634"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67845634"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:38:39 -0700
X-CSE-ConnectionGUID: EMX2RWTJRaSTgnC0Wp6xPQ==
X-CSE-MsgGUID: Owbl8fjrQgO/ulCI8EG0eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185190443"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 08:38:37 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v2 3/3] tools/intel_gpu_frequency: Add Xe driver support
Date: Thu, 30 Oct 2025 20:54:05 +0530
Message-Id: <20251030152405.3422044-4-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030152405.3422044-1-s.sebinraj@intel.com>
References: <20251030152405.3422044-1-s.sebinraj@intel.com>
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
 tools/intel_gpu_frequency.c | 87 +++++++++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 19 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 5c8c4d57e..8517ec069 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -32,11 +32,13 @@
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
@@ -57,27 +59,55 @@ struct freq_info {
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
@@ -147,7 +177,7 @@ static void process_gt_frequencies(int fd, int gt_id, bool write, bool *targets,
 	int i, try = 1;
 	bool fail = write;
 
-	if (igt_sysfs_get_num_gt(fd) > 1)
+	if (driver_get_num_gts(fd) > 1)
 		printf("\n--- GT%d ---\n", gt_id);
 
 	/* If we've previously locked the frequency, we need to make sure to set things
@@ -212,6 +242,8 @@ usage(const char *prog)
 	printf("   intel_gpu_frequency --custom max=750 --gt 0\tSet GT0 max frequency to 750MHz\n");
 	printf("   intel_gpu_frequency --list-gts\t\tList all available GTs\n");
 	printf("\n");
+	printf("Auto-detects i915 vs Xe driver and uses appropriate interfaces.\n");
+	printf("\n");
 	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
 	exit(EXIT_FAILURE);
 }
@@ -317,7 +349,7 @@ parse(int argc, char *argv[], int fd, bool *act_upon, size_t act_upon_n,
 			}
 			break;
 		case 'e': /* efficient */
-			if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)) {
+			if (!is_xe && (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))) {
 				/* the LP parts have special efficient frequencies */
 				fprintf(stderr,
 					"FIXME: Warning efficient frequency information is incorrect.\n");
@@ -396,8 +428,13 @@ static void list_available_gts(int fd, int num_gts)
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
 
@@ -425,11 +462,15 @@ static void execute_frequency_operations(int fd, int specified_gt, bool write,
 		/* Process single specified GT */
 		process_gt_frequencies(fd, specified_gt, write, targets, set_freq);
 	} else {
-		/* Process all GTs using for_each_gt pattern */
-		int gt_dir;
+		/* Process all GTs using driver-specific for_each_gt pattern */
+		if (is_xe) {
+			xe_for_each_gt(fd, target_gt)
+				process_gt_frequencies(fd, target_gt, write, targets, set_freq);
+		} else {
+			int gt_dir;
 
-		i915_for_each_gt(fd, gt_dir, target_gt) {
-			process_gt_frequencies(fd, target_gt, write, targets, set_freq);
+			i915_for_each_gt(fd, gt_dir, target_gt)
+				process_gt_frequencies(fd, target_gt, write, targets, set_freq);
 		}
 	}
 }
@@ -440,10 +481,18 @@ int main(int argc, char *argv[])
 	int i, fd, set_freq[MAX+1] = {0}, num_gts;
 	int specified_gt = -1;
 
-	fd = __drm_open_driver(DRIVER_INTEL);
-	devid = intel_get_drm_devid(fd);
-	device = igt_device_get_card_index(fd);
-	num_gts = igt_sysfs_get_num_gt(fd);
+	fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+	is_xe = is_xe_device(fd);
+
+	if (is_xe) {
+		printf("Using Xe driver\n");
+	} else {
+		devid = intel_get_drm_devid(fd);
+		device = igt_device_get_card_index(fd);
+		printf("Using i915 driver\n");
+	}
+
+	num_gts = driver_get_num_gts(fd);
 
 	write = parse(argc, argv, fd, targets, ARRAY_SIZE(targets), set_freq,
 		      &list_gts, &specified_gt);
-- 
2.43.0

