Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FF2D3B98C
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 17:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCFC10E546;
	Tue,  9 Dec 2025 17:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R84mqvKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E94C10E63B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 17:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765302366; x=1796838366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O0PvxlCRhn4Fgw3A4fvidBlgUvCbvkRmqF1vWTPt3e4=;
 b=R84mqvKk3r3ZKwVVUBPcDo7U9kuTK0393wZNHBQFv5hvICUbChqRg5R9
 xlKTMPvD4TYRJsq22Z+Ljl6dVB3AWnaRVHqVYenFGeqVXfEx8f6mO40Mi
 KDt67o2L88TFLm6spNlBhSmbo3m2KWJZEhumQ5atykizQ+Sv5oVIAsLVh
 qZt68v/quPW7vUO14VjFT6fl3LWqJ9ek1usBcVGl8CYEXp7FVr39ZCWCq
 Gq2+hEZ4Tmt71LAt6uQMu848fHKiBlVBSrk0KAq/B1aI8N4UBetQH/doz
 bGaSej5p4iwvCQB+RgPczmDFKeTlbOCajMF4aO6/49ezGWO75RSrfyj+k w==;
X-CSE-ConnectionGUID: n3nMRpwKT/CdvFqwCUmAyg==
X-CSE-MsgGUID: v9yQ8cUEQ466cidZGROXgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71127256"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="71127256"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 09:46:05 -0800
X-CSE-ConnectionGUID: 6BRed55JTpikZQeijh8+Eg==
X-CSE-MsgGUID: BhcjuW7JQvqHk7HSykryKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="197056932"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 09:46:03 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v1 2/2] tools/gputop/gputop: Enable support for multiple
 GPUs and instances
Date: Tue,  9 Dec 2025 23:05:13 +0530
Message-Id: <20251209173513.4020947-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209173513.4020947-1-soham.purkait@intel.com>
References: <20251209173513.4020947-1-soham.purkait@intel.com>
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

Introduce vendor-agnostic support for handling multiple GPUs and instances
in gputop. Improve the tool's adaptability to various GPU configurations.

v1:
 - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
v2:
 - Add device filter to populate the array of cards for
   all supported drivers. (Zbigniew)
v3:
 - Cosmetic changes. (Riana)
 - Avoid three level indentation. (Riana)
v4:
 - Add user message for running without root privileges. (Kamil)
v5:
 - Add support for GPU client-only busyness on unsupported
   drivers as a fallback mechanism. (Kamil)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/{ => gputop}/gputop.c | 283 +++++++++++++++++++++++++++++++-----
 tools/gputop/meson.build    |   6 +
 tools/meson.build           |   6 +-
 3 files changed, 250 insertions(+), 45 deletions(-)
 rename tools/{ => gputop}/gputop.c (59%)
 create mode 100644 tools/gputop/meson.build

diff --git a/tools/gputop.c b/tools/gputop/gputop.c
similarity index 59%
rename from tools/gputop.c
rename to tools/gputop/gputop.c
index f577a1750..e13f98b82 100644
--- a/tools/gputop.c
+++ b/tools/gputop/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2025 Intel Corporation
  */
 
 #include <assert.h>
@@ -14,66 +14,148 @@
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
+static size_t sizeof_gputop_obj(int driver_num)
+{
+	switch (driver_num) {
+	case 0:
+		return sizeof(struct xe_gputop);
+	default:
+		fprintf(stderr,
+			"Driver number does not exist.\n");
+		exit(EXIT_FAILURE);
+	}
+}
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
+		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
+		free(per_driver_contexts[i].instances);
+		per_driver_contexts[i].device_present = false;
+		per_driver_contexts[i].len = 0;
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
+	struct gputop_driver *driver_entry =  NULL;
+	int driver_no;
+	int count, final_count = 0;
+
+	count = igt_device_card_match_all(filter, &cards);
+	for (int j = 0; j < count; j++) {
+		if (strcmp(cards[j].subsystem, "pci") != 0)
+			continue;
 
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
+		driver_no = find_driver(&cards[j]);
+		if (driver_no < 0)
+			continue;
 
-	putchar('|');
+		driver_entry = &per_driver_contexts[driver_no];
+		if (!driver_entry->device_present)
+			driver_entry->device_present = true;
+		driver_entry->len++;
+		driver_entry->instances = realloc(driver_entry->instances,
+						  driver_entry->len * sizeof_gputop_obj(driver_no));
+		if (!driver_entry->instances) {
+			fprintf(stderr,
+				"Device instance realloc failed (%s)\n",
+				strerror(errno));
+			exit(EXIT_FAILURE);
+		}
+		card_inplace = (struct igt_device_card *)
+				calloc(1, sizeof(struct igt_device_card));
+		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
+		ops[driver_no].gputop_init(driver_entry->instances, (driver_entry->len - 1),
+			card_inplace);
+		final_count++;
+	}
+	if (count)
+		free(cards);
+	return final_count;
 }
 
 static int
