Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C1FC7115B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 19:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB99D10E10C;
	Thu, 19 Jun 2025 19:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPWJRapO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A8010E10C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750361268; x=1781897268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GYkplvTPZyg1kvWKiGlhtYosnAcKet9JFfc3tvLOP1w=;
 b=SPWJRapOoe4ngXjf99e0+5jwtL662x54iYxuT/W7spZDsVszI1i5TmBl
 19Wwnd9U+iMCAgZV9X5zAAYjPentGSQp/FDyM9/oiZGWPDE6F2YSoFusI
 cOB/A2TtxBvvRR4gC3KW87tXhPqQCnlUrwb1mg9bPgh4EbA8P4ac3KHLw
 ZSJF0zuHWSZxJhfKkCSvzLeDQz9UDrTIk+qJQ7t9+Nmq5I5c7oXWmMeOO
 eDaeKh9NkYGJVsB8epb2TT7boi7ptm4QuBEneHkZUWaDyOoxGOIoJ/Goj
 jnxhScQ+0gesFXf41n/e7HQpxoWyaD1jkvmBva8EszTU9HY0OJqLKxcEV w==;
X-CSE-ConnectionGUID: OtDBfYuRT7arDYuR+TRq5w==
X-CSE-MsgGUID: KLKfYAabTWqExM8QcGZVfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52319515"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="52319515"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 12:27:48 -0700
X-CSE-ConnectionGUID: zzSFP0ChQfSIOvTTLSVa8A==
X-CSE-MsgGUID: mpsJm9J3RBeprq5QjT8cUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="155101198"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 12:27:45 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v13 5/5] tools/gputop/gputop: Enable support for multiple GPUs
 and instances
Date: Fri, 20 Jun 2025 00:51:36 +0530
Message-Id: <20250619192136.3026910-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619192136.3026910-1-soham.purkait@intel.com>
References: <20250619192136.3026910-1-soham.purkait@intel.com>
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

v2 : Fix for refactoring GPUTOP into a
     vendor-agnostic tool. (Lucas)

v3 : New year included in copyright. (Kamil, Riana)
     Removed caps in function name. (Riana)
     Struct for driver specific operations. (Riana)
     Headers in alphabetical order. (Kamil, Riana)

v4 : Commit description and signed-off included.

v5 : Fix for proper resource cleanup. (Riana)
     Use "dev_type" enum for card_type. (Krzysztof)
     Add new filter to return collection
     of matching devices.               (Zbigniew)

v6 : Use device filter to populate the array of
     cards for all supported drivers.   (Zbigniew)

v7 : Use filter to find all the cards.  (Zbigniew)

v8 : Removed 'drivers' array parameter from
     card match function.               (Zbigniew)

v10 : Resolved 'populate_devices' call with
      pci subsystem filtering.          (Zbigniew)

v11 : Add space after /* and before */ for better
      readability.                      (Zbigniew)
      Comments wrapped at 75/100.       (Riana)

