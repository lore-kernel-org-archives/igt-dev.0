Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E12FCA0EDC
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 13:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEC610E262;
	Wed, 20 Aug 2025 13:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifkIHY2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D4310E262
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755696042; x=1787232042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LEoRQ0HvFo680fnwfxICgikodE22I846opPUhl/3gX0=;
 b=ifkIHY2wIQ/wzkRvo09IqcLs5HDx24lDF5Mjjpro0Q8b7gNlwfAiZ1IR
 Zpj038bgCztZHXldKcXc6fD7JeLzDrVCyiIkJjVCEnn4sQFmkyHyRt3uW
 aHedOOwriZj8EkNx0o9X6GkCFerLOpfEKswefDQp09kgLLMPs/6/mqtDh
 SjBUoj5oXY+ggDrL2+PzdepJq6uNZntfth5fHjhaS4zIfzDmhFDWRo5ox
 OAiWzerWAZ8ZFFVinKXU7ZeJa81w1wa+WlBMghEEFFeByaY3M9BU0QX5P
 B74S+OJDwRNdzqbWUiJF2CkH/i8Ut6UgVnllEBBBDDQGfha5q7RL/TVzA A==;
X-CSE-ConnectionGUID: pyQJtpF0SC2kerdrG+9aMQ==
X-CSE-MsgGUID: zzHfRTuOSKCd2CJO+ZmS8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57159718"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57159718"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 06:20:41 -0700
X-CSE-ConnectionGUID: 5DexN0fjR+61sF4CCpwC9Q==
X-CSE-MsgGUID: YV7qMgOYTtKydrFAgqjU2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167323802"
Received: from intel-s2600wft.iind.intel.com (HELO
 ec8f73bc045b.iind.intel.com) ([10.223.26.161])
 by orviesa006.jf.intel.com with ESMTP; 20 Aug 2025 06:20:40 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: carlos.santa@intel.com, s.sebinraj@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t] tools/xe_gpu_frequency: Add tool to set/get Intel GPU
 frequency for Xe
Date: Wed, 20 Aug 2025 18:21:17 +0530
Message-ID: <20250820125121.1387843-1-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.51.0
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

Introduces a new tool, `xe_gpu_frequency`, which provides options to get
and set frequencies for Intel Graphics cards using the Xe driver.

Example usages:
$xe_gpu_frequency -g
Opened device: /dev/dri/card0

=====GT0=====
cur: 700 MHz
min: 700 MHz
rpe: 600 MHz
max: 700 MHz

=====GT1=====
cur: 400 MHz
min: 400 MHz
rpe: 400 MHz
max: 400 MHz

$xe_gpu_frequency -s 300 -g
Opened device: /dev/dri/card0

=====GT0=====
cur: 300 MHz
min: 300 MHz
rpe: 600 MHz
max: 300 MHz

=====GT1=====
cur: 300 MHz
min: 300 MHz
rpe: 400 MHz
max: 300 MHz

$xe_gpu_frequency -c gt=0,max=900 -g
Opened device: /dev/dri/card0

=====GT0=====
cur: 300 MHz
min: 300 MHz
rpe: 600 MHz
max: 900 MHz

=====GT1=====
cur: 300 MHz
min: 300 MHz
rpe: 400 MHz
max: 300 MHz

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tools/meson.build        |   1 +
 tools/xe_gpu_frequency.c | 185 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+)
 create mode 100644 tools/xe_gpu_frequency.c

diff --git a/tools/meson.build b/tools/meson.build
index 99a732942..3a0c53d68 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -47,6 +47,7 @@ tools_progs = [
 	'intel_gvtg_test',
 	'dpcd_reg',
 	'lsgpu',
+	'xe_gpu_frequency',
 ]
 tool_deps = igt_deps
 tool_deps += zlib
