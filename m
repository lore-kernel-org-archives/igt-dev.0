Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD36CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 13:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422C110E237;
	Wed, 24 Sep 2025 13:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwhh0ptl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F384D10E237
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758720657; x=1790256657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k5XPGVu2TmJ8Wf5dcusZag63xZQ6oedijPWtDJyjuGI=;
 b=dwhh0ptleAeB400ISVbJ9xwmFGLZmXqKOdhdmRq1lwAONE+mDzTKdNgK
 Nw7Yv0mYoBAJ8DqSSSWq3TsKs9lvfEiLDr8IwLk+I6EfTjWs7uz4slJ+1
 GF8dmCrmevwevA0F9VLeB/1bINumqFXUxrymOKM/GCk37bEb3kSM6uzf/
 /pUEcrwT1SMOZnomOmk/Sh3esHP+DxhJoPc3vPLrXitzbvVzPDGudflC+
 zzdZ4dHSmWxggwrPEN6iuUHs55Sde81G7Pwc20HGUzXj0QhYNKV+ph+do
 xeDbU1pqlsJm3Zp8XJkwW1zjR/RJKNIvAjlN4Ms7WnP/CNbrl04rVYkmg g==;
X-CSE-ConnectionGUID: jSpdDTs9TrqoSDIumEK89g==
X-CSE-MsgGUID: WR4SR9HNRKOt7pPx7e42tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="71638141"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="71638141"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:30:56 -0700
X-CSE-ConnectionGUID: 6akPr6UBRCqTeW1wK0hXtg==
X-CSE-MsgGUID: FUjdMG1YTjWixRt0/qlwrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177805766"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:30:54 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] Revert "tools/gputop/gputop: Enable support for
 multiple GPUs and instances"
Date: Wed, 24 Sep 2025 15:30:38 +0200
Message-ID: <20250924133038.45835-1-kamil.konieczny@linux.intel.com>
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

This reverts commit 08eb5310bd1d4c9bfee7e268e7e6242d3283b28e.

It introduced regression, it fails to run with non-root:

