Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00249CF8554
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 08:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C28610E70E;
	Thu, 20 Nov 2025 08:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/zRzhUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D68810E70E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763626201; x=1795162201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1iaVvqK72cVf0RAr0AxFkxeBO1Ilg1YYMk0hkIk/0m4=;
 b=I/zRzhUC7dfiBQ2b5whfidDNjEhp6pIsZuGmhDmy8H/PnlxWsfKzksoV
 XeG+j4jVpavUnfQVmUYjPdG444lkwtUqrDZDn5kHln8toa/Ol63vbxupt
 evHZAJwIeDkE6fzw60YxcYFNlX3+JfCk37jW77wIsuRCy03tc51ch291e
 4pjC+65+jK/XlwKbe4H4tZkBuSoaf4BAt36EwDvpVL30SkBWAK6+UwqpL
 FaTYuzb0TgSvpO1lSf4PMtvOxanlbzvrGSgcI85IJ3w4JDIYzYgmfrv9v
 ptfryzQIRZ5lzoencfYECdXVAeRp/6bg+tghPjcxpswavNdMpRJUJP9PH g==;
X-CSE-ConnectionGUID: A8DOe7bFQPiV6Z5lTQ34TA==
X-CSE-MsgGUID: SoSK7B/iQaCg6iK/JtcRBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65618217"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65618217"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:10:01 -0800
X-CSE-ConnectionGUID: IBwsyDP/S9erVNvHA/na9Q==
X-CSE-MsgGUID: r1kTIFKiSH2J7yr8rdI7Gw==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2025 00:09:59 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v4 2/3] tools/intel_gpu_frequency: Add multi-GT support
Date: Thu, 20 Nov 2025 13:22:38 +0530
Message-Id: <20251120075239.1372105-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120075239.1372105-1-s.sebinraj@intel.com>
References: <20251120075239.1372105-1-s.sebinraj@intel.com>
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
- New --list/-l option to display available GTs
- Update sysfs path generation to use igt_sysfs_gt_path()
- Update the man page for new options

Usage examples:
  intel_gpu_frequency --get --gt 1     # Get GT1 frequencies
  intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency
  intel_gpu_frequency --list           # List available GTs

The tool now dynamically detects available GTs at runtime and provides
error messages when invalid GT numbers are specified. Also by default
for set / get operations it acts upon all available GTs unless
specified.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
Signed-off-by: Jeevaka Badrappan <jeevaka.badrappan@intel.com>
---
 lib/drmtest.c               |   2 +-
 man/intel_gpu_frequency.rst |  34 ++++-
 tools/intel_gpu_frequency.c | 254 ++++++++++++++++++++++++++++++------
 3 files changed, 241 insertions(+), 49 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 3d8c8e79e..d4f2a5f4a 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -311,7 +311,7 @@ static void log_opened_device_path(const char *device_path)
 	item->path = strdup(device_path);
 	igt_assert(item->path);
 	igt_list_add(&item->link, &opened_paths);
