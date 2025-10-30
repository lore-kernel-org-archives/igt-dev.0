Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903D9CCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 15:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457F810E9FB;
	Thu, 30 Oct 2025 15:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiPPES4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB12E10E9F9
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761838717; x=1793374717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IMt1Ki7Z4q/oABEMHhMgJa6rxUMpVCQs2FhLGTwXRks=;
 b=DiPPES4aYcyP5dhtx5MmB8sZCKhv5ftGJs6iAuuZb/SfMAuUe4d7jY7s
 K70jL7mKB7Uta7ABPU0lKWALc8VBGslYgAQJ+H5z1+nuvuQgTPq8Ov06l
 is38XVCvj1pfK7r2geNE0qy2vgQH1GXijHrVvzh0waAOxRp0h0nbm7TPT
 RQu9UG9mTDZx6RJyScLiaK9GlaD6xwSvNFBDXnUiWpxbad5KcX1DcIieL
 VEnvpTLf98mR1202A0C3ILQp2WwQz0AAlZX5IHv1PaXkWJafMKsa3YjSa
 AkDyJoiBUe4IDvYpGmhnn/eOyREeCLtREamDxiClHM/FQkvU1hbUhNRiJ A==;
X-CSE-ConnectionGUID: v7q58/NIS86NXMBBWSpRng==
X-CSE-MsgGUID: aznO3HsiQnGLGKCtd92neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67845628"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67845628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:38:37 -0700
X-CSE-ConnectionGUID: U7qiBH4JSWSYMsMlrBtMRQ==
X-CSE-MsgGUID: kvybZP/+Rg+TlggAcVVG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185190434"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 08:38:35 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v2 2/3] tools/intel_gpu_frequency: Add multi-GT support
Date: Thu, 30 Oct 2025 20:54:04 +0530
Message-Id: <20251030152405.3422044-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030152405.3422044-1-s.sebinraj@intel.com>
References: <20251030152405.3422044-1-s.sebinraj@intel.com>
MIME-Version: 1.0
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

This change enhances intel_gpu_frequency to support Intel GPUs
with multiple Graphics Technology (GT) units.

Key improvements:
- Add runtime GT detection using igt_sysfs_get_num_gt()
- New --gt/-t option to specify target GT (defaults to GT0)
- New --list-gts/-l option to display available GTs
- Update sysfs path generation to use igt_sysfs_gt_path()
- As simulataneous read and write is not allowed, the same goes
  vice versa, fix for the same is added.

Usage examples:
  intel_gpu_frequency --get --gt 1     # Get GT1 frequencies
  intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency
  intel_gpu_frequency --list-gts       # List available GTs

The tool now dynamically detects available GTs at runtime and provides
error messages when invalid GT numbers are specified. Also by default
for set / get operations it acts upon all available GTs unless
specified.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
Signed-off-by: Jeevaka Badrappan <jeevaka.badrappan@intel.com>
---
 tools/intel_gpu_frequency.c | 255 ++++++++++++++++++++++++++----------
 1 file changed, 188 insertions(+), 67 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 3378f3927..5c8c4d57e 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -24,14 +24,17 @@
 #include <assert.h>
 #include <getopt.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <time.h>
 #include <unistd.h>
 
 #include "drmtest.h"
 #include "igt_device.h"
+#include "igt_sysfs.h"
 #include "intel_chipset.h"
 
 #define VERSION "1.0"
+#define SYSFS_PATH_MAX 96
 
 static int device, devid;
 
@@ -61,29 +64,51 @@ static struct freq_info info[] = {
 };
 
 static char *
-get_sysfs_path(const char *which)
+get_sysfs_path(int fd, int gt_id, const char *which)
 {
-	static const char fmt[] = "/sys/class/drm/card%1d/gt_%3s_freq_mhz";
-	char *path;
-	int ret;
+	static char path[SYSFS_PATH_MAX];
+	char *gt_path;
+	int path_len, ret;
+
+	gt_path = igt_sysfs_gt_path(fd, gt_id, path, sizeof(path));
+	if (gt_path == NULL) {
+		fprintf(stderr, "igt_sysfs_gt_path returned NULL for GT%d\n", gt_id);
+		return NULL;
+	}
+	path_len = strlen(gt_path);
+	ret = snprintf(path + path_len, sizeof(path) - path_len,
+		       "/rps_%s_freq_mhz", which);
 
-#define STATIC_STRLEN(string) (sizeof(string) / sizeof(string [0]))
-	ret = asprintf(&path, fmt, device, which);
-	assert(ret == (STATIC_STRLEN(fmt) - 3));
-#undef STATIC_STRLEN
+	if (ret >= sizeof(path) - path_len) {
+		fprintf(stderr, "Path truncated\n");
+		return NULL;
+	}
 
 	return path;
 }
 
 static void
