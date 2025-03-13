Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E3FC282EC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 06:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6A610E7F9;
	Thu, 13 Mar 2025 06:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXUQ8Pd2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3607A10E7F9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741847119; x=1773383119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dpp8mOPBZD1hxIE3wx5n0MgAQqUgFcKCscPfkuy2byI=;
 b=iXUQ8Pd2uVltW/OvgwFMhO6eZQBxkPCIugSM9nAbVPU2d+mik06wjcue
 27Duql6GWn9nfxxxAmv/71KOYb7vigAXeu3y5Rd8iqe0VUscAvXan3tqq
 aR2RhAZJ+/MCDMJ9Bryag80+RMwU77YWP3hguzmQiq/V9S3XWDvAFqwt3
 OkgpPSGAmZB+lMb1Z+lpwQvNQ+AnQ8lX6kumWFRP370AENqZUT0BKZzZG
 Se72TD+DOLQrh11cvYKDugYU5LTin/M6AmPn1O0e6TZ6FyApLg3cs3oAw
 20XkaW47XYj+iTKc0vpn9b9nF/EYoruW8nHoomFbUnbycr3XrmZxwvOwC w==;
X-CSE-ConnectionGUID: W/PxGat3Te+TDLot5hatcQ==
X-CSE-MsgGUID: qYNj2oPVS1mMWTrTis8lSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42829726"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42829726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:19 -0700
X-CSE-ConnectionGUID: jgkLWmFdQY+x+eoRn+05Tw==
X-CSE-MsgGUID: yVHkIA+OQRuxK9zOtiTXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="158022919"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:15 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH <i-g-t> v4 4/4] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
Date: Thu, 13 Mar 2025 11:51:54 +0530
Message-Id: <20250313062154.1601701-5-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313062154.1601701-1-soham.purkait@intel.com>
References: <20250313062154.1601701-1-soham.purkait@intel.com>
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

    Introduce vendor-agnostic support for handling multiple GPUs and
instances in gputop. Improve the tool's adaptability to various GPU
configurations.

v2 : fix for refactoring GPUTOP into a
     vendor-agnostic tool (Lucas)

v3 : New year included in copyright (Kamil, Riana)
     Removed caps in function name (Riana)
     Struct for driver specific operations (Riana)
     Headers in alphabetical order (Kamil, Riana)

v4 : Commit description and
     signed-off included

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/{ => gputop}/gputop.c | 211 +++++++++++++++++++++++++++++-------
 tools/gputop/meson.build    |   6 +
 tools/meson.build           |   6 +-
 3 files changed, 177 insertions(+), 46 deletions(-)
 rename tools/{ => gputop}/gputop.c (69%)
 create mode 100644 tools/gputop/meson.build

diff --git a/tools/gputop.c b/tools/gputop/gputop.c
similarity index 69%
rename from tools/gputop.c
rename to tools/gputop/gputop.c
index 43b01f566..732c885e2 100644
--- a/tools/gputop.c
+++ b/tools/gputop/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2025 Intel Corporation
  */
 
 #include <assert.h>
@@ -14,66 +14,110 @@
 #include <math.h>
 #include <poll.h>
 #include <signal.h>
+#include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <sys/sysmacros.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/types.h>
-#include <unistd.h>
 #include <termios.h>
-#include <sys/sysmacros.h>
-#include <stdbool.h>
+#include <unistd.h>
 
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
+#include "igt_perf.h"
 #include "igt_profiling.h"
-#include "drmtest.h"
+#include "xe_gputop.h"
+#include "xe/xe_query.h"
+
+/**
+ * Supported Drivers
+ *
+ * Adhere to the following requirements
+ * when implementing support for the
+ * new driver:
+ * @drivers: Update drivers[] with
+ * driver string.
+ * @total_count: Update NUM_DRIVER with
+ * the total number of supported drivers.
+ * @operations: Update the respective
+ * operations of the new driver:
+ * discover_engines,
+ * pmu_init,
+ * pmu_sample,
+ * print_engines
+ * @devices: Update devices[] array
+ * of type "struct gputop_device" with
+ * the initial values.
+ */
+static const char * const drivers[] = {
+	"xe",
+    /*Keep the last one as NULL*/
+	NULL
+};
+
+/**
+ * Number of supported drivers needs to be adjusted
+ * as per the letgth of the drivers[] array.
+ */
+#define NUM_DRIVER 1
+
+/**
+ * Supported operations on driver instances.
+ * Update the oprs[] array for
+ * each individual driver specific function.
+ * Maintain the sequence as per drivers[] array.
+ */
+struct device_operations oprs[NUM_DRIVER] = {
+	{
+		xe_discover_engines,
+		xe_pmu_init,
+		xe_pmu_sample,
+		xe_print_engines
+	}
+};
+
+/*
+ * devices[] array of type
+ * struct gputop_device
+ */
+struct gputop_device devices[] = {
+	{false, 0, NULL}
+};
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
-static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
-
-#define ANSI_HEADER "\033[7m"
-#define ANSI_RESET "\033[0m"
-
-static void n_spaces(const unsigned int n)
+static void populate_device_instances(struct gputop_device *dev, const char *driver)
 {
-	unsigned int i;
-
-	for (i = 0; i < n; i++)
-		putchar(' ');
+	struct igt_device_card *cards = NULL;
+	int count;
+#define ALL_CARD_TYPES 2
+	count = find_all_intel_card_by_driver_name(&cards, ALL_CARD_TYPES, driver);
+	dev->driver_present = true;
+	dev->len = count;
+	dev->instances = calloc(dev->len, sizeof(struct xe_gputop));
+	for (int i = 0; i < count; i++) {
+		xe_gputop_init((struct xe_gputop *)dev->instances + i,
+			       cards + i
+			);
+	}
 }
 
