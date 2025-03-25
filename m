Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33781C3600D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F4210E5DF;
	Tue, 25 Mar 2025 19:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSjFndY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B865510E5E7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742930174; x=1774466174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LDTWor3iUa5Pl3FJzXQ08QZMkYGb2gI+/t7iBm8XlP4=;
 b=mSjFndY2MFbwg2GrRu2s4mHIubsJ2rRECzRPOsOsuzjSYvSA7p3S08DK
 9mSv5ZZfTX/7aU56CMMfsAyFe/nKe3Qi18RP3Z57kJtKdCsvyXLe1UWQM
 SgleO8UYc9qJGeHA8C58ISvQJsIfhJdvVru96LaeKJZ3Gjb5QMT9L1bBJ
 hjOg7qtW673CvuPqRCenXg41D9emO/KKNxAS5dbvyxBsp4r0cHHu0gqwp
 5ViLt0Zg0ZfEZ2rEUuiZZFhF98Xc/yqpsCloTVDM+BZos4HNj+L7jkWr7
 CvNfPlNXmKlvupjW7itkskk0akj284DTvWfSDvDbdzqZ22ycxCjL7HTNp Q==;
X-CSE-ConnectionGUID: 8gM+33/OSSCNuArLtfjfyw==
X-CSE-MsgGUID: hktnUxAeQruLhtGbmKojkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69558695"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="69558695"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:16:14 -0700
X-CSE-ConnectionGUID: MP44R6vXQcOn9tQNT73yJg==
X-CSE-MsgGUID: +5DSKzJkQjq1SyaGel8gbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="147657262"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:16:11 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH <i-g-t> v5 4/4] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
Date: Wed, 26 Mar 2025 00:42:30 +0530
Message-Id: <20250325191230.1822979-5-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250325191230.1822979-1-soham.purkait@intel.com>
References: <20250325191230.1822979-1-soham.purkait@intel.com>
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

Introduce vendor-agnostic support for
handling multiple GPUs and instances
in gputop. Improve the tool's adaptability
to various GPU configurations.

v2 : fix for refactoring GPUTOP into a
     vendor-agnostic tool (Lucas)

v3 : New year included in copyright (Kamil, Riana)
     Removed caps in function name (Riana)
     Struct for driver specific operations (Riana)
     Headers in alphabetical order (Kamil, Riana)

v4 : Commit description and
     signed-off included 

v5 : Fix for proper resource cleanup. (Riana)
     Use "dev_type" enum for card_type. (Krzysztof)
     Add new filter to return collection
     of matching devices.               (Zbigniew)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/{ => gputop}/gputop.c | 235 ++++++++++++++++++++++++++++++------
 tools/gputop/meson.build    |   6 +
 tools/meson.build           |   6 +-
 3 files changed, 202 insertions(+), 45 deletions(-)
 rename tools/{ => gputop}/gputop.c (66%)
 create mode 100644 tools/gputop/meson.build

diff --git a/tools/gputop.c b/tools/gputop/gputop.c
similarity index 66%
rename from tools/gputop.c
rename to tools/gputop/gputop.c
index 43b01f566..328062bd2 100644
--- a/tools/gputop.c
+++ b/tools/gputop/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2025 Intel Corporation
  */
 
 #include <assert.h>