-initialize_freq_info(struct freq_info *freq_info)
+initialize_freq_info(struct freq_info *freq_info, int fd, int gt_id)
 {
-	if (freq_info->filp)
-		return;
+	/* Always close existing file handle and reopen for correct GT */
+	if (freq_info->filp) {
+		fclose(freq_info->filp);
+		freq_info->filp = NULL;
+	}
 
-	freq_info->path = get_sysfs_path(freq_info->name);
+	if (freq_info->path)
+		free(freq_info->path);
+
+	freq_info->path = strdup(get_sysfs_path(fd, gt_id, freq_info->name));
+	if (!freq_info->path) {
+		fprintf(stderr, "Failed to get sysfs path for %s on GT%d\n",
+			freq_info->name, gt_id);
+	}
 	assert(freq_info->path);
+
 	freq_info->filp = fopen(freq_info->path, freq_info->mode);
+	if (!freq_info->filp)
+		fprintf(stderr, "Failed to open %s\n", freq_info->path);
 	assert(freq_info->filp);
 }
 
@@ -97,31 +122,75 @@ static void wait_freq_settle(void)
 	clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
 }
 
-static void set_frequency(struct freq_info *freq_info, int val)
+static void set_frequency(struct freq_info *freq_info, int fd, int gt_id, int val)
 {
-	initialize_freq_info(freq_info);
+	initialize_freq_info(freq_info, fd, gt_id);
 	rewind(freq_info->filp);
 	assert(fprintf(freq_info->filp, "%d", val) > 0);
 
 	wait_freq_settle();
 }
 
-static int get_frequency(struct freq_info *freq_info)
+static int get_frequency(struct freq_info *freq_info, int fd, int gt_id)
 {
 	int val;
 
-	initialize_freq_info(freq_info);
+	initialize_freq_info(freq_info, fd, gt_id);
 	rewind(freq_info->filp);
 	assert(fscanf(freq_info->filp, "%d", &val)==1);
 
 	return val;
 }
 
+static void process_gt_frequencies(int fd, int gt_id, bool write, bool *targets, int *set_freq)
+{
+	int i, try = 1;
+	bool fail = write;
+
+	if (igt_sysfs_get_num_gt(fd) > 1)
+		printf("\n--- GT%d ---\n", gt_id);
+
+	/* If we've previously locked the frequency, we need to make sure to set things
+	 * in the correct order, or else the operation will fail (ie. min = max = 200,
+	 * and we set min to 300, we fail because it would try to set min >
+	 * max). This can be accomplished be going either forward or reverse
+	 * through the loop. MIN is always before MAX.
+	 *
+	 * XXX: Since only min and max are at play, the super lazy way is to do this
+	 * 3 times and if we still fail after 3, it's for real.
+	 */
+again:
+	if (try > 2) {
+		fprintf(stderr, "Did not achieve desired freq on GT%d.\n", gt_id);
+		exit(EXIT_FAILURE);
+	}
+	for (i = 0; i < ARRAY_SIZE(info); i++) {
+		if (targets[i] == false)
+			continue;
+
+		if (write) {
+			set_frequency(&info[i], fd, gt_id, set_freq[i]);
+			if (get_frequency(&info[i], fd, gt_id) != set_freq[i])
+				fail = true;
+			else
+				fail = false;
+		} else {
+			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i], fd, gt_id));
+		}
+	}
+
+	if (fail) {
+		try++;
+		goto again;
+	}
+}
+
 static void __attribute__((noreturn))
 usage(const char *prog)
 {
 	printf("%s A program to manipulate Intel GPU frequencies.\n\n", prog);
-	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", prog);
+	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz] ", prog);
+	printf("[--gt gt_number]\n\n");
 	printf("Options: \n");
 	printf("  -e		Lock frequency to the most efficient frequency\n");
 	printf("  -g, --get     Get all the frequency settings\n");