-	igt_info("Opened device: %s\n", item->path);
+	igt_debug("Opened device: %s\n", item->path);
 }
 
 /**
diff --git a/man/intel_gpu_frequency.rst b/man/intel_gpu_frequency.rst
index 92f039645..285870857 100644
--- a/man/intel_gpu_frequency.rst
+++ b/man/intel_gpu_frequency.rst
@@ -38,7 +38,8 @@ OPTIONS
     Lock frequency to the most efficient frequency.
 
 -g, --get
-    Get all the current frequency settings.
+    Get all the current frequency settings. Displays results
+    showing all GTs with their corresponding frequencies.
 
 -s FREQUENCY, --set=FREQUENCY
     Lock frequency to an absolute value (MHz).
@@ -55,6 +56,14 @@ OPTIONS
 -d, --defaults
     Return the system to hardware defaults.
 
+-t GT_NUMBER, --gt=GT_NUMBER
+    Specify which GT (Graphics Technology) to operate on. GT numbers start from 0.
+    If not specified, operations apply to all available GTs. Use with --list
+    to see available GTs.
+
+-l, --list
+    List all available GTs in the system with their sysfs paths.
+
 -h, --help
     Show help.
 
@@ -64,14 +73,29 @@ OPTIONS
 EXAMPLES
 ========
 
-intel_gpu_frequency -gmin,cur
-    Get the current and minimum frequency.
+intel_gpu_frequency
+    Display frequency information for all GTs in table format.
+
+intel_gpu_frequency -g
+    Get frequency settings for all GTs (displays in table format).
+
+intel_gpu_frequency --list-gts
+    List all available GTs in the system.
+
+intel_gpu_frequency --get --gt 1
+    Get frequency settings for GT1 only.
 
 intel_gpu_frequency -s 400
-    Lock frequency to 400Mhz.
+    Lock frequency to 400Mhz for all GTs.
+
+intel_gpu_frequency -s 400 --gt 0
+    Lock frequency to 400Mhz for GT0 only.
 
 intel_gpu_frequency -c max=750
-    Set the max frequency to 750MHz
+    Set the max frequency to 750MHz for all GTs.
+
+intel_gpu_frequency -c max=750 --gt 1
+    Set the max frequency to 750MHz for GT1 only.
 
 REPORTING BUGS
 ==============
diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 2f43bf6fc..1931db72b 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -24,14 +24,18 @@
 #include <assert.h>
 #include <getopt.h>
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <unistd.h>
 
 #include "drmtest.h"
 #include "igt_device.h"
+#include "igt_sysfs.h"
 #include "intel_chipset.h"
 
 #define VERSION "1.0"
+#define SYSFS_PATH_MAX 96
 
 static int device, devid;
 
@@ -61,29 +65,51 @@ static struct freq_info info[] = {
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
+
+	if (freq_info->path)
+		free(freq_info->path);
 
-	freq_info->path = get_sysfs_path(freq_info->name);
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
 
@@ -97,20 +123,20 @@ static void wait_freq_settle(void)
 	clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
 }
 
-static void set_frequency(struct freq_info *freq_info, int val)
+static void set_frequency(struct freq_info *freq_info, int val, int fd, int gt_id)
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
 
@@ -121,7 +147,7 @@ static void __attribute__((noreturn))
 usage(const char *prog, int err)
 {
 	printf("%s A program to manipulate Intel GPU frequencies.\n\n", prog);
-	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", prog);
+	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz] [--gt GT_NUM] [--list]\n\n", prog);
 	printf("Options: \n");
 	printf("  -e		Lock frequency to the most efficient frequency\n");
 	printf("  -g, --get     Get all the frequency settings\n");
@@ -130,6 +156,8 @@ usage(const char *prog, int err)
 	printf("  -m  --max     Lock frequency to max frequency\n");
 	printf("  -i  --min     Lock frequency to min (never a good idea, DEBUG ONLY)\n");
 	printf("  -d  --defaults  Return the system to hardware defaults\n");
+	printf("  -t  --gt      Specify GT number to operate on (default: all GTs)\n");
+	printf("  -l  --list    List all available GTs\n");
 	printf("  -h  --help    Returns this\n");
 	printf("  -v  --version Version\n");
 	printf("\n");
@@ -137,6 +165,8 @@ usage(const char *prog, int err)
 	printf("   intel_gpu_frequency --get\t\tGet the current and minimum frequency\n");
 	printf("   intel_gpu_frequency --set 400\tLock frequency to 400Mhz\n");
 	printf("   intel_gpu_frequency --custom max=750\tSet the max frequency to 750MHz\n");
+	printf("   intel_gpu_frequency --get --gt 1\tGet frequencies for GT1\n");
+	printf("   intel_gpu_frequency --list\t\tList all available GTs\n");
 	printf("\n");
 	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
 	exit(err);
@@ -176,10 +206,12 @@ parse_version_or_help(int argc, char *argv[])
 
 /* Returns read or write operation */
 static bool
-parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq, bool *reader)
+parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
+      bool *reader, int *specified_gt, bool *list_gts, int fd)
 {
 	int c, tmp;
 	bool write = false;
+	bool gtt_specified = false;
 
 	/* No args means -g" */
 	if (argc == 1) {
@@ -196,12 +228,14 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 			{ "min", no_argument, NULL, 'i' },
 			{ "max", no_argument, NULL, 'm' },
 			{ "defaults", no_argument, NULL, 'd' },
+			{ "gt", required_argument, NULL, 't' },
+			{ "list", no_argument, NULL, 'l' },
 			{ "help", no_argument, NULL, 'h' },
 			{ "version", no_argument, NULL, 'v' },
 			{ NULL, 0, NULL, 0}
 		};
 
-		c = getopt_long(argc, argv, "egs:c:midh", long_options, &option_index);
+		c = getopt_long(argc, argv, "egs:c:midt:lhv", long_options, &option_index);
 		if (c == -1)
 			break;
 
@@ -258,7 +292,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 					"FIXME: Warning efficient frequency information is incorrect.\n");
 				exit(EXIT_FAILURE);
 			}
-			tmp = get_frequency(&info[EFF]);
+			tmp = get_frequency(&info[EFF], fd,
+					    *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -266,7 +301,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 			write = true;
 			break;
 		case 'i': /* mIn */
-			tmp = get_frequency(&info[RPn]);
+			tmp = get_frequency(&info[RPn], fd,
+					    *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -274,7 +310,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 			write = true;
 			break;
 		case 'm': /* max */
-			tmp = get_frequency(&info[RP0]);
+			tmp = get_frequency(&info[RP0], fd,
+					    *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -282,12 +319,36 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
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
+				usage(argv[0], EXIT_FAILURE);
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
+		case 'l': /* list */
+			*list_gts = true;
+			break;
+		case 'v':
+			version(argv[0]);
+			exit(0);
+		case 'h':
 		default:
 			fprintf(stderr, "Error: unknown option\n");
 			usage(argv[0], EXIT_FAILURE);
@@ -298,21 +359,92 @@ done:
 	return write;
 }
 
-int main(int argc, char *argv[])
+static void print_freq_table_header(void)
 {
+	printf("%-15s %-15s %6s %6s %6s %6s %6s %6s %3s\n",
+	       "card/tile/GT", "BDF", "min", "curr", "RP1", "max", "RP0", "RPn", "(MHz)");
+	printf("%-15s %-15s %6s %6s %6s %6s %6s %6s\n",
+	       "------------", "------------", "----", "----", "----", "----", "----", "----");
+}
 
-	bool write, reader = false, fail, targets[MAX+1] = {false};
-	int i, fd, try = 1, set_freq[MAX+1] = {0};
+static void print_freq_table_row(int fd, int card, int gt_id)
+{
+	char bdf[16] = "N/A";
+	char gt_label[16];
+	int freqs[ARRAY_SIZE(info)];
+	int i;
+
+	/* Get BDF (Bus:Device.Function) for this device */
+	igt_device_get_pci_slot_name(fd, bdf);
+
+	/* Format GT label as card/tile/GT */
+	snprintf(gt_label, sizeof(gt_label), "%d/t0/GT%d", card, gt_id);
+
+	/* Read all frequencies */
+	for (i = 0; i < ARRAY_SIZE(info); i++)
+		freqs[i] = get_frequency(&info[i], fd, gt_id);
+
+	/* Print the row: GT label, BDF, and all frequencies */
+	printf("%-15s %-15s %6d %6d %6d %6d %6d %6d\n",
+	       gt_label, bdf,
+	       freqs[MIN], freqs[CUR], freqs[EFF],
+	       freqs[MAX], freqs[RP0], freqs[RPn]);
+}
 
-	parse_version_or_help(argc, argv);
+static void process_gt_frequencies(int argc, int fd, int gt_id, bool write, bool reader,
+						bool *targets, int *set_freq);
 
-	fd = __drm_open_driver(DRIVER_INTEL);
-	devid = intel_get_drm_devid(fd);
-	device = igt_device_get_card_index(fd);
-	close(fd);
+static void list_available_gts(int fd, int num_gts)
+{
+	int i;
 
-	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq, &reader);
-	fail = write;
+	printf("Available GTs: %d\n", num_gts);
+	for (i = 0; i < num_gts; i++) {
+		char path[SYSFS_PATH_MAX];
+
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
+		igt_debug("Operating on GT%d (Total GTs: %d)\n", specified_gt, num_gts);
+	} else {
+		igt_debug("Operating on all GTs (Total GTs: %d)\n", num_gts);
+	}
+}
+
+static void execute_frequency_operations(int argc, int fd, int specified_gt, bool write, bool reader,
+								bool *targets, int *set_freq)
+{
+	int target_gt;
+
+	if (specified_gt >= 0) {
+		/* Process single specified GT */
+		process_gt_frequencies(argc, fd, specified_gt, write, reader, targets, set_freq);
+	} else {
+		/* Process all GTs */
+		int num_gts = igt_sysfs_get_num_gt(fd);
+
+		for (target_gt = 0; target_gt < num_gts; target_gt++)
+			process_gt_frequencies(argc, fd, target_gt, write, reader, targets, set_freq);
+	}
+}
+
+static void process_gt_frequencies(int argc, int fd, int gt_id, bool write, bool reader,
+						bool *targets, int *set_freq)
+{
+	int i, try = 1;
+	bool fail = write;
+	static bool table_header_printed = false;
 
 	/* If we've previously locked the frequency, we need to make sure to set things
 	 * in the correct order, or else the operation will fail (ie. min = max = 200,
@@ -325,24 +457,27 @@ int main(int argc, char *argv[])
 	 */
 again:
 	if (try > 2) {
-		fprintf(stderr, "Did not achieve desired freq.\n");
+		fprintf(stderr, "Did not achieve desired freq on GT%d.\n", gt_id);
 		exit(EXIT_FAILURE);
 	}
 
 	if (write) {
-		/* only reset and set max & min act_upons flags if a read operation is also requested */
+		/* only reset and set max & min act_upons flags
+		 * if a read operation is also requested
+		 */
 		if (reader != false) {
-			for (int j = 0; j < ARRAY_SIZE(targets); j++)
+			for (int j = 0; j < ARRAY_SIZE(info); j++)
 				targets[j] = false;
 			targets[MIN] = true;
 			targets[MAX] = true;
 		}
 
-		for (i = 0; i < ARRAY_SIZE(targets); i++) {
+		for (i = 0; i < ARRAY_SIZE(info); i++) {
 			if (targets[i] == false)
 				continue;
-			set_frequency(&info[i], set_freq[i]);
-			if (get_frequency(&info[i]) != set_freq[i])
+
+			set_frequency(&info[i], set_freq[i], fd, gt_id);
+			if (get_frequency(&info[i], fd, gt_id) != set_freq[i])
 				fail = true;
 			else
 				fail = false;
@@ -355,12 +490,44 @@ again:
 	}
 
 	if (reader || argc == 1) {
-		for (i = 0; i < ARRAY_SIZE(targets); i++) {
-			/* loop for all frequencies for get operations */
-			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i]));
+		/* Print table header only once for all GTs */
+		if (!table_header_printed) {
+			print_freq_table_header();
+			table_header_printed = true;
 		}
+
+		/* Print frequency row for this GT */
+		print_freq_table_row(fd, device, gt_id);
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	bool write, reader = false, list_gts = false, targets[MAX+1] = {false};
+	int i, fd, set_freq[MAX+1] = {0};
+	int specified_gt = -1;
+	int num_gts;
+
+	parse_version_or_help(argc, argv);
+
+	fd = __drm_open_driver(DRIVER_INTEL);
+	devid = intel_get_drm_devid(fd);
+	device = igt_device_get_card_index(fd);
+	num_gts = igt_sysfs_get_num_gt(fd);
+
+	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq, &reader,
+		      &specified_gt, &list_gts, fd);
+
+	if (list_gts) {
+		list_available_gts(fd, num_gts);
+		close(fd);
+		return EXIT_SUCCESS;
 	}
 
+	validate_specified_gt(fd, specified_gt, num_gts);
+
+	execute_frequency_operations(argc, fd, specified_gt, write, reader, targets, set_freq);
+
 	for (i = 0; i < ARRAY_SIZE(targets); i++) {
 		if (info[i].filp) {
 			fclose(info[i].filp);
@@ -368,5 +535,6 @@ again:
 		}
 	}
 
+	close(fd);
 	return EXIT_SUCCESS;
 }
-- 
2.43.0