@@ -14,66 +14,153 @@
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
+ * gputop_init,
+ * discover_engines,
+ * pmu_init,
+ * pmu_sample,
+ * print_engines,
+ * clean_up
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
+		xe_gputop_init,
+		xe_populate_engines,
+		xe_pmu_init,
+		xe_pmu_sample,
+		xe_print_engines,
+		xe_clean_up
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
+static void gputop_clean_up(void)
 {
-	unsigned int i;
-
-	for (i = 0; i < n; i++)
-		putchar(' ');
+	for (int i = 0; drivers[i]; i++) {
+		oprs[i].clean_up(devices[i].instances, devices[i].len);
+		free(devices[i].instances);
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
+	for (int i = 0; drivers[i]; i++) {
+		if (strcmp(drivers[i], card->driver) == 0)
+			return i;
+	}
+	return -1;
+}
 
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
+/*
+ * If filter is not NULL i will be ignored.
+ */
+static int populate_device_instances(const char *filter, const int i)
+{
+	struct igt_device_card *cards = NULL;
+	struct gputop_device *dev = devices + i;
+	const char *driver = drivers[i];
+	int count;
+
+	if (!filter) {
+		count = igt_device_find_all_intel_card_by_driver_name(&cards, DEVTYPE_ALL, driver);
+		dev->driver_present = true;
+		dev->len = count;
+		dev->instances = calloc(dev->len, sizeof(struct xe_gputop));
+		for (int j = 0; j < count; j++) {
+			oprs[i].gputop_init((struct xe_gputop *)dev->instances + j,
+				cards + j
+				);
+		}
+	}
 
-	putchar('|');
+	else {
+		count = igt_device_card_match_all(filter, &cards, true, drivers);
+		for (int j = 0; j < count; j++) {
+			int driver_no = find_driver(cards + j);
+
+			dev = devices + driver_no;
+			if (!dev->driver_present)
+				dev->driver_present = true;
+			dev->len++;
+			dev->instances = realloc(dev->instances,
+						 dev->len * sizeof(struct xe_gputop));
+			if (!dev->instances) {
+				fprintf(stderr,
+					"Device instance realloc failed (%s)\n",
+					strerror(errno));
+				exit(EXIT_FAILURE);
+			}
+			oprs[i].gputop_init((struct xe_gputop *)(dev->instances + dev->len - 1),
+				cards + j
+				);
+		}
+	}
+	return count;
 }
 
 static int
@@ -333,6 +420,7 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
 static void help(void)
@@ -343,16 +431,18 @@ static void help(void)
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
+	       "\t-D, --device              Device filter\n"
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
 
@@ -360,6 +450,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
+	args->device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -383,6 +474,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args->device = optarg;
+			break;
 		case 'h':
 			help();
 			return 0;
@@ -422,6 +516,59 @@ int main(int argc, char **argv)
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
+	igt_devices_scan();
+
+	if (args.device) {
+		if (!populate_device_instances(args.device, 0))
+			printf("No device found with the filter.\n");
+		else
+			goto explore_devices;
+	}
+
+	for (int i = 0; drivers[i]; i++)
+		populate_device_instances(NULL, i);
+
+explore_devices:
+
+	for (int i = 0; drivers[i]; i++) {
+		if (devices[i].driver_present) {
+			for (int j = 0; j < devices[i].len; j++) {
+				if (!oprs[i].init_engines(devices[i].instances + j)) {
+					fprintf(stderr,
+						"Failed to initialize engines! (%s)\n",
+						strerror(errno));
+						gputop_clean_up();
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
+					gputop_clean_up();
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
@@ -442,7 +589,7 @@ int main(int argc, char **argv)
 
 	while ((n != 0) && !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
-		int i, engine_w = 0, lines = 0;
+		int k, engine_w = 0, lines = 0;
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 		igt_drm_clients_sort(clients, client_cmp);
@@ -450,6 +597,14 @@ int main(int argc, char **argv)
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
 
@@ -457,7 +612,7 @@ int main(int argc, char **argv)
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, i) {
+		igt_for_each_drm_client(clients, c, k) {
 			assert(c->status != IGT_DRM_CLIENT_PROBE);
 			if (c->status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
@@ -481,11 +636,11 @@ int main(int argc, char **argv)
 	}
 
 	igt_drm_clients_free(clients);
+	gputop_clean_up();
 
 	if (profiled_devices != NULL) {
 		igt_devices_configure_profiling(profiled_devices, false);
 		igt_devices_free_profiling(profiled_devices);
 	}
-
 	return 0;
 }
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

