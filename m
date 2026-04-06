Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46439E6400D
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC73910E023;
	Mon,  6 Apr 2026 06:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iC0hUiPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC95B10E023
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775455908; x=1806991908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xRf4RedIwXQ2Tnlpov+3xe+xKO2ROH92GXDZeTicYtE=;
 b=iC0hUiPhXotIhc+Wo/p2Mo90EbWX+Z+FxBMGuXwqpK3o4JpyRA3rRq5H
 V4I1aWP3olvZoU5wZ7xXRkLTEXzDoNQCiskR0tOz7yqVmg4zoRKYLDh8o
 Z5HxlF9R3CeTkXYzLOc+B2RtCG5hW/K12EUJnlb7lE5ThlRVehpmThz4Z
 b5OIBLwCgh76qku0vO7JRVsAvveDrYT9qOPdZ2c/aiF6N9oUX2JeJ1H3N
 kdUqIJkZvvUgPEemZBb5GiFPq54RBoLAeMgsDXPzAtFFlW8l2zccMKe9D
 lwk7hErudB5YUNzs7wNC/THDfUCPvzQlqoClMjbHGnpppP9dqYeUWekQL g==;
X-CSE-ConnectionGUID: cczeYFjaQLygMj1mr5JZyg==
X-CSE-MsgGUID: jU+VqqCyTdKtm3bf/OEF3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76421202"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76421202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:11:48 -0700
X-CSE-ConnectionGUID: gnkJcpibTiCMEwRCZp5tww==
X-CSE-MsgGUID: VO3Tyd/cSc6obT1l/UyUXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="226968790"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:11:45 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: [PATCH i-g-t v10 4/5] tools/gputop.src/gputop: Add support for
 per-engine busyness monitoring
Date: Mon,  6 Apr 2026 11:34:27 +0530
Message-Id: <20260406060428.2734117-5-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406060428.2734117-1-soham.purkait@intel.com>
References: <20260406060428.2734117-1-soham.purkait@intel.com>
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

This introduce support for monitoring per-engine busyness in gputop,
extending existing per-client monitoring to handle multiple GPUs, when
present, including support for multi-engine instances, enabling
finer-grained engine busyness reporting.

v1:
 - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
v2:
 - Cosmetic changes. (Riana)
 - Avoid three level indentation. (Riana)
v3:
 - Add device filter to populate the array of cards for
   all supported drivers. (Zbigniew)
v4:
 - Add user message for running without root privileges. (Kamil)
 - Add support for GPU client-only busyness on unsupported
   drivers as a fallback mechanism. (Kamil)
 - Remove unused dependencies and headers. (Kamil)
v5:
 - Replace hardcoded values with Enum for driver number. (Vinay)
 - Rename driver_no to driver_num for better readability. (Vinay)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop.src/gputop.c    | 305 ++++++++++++++++++++++++++++++-----
 tools/gputop.src/meson.build |   2 +-
 tools/meson.build            |   3 +-
 3 files changed, 268 insertions(+), 42 deletions(-)

diff --git a/tools/gputop.src/gputop.c b/tools/gputop.src/gputop.c
index 9b2e8cb6f..479897f40 100644
--- a/tools/gputop.src/gputop.c
+++ b/tools/gputop.src/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2026 Intel Corporation
  */
 
 #include <assert.h>
@@ -14,22 +14,71 @@
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
 
 #include "igt_core.h"
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
 #include "igt_profiling.h"