tursulin@x1:~$ ~/build/igt-gpu-tools/build/tools/gputop/gputop
(gputop:18642) xe/xe_query-CRITICAL: Test assertion failure function
xe_query_config_new, file ../lib/xe/xe_query.c:38:
(gputop:18642) xe/xe_query-CRITICAL: Failed assertion: igt_ioctl(fd,

11880 openat(AT_FDCWD, "/dev/dri/card0", O_RDWR) = -1 EACCES (Permission
denied)

and when run with root it prevents running kms test:

IGT-Version: 2.1-g3f9506ebd (x86_64) (Linux: 6.17.0-rc7+ x86_64)
Using IGT_SRANDOM=1758710179 for randomisation
Opened device: /dev/dri/card0
(kms_flip_tiling:18628) igt_debugfs-WARNING: clients:
              command  tgid dev master a   uid      magic
                                              name                   id
               gputop 18625   0   y    y     0          0
                                           <unset>                   95
      kms_flip_tiling 18628   0   n    y     0          0
                                           <unset>                   96
Test requirement not met in function igt_device_set_master, file
../lib/igt_device.c:65:
Test requirement: __igt_device_set_master(fd) == 0
Can't become DRM master, please check if no other DRM client is running.

I checked previous gputop and it works fine with i915,
current one fails:

kamil$ build/tools/gputop/gputop
No device found.

ls /dev/dri
by-path  card1  renderD128

Reported-by: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/{gputop => }/gputop.c | 236 ++++++------------------------------
 tools/gputop/meson.build    |   6 -
 tools/meson.build           |   6 +-
 3 files changed, 44 insertions(+), 204 deletions(-)
 rename tools/{gputop => }/gputop.c (65%)
 delete mode 100644 tools/gputop/meson.build

diff --git a/tools/gputop/gputop.c b/tools/gputop.c
similarity index 65%
rename from tools/gputop/gputop.c
rename to tools/gputop.c
index 3e1f3badc..f577a1750 100644
--- a/tools/gputop/gputop.c
+++ b/tools/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023-2025 Intel Corporation
+ * Copyright © 2023 Intel Corporation
  */
 
 #include <assert.h>
@@ -14,149 +14,66 @@
 #include <math.h>
 #include <poll.h>
 #include <signal.h>
-#include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
-#include <sys/sysmacros.h>
 #include <sys/types.h>
-#include <termios.h>
 #include <unistd.h>
+#include <termios.h>
+#include <sys/sysmacros.h>
+#include <stdbool.h>
 
-#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
-#include "igt_perf.h"
 #include "igt_profiling.h"
-#include "xe_gputop.h"
-#include "xe/xe_query.h"
-
-/**
- * Supported Drivers
- *
- * Adhere to the following requirements when implementing support for the
- * new driver:
- * @drivers: Update drivers[] with driver string.
- * @sizeof_gputop_obj: Update this function as per new driver support included.
- * @operations: Update the respective operations of the new driver:
- * gputop_init,
- * discover_engines,
- * pmu_init,
- * pmu_sample,
- * print_engines,
- * clean_up
- * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
- * initial values.
- */
-static const char * const drivers[] = {
-	"xe",
-    /* Keep the last one as NULL */
-	NULL
-};
-
-static size_t sizeof_gputop_obj(int driver_num)
-{
-	switch (driver_num) {
-	case 0:
-		return sizeof(struct xe_gputop);
-	default:
-		fprintf(stderr,
-			"Driver number does not exist.\n");
-		exit(EXIT_FAILURE);
-	}
-}
-
-/**
- * Supported operations on driver instances. Update the ops[] array for
- * each individual driver specific function. Maintain the sequence as per
- * drivers[] array.
- */
-struct device_operations ops[] = {
-	{
-		xe_gputop_init,
-		xe_populate_engines,
-		xe_pmu_init,
-		xe_pmu_sample,
-		xe_print_engines,
-		xe_clean_up
-	}
-};
-
-/*
- * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
- * and related info discovered per driver.
- */
-struct gputop_driver per_driver_contexts[] = {
-	{false, 0, NULL}
-};
+#include "drmtest.h"
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
-static void gputop_clean_up(void)
-{
-	for (int i = 0; drivers[i]; i++) {
-		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
-		free(per_driver_contexts[i].instances);
-		per_driver_contexts[i].device_present = false;
-		per_driver_contexts[i].len = 0;
-	}
-}
+static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
+
+#define ANSI_HEADER "\033[7m"
+#define ANSI_RESET "\033[0m"
 
-static int find_driver(struct igt_device_card *card)
+static void n_spaces(const unsigned int n)
 {
-	for (int i = 0; drivers[i]; i++) {
-		if (strcmp(drivers[i], card->driver) == 0)
-			return i;
-	}
-	return -1;
+	unsigned int i;
+
+	for (i = 0; i < n; i++)
+		putchar(' ');
 }
 
-static int populate_device_instances(const char *filter)
+static void print_percentage_bar(double percent, int max_len)
 {
-	struct igt_device_card *cards = NULL;
-	struct igt_device_card *card_inplace = NULL;
-	struct gputop_driver *driver_entry =  NULL;
-	int driver_no;
-	int count, final_count = 0;
-
-	count = igt_device_card_match_all(filter, &cards);
-	for (int j = 0; j < count; j++) {
-		if (strcmp(cards[j].subsystem, "pci") != 0)
-			continue;
+	int bar_len, i, len = max_len - 1;
+	const int w = 8;
 
-		driver_no = find_driver(&cards[j]);
-		if (driver_no < 0)
-			continue;
+	len -= printf("|%5.1f%% ", percent);
 
-		driver_entry = &per_driver_contexts[driver_no];
-		if (!driver_entry->device_present)
-			driver_entry->device_present = true;
-		driver_entry->len++;
-		driver_entry->instances = realloc(driver_entry->instances,
-						  driver_entry->len * sizeof_gputop_obj(driver_no));
-		if (!driver_entry->instances) {
-			fprintf(stderr,
-				"Device instance realloc failed (%s)\n",
-				strerror(errno));
-			exit(EXIT_FAILURE);
-		}
-		card_inplace = (struct igt_device_card *)
-				calloc(1, sizeof(struct igt_device_card));
-		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
-		ops[driver_no].gputop_init(driver_entry->instances, (driver_entry->len - 1),
-			card_inplace);
-		final_count++;
-	}
-	if (count)
-		free(cards);
-	return final_count;
+	/* no space left for bars, do what we can */
+	if (len < 0)
+		len = 0;
+
+	bar_len = ceil(w * percent * len / 100.0);
+	if (bar_len > w * len)
+		bar_len = w * len;
+
+	for (i = bar_len; i >= w; i -= w)
+		printf("%s", bars[w]);
+	if (i)
+		printf("%s", bars[i]);
+
+	len -= (bar_len + (w - 1)) / w;
+	n_spaces(len);
+
+	putchar('|');
 }
 
 static int
@@ -416,7 +333,6 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
-	char *device;
 };
 
 static void help(char *full_path)