@@ -130,13 +199,18 @@ usage(const char *prog)
 	printf("  -m  --max     Lock frequency to max frequency\n");
 	printf("  -i  --min     Lock frequency to min (never a good idea, DEBUG ONLY)\n");
 	printf("  -d  --defaults  Return the system to hardware defaults\n");
+	printf("  -t  --gt      Specify GT number (0, 1, 2, etc.). Default: 0\n");
+	printf("  -l  --list-gts List available GTs\n");
 	printf("  -h  --help    Returns this\n");
 	printf("  -v  --version Version\n");
 	printf("\n");
 	printf("Examples:\n");
-	printf("   intel_gpu_frequency --get\t\tGet the current and minimum frequency\n");
-	printf("   intel_gpu_frequency --set 400\tLock frequency to 400Mhz\n");
-	printf("   intel_gpu_frequency --custom max=750\tSet the max frequency to 750MHz\n");
+	printf("   intel_gpu_frequency --get\t\t\tGet frequency settings for all GTs\n");
+	printf("   intel_gpu_frequency --get --gt 1\t\tGet frequency settings for GT1 only\n");
+	printf("   intel_gpu_frequency --set 400\t\t\tLock all GTs frequency to 400Mhz\n");
+	printf("   intel_gpu_frequency --set 400 --gt 1\tLock GT1 frequency to 400Mhz\n");
+	printf("   intel_gpu_frequency --custom max=750 --gt 0\tSet GT0 max frequency to 750MHz\n");
+	printf("   intel_gpu_frequency --list-gts\t\tList all available GTs\n");
 	printf("\n");
 	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
 	exit(EXIT_FAILURE);
@@ -151,11 +225,13 @@ version(const char *prog)
 
 /* Returns read or write operation */
 static bool
-parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
+parse(int argc, char *argv[], int fd, bool *act_upon, size_t act_upon_n,
+	int *new_freq, bool *list_gts, int *specified_gt)
 {
 	int c, tmp;
 	bool write = false;
 	bool reader = false;
+	bool gtt_specified = false;
 
 	/* No args means -g" */
 	if (argc == 1) {
@@ -173,11 +249,13 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			{ "max", no_argument, NULL, 'm' },
 			{ "defaults", no_argument, NULL, 'd' },
 			{ "help", no_argument, NULL, 'h' },
+			{ "gt", required_argument, NULL, 't' },
+			{ "list-gts", no_argument, NULL, 'l' },
 			{ "version", no_argument, NULL, 'v' },
 			{ NULL, 0, NULL, 0}
 		};
 
-		c = getopt_long(argc, argv, "egs:c:midh", long_options, &option_index);
+		c = getopt_long(argc, argv, "egs:c:midht:lv", long_options, &option_index);
 		if (c == -1)
 			break;
 
@@ -245,7 +323,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 					"FIXME: Warning efficient frequency information is incorrect.\n");
 				exit(EXIT_FAILURE);
 			}
