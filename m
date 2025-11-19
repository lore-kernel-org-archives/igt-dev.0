Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B39CCF58FA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 21:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C349410E698;
	Wed, 19 Nov 2025 21:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYqAcM5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E2210E697
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 21:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763586165; x=1795122165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7CrbRhDyquvJOXXq2UGTKMXRtJxtkE7cvNVgjgFHdw=;
 b=fYqAcM5PpINhMa2Q7W5lMDg0ldTUkB4T7olwury+QODxMz4Lvu6cSYp1
 D6fXHDNB2O8Z4aDGT+VsvlZLLFqEuWtx3Q1hi9k1KyWjF+g7cQ9lpdBQ0
 ItS76Z1TEUhunZueQg9KFkD/8adj5p/5VpKIQgvHxDRdf8wTzrGsgZ6+l
 21BSoAeM4OIFpgXaAR7iczYencC64PsR4RYedw93HsiFDPgskPJYao15F
 kgUtK0YegVRM+hXLpmq/UZ6KFzZwPg9glapqmsoPT/EMEL3A/tZXc5ZfX
 OAPrgz4+DXl5lNPD5pSf6osuEO8A1+oMc0C91jFc6FrU9M13qz11XmWBU A==;
X-CSE-ConnectionGUID: H7ZDyZmdRhqlXTLF8qnT3A==
X-CSE-MsgGUID: ogq1Tl9mRiay+Md8ZyIWqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68249391"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="68249391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 13:02:45 -0800
X-CSE-ConnectionGUID: afvURvDEQTWxLeH7FVkEbw==
X-CSE-MsgGUID: lfSAKcd9R16gVOjNKcMuNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="222099821"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2025 13:02:42 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v3 2/3] tools/intel_gpu_frequency: Add multi-GT support
Date: Thu, 20 Nov 2025 02:15:29 +0530
Message-Id: <20251119204530.1357940-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119204530.1357940-1-s.sebinraj@intel.com>
References: <20251119204530.1357940-1-s.sebinraj@intel.com>
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
 man/intel_gpu_frequency.rst |  34 +++-
 tools/intel_gpu_frequency.c | 318 +++++++++++++++++++++++++++---------
 3 files changed, 269 insertions(+), 85 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 590c4671a..7311f83af 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -310,7 +310,7 @@ static void log_opened_device_path(const char *device_path)
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
index 2cf3cabb6..aaadd0857 100644
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
 
@@ -97,31 +122,126 @@ static void wait_freq_settle(void)
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
 