v13 : Cosmetic changes.
		      (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tools/{ => gputop}/gputop.c | 229 ++++++++++++++++++++++++++++++------
 tools/gputop/meson.build    |   6 +
 tools/meson.build           |   6 +-
 3 files changed, 197 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (65%)
 create mode 100644 tools/gputop/meson.build

diff --git a/tools/gputop.c b/tools/gputop/gputop.c
similarity index 65%
rename from tools/gputop.c
rename to tools/gputop/gputop.c
index 43b01f566..524b4ac1a 100644
--- a/tools/gputop.c
+++ b/tools/gputop/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2025 Intel Corporation
  */
 
 #include <assert.h>
@@ -14,66 +14,143 @@
 #include <math.h>
 #include <poll.h>
 #include <signal.h>
+#include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
+#include <sys/sysmacros.h>
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
+ * Adhere to the following requirements when implementing support for the
+ * new driver:
+ * @drivers: Update drivers[] with driver string.
+ * @total_count: Update NUM_DRIVER with the total number of supported drivers.
+ * @operations: Update the respective operations of the new driver:
+ * gputop_init,
+ * discover_engines,
+ * pmu_init,
+ * pmu_sample,
+ * print_engines,
+ * clean_up
+ * @per_driver_devices: Update per_driver_devices[] array of type "struct gputop_devices" with the
+ * initial values.
+ */
+static const char * const drivers[] = {
+	"xe",
+    /* Keep the last one as NULL */
+	NULL
+};
+
+/**
+ * Number of supported drivers needs to be adjusted as per the length of
+ * the drivers[] array.
+ */
+#define NUM_DRIVER 1
+
+/**
+ * Supported operations on driver instances. Update the ops[] array for
+ * each individual driver specific function. Maintain the sequence as per
+ * drivers[] array.
+ */
+struct device_operations ops[NUM_DRIVER] = {
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
+ * per_driver_devices[] array of type struct gputop_devices which keeps track of the devices
+ * discovered per driver.
+ */
+struct gputop_devices per_driver_devices[] = {
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
+		ops[i].clean_up(per_driver_devices[i].instances, per_driver_devices[i].len);
+		free(per_driver_devices[i].instances);
+		per_driver_devices[i].device_present = false;
+		per_driver_devices[i].len = 0;
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
+	for (int i = 0; drivers[i]; i++) {
+		if (strcmp(drivers[i], card->driver) == 0)
+			return i;
+	}
+	return -1;
+}
 
-	for (i = bar_len; i >= w; i -= w)
-		printf("%s", bars[w]);
-	if (i)
-		printf("%s", bars[i]);
+static int populate_device_instances(const char *filter)
+{
+	struct igt_device_card *cards = NULL;
+	struct igt_device_card *card_inplace = NULL;
+	struct gputop_devices *dev =  NULL;
+	int driver_no;
+	int count, final_count = 0;
+
+	count = igt_device_card_match_all(filter, &cards);
+	for (int j = 0; j < count; j++) {
+		if (strcmp((cards + j)->subsystem, "pci") != 0)
+			continue;
 
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
+		driver_no = find_driver(cards + j);
+		if (driver_no < 0)
+			continue;
 
-	putchar('|');
+		dev = per_driver_devices + driver_no;
+		if (!dev->device_present)
+			dev->device_present = true;
+		dev->len++;
+		dev->instances = realloc(dev->instances,
+					 dev->len * sizeof(struct xe_gputop));
+		if (!dev->instances) {
+			fprintf(stderr,
+				"Device instance realloc failed (%s)\n",
+				strerror(errno));
+			exit(EXIT_FAILURE);
+		}
+		card_inplace = (struct igt_device_card *)
+				calloc(1, sizeof(struct igt_device_card));
+		memcpy(card_inplace, cards + j, sizeof(struct igt_device_card));
+		ops[driver_no].gputop_init((struct xe_gputop *)(dev->instances + dev->len - 1),
+			card_inplace);
+		final_count++;
+	}
+	if (count)
+		free(cards);
+	return final_count;
 }
 
 static int
@@ -333,6 +410,7 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
 static void help(void)
@@ -343,16 +421,18 @@ static void help(void)
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
 
@@ -360,6 +440,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
+	args->device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -383,6 +464,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args->device = optarg;
+			break;
 		case 'h':
 			help();
 			return 0;
@@ -422,6 +506,56 @@ int main(int argc, char **argv)
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
+	if (!populate_device_instances(args.device ? args.device
+				       : "device:subsystem=pci,card=all")) {
+		printf("No device found.\n");
+		gputop_clean_up();
+		exit(1);
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		if (per_driver_devices[i].device_present) {
+			for (int j = 0; j < per_driver_devices[i].len; j++) {
+				if (!ops[i].init_engines(per_driver_devices[i].instances + j)) {
+					fprintf(stderr,
+						"Failed to initialize engines! (%s)\n",
+						strerror(errno));
+						gputop_clean_up();
+					return EXIT_FAILURE;
+				}
+				ret = ops[i].pmu_init(per_driver_devices[i].instances + j);
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
+		} else {
+			continue;
+		}
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		for (int j = 0;
+		     per_driver_devices[i].device_present && j < per_driver_devices[i].len;
+		     j++)
+			ops[i].pmu_sample(per_driver_devices[i].instances + j);
+	}
+
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
 		exit(1);
@@ -442,14 +576,31 @@ int main(int argc, char **argv)
 
 	while ((n != 0) && !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
-		int i, engine_w = 0, lines = 0;
+		int k, engine_w = 0, lines = 0;
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_devices[i].device_present && j < per_driver_devices[i].len;
+			     j++)
+				ops[i].pmu_sample(per_driver_devices[i].instances + j);
+		}
+
 		igt_drm_clients_sort(clients, client_cmp);
 
 		update_console_size(&con_w, &con_h);
 		clrscr();
 
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_devices[i].device_present && j < per_driver_devices[i].len;
+			     j++) {
+				lines = ops[i].print_engines(per_driver_devices[i].instances + j,
+							 lines, con_w, con_h);
+			}
+		}
+
 		if (!clients->num_clients) {
 			const char *msg = " (No GPU clients yet. Start workload to see stats)";
 
@@ -457,7 +608,7 @@ int main(int argc, char **argv)
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, i) {
+		igt_for_each_drm_client(clients, c, k) {
 			assert(c->status != IGT_DRM_CLIENT_PROBE);
 			if (c->status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
@@ -481,11 +632,11 @@ int main(int argc, char **argv)
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
index de866c392..8002f707d 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -69,11 +69,6 @@ if libudev.found()
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
@@ -122,3 +117,4 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+subdir('gputop')
-- 
2.34.1