-			tmp = get_frequency(&info[EFF]);
+			tmp = get_frequency(&info[EFF], fd, *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -253,7 +331,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			write = true;
 			break;
 		case 'i': /* mIn */
-			tmp = get_frequency(&info[RPn]);
+			tmp = get_frequency(&info[RPn], fd,
+					    *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -261,7 +340,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			write = true;
 			break;
 		case 'm': /* max */
-			tmp = get_frequency(&info[RP0]);
+			tmp = get_frequency(&info[RP0], fd,
+					    *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -269,12 +349,32 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			write = true;
 			break;
 		case 'd': /* defaults */
-			new_freq[MIN] = get_frequency(&info[RPn]);
-			new_freq[MAX] = get_frequency(&info[RP0]);
+			new_freq[MIN] = get_frequency(&info[RPn], fd,
+						      *specified_gt >= 0 ? *specified_gt : 0);
+			new_freq[MAX] = get_frequency(&info[RP0], fd,
+						      *specified_gt >= 0 ? *specified_gt : 0);
 			act_upon[MIN] = true;
 			act_upon[MAX] = true;
 			write = true;
 			break;
+		case 't': /* gt */
+			if (!optarg)
+				usage(argv[0]);
+
+			if (gtt_specified) {
+				fprintf(stderr, "Only one GT may be specified at a time\n");
+				exit(EXIT_FAILURE);
+			}
+			*specified_gt = atoi(optarg);
+			if (*specified_gt < 0) {
+				fprintf(stderr, "Invalid GT number: %d\n", *specified_gt);
+				exit(EXIT_FAILURE);
+			}
+			gtt_specified = true;
+			break;
+		case 'l': /* list-gts */
+			*list_gts = true;
+			break;
 		case 'v':
 			version(argv[0]);
 			exit(0);
@@ -288,60 +388,81 @@ done:
 	return write;
 }
 
-int main(int argc, char *argv[])
+static void list_available_gts(int fd, int num_gts)
 {
+	int i;
+
+	printf("Available GTs: %d\n", num_gts);
+	for (i = 0; i < num_gts; i++) {
+		char path[SYSFS_PATH_MAX];
 
-	bool write, fail, targets[MAX+1] = {false};
-	int i, fd, try = 1, set_freq[MAX+1] = {0};
+		if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
+			printf("  GT%d: %s\n", i, path);
+	}
+}
+
+static void validate_specified_gt(int fd, int specified_gt, int num_gts)
+{
+	if (specified_gt >= 0) {
+		if (specified_gt >= num_gts) {
+			fprintf(stderr, "Error: GT%d does not exist. Available GTs: 0-%d\n",
+				specified_gt, num_gts - 1);
+			close(fd);
+			exit(EXIT_FAILURE);
+		}
+		printf("Operating on GT%d (Total GTs: %d)\n", specified_gt, num_gts);
+	} else {
+		printf("Operating on all GTs (Total GTs: %d)\n", num_gts);
+	}
+}
+
+static void execute_frequency_operations(int fd, int specified_gt, bool write,
+					 bool *targets, int *set_freq)
+{
+	int target_gt;
+
+	if (specified_gt >= 0) {
+		/* Process single specified GT */
+		process_gt_frequencies(fd, specified_gt, write, targets, set_freq);
+	} else {
+		/* Process all GTs using for_each_gt pattern */
+		int gt_dir;
+
+		i915_for_each_gt(fd, gt_dir, target_gt) {
+			process_gt_frequencies(fd, target_gt, write, targets, set_freq);
+		}
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	bool write, targets[MAX+1] = {false}, list_gts = false;
+	int i, fd, set_freq[MAX+1] = {0}, num_gts;
+	int specified_gt = -1;
 
 	fd = __drm_open_driver(DRIVER_INTEL);
 	devid = intel_get_drm_devid(fd);
 	device = igt_device_get_card_index(fd);
-	close(fd);
+	num_gts = igt_sysfs_get_num_gt(fd);
 
-	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq);
-	fail = write;
+	write = parse(argc, argv, fd, targets, ARRAY_SIZE(targets), set_freq,
+		      &list_gts, &specified_gt);
 
-	/* If we've previously locked the frequency, we need to make sure to set things
-	 * in the correct order, or else the operation will fail (ie. min = max = 200,
-	 * and we set min to 300, we fail because it would try to set min >
-	 * max). This can be accomplished be going either forward or reverse
-	 * through the loop. MIN is always before MAX.
-	 *
-	 * XXX: Since only min and max are at play, the super lazy way is to do this
-	 * 3 times and if we still fail after 3, it's for real.
-	 */
-again:
-	if (try > 2) {
-		fprintf(stderr, "Did not achieve desired freq.\n");
-		exit(EXIT_FAILURE);
-	}
-	for (i = 0; i < ARRAY_SIZE(targets); i++) {
-		if (targets[i] == false)
-			continue;
+	/* Handle --list-gts option */
+	if (list_gts)
+		list_available_gts(fd, num_gts);
 
-		if (write) {
-			set_frequency(&info[i], set_freq[i]);
-			if (get_frequency(&info[i]) != set_freq[i])
-				fail = true;
-			else
-				fail = false;
-		} else {
-			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i]));
-		}
-	}
+	/* Validate specified GT */
+	validate_specified_gt(fd, specified_gt, num_gts);
 
-	if (fail) {
-		try++;
-		goto again;
-	}
+	/* Process frequencies for specified GT or all GTs */
+	execute_frequency_operations(fd, specified_gt, write, targets, set_freq);
 
 	for (i = 0; i < ARRAY_SIZE(targets); i++) {
-		if (info[i].filp) {
+		if (info[i].filp)
 			fclose(info[i].filp);
-			free(info[i].path);
-		}
 	}
 
+	close(fd);
 	return EXIT_SUCCESS;
 }
-- 
2.43.0