+static void print_freq_table_header(void)
+{
+	printf("%-15s %-15s %6s %6s %6s %6s %6s %6s %3s\n",
+	       "card/tile/GT", "BDF", "min", "curr", "RP1", "max", "RP0", "RPn", "(MHz)");
+	printf("%-15s %-15s %6s %6s %6s %6s %6s %6s\n",
+	       "------------", "------------", "----", "----", "----", "----", "----", "----");
+}
+
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
+
+static void process_gt_frequencies(int argc, int fd, int gt_id, bool write, bool reader,
+				bool *targets, int *set_freq)
+{
+	int i, try = 1;
+	bool fail = write;
+	static bool table_header_printed = false;
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
+
+	if (write) {
+		/* only reset and set max & min act_upons flags
+		 * if a read operation is also requested
+		 */
+		if (reader != false) {
+			for (int j = 0; j < ARRAY_SIZE(info); j++)
+				targets[j] = false;
+			targets[MIN] = true;
+			targets[MAX] = true;
+		}
+
+		for (i = 0; i < ARRAY_SIZE(info); i++) {
+			if (targets[i] == false)
+				continue;
+
+			set_frequency(&info[i], fd, gt_id, set_freq[i]);
+			if (get_frequency(&info[i], fd, gt_id) != set_freq[i])
+				fail = true;
+			else
+				fail = false;
+		}
+	}
+
+	if (fail) {
+		try++;
+		goto again;
+	}
+
+	if (reader || argc == 1) {
+		/* Print table header only once for all GTs */
+		if (!table_header_printed) {
+			print_freq_table_header();
+			table_header_printed = true;
+		}
+
+		/* Print frequency row for this GT */
+		print_freq_table_row(fd, device, gt_id);
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
@@ -130,13 +250,18 @@ usage(const char *prog)
 	printf("  -m  --max     Lock frequency to max frequency\n");
 	printf("  -i  --min     Lock frequency to min (never a good idea, DEBUG ONLY)\n");
 	printf("  -d  --defaults  Return the system to hardware defaults\n");
+	printf("  -t  --gt      Specify GT number (0, 1, 2, etc.). Default: 0\n");
+	printf("  -l  --list    List available GTs\n");
 	printf("  -h  --help    Returns this\n");
 	printf("  -v  --version Version\n");
 	printf("\n");
 	printf("Examples:\n");
-	printf("   intel_gpu_frequency --get\t\tGet the current and minimum frequency\n");
-	printf("   intel_gpu_frequency --set 400\tLock frequency to 400Mhz\n");
-	printf("   intel_gpu_frequency --custom max=750\tSet the max frequency to 750MHz\n");
+	printf("   intel_gpu_frequency --get\t\t\tGet frequency settings for all GTs\n");
+	printf("   intel_gpu_frequency --get --gt 1\t\tGet frequency settings for GT1 only\n");
+	printf("   intel_gpu_frequency --set 400\t\tLock all GTs frequency to 400Mhz\n");
+	printf("   intel_gpu_frequency --set 400 --gt 1\t\tLock GT1 frequency to 400Mhz\n");
+	printf("   intel_gpu_frequency --custom max=750 --gt 0\tSet GT0 max frequency to 750MHz\n");
+	printf("   intel_gpu_frequency --list\t\t\tList all available GTs\n");
 	printf("\n");
 	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
 	exit(EXIT_FAILURE);
@@ -151,10 +276,12 @@ version(const char *prog)
 
 /* Returns read or write operation */
 static bool
-parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq, bool *reader)
+parse(int argc, char *argv[], int fd, bool *act_upon, size_t act_upon_n, int *new_freq, bool *reader,
+	bool *list_gts, int *specified_gt)
 {
 	int c, tmp;
 	bool write = false;
+	bool gtt_specified = false;
 
 	/* No args means -g" */
 	if (argc == 1) {
@@ -172,11 +299,13 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 			{ "max", no_argument, NULL, 'm' },
 			{ "defaults", no_argument, NULL, 'd' },
 			{ "help", no_argument, NULL, 'h' },
+			{ "gt", required_argument, NULL, 't' },
+			{ "list", no_argument, NULL, 'l' },
 			{ "version", no_argument, NULL, 'v' },
 			{ NULL, 0, NULL, 0}
 		};
 
-		c = getopt_long(argc, argv, "egs:c:midh", long_options, &option_index);
+		c = getopt_long(argc, argv, "egs:c:midht:lv", long_options, &option_index);
 		if (c == -1)
 			break;
 
@@ -233,7 +362,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 					"FIXME: Warning efficient frequency information is incorrect.\n");
 				exit(EXIT_FAILURE);
 			}