diff --git a/tools/xe_gpu_frequency.c b/tools/xe_gpu_frequency.c
new file mode 100644
index 000000000..4ba362be7
--- /dev/null
+++ b/tools/xe_gpu_frequency.c
@@ -0,0 +1,185 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <getopt.h>
+
+#include "xe/xe_gt.h"
+
+#define VERSION "1.0"
+
+enum {
+	CUR = 0,
+	MIN,
+	EFF,
+	MAX,
+	RP0,
+	RPn
+};
+
+struct freq_info {
+	const char *name;
+	const char *mode;
+};
+
+static struct freq_info info[] = {
+	{ "cur", "r"  },
+	{ "min", "rb+" },
+	{ "rpe", "r" },
+	{ "max", "rb+" },
+	{ "rp0", "r" },
+	{ "rpn", "r" }
+};
+
+static void usage(const char *prog)
+{
+	printf("%s A program to manipulate Intel GPU frequencies.\n\n", prog);
+	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", prog);
+	printf("Options:\n");
+	printf("  -e		Lock frequency to the most efficient frequency\n");
+	printf("  -g, --get     Get all the frequency settings\n");
+	printf("  -s, --set     Lock frequency to an absolute value (MHz)\n");
+	printf("  -c, --custom  Set a min, max frequency or both for a gt\"gt=X,min=Y,max=Z\"\n");
+	printf("  -m  --max     Lock frequency to max frequency\n");
+	printf("  -h  --help    Returns this\n");
+	printf("  -v  --version Version\n");
+	printf("\n");
+	printf("Examples:\n");
+	printf("   xe_gpu_frequency --get\t\tGet the current and minimum frequency for all gt\n");
+	printf("   xe_gpu_frequency --set 400\tLock frequency to 400Mhz for all gt\n");
+	printf("   xe_gpu_frequency --custom gt=0,max=750\tSet the max frequency to 750MHz\n");
+	printf("\n");
+	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
+}
+
+static void version(const char *prog)
+{
+	printf("%s: %s\n", prog, VERSION);
+	printf("Copyright © 2025 Intel Corporation\n");
+}
+
+int main(int argc, char *argv[])
+{
+	uint32_t frequency;
+	int fd, c, gt;
+	int ret = EXIT_FAILURE;
+
+	fd = __drm_open_driver(DRIVER_XE);
+	if (fd < 0) {
+		fprintf(stderr, "Xe device open failed\n");
+		exit(EXIT_FAILURE);
+	}
+
+	while (1) {
+		int option_index = 0;
+		static struct option long_options[] = {
+			{ "get", no_argument, NULL, 'g' },
+			{ "set", required_argument, NULL, 's' },
+			{ "custom", required_argument, NULL, 'c'},
+			{ "max", no_argument, NULL, 'm' },
+			{ "help", no_argument, NULL, 'h' },
+			{ "version", no_argument, NULL, 'v' },
+			{ NULL, 0, NULL, 0}
+		};
+
+		c = getopt_long(argc, argv, "egs:c:mh", long_options, &option_index);
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 'g':
+			xe_for_each_gt(fd, gt) {
+				printf("\n=====GT%d=====\n", gt);
+				for (int i = 0; i < (MAX + 1); i++) {
+					printf("%s: %d MHz\n",  info[i].name,
+					       xe_gt_get_freq(fd, gt, info[i].name));
+				}
+			}
+			break;
+		case 's':
+			if (!optarg) {
+				usage(argv[0]);
+				goto failure;
+			}
+
+			sscanf(optarg, "%u", &frequency);
+			xe_for_each_gt(fd, gt) {
+				xe_gt_set_freq(fd, gt, info[MIN].name, frequency);
+				xe_gt_set_freq(fd, gt, info[MAX].name, frequency);
+			}
+			break;
+		case 'c': {
+			char *arg, *token;
+
+			if (!optarg) {
+				usage(argv[0]);
+				goto failure;
+			}
+
+			arg = strdup(optarg);
+			token = strtok(arg, ",");
+			while (token != NULL) {
+				if (!strncmp("gt=", token, 3)) {
+					sscanf(token + 3, "%d", &gt);
+				} else if (!strncmp("min=", token, 4)) {
+					sscanf(token + 4, "%u", &frequency);
+					xe_gt_set_freq(fd, gt, info[MIN].name, frequency);
+				} else if (!strncmp("max=", token, 4)) {
+					sscanf(token + 4, "%u", &frequency);
+					xe_gt_set_freq(fd, gt, info[MAX].name, frequency);
+				} else {
+					fprintf(stderr, "Selected unmodifiable frequency\n");
+				}
+				token = strtok(NULL, ",");
+			}
+			free(arg);
+			break;
+		}
+		case 'e': /* efficient */
+			xe_for_each_gt(fd, gt) {
+				frequency = xe_gt_get_freq(fd, gt, info[EFF].name);
+				xe_gt_set_freq(fd, gt, info[MIN].name, frequency);
+				xe_gt_set_freq(fd, gt, info[MAX].name, frequency);
+			}
+			break;
+		case 'm': /* max */
+			xe_for_each_gt(fd, gt) {
+				frequency = xe_gt_get_freq(fd, gt, info[RP0].name);
+				xe_gt_set_freq(fd, gt, info[MIN].name, frequency);
+				xe_gt_set_freq(fd, gt, info[MAX].name, frequency);
+			}
+			break;
+		case 'v':
+			version(argv[0]);
+			break;
+		case 'h':
+		default:
+			usage(argv[0]);
+			break;
+		}
+	}
+
+	ret = EXIT_SUCCESS;
+failure:
+	close(fd);
+	return ret;
+}
-- 
2.50.1

