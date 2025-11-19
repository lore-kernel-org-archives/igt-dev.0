Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D304CF58F5
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 21:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB1810E690;
	Wed, 19 Nov 2025 21:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAtq0otM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E663E10E699
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 21:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763586167; x=1795122167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UqQY3EBY2fC9Tbz3UIHmBDcknwBG/jbMn3j7RJPjpMA=;
 b=KAtq0otMV816bbXZlcpStO4s3DzF8wbwKUSG8ZhIALbMafkdYGkocTn2
 rAwRR6zDt/SMsfZO998t3l9Uh2nqzqDjkQY874eFzpQ4SbWAbxSok4mVX
 JytJnx2QgBz1vkJJMkQ0wPr9Y72WLtfn4idN71cAJApPlhcTF9320DmjK
 o/ygpoHUg1OgRuFYlI7rTGVTPp+CGYFIG2r5ytbJvZHXcR6roUkmyrE1C
 BXjwJhFamclJwjvMkJlQ07RW+GPpn31C1ij1qN/IU/kfIzOiEP4zRmfBS
 3NQMKyslAQkkX6tv+IURNoBRADZX6V5nOGF5r/VdJw5kWeFSaMkiZEnpy Q==;
X-CSE-ConnectionGUID: E3AogcbwQ+S2C9+AWCSQ9Q==
X-CSE-MsgGUID: 1V0lbo7RT0anvlq7x9+k3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68249397"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="68249397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 13:02:47 -0800
X-CSE-ConnectionGUID: NdC9QvecRymznd3pOkbL8A==
X-CSE-MsgGUID: HnwmQkf5RvCjYqotvxTMsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="222099825"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2025 13:02:45 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v3 3/3] tools/intel_gpu_frequency: Add Xe driver support
Date: Thu, 20 Nov 2025 02:15:30 +0530
Message-Id: <20251119204530.1357940-4-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119204530.1357940-1-s.sebinraj@intel.com>
References: <20251119204530.1357940-1-s.sebinraj@intel.com>
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
 tools/intel_gpu_frequency.c | 87 ++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 20 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index aaadd0857..2c56f0e2e 100644
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
@@ -263,6 +293,8 @@ usage(const char *prog)
 	printf("   intel_gpu_frequency --custom max=750 --gt 0\tSet GT0 max frequency to 750MHz\n");
 	printf("   intel_gpu_frequency --list\t\t\tList all available GTs\n");
 	printf("\n");
+	printf("Auto-detects i915 vs Xe driver and uses appropriate interfaces.\n");
+	printf("\n");
 	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
 	exit(EXIT_FAILURE);
 }
@@ -356,7 +388,7 @@ parse(int argc, char *argv[], int fd, bool *act_upon, size_t act_upon_n, int *ne
 			}
 			break;
 		case 'e': /* efficient */
-			if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)) {
+			if (!is_xe && (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))) {
 				/* the LP parts have special efficient frequencies */
 				fprintf(stderr,
 					"FIXME: Warning efficient frequency information is incorrect.\n");
@@ -435,8 +467,13 @@ static void list_available_gts(int fd, int num_gts)
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
 
@@ -464,26 +501,36 @@ static void execute_frequency_operations(int argc, int fd, int specified_gt, boo
 		/* Process single specified GT */
 		process_gt_frequencies(argc, fd, specified_gt, write, reader, targets, set_freq);
 	} else {
-		/* Process all GTs using for_each_gt pattern */
-		int gt_dir;
-
-		i915_for_each_gt(fd, gt_dir, target_gt) {
-			process_gt_frequencies(argc, fd, target_gt, write, reader, targets, set_freq);
+		/* Process all GTs using driver-specific for_each_gt pattern */
+		if (is_xe) {
+			xe_for_each_gt(fd, target_gt)
+				process_gt_frequencies(argc, fd, target_gt, write, reader, targets, set_freq);
+		} else {
+			int gt_dir;
+			i915_for_each_gt(fd, gt_dir, target_gt)
+				process_gt_frequencies(argc, fd, target_gt, write, reader, targets, set_freq);
 		}
 	}
 }
 
 int main(int argc, char *argv[])
 {
-
 	bool write, reader = false, targets[MAX+1] = {false}, list_gts = false;
 	int i, fd, set_freq[MAX+1] = {0}, num_gts;
 	int specified_gt = -1;
 
-	fd = drm_open_driver(DRIVER_INTEL);
-	devid = intel_get_drm_devid(fd);
-	device = igt_device_get_card_index(fd);
-	num_gts = igt_sysfs_get_num_gt(fd);
+	fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
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
 
 	write = parse(argc, argv, fd, targets, ARRAY_SIZE(targets), set_freq, &reader,
 		       &list_gts, &specified_gt);
-- 
2.43.0