-			tmp = get_frequency(&info[EFF]);
+			tmp = get_frequency(&info[EFF], fd, *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -241,7 +370,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 			write = true;
 			break;
 		case 'i': /* mIn */
-			tmp = get_frequency(&info[RPn]);
+			tmp = get_frequency(&info[RPn], fd,
+					    *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -249,7 +379,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
 			write = true;
 			break;
 		case 'm': /* max */
-			tmp = get_frequency(&info[RP0]);
+			tmp = get_frequency(&info[RP0], fd,
+					    *specified_gt >= 0 ? *specified_gt : 0);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
@@ -257,12 +388,32 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
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
+		case 'l': /* list */
+			*list_gts = true;
+			break;
 		case 'v':
 			version(argv[0]);
 			exit(0);
@@ -276,73 +427,82 @@ done:
 	return write;
 }
 
-int main(int argc, char *argv[])
+static void list_available_gts(int fd, int num_gts)
 {
+	int i;
 
-	bool write, reader = false, fail, targets[MAX+1] = {false};
-	int i, fd, try = 1, set_freq[MAX+1] = {0};
+	printf("Available GTs: %d\n", num_gts);
+	for (i = 0; i < num_gts; i++) {
+		char path[SYSFS_PATH_MAX];
 
-	fd = __drm_open_driver(DRIVER_INTEL);
-	devid = intel_get_drm_devid(fd);
-	device = igt_device_get_card_index(fd);
-	close(fd);
-
-	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq, &reader);
-	fail = write;
-
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
+		if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
+			printf("  GT%d: %s\n", i, path);
 	}
+}
 
-	if (write) {
-		/* only reset and set max & min act_upons flags if a read operation is also requested */
-		if (reader != false) {
-			for (int j = 0; j < ARRAY_SIZE(targets); j++)
-				targets[j] = false;
-			targets[MIN] = true;
-			targets[MAX] = true;
-		}
-
-		for (i = 0; i < ARRAY_SIZE(targets); i++) {
-			if (targets[i] == false)
-				continue;
-			set_frequency(&info[i], set_freq[i]);
-			if (get_frequency(&info[i]) != set_freq[i])
-				fail = true;
-			else
-				fail = false;
+static void validate_specified_gt(int fd, int specified_gt, int num_gts)
+{
+	if (specified_gt >= 0) {
+		if (specified_gt >= num_gts) {
+			fprintf(stderr, "Error: GT%d does not exist. Available GTs: 0-%d\n",
+				specified_gt, num_gts - 1);
+			close(fd);
+			exit(EXIT_FAILURE);
 		}
+		igt_debug("Operating on GT%d (Total GTs: %d)\n", specified_gt, num_gts);
+	} else {
+		igt_debug("Operating on all GTs (Total GTs: %d)\n", num_gts);
 	}
+}
 
-	if (fail) {
-		try++;
-		goto again;
-	}
+static void execute_frequency_operations(int argc, int fd, int specified_gt, bool write, bool reader,
+								bool *targets, int *set_freq)
+{
+	int target_gt;
 
-	if (reader || argc == 1) {
-		for (i = 0; i < ARRAY_SIZE(targets); i++) {
-			/* loop for all frequencies for get operations */
-			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i]));
+	if (specified_gt >= 0) {
+		/* Process single specified GT */
+		process_gt_frequencies(argc, fd, specified_gt, write, reader, targets, set_freq);
+	} else {
+		/* Process all GTs using for_each_gt pattern */
+		int gt_dir;
+
+		i915_for_each_gt(fd, gt_dir, target_gt) {
+			process_gt_frequencies(argc, fd, target_gt, write, reader, targets, set_freq);
 		}
 	}
+}
+
+int main(int argc, char *argv[])
+{
+
+	bool write, reader = false, targets[MAX+1] = {false}, list_gts = false;
+	int i, fd, set_freq[MAX+1] = {0}, num_gts;
+	int specified_gt = -1;
+
+	fd = drm_open_driver(DRIVER_INTEL);
+	devid = intel_get_drm_devid(fd);
+	device = igt_device_get_card_index(fd);
+	num_gts = igt_sysfs_get_num_gt(fd);
+
+	write = parse(argc, argv, fd, targets, ARRAY_SIZE(targets), set_freq, &reader,
+		       &list_gts, &specified_gt);
+
+	/* Handle --list option */
+	if (list_gts)
+		list_available_gts(fd, num_gts);
+
+	/* Validate specified GT */
+	validate_specified_gt(fd, specified_gt, num_gts);
+
+	/* Process frequencies for specified GT or all GTs */
+	execute_frequency_operations(argc, fd, specified_gt, write, reader, targets, set_freq);
 
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