@@ -333,6 +415,7 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
 static void help(char *full_path)
@@ -350,16 +433,18 @@ static void help(char *full_path)
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
+	       "\t-D, --device              Device filter\n"
 	       , short_program_name);
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
 
@@ -367,6 +452,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
+	args->device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -390,6 +476,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args->device = optarg;
+			break;
 		case 'h':
 			help(argv[0]);
 			return 0;
@@ -417,9 +506,12 @@ int main(int argc, char **argv)
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
@@ -429,6 +521,92 @@ int main(int argc, char **argv)
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
+	if (!populate_device_instances(args.device ? args.device
+				       : "device:subsystem=pci,card=all") &&
+				       geteuid()) {
+		printf("\n" ANSI_HEADER "Run with root "
+		       "privileges for GPU client "
+		       "busyness.\n" ANSI_RESET "\n");
+		gputop_clean_up();
+		exit(1);
+	}
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
+					fprintf(stderr,
+						"\n"
+						"When running as a normal user, "
+						"CAP_PERFMON or perf_event_paranoid\n"
+						"is required to access performance "
+						"monitoring.\n"
+						"\n"
+						ANSI_HEADER "Through CAP_PERFMON "
+						"capability"
+						ANSI_RESET "\n"
+						"cd /path/to/igt-gpu-tools/\n"
+						"sudo setcap cap_perfmon=+ep $(pwd)/"
+						"build/tools/gputop/gputop\n"
+						"sudo sh -c \"echo $(pwd)/build/lib >"
+						" /etc/ld.so.conf.d/lib-igt.conf\"\n"
+						"sudo ldconfig\n"
+						ANSI_HEADER "Revert:" ANSI_RESET "\n"
+						"sudo setcap cap_perfmon=-ep $(pwd)/"
+						"build/tools/gputop/gputop\n"
+						"sudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
+						"sudo ldconfig\n"
+						"\n"
+						ANSI_HEADER "Through perf_event_paranoid"
+						" (system-wide policy)"
+						ANSI_RESET "\n"
+						"# Save current value\n"
+						"orig_val=$(sysctl -n "
+						"kernel.perf_event_paranoid)\n"
+						"# Allow non-root perf usage\n"
+						"sudo sysctl -w kernel.perf_event_paranoid=-1\n"
+						ANSI_HEADER "Revert:" ANSI_RESET "\n"
+						"sudo sysctl -w kernel."
+						"perf_event_paranoid=$orig_val\n"
+						"\n"
+						"For details, see 'Perf events and "
+						"tool security':\n"
+						"https://www.kernel.org/doc/html/"
+						"latest/admin-guide/perf-security.html\n");
+					igt_devices_free();
+					gputop_clean_up();
+					return EXIT_SUCCESS;
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
+			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
+	}
+
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
 		exit(1);
@@ -449,22 +627,47 @@ int main(int argc, char **argv)
 
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
+				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
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
+
+			if (is_root)
+				msg = " (No GPU clients yet. Start workload to see stats)";
+			else
+				msg = " (GPU client busyness is only available with root"
+				" privileges)";
 
 			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, i) {
+		igt_for_each_drm_client(clients, c, k) {
 			assert(c->status != IGT_DRM_CLIENT_PROBE);
 			if (c->status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
@@ -488,11 +691,11 @@ int main(int argc, char **argv)
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
index 8185ba160..99a732942 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -70,11 +70,6 @@ if libudev.found()
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
@@ -123,3 +118,4 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+subdir('gputop')
-- 
2.34.1