+#include "xe_gputop.h"
+
+/**
+ * Supported Drivers
+ *
+ * Adhere to the following requirements when implementing support for the
+ * new driver:
+ * @drivers: Update drivers[] with new driver string and so the enum drivers
+ * with the new driver entry.
+ * @sizeof_gputop_obj: Update this function as per new driver support included.
+ * @operations: Update the respective operations of the new driver:
+ * gputop_init,
+ * discover_engines,
+ * pmu_init,
+ * pmu_sample,
+ * print_engines,
+ * clean_up
+ * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
+ * initial values.
+ */
+static const char * const drivers[] = {
+	"xe",
+    /* Keep the last one as NULL */
+	NULL
+};
+
+/**
+ * Supported operations on driver instances. Update the ops[] array for
+ * each individual driver specific function. Maintain the sequence as per
+ * drivers[] array.
+ */
+struct device_operations ops[] = {
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
+ * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
+ * and related info discovered per driver.
+ */
+struct gputop_driver per_driver_contexts[] = {
+	{false, 0, NULL}
+};
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
@@ -37,50 +86,84 @@ enum utilization_type {
 };
 
 enum intel_driver_type {
-	INTEL_DRIVER_I915,
 	INTEL_DRIVER_XE,
+	INTEL_DRIVER_I915,
 	INTEL_DRIVER_UNKNOWN,
 };
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
-static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
-
-#define ANSI_HEADER "\033[7m"
-#define ANSI_RESET "\033[0m"
-
-static void n_spaces(const unsigned int n)
+static size_t sizeof_gputop_obj(int driver_num)
 {
-	unsigned int i;
-
-	for (i = 0; i < n; i++)
-		putchar(' ');
+	switch (driver_num) {
+	case INTEL_DRIVER_XE:
+		return sizeof(struct xe_gputop);
+	default:
+		fprintf(stderr,
+			"Driver object size does not exist.\n");
+		exit(EXIT_FAILURE);
+	}
 }
 
-static void print_percentage_bar(double percent, int max_len)
+static void gputop_clean_up(void)
 {
-	int bar_len, i, len = max_len - 1;
-	const int w = 8;
-
-	len -= printf("|%5.1f%% ", percent);
-
-	/* no space left for bars, do what we can */
-	if (len < 0)
-		len = 0;
+	for (int i = 0; drivers[i]; i++) {
+		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
+		free(per_driver_contexts[i].instances);
+		per_driver_contexts[i].device_present = false;
+		per_driver_contexts[i].len = 0;
+	}
+}
 
-	bar_len = ceil(w * percent * len / 100.0);
-	if (bar_len > w * len)
-		bar_len = w * len;
+static int find_driver(struct igt_device_card *card)
+{
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
+	struct gputop_driver *driver_entry =  NULL;
+	int driver_num;
+	int count, final_count = 0;
+
+	count = igt_device_card_match_all(filter, &cards);
+	for (int j = 0; j < count; j++) {
+		if (strcmp(cards[j].subsystem, "pci") != 0)
+			continue;
 
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
+		driver_num = find_driver(&cards[j]);
+		if (driver_num < 0)
+			continue;
 
-	putchar('|');
+		driver_entry = &per_driver_contexts[driver_num];
+		if (!driver_entry->device_present)
+			driver_entry->device_present = true;
+		driver_entry->len++;
+		driver_entry->instances = realloc(driver_entry->instances,
+						  driver_entry->len
+						  * sizeof_gputop_obj(driver_num));
+		if (!driver_entry->instances) {
+			fprintf(stderr,
+				"Device instance realloc failed (%s)\n",
+				strerror(errno));
+			exit(EXIT_FAILURE);
+		}
+		card_inplace = (struct igt_device_card *)
+				calloc(1, sizeof(struct igt_device_card));
+		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
+		ops[driver_num].gputop_init(driver_entry->instances, (driver_entry->len - 1),
+			card_inplace);
+		final_count++;
+	}
+	if (count)
+		free(cards);
+	return final_count;
 }
 
 /* Get the correct sysfs prefix based on DRM minor number */
@@ -526,8 +609,31 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	bool verbose;
 };
 