-static void print_percentage_bar(double percent, int max_len)
+static int find_driver(struct igt_device_card *card)
 {
-	int bar_len, i, len = max_len - 1;
-	const int w = 8;
-
-	len -= printf("|%5.1f%% ", percent);
-
-	/* no space left for bars, do what we can */
-	if (len < 0)
-		len = 0;
-
-	bar_len = ceil(w * percent * len / 100.0);
-	if (bar_len > w * len)
-		bar_len = w * len;
-
-	for (i = bar_len; i >= w; i -= w)
-		printf("%s", bars[w]);
-	if (i)
-		printf("%s", bars[i]);
-
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
-
-	putchar('|');
+	for (int i = 0; drivers[i]; i++) {
+		if (strcmp(drivers[i], card->driver) == 0)
+			return i;
+	}
+	return -1;
 }
 
 static int
@@ -333,6 +377,7 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
 static void help(void)
@@ -343,16 +388,18 @@ static void help(void)
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
+	       "\t-D, --device              Device filter"
 	       , program_invocation_short_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = "hn:d:";
+	static const char cmdopts_s[] = "hn:d:D:";
 	static const struct option cmdopts[] = {
 	       {"help", no_argument, 0, 'h'},
 	       {"delay", required_argument, 0, 'd'},
 	       {"iterations", required_argument, 0, 'n'},
+	       {"device", required_argument, 0, 'D'},
 	       { }
 	};
 
@@ -360,6 +407,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
+	args->device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -383,6 +431,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args->device = optarg;
+			break;
 		case 'h':
 			help();
 			return 0;
@@ -422,6 +473,76 @@ int main(int argc, char **argv)
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
+	igt_devices_scan();
+
+	if (args.device) {
+		struct igt_device_card *card = calloc(1, sizeof(struct igt_device_card));
+
+		if (!igt_device_card_match(args.device, card)) {
+			printf("No device found for the filter\n"
+				"Showing for all devices\n");
+				free(card);
+		} else {
+			int driver_no = find_driver(card);
+
+			if (driver_no < 0) {
+				fprintf(stderr, "The driver %s could not be found.", card->driver);
+				exit(EXIT_FAILURE);
+			}
+
+			devices[driver_no].driver_present = true;
+			devices[driver_no].len = 1;
+			devices[driver_no].instances =
+				calloc(1, sizeof(struct xe_gputop));
+			xe_gputop_init(devices[driver_no].instances,
+				       card
+					);
+			goto explore_devices;
+		}
+	}
+
+	for (int i = 0; drivers[i]; i++)
+		populate_device_instances(devices + i, drivers[i]);
+
+explore_devices:
+
+	for (int i = 0; drivers[i]; i++) {
+		if (devices[i].driver_present) {
+			for (int j = 0; j < devices[i].len; j++) {
+				if (!oprs[i].discover_engines(devices[i].instances + j)) {
+					fprintf(stderr,
+						"Failed to discover engines! (%s)\n",
+						strerror(errno));
+					return EXIT_FAILURE;
+				}
+				ret = oprs[i].pmu_init(devices[i].instances + j);
+
+				if (ret) {
+					fprintf(stderr,
+						"Failed to initialize PMU! (%s)\n",
+						strerror(errno));
+					if (errno == EACCES && geteuid())
+						fprintf(stderr,
+							"\n"
+							"When running as a normal user CAP_PERFMON is required to access performance\n"
+							"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
+							"distribution vendor for assistance.\n"
+							"\n"
+							"More information can be found at 'Perf events and tool security' document:\n"
+							"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
+
+					igt_devices_free();
+					return EXIT_FAILURE;
+				}
+			}
+		}
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
+			oprs[i].pmu_sample(devices[i].instances + j);
+	}
+
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
 		exit(1);
@@ -442,7 +563,7 @@ int main(int argc, char **argv)
 
 	while ((n != 0) && !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
-		int i, engine_w = 0, lines = 0;
+		int k, engine_w = 0, lines = 0;
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 		igt_drm_clients_sort(clients, client_cmp);
@@ -450,6 +571,14 @@ int main(int argc, char **argv)
 		update_console_size(&con_w, &con_h);
 		clrscr();
 
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++) {
+				oprs[i].pmu_sample(devices[i].instances + j);
+				lines = oprs[i].print_engines(devices[i].instances + j,
+							 lines, con_w, con_h);
+			}
+		}
+
 		if (!clients->num_clients) {
 			const char *msg = " (No GPU clients yet. Start workload to see stats)";
 
@@ -457,7 +586,7 @@ int main(int argc, char **argv)
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, i) {
+		igt_for_each_drm_client(clients, c, k) {
 			assert(c->status != IGT_DRM_CLIENT_PROBE);
 			if (c->status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
new file mode 100644
index 000000000..4766d8496
--- /dev/null
+++ b/tools/gputop/meson.build
@@ -0,0 +1,6 @@
+gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
+executable('gputop', sources : gputop_src,
+           install : true,
+           install_rpath : bindir_rpathdir,
+           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
+	   install: true)
diff --git a/tools/meson.build b/tools/meson.build
index 1dfe1f839..44c127c01 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -68,11 +68,6 @@ if libudev.found()
 		   install : true)
 endif
 
-executable('gputop', 'gputop.c',
-           install : true,
-           install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
-
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
 	   dependencies : tool_deps,
@@ -121,3 +116,4 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+subdir('gputop')
-- 
2.34.1