@@ -434,18 +350,16 @@ static void help(char *full_path)
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
-	       "\t-D, --device              Device filter\n"
 	       , short_program_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = "hn:d:D:";
+	static const char cmdopts_s[] = "hn:d:";
 	static const struct option cmdopts[] = {
 	       {"help", no_argument, 0, 'h'},
 	       {"delay", required_argument, 0, 'd'},
 	       {"iterations", required_argument, 0, 'n'},
-	       {"device", required_argument, 0, 'D'},
 	       { }
 	};
 
@@ -453,7 +367,6 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
-	args->device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -477,9 +390,6 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
-		case 'D':
-			args->device = optarg;
-			break;
 		case 'h':
 			help(argv[0]);
 			return 0;
@@ -519,55 +429,6 @@ int main(int argc, char **argv)
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
-	if (!populate_device_instances(args.device ? args.device
-				       : "device:subsystem=pci,card=all")) {
-		printf("No device found.\n");
-		gputop_clean_up();
-		exit(1);
-	}
-
-	for (int i = 0; drivers[i]; i++) {
-		if (!per_driver_contexts[i].device_present)
-			continue;
-
-		for (int j = 0; j < per_driver_contexts[i].len; j++) {
-			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
-				fprintf(stderr,
-					"Failed to initialize engines! (%s)\n",
-					strerror(errno));
-					gputop_clean_up();
-				return EXIT_FAILURE;
-			}
-			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
-
-			if (ret) {
-				fprintf(stderr,
-					"Failed to initialize PMU! (%s)\n",
-					strerror(errno));
-				if (errno == EACCES && geteuid())
-					fprintf(stderr,
-						"\n"
-						"When running as a normal user CAP_PERFMON is required to access performance\n"
-						"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
-						"distribution vendor for assistance.\n"
-						"\n"
-						"More information can be found at 'Perf events and tool security' document:\n"
-						"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
-
-				igt_devices_free();
-				gputop_clean_up();
-				return EXIT_FAILURE;
-			}
-		}
-	}
-
-	for (int i = 0; drivers[i]; i++) {
-		for (int j = 0;
-		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
-		     j++)
-			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
-	}
-
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
 		exit(1);
@@ -588,33 +449,14 @@ int main(int argc, char **argv)
 
 	while ((n != 0) && !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
-		int k, engine_w = 0, lines = 0;
+		int i, engine_w = 0, lines = 0;
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
-
-		for (int i = 0; drivers[i]; i++) {
-			for (int j = 0;
-			     per_driver_contexts[i].device_present &&
-			     j < per_driver_contexts[i].len;
-			     j++)
-				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
-		}
-
 		igt_drm_clients_sort(clients, client_cmp);
 
 		update_console_size(&con_w, &con_h);
 		clrscr();
 
-		for (int i = 0; drivers[i]; i++) {
-			for (int j = 0;
-			     per_driver_contexts[i].device_present &&
-			     j < per_driver_contexts[i].len;
-			     j++) {
-				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
-							 lines, con_w, con_h);
-			}
-		}
-
 		if (!clients->num_clients) {
 			const char *msg = " (No GPU clients yet. Start workload to see stats)";
 
@@ -622,7 +464,7 @@ int main(int argc, char **argv)
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, k) {
+		igt_for_each_drm_client(clients, c, i) {
 			assert(c->status != IGT_DRM_CLIENT_PROBE);
 			if (c->status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
@@ -646,11 +488,11 @@ int main(int argc, char **argv)
 	}
 
 	igt_drm_clients_free(clients);
-	gputop_clean_up();
 
 	if (profiled_devices != NULL) {
 		igt_devices_configure_profiling(profiled_devices, false);
 		igt_devices_free_profiling(profiled_devices);
 	}
+
 	return 0;
 }
diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
deleted file mode 100644
index f82962834..000000000
--- a/tools/gputop/meson.build
+++ /dev/null
@@ -1,6 +0,0 @@
-gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
-executable('gputop',
-	   sources : gputop_src,
-           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
-           install : true,
-           install_rpath : bindir_rpathdir)
diff --git a/tools/meson.build b/tools/meson.build
index 99a732942..8185ba160 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -70,6 +70,11 @@ if libudev.found()
 		   install : true)
 endif
 
+executable('gputop', 'gputop.c',
+           install : true,
+           install_rpath : bindir_rpathdir,
+           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
+
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
 	   dependencies : tool_deps,
@@ -118,4 +123,3 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
-subdir('gputop')
-- 
2.51.0