+static void countdown(const char *msg, const int start_sec)
+{
+	struct pollfd pfd;
+	int i, ret;
+	char ch;
+
+	for (i = start_sec; i > 0; i--) {
+		printf("\r%s%d... second(s)", msg, i);
+		fflush(stdout);
+
+		pfd.fd = STDIN_FILENO;
+		pfd.events = POLLIN;
+
+		ret = poll(&pfd, 1, 1000);
+		if (ret > 0 && (pfd.revents & POLLIN)) {
+			while ((ch = getchar()) != '\n' && ch != EOF)
+				continue;
+			return;
+		}
+	}
+}
+
 static void help(char *full_path)
 {
 	const char *short_program_name = strrchr(full_path, '/');
@@ -541,18 +647,47 @@ static void help(char *full_path)
 	       "\t%s [options]\n\n"
 	       "Options:\n"
 	       "\t-h, --help                show this help\n"
+	       "\t-v, --verbose             wait 5 seconds before starting client-only busyness in"
+	       " non-root mode if neither CAP_PERFMON is set nor perf_event_paranoid is"
+	       " permissive.\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
-	       "\t-n, --iterations =NUMBER  number of executions\n"
+	       "\t-n, --iterations =NUMBER  number of executions\n\n"
+	       "Running without root:\n"
+	       "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid is required to\n"
+	       "\taccess engine busyness\n"
+	       "\t" ANSI_HEADER "Steps to run without root (using CAP_PERFMON):"
+		ANSI_RESET "\n"
+	       "\tcd /path/to/igt-gpu-tools/\n"
+	       "\tsudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop\n"
+	       "\tsudo sh -c \"echo $(pwd)/build/lib > /etc/ld.so.conf.d/lib-igt.conf\"\n"
+	       "\tsudo ldconfig\n"
+	       "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET "\n"
+	       "\tsudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop\n"
+	       "\tsudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
+	       "\tsudo ldconfig\n"
+	       "\n"
+	       "\t" ANSI_HEADER "Steps to run without root (using perf_event_paranoid):"
+	       ANSI_RESET "\n"
+	       "\t\033[32m# Save current perf_event_paranoid value\033[0m\n"
+	       "\torig_val=$(sysctl -n kernel.perf_event_paranoid)\n"
+	       "\tsudo sysctl -w kernel.perf_event_paranoid=-1\n"
+	       "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET "\n"
+	       "\t\033[32m# Restore original value\033[0m\n"
+	       "\tsudo sysctl -w kernel.perf_event_paranoid=$orig_val\n\n"
+	       "\tFor details, see 'Perf events and tool security':\n"
+	       "\thttps://www.kernel.org/doc/html/"
+	       "latest/admin-guide/perf-security.html\n\n"
 	       , short_program_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = "hn:d:";
+	static const char cmdopts_s[] = "hvn:d:";
 	static const struct option cmdopts[] = {
 	       {"help", no_argument, 0, 'h'},
 	       {"delay", required_argument, 0, 'd'},
 	       {"iterations", required_argument, 0, 'n'},
+	       {"verbose", no_argument, 0, 'v'},
 	       { }
 	};
 
@@ -560,6 +695,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
+	args->verbose = false;
 
 	for (;;) {
 		int c, idx = 0;
@@ -573,6 +709,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 		case 'n':
 			args->n_iter = strtol(optarg, NULL, 10);
 			break;
+		case 'v':
+			args->verbose = true;
+			break;
 		case 'd':
 			args->delay_usec = strtoul(optarg, &end_ptr, 10) * USEC_PER_SEC;
 			if (*end_ptr == '.')
@@ -610,9 +749,12 @@ int main(int argc, char **argv)
 	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
+	bool is_root;
 	int ret;
 	long n;
 
+	is_root = (geteuid() == 0);
+
 	ret = parse_args(argc, argv, &args);
 	if (ret < 0)
 		return EXIT_FAILURE;
@@ -621,6 +763,62 @@ int main(int argc, char **argv)
 
 	n = args.n_iter;
 	period_us = args.delay_usec;
+	populate_device_instances("device:subsystem=pci,card=all");
+
+	for (int i = 0; drivers[i]; i++) {
+		if (!per_driver_contexts[i].device_present)
+			continue;
+
+		for (int j = 0; j < per_driver_contexts[i].len; j++) {
+			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
+				fprintf(stderr,
+					"Failed to initialize engines! (%s)\n",
+					strerror(errno));
+					gputop_clean_up();
+				return EXIT_FAILURE;
+			}
+			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
+
+			if (ret) {
+				if (errno == EACCES && !is_root) {
+					igt_devices_free();
+					gputop_clean_up();
+					if (args.verbose) {
+						fprintf(stderr,
+							"\n"
+							"Running without root privileges.\n"
+							"Engine busyness may not be available "
+							"without root privileges.\n"
+							"See \"--help\" to enable engine "
+							"busyness without root.\n\n");
+						countdown("Resuming with only gpu client "
+								"busyness in ", 5);
+					}
+				} else {
+					fprintf(stderr,
+						"Failed to initialize PMU! (%s)\n",
+						strerror(errno));
+					igt_devices_free();
+					gputop_clean_up();
+					return EXIT_FAILURE;
+				}
+			}
+		}
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		for (int j = 0;
+		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
+		     j++)
+			if (ops[i].pmu_sample(per_driver_contexts[i].instances, j)) {
+				fprintf(stderr,
+					"Failed to sample PMU! (%s)\n",
+					strerror(errno));
+				igt_devices_free();
+				gputop_clean_up();
+				return EXIT_FAILURE;
+			}
+	}
 
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
@@ -642,22 +840,49 @@ int main(int argc, char **argv)
 
 	while ((n != 0) && !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
-		int i, engine_w = 0, lines = 0;
+		int k, engine_w = 0, lines = 0;
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_contexts[i].device_present &&
+			     j < per_driver_contexts[i].len;
+			     j++)
+				if (ops[i].pmu_sample(per_driver_contexts[i].instances, j)) {
+					fprintf(stderr,
+						"Failed to sample PMU! (%s)\n",
+						strerror(errno));
+					igt_devices_free();
+					gputop_clean_up();
+					return EXIT_FAILURE;
+				}
+		}
+
 		igt_drm_clients_sort(clients, client_cmp);
 
 		update_console_size(&con_w, &con_h);
 		clrscr();
 
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_contexts[i].device_present &&
+			     j < per_driver_contexts[i].len;
+			     j++) {
+				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
+							 lines, con_w, con_h);
+			}
+		}
+
 		if (!clients->num_clients) {
-			const char *msg = " (No GPU clients yet. Start workload to see stats)";
+			const char *msg;
 
+			msg = " (No GPU clients yet. Start workload to see stats)";
 			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, i) {
+		igt_for_each_drm_client(clients, c, k) {
 			assert(c->status != IGT_DRM_CLIENT_PROBE);
 			if (c->status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
@@ -681,11 +906,11 @@ int main(int argc, char **argv)
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
diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
index ec39f4c7a..e95657fca 100644
--- a/tools/gputop.src/meson.build
+++ b/tools/gputop.src/meson.build
@@ -1 +1 @@
-gputop_src = files('gputop.c')
+gputop_src = files('gputop.c', 'utils.c', 'xe_gputop.c')
diff --git a/tools/meson.build b/tools/meson.build
index 521607a4c..caca57d0e 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -123,4 +123,5 @@ subdir('gputop.src')
 executable('gputop', sources : gputop_src,
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],)
+	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,
+	   		   lib_igt_drm_fdinfo,lib_igt_profiling,math],)
-- 
2.34.1

