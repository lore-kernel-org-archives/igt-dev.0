Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7197DC61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 08:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AABD10E8FA;
	Fri, 13 Jun 2025 08:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWxzhGq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791F610E8FA
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749801776; x=1781337776;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3f1r/ADOOGri/+20KsNeBanx48TGPg1a1cE+wn4Zb88=;
 b=HWxzhGq/d1vKCGvO98y/4fmknEF9xIMJEu7C7nLNvpHEXDKwd9eaQhFf
 NlLSo6bg4UxMI1dTSJjbrtlGscBByTcBvIIfDLorsymdQY3kldmdCi/dI
 DoCmDOxikig94JRqonyC6HJEl1kyuhp/7LGuZWwanc2VbWzjXNPku+rf8
 gb1n5O7VwUn2MiA8P0SjKnTCkYxZPYThVlNK6Y7mOjgcZzGKBI60MqFA0
 5BCbWBIVO684cDIqeMK4Plf8q3A68Mpw91wZ5D5/ZtEWYMC4wE2C95m6T
 CrpjwAXiKfmvx5uOSuXwlXJjDh+ggT0EKoGVMiyad+j1Zr5jlAOzJBYea A==;
X-CSE-ConnectionGUID: AFXZggx0TXGDrOwNxaC0Vg==
X-CSE-MsgGUID: mz7o3p3/SyKZJyTactyW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51726109"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="51726109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:02:56 -0700
X-CSE-ConnectionGUID: +8QTpcqSSpqTXRvUV46n3Q==
X-CSE-MsgGUID: vF0dTsKrTYynZe6tLTsKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="178659711"
Received: from unknown (HELO DUT2943PVC.iind.intel.com) ([10.190.215.47])
 by orviesa002.jf.intel.com with ESMTP; 13 Jun 2025 01:02:54 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 1/2] tools/gputop/gputop: Add per-device engine activity
 stats in GPUTOP
Date: Fri, 13 Jun 2025 08:02:50 +0000
Message-ID: <20250613080251.570961-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613080251.570961-1-nishit.sharma@intel.com>
References: <20250613080251.570961-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Soham Purkait <Soham Purkait soham.purkait@intel.com>

This patch adds per-device engine activity stat support in GPUTOP. This leverages the PMU
interface to display the activity of engine instances for the array of requested or all
devices.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_device_scan.c    | 128 ++++++++
 lib/igt_device_scan.h    |   1 +
 tools/gputop/gputop.c    | 638 +++++++++++++++++++++++++++++++++++++++
 tools/gputop/meson.build |   6 +
 tools/gputop/utils.c     |  51 ++++
 tools/gputop/utils.h     |  64 ++++
 tools/gputop/xe_gputop.c | 378 +++++++++++++++++++++++
 tools/gputop/xe_gputop.h |  62 ++++
 tools/meson.build        |   6 +-
 9 files changed, 1329 insertions(+), 5 deletions(-)
 create mode 100644 tools/gputop/gputop.c
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index e1cebfaed..0ab7b7a0a 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1436,6 +1436,7 @@ struct filter {
 		char *driver;
 		char *pf;
 		char *vf;
+		char *subsystem;
 	} data;
 };
 
@@ -1455,6 +1456,7 @@ static void fill_filter_data(struct filter *filter, const char *key, const char
 	__fill_key(driver);
 	__fill_key(pf);
 	__fill_key(vf);
+	__fill_key(subsystem);
 #undef __fill_key
 
 }
@@ -1711,6 +1713,77 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
 	return &igt_devs.filtered;
 }
 
+/*
+ * Find appropriate gpu device through matching driver, device type and
+ * card filter arguments.
+ */
+static struct igt_list_head *filter_device(const struct filter_class *fcls,
+					   const struct filter *filter)
+{
+	struct igt_device *dev;
+	bool allcards = false;
+	int card = 0;
+	(void)fcls;
+
+	DBG("filter device\n");
+	if (filter->data.card) {
+		char crdop[5] = {0};
+
+		if (sscanf(filter->data.card, "%d", &card) == 1) {
+			if (card < 0)
+				return &igt_devs.filtered;
+		} else {
+			card = 0;
+			if (sscanf(filter->data.card, "%4s", crdop) == 1) {
+				if (!strcmp(crdop, "all"))
+					allcards = true;
+				else
+					return &igt_devs.filtered;
+			} else {
+				return &igt_devs.filtered;
+			}
+		}
+	} else {
+		card = 0;
+	}
+
+	igt_list_for_each_entry(dev, &igt_devs.all, link) {
+		/* Skip if 'driver' doesn't match */
+		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
+			continue;
+
+		/* Skip if 'device' doesn't match */
+		if (filter->data.device && !is_device_matched(dev, filter->data.device))
+			continue;
+
+		/* Skip if 'subsystem' doesn't match */
+		if (filter->data.subsystem && strcmp(filter->data.subsystem, "all")) {
+			if (strcmp(filter->data.subsystem, get_prop_subsystem(dev)))
+				continue;
+		}
+
+		/* We get n-th card */
+		if (!allcards && !card) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add_tail(&dup->link, &igt_devs.filtered);
+			break;
+		} else if (!allcards) {
+			card--;
+		}
+		/* Include all the cards */
+		else if (allcards) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add(&dup->link, &igt_devs.filtered);
+		}
+	}
+
+	DBG("Filter device filtered size: %d\n", igt_list_length(&igt_devs.filtered));
+
+	return &igt_devs.filtered;
+}
+
 static bool sys_path_valid(const struct filter_class *fcls,
 			   const struct filter *filter)
 {
@@ -1752,6 +1825,13 @@ static struct filter_class filter_definition_list[] = {
 		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
 		.detail = "find pf or vf\n",
 	},
+	{
+		.name = "device",
+		.filter_function = filter_device,
+		.help =
+		"device:[driver=name][,subsystem=all|<subsystem>][,device=type][,card=%d|all]",
+		.detail = "find device by driver name, subsystem, device type and card number\n",
+	},
 	{
 		.name = NULL,
 	},
@@ -2065,6 +2145,54 @@ bool igt_device_card_match_pci(const char *filter,
        return __igt_device_card_match(filter, card, true);
 }
 
+/**
+ * igt_device_card_match_all
+ * @filter: filter string.
+ * @card: double pointer to igt_device_card structure, containing
+ * an array of igt_device_card structures upon successful return.
+ *
+ * Function applies filter to match device from device array.
+ *
+ * Returns: the number of cards found.
+ *
+ * Note: The caller is responsible for freeing the memory which is
+ * dynamically allocated for the array of igt_device_card structures
+ * upon successful return.
+ */
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card)
+{
+	struct igt_device *dev = NULL;
+	struct igt_device_card *crd = NULL;
+	int count = 0;
+
+	igt_devices_scan();
+
+	if (igt_device_filter_apply(filter) == false)
+		return 0;
+
+	if (igt_list_empty(&igt_devs.filtered))
+		return 0;
+
+	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
+		count++;
+	}
+
+	crd = calloc(count, sizeof(struct igt_device_card));
+	if (!crd)
+		return 0;
+
+	count = 0;
+
+	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
+		__copy_dev_to_card(dev, crd + count++);
+	}
+
+	if (count)
+		*card = crd;
+
+	return count;
+}
+
 /**
  * igt_device_get_pretty_name
  * @card: pointer to igt_device_card struct
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index f1cd3b1e9..e6e31e799 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -89,6 +89,7 @@ int igt_device_filter_pci(void);
 bool igt_device_card_match(const char *filter, struct igt_device_card *card);
 bool igt_device_card_match_pci(const char *filter,
 	struct igt_device_card *card);
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card);
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
 bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
diff --git a/tools/gputop/gputop.c b/tools/gputop/gputop.c
new file mode 100644
index 000000000..678ae7935
--- /dev/null
+++ b/tools/gputop/gputop.c
@@ -0,0 +1,638 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#include <assert.h>
+#include <ctype.h>
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <limits.h>
+#include <locale.h>
+#include <math.h>
+#include <poll.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/sysmacros.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <termios.h>
+#include <unistd.h>
+
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_drm_clients.h"
+#include "igt_drm_fdinfo.h"
+#include "igt_perf.h"
+#include "igt_profiling.h"
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
+ * @devices: Update devices[] array of type "struct gputop_device" with the
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
+ * Supported operations on driver instances. Update the oprs[] array for
+ * each individual driver specific function. Maintain the sequence as per
+ * drivers[] array.
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
+ * devices[] array of type struct gputop_device
+ */
+struct gputop_device devices[] = {
+	{false, 0, NULL}
+};
+
+enum utilization_type {
+	UTILIZATION_TYPE_ENGINE_TIME,
+	UTILIZATION_TYPE_TOTAL_CYCLES,
+};
+
+static void gputop_clean_up(void)
+{
+	for (int i = 0; drivers[i]; i++) {
+		oprs[i].clean_up(devices[i].instances, devices[i].len);
+		free(devices[i].instances);
+		devices[i].driver_present = false;
+		devices[i].len = 0;
+	}
+}
+
+static int find_driver(struct igt_device_card *card)
+{
+	for (int i = 0; drivers[i]; i++) {
+		if (strcmp(drivers[i], card->driver) == 0)
+			return i;
+	}
+	return -1;
+}
+
+/*
+ * If filter is not NULL i will be ignored.
+ */
+static int populate_device_instances(const char *filter)
+{
+	struct igt_device_card *cards = NULL;
+	struct igt_device_card *card_inplace = NULL;
+	struct gputop_device *dev =  NULL;
+	int driver_no;
+	int count, final_count = 0;
+
+	count = igt_device_card_match_all(filter, &cards);
+	for (int j = 0; j < count; j++) {
+		if (strcmp((cards + j)->subsystem, "pci") != 0)
+			continue;
+
+		driver_no = find_driver(cards + j);
+		if (driver_no < 0)
+			continue;
+
+		dev = devices + driver_no;
+		if (!dev->driver_present)
+			dev->driver_present = true;
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
+		oprs[driver_no].gputop_init((struct xe_gputop *)(dev->instances + dev->len - 1),
+			card_inplace);
+		final_count++;
+	}
+	if (count)
+		free(cards);
+	return final_count;
+}
+
+static int
+print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
+		    int *engine_w)
+{
+	int ret, len;
+
+	if (lines++ >= con_h)
+		return lines;
+
+	printf(ANSI_HEADER);
+	ret = printf("DRM minor %u", c->drm_minor);
+	n_spaces(con_w - ret);
+
+	if (lines++ >= con_h)
+		return lines;
+
+	putchar('\n');
+	if (c->regions->num_regions)
+		len = printf("%*s      MEM      RSS ",
+			     c->clients->max_pid_len, "PID");
+	else
+		len = printf("%*s ", c->clients->max_pid_len, "PID");
+
+	if (c->engines->num_engines) {
+		unsigned int i;
+		int width;
+
+		*engine_w = width =
+			(con_w - len - c->clients->max_name_len - 1) /
+			c->engines->num_engines;
+
+		for (i = 0; i <= c->engines->max_engine_id; i++) {
+			const char *name = c->engines->names[i];
+			int name_len = strlen(name);
+			int pad = (width - name_len) / 2;
+			int spaces = width - pad - name_len;
+
+			if (!name)
+				continue;
+
+			if (pad < 0 || spaces < 0)
+				continue;
+
+			n_spaces(pad);
+			printf("%s", name);
+			n_spaces(spaces);
+			len += pad + name_len + spaces;
+		}
+	}
+
+	printf(" %-*s" ANSI_RESET "\n", con_w - len - 1, "NAME");
+
+	return lines;
+}
+
+static bool
+engines_identical(const struct igt_drm_client *c,
+		  const struct igt_drm_client *pc)
+{
+	unsigned int i;
+
+	if (c->engines->num_engines != pc->engines->num_engines ||
+	    c->engines->max_engine_id != pc->engines->max_engine_id)
+		return false;
+
+	for (i = 0; i <= c->engines->max_engine_id; i++)
+		if (c->engines->capacity[i] != pc->engines->capacity[i] ||
+		    !!c->engines->names[i] != !!pc->engines->names[i] ||
+		    strcmp(c->engines->names[i], pc->engines->names[i]))
+			return false;
+
+	return true;
+}
+
+static bool
+newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
+{
+	return !pc || c->drm_minor != pc->drm_minor ||
+	       /*
+		* Below is a a hack for drivers like amdgpu which omit listing
+		* unused engines. Simply treat them as separate minors which
+		* will ensure the per-engine columns are correctly sized in all
+		* cases.
+		*/
+	       !engines_identical(c, pc);
+}
+
+static int
+print_size(uint64_t sz)
+{
+	char units[] = {'B', 'K', 'M', 'G'};
+	unsigned int u;
+
+	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
+		if (sz < 1024)
+			break;
+		sz /= 1024;
+	}
+
+	return printf("%7"PRIu64"%c ", sz, units[u]);
+}
+
+static int
+print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
+	     double t, int lines, int con_w, int con_h,
+	     unsigned int period_us, int *engine_w)
+{
+	enum utilization_type utilization_type;
+	unsigned int i;
+	uint64_t sz;
+	int len;
+
+	if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES &&
+	    c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES)
+		utilization_type = UTILIZATION_TYPE_TOTAL_CYCLES;
+	else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME)
+		utilization_type = UTILIZATION_TYPE_ENGINE_TIME;
+	else
+		return 0;
+
+	if (c->samples < 2)
+		return 0;
+
+	/* Filter out idle clients. */
+	switch (utilization_type) {
+	case UTILIZATION_TYPE_ENGINE_TIME:
+	       if (!c->total_engine_time)
+		       return 0;
+	       break;
+	case UTILIZATION_TYPE_TOTAL_CYCLES:
+	       if (!c->total_total_cycles)
+		       return 0;
+	       break;
+	}
+
+	/* Print header when moving to a different DRM card. */
+	if (newheader(c, *prevc)) {
+		lines = print_client_header(c, lines, con_w, con_h, engine_w);
+		if (lines >= con_h)
+			return lines;
+	}
+
+	*prevc = c;
+
+	len = printf("%*s ", c->clients->max_pid_len, c->pid_str);
+
+	if (c->regions->num_regions) {
+		for (sz = 0, i = 0; i <= c->regions->max_region_id; i++)
+			sz += c->memory[i].total;
+		len += print_size(sz);
+
+		for (sz = 0, i = 0; i <= c->regions->max_region_id; i++)
+			sz += c->memory[i].resident;
+		len += print_size(sz);
+	}
+
+	lines++;
+
+	for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {
+		double pct;
+
+		if (!c->engines->capacity[i])
+			continue;
+
+		switch (utilization_type) {
+		case UTILIZATION_TYPE_ENGINE_TIME:
+			pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100 /
+				c->engines->capacity[i];
+			break;
+		case UTILIZATION_TYPE_TOTAL_CYCLES:
+			pct = (double)c->utilization[i].delta_cycles / c->utilization[i].delta_total_cycles * 100 /
+				c->engines->capacity[i];
+			break;
+		}
+
+		/*
+		 * Guard against fluctuations between our scanning period and
+		 * GPU times as exported by the kernel in fdinfo.
+		 */
+		if (pct > 100.0)
+			pct = 100.0;
+
+		print_percentage_bar(pct, *engine_w);
+		len += *engine_w;
+	}
+
+	printf(" %-*s\n", con_w - len - 1, c->print_name);
+
+	return lines;
+}
+
+static int
+__client_id_cmp(const struct igt_drm_client *a,
+		const struct igt_drm_client *b)
+{
+	if (a->id > b->id)
+		return 1;
+	else if (a->id < b->id)
+		return -1;
+	else
+		return 0;
+}
+
+static int client_cmp(const void *_a, const void *_b, void *unused)
+{
+	const struct igt_drm_client *a = _a;
+	const struct igt_drm_client *b = _b;
+	long val_a, val_b;
+
+	/* DRM cards into consecutive buckets first. */
+	val_a = a->drm_minor;
+	val_b = b->drm_minor;
+	if (val_a > val_b)
+		return 1;
+	else if (val_b > val_a)
+		return -1;
+
+	/*
+	 * Within buckets sort by last sampling period aggregated runtime, with
+	 * client id as a tie-breaker.
+	 */
+	val_a = a->agg_delta_engine_time;
+	val_b = b->agg_delta_engine_time;
+	if (val_a == val_b)
+		return __client_id_cmp(a, b);
+	else if (val_b > val_a)
+		return 1;
+	else
+		return -1;
+
+}
+
+static void update_console_size(int *w, int *h)
+{
+	struct winsize ws = {};
+
+	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
+		return;
+
+	*w = ws.ws_col;
+	*h = ws.ws_row;
+
+	if (*w == 0 && *h == 0) {
+		/* Serial console. */
+		*w = 80;
+		*h = 24;
+	}
+}
+
+static void clrscr(void)
+{
+	printf("\033[H\033[J");
+}
+
+struct gputop_args {
+	long n_iter;
+	unsigned long delay_usec;
+	char *device;
+};
+
+static void help(char *full_path)
+{
+	const char *short_program_name = strrchr(full_path, '/');
+
+	if (short_program_name)
+		short_program_name++;
+	else
+		short_program_name = full_path;
+
+	printf("Usage:\n"
+	       "\t%s [options]\n\n"
+	       "Options:\n"
+	       "\t-h, --help                show this help\n"
+	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
+	       "\t-n, --iterations =NUMBER  number of executions\n"
+	       , short_program_name);
+}
+
+static int parse_args(int argc, char * const argv[], struct gputop_args *args)
+{
+	static const char cmdopts_s[] = "hn:d:";
+	static const struct option cmdopts[] = {
+	       {"help", no_argument, 0, 'h'},
+	       {"delay", required_argument, 0, 'd'},
+	       {"iterations", required_argument, 0, 'n'},
+	       { }
+	};
+
+	/* defaults */
+	memset(args, 0, sizeof(*args));
+	args->n_iter = -1;
+	args->delay_usec = 2 * USEC_PER_SEC;
+	args->device = NULL;
+
+	for (;;) {
+		int c, idx = 0;
+		char *end_ptr = NULL;
+
+		c = getopt_long(argc, argv, cmdopts_s, cmdopts, &idx);
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 'n':
+			args->n_iter = strtol(optarg, NULL, 10);
+			break;
+		case 'd':
+			args->delay_usec = strtoul(optarg, &end_ptr, 10) * USEC_PER_SEC;
+			if (*end_ptr == '.')
+				args->delay_usec += strtoul(end_ptr + 1, &end_ptr, 10) * USEC_PER_DECISEC;
+
+			if (!args->delay_usec) {
+				fprintf(stderr, "Invalid delay value: %s\n", optarg);
+				return -1;
+			}
+			break;
+		case 'h':
+			help(argv[0]);
+			return 0;
+		default:
+			fprintf(stderr, "Unkonwn option '%c'.\n", c);
+			return -1;
+		}
+	}
+
+	return 1;
+}
+
+static volatile bool stop_top;
+
+static void sigint_handler(int sig)
+{
+	(void) sig;
+	stop_top = true;
+}
+
+int main(int argc, char **argv)
+{
+	struct gputop_args args;
+	unsigned int period_us;
+	struct igt_profiled_device *profiled_devices = NULL;
+	struct igt_drm_clients *clients = NULL;
+	int con_w = -1, con_h = -1;
+	int ret;
+	long n;
+
+	ret = parse_args(argc, argv, &args);
+	if (ret < 0)
+		return EXIT_FAILURE;
+	if (!ret)
+		return EXIT_SUCCESS;
+
+	n = args.n_iter;
+	period_us = args.delay_usec;
+
+	if (!populate_device_instances(args.device ? args.device
+				       : "device:subsystem=pci,card=all")) {
+		printf("No device found.\n");
+		gputop_clean_up();
+		exit(1);
+	}
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
+	clients = igt_drm_clients_init(NULL);
+	if (!clients)
+		exit(1);
+
+	profiled_devices = igt_devices_profiled();
+	if (profiled_devices != NULL) {
+		igt_devices_configure_profiling(profiled_devices, true);
+
+		if (signal(SIGINT, sigint_handler) == SIG_ERR) {
+			fprintf(stderr, "Failed to install signal handler!\n");
+			igt_devices_configure_profiling(profiled_devices, false);
+			igt_devices_free_profiling(profiled_devices);
+			profiled_devices = NULL;
+		}
+	}
+
+	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+	while ((n != 0) && !stop_top) {
+		struct igt_drm_client *c, *prevc = NULL;
+		int k, engine_w = 0, lines = 0;
+
+		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
+				oprs[i].pmu_sample(devices[i].instances + j);
+		}
+
+		igt_drm_clients_sort(clients, client_cmp);
+
+		update_console_size(&con_w, &con_h);
+		clrscr();
+
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++) {
+				lines = oprs[i].print_engines(devices[i].instances + j,
+							 lines, con_w, con_h);
+			}
+		}
+
+		if (!clients->num_clients) {
+			const char *msg = " (No GPU clients yet. Start workload to see stats)";
+
+			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
+			       (int)(con_w - strlen(msg) - 1), msg);
+		}
+
+		igt_for_each_drm_client(clients, c, k) {
+			assert(c->status != IGT_DRM_CLIENT_PROBE);
+			if (c->status != IGT_DRM_CLIENT_ALIVE)
+				break; /* Active clients are first in the array. */
+
+			lines = print_client(c, &prevc, (double)period_us / 1e6,
+					     lines, con_w, con_h, period_us,
+					     &engine_w);
+			if (lines >= con_h)
+				break;
+		}
+
+		if (lines++ < con_h)
+			printf("\n");
+
+		usleep(period_us);
+		if (n > 0)
+			n--;
+
+		if (profiled_devices != NULL)
+			igt_devices_update_original_profiling_state(profiled_devices);
+	}
+
+	igt_drm_clients_free(clients);
+	gputop_clean_up();
+
+	if (profiled_devices != NULL) {
+		igt_devices_configure_profiling(profiled_devices, false);
+		igt_devices_free_profiling(profiled_devices);
+	}
+	return 0;
+}
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
diff --git a/tools/gputop/utils.c b/tools/gputop/utils.c
new file mode 100644
index 000000000..7f260dc05
--- /dev/null
+++ b/tools/gputop/utils.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <assert.h>
+
+#include "utils.h"
+
+static const char * const bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
+
+void n_spaces(const unsigned int n)
+{
+	unsigned int i;
+
+	for (i = 0; i < n; i++)
+		putchar(' ');
+}
+
+void print_percentage_bar(double percent, int max_len)
+{
+	int bar_len, i, len = max_len - 1;
+	const int w = PERCLIENT_ENGINE_WIDTH;
+
+	len -= printf("|%5.1f%% ", percent);
+
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
+}
+
+int print_engines_footer(int lines, int con_w, int con_h)
+{
+	if (lines++ < con_h)
+		printf("\n");
+
+	return lines;
+}
diff --git a/tools/gputop/utils.h b/tools/gputop/utils.h
new file mode 100644
index 000000000..3c62f1c47
--- /dev/null
+++ b/tools/gputop/utils.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef COMMON_GPUTOP_H
+#define COMMON_GPUTOP_H
+
+#include <glib.h>
+#include <math.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "igt_device_scan.h"
+
+#define ANSI_HEADER "\033[7m"
+#define ANSI_RESET "\033[0m"
+
+#define PERCLIENT_ENGINE_WIDTH 8
+
+/**
+ * struct gputop_device
+ *
+ * @driver_present: It is set if at least a
+ * single device of the respective driver is
+ * found
+ * @len: Number of total device discovered
+ * of the respective driver
+ * @instances: pointer to the array of
+ * discovered instances of the devices
+ * of the same driver
+ */
+struct gputop_device {
+	bool driver_present;
+	int len;
+	void *instances;
+};
+
+/**
+ * struct device_operations - Structure to hold function
+ * pointers for device specific operations for each individual driver.
+ * @gputop_init: Function to initialize GPUTOP object
+ * @init_engines: Function to initialize engines for the respective driver.
+ * @pmu_init: Function to initialize the PMU (Performance Monitoring Unit).
+ * @pmu_sample: Function to sample PMU data.
+ * @print_engines: Function to print engine business.
+ * @clean_up: Function to release resources.
+ */
+struct device_operations {
+	void (*gputop_init)(void *ptr,
+			    struct igt_device_card *card);
+	void *(*init_engines)(const void *obj);
+	int (*pmu_init)(const void *obj);
+	void (*pmu_sample)(const void *obj);
+	int (*print_engines)(const void *obj, int lines, int w, int h);
+	void (*clean_up)(void *obj, int len);
+};
+
+void print_percentage_bar(double percent, int max_len);
+int print_engines_footer(int lines, int con_w, int con_h);
+void n_spaces(const unsigned int n);
+
+#endif  /* COMMON_GPUTOP_H */
diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
new file mode 100644
index 000000000..ac3ed76e6
--- /dev/null
+++ b/tools/gputop/xe_gputop.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_gputop.h"
+
+#define engine_ptr(engines, n) (&(engines)->engine + (n))
+
+static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
+{
+	counter->val.prev = counter->val.cur;
+	counter->val.cur = val;
+}
+
+static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
+{
+	if (counter->present)
+		__update_sample(counter, val[counter->idx]);
+}
+
+static const char *class_display_name(unsigned int class)
+{
+	switch (class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "Render/3D";
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return "Blitter";
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "Video";
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "VideoEnhance";
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "Compute";
+	default:
+		return "[unknown]";
+	}
+}
+
+void xe_clean_up(void *obj, int len)
+{
+	struct xe_engine *eng;
+	struct xe_pmu_counter pmu;
+	struct xe_gputop *dev = (struct xe_gputop *)obj;	
+
+	for (int i = 0; i < len; i++) {
+		if ((dev + i)->card)
+			free((dev + i)->card);
+		if ((dev + i)->eng_obj) {
+
+			for(int j = 0; j < ((struct xe_pmu_device*)(dev + i)->eng_obj)->num_engines ; j++) {
+				eng = engine_ptr((struct xe_pmu_device*)(dev + i)->eng_obj, j);
+				if (eng->display_name)
+					free(eng->display_name);
+
+				pmu = eng->engine_active_ticks;
+				if (pmu.present)
+					close(pmu.fd);
+
+				pmu = eng->engine_total_ticks;
+				if (pmu.present)
+					close(pmu.fd);
+			}
+			free(dev->eng_obj);
+		}			
+		if ((dev + i)->pmu_device)
+			free(dev->pmu_device);
+	}
+}
+
+static char *pmu_name(struct igt_device_card *card)
+{
+	int card_fd;
+	char device[30];
+	char *path;
+
+	if (strlen(card->card))
+		card_fd = igt_open_card(card);
+	else if (strlen(card->render))
+		card_fd = igt_open_render(card);
+
+	if (card_fd == -1)
+		return NULL;
+
+	xe_perf_device(card_fd, device, sizeof(device));
+	path = strdup(device);
+	close(card_fd);
+	return path;
+}
+
+static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
+{
+	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
+
+	if (fd__ >= 0) {
+		if (*fd == -1)
+			*fd = fd__;
+		pmu->present = true;
+		pmu->idx = (*cnt)++;
+		pmu->fd = fd__;
+	}
+
+	return fd__;
+}
+
+void xe_gputop_init(void *ptr,
+		    struct igt_device_card *card)
+{
+	struct xe_gputop *obj = (struct xe_gputop *)ptr;
+
+	obj->pmu_device = pmu_name(card);
+	if (!obj->pmu_device) {
+		fprintf(stderr, "%s : pmu_device path returned NULL", card->pci_slot_name);
+		exit(EXIT_FAILURE);
+	}
+	obj->card = card;
+}
+
+static int pmu_format_shift(int xe, const char *name)
+{
+	uint32_t start;
+	int format;
+	char device[80];
+
+	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
+				   name, &start);
+	if (format)
+		return 0;
+
+	return start;
+}
+
+static int engine_cmp(const void *__a, const void *__b)
+{
+	const struct xe_engine *a = (struct xe_engine *)__a;
+	const struct xe_engine *b = (struct xe_engine *)__b;
+
+	if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
+		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
+	else
+		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
+}
+
+void *xe_populate_engines(const void *obj)
+{
+	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
+	struct xe_pmu_device *engines;
+	int ret = 0;
+	char device[30];
+	struct drm_xe_engine_class_instance *hwe;
+	int card_fd;
+	uint64_t engine_class, engine_instance, gt_shift;
+	uint64_t engine_active_config, engine_total_config;
+
+	if (!card || !strlen(card->card) || !strlen(card->render))
+		return NULL;
+
+	if (strlen(card->card)) {
+		card_fd = igt_open_card(card);
+	} else if (strlen(card->render)) {
+		card_fd = igt_open_render(card);
+	} else {
+		fprintf(stderr, "Failed to detect device!\n");
+		return NULL;
+	}
+	xe_device_get(card_fd);
+	engines = malloc(sizeof(struct xe_pmu_device) +
+			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
+	if (!engines)
+		return NULL;
+
+	memset(engines, 0, sizeof(struct xe_pmu_device) +
+	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
+
+	engines->num_engines = 0;
+	engines->device = ((struct xe_gputop *)obj)->pmu_device;
+	gt_shift = pmu_format_shift(card_fd, "gt");
+	engine_class = pmu_format_shift(card_fd, "engine_class");
+	engine_instance = pmu_format_shift(card_fd, "engine_instance");
+	xe_perf_device(card_fd, device, sizeof(device));
+	ret = perf_event_config(device,
+				"engine-active-ticks",
+				&engine_active_config);
+	if (ret < 0)
+		return NULL;
+	ret = perf_event_config(device,
+				"engine-total-ticks",
+				&engine_total_config);
+	if (ret < 0)
+		return NULL;
+	xe_for_each_engine(card_fd, hwe) {
+		uint64_t  param_config;
+		struct xe_engine *engine;
+
+		engine = engine_ptr(engines, engines->num_engines);
+		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
+			| hwe->engine_instance << engine_instance;
+		engine->drm_xe_engine = *hwe;
+		engine->engine_active_ticks.config = engine_active_config | param_config;
+		engine->engine_total_ticks.config = engine_total_config | param_config;
+
+		if (engine->engine_active_ticks.config == -1 ||
+		    engine->engine_total_ticks.config == -1) {
+			ret = ENOENT;
+			break;
+		}
+
+		ret = asprintf(&engine->display_name, "%s/%u",
+			       class_display_name(engine->drm_xe_engine.engine_class),
+			       engine->drm_xe_engine.engine_instance);
+
+		if (ret <= 0) {
+			ret = errno;
+			break;
+		}
+
+		engines->num_engines++;
+	}
+
+	if (!ret) {
+		errno = ret;
+		return NULL;
+	}
+
+	qsort(engine_ptr(engines, 0), engines->num_engines,
+	      sizeof(struct xe_engine), engine_cmp);
+
+	((struct xe_gputop *)obj)->eng_obj = engines;
+
+	return engines;
+}
+
+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+{
+	uint64_t buf[2 + num];
+	unsigned int i;
+	ssize_t len;
+
+	memset(buf, 0, sizeof(buf));
+
+	len = read(fd, buf, sizeof(buf));
+	assert(len == sizeof(buf));
+
+	for (i = 0; i < num; i++)
+		val[i] = buf[2 + i];
+
+	return buf[1];
+}
+
+void xe_pmu_sample(const void *obj)
+{
+	struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
+	const int num_val = engines->num_counters;
+	uint64_t val[2 + num_val];
+	unsigned int i;
+
+	pmu_read_multi(engines->fd, num_val, val);
+
+	for (i = 0; i < engines->num_engines; i++) {
+		struct xe_engine *engine = engine_ptr(engines, i);
+
+		update_sample(&engine->engine_active_ticks, val);
+		update_sample(&engine->engine_total_ticks, val);
+	}
+}
+
+int xe_pmu_init(const void *obj)
+{
+	struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
+	unsigned int i;
+	int fd;
+	struct xe_engine *engine;
+	uint64_t type = igt_perf_type_id(engines->device);
+
+	engines->fd = -1;
+	engines->num_counters = 0;
+
+	for (i = 0; i < engines->num_engines; i++) {
+		engine = engine_ptr(engines, i);
+		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
+			       &engines->fd);
+		if (fd < 0)
+			return -1;
+		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
+			       &engines->fd);
+		if (fd < 0)
+			return -1;
+	}
+	return 0;
+}
+
+static double pmu_active_percentage(struct xe_engine *engine)
+{
+	double pmu_active_ticks = engine->engine_active_ticks.val.cur -
+				  engine->engine_active_ticks.val.prev;
+	double pmu_total_ticks = engine->engine_total_ticks.val.cur -
+				 engine->engine_total_ticks.val.prev;
+	double percentage;
+
+	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
+	return percentage;
+}
+
+static int
+print_device_description(const void *obj, int lines, int w, int h)
+{
+	char *desc;
+	int len;
+
+	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
+		       ((struct xe_gputop *)obj)->card->driver,
+		       ((struct xe_gputop *)obj)->card->pci_slot_name);
+
+	printf("\033[7m%s%*s\033[0m\n",
+	       desc,
+	       (int)(w - len), " ");
+	lines++;
+	free(desc);
+	return lines;
+}
+
+static int
+print_engines_header(struct xe_pmu_device *engines,
+		     int lines, int con_w, int con_h)
+{
+	const char *a;
+
+	for (unsigned int i = 0;
+	     i < engines->num_engines && lines < con_h;
+	     i++) {
+		struct xe_engine *engine = engine_ptr(engines, i);
+
+		if (!engine->num_counters)
+			continue;
+
+		a = "            ENGINES   ACTIVITY  ";
+
+		printf("\033[7m%s%*s\033[0m\n",
+		       a,
+		       (int)(con_w - strlen(a)), " ");
+		lines++;
+
+		break;
+	}
+
+	return lines;
+}
+
+static int
+print_engine(struct xe_pmu_device *engines, unsigned int i,
+	     int lines, int con_w, int con_h)
+{
+	struct xe_engine *engine = engine_ptr(engines, i);
+	double percentage = pmu_active_percentage(engine);
+
+	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
+	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
+	printf("\n");
+
+	return ++lines;
+}
+
+int xe_print_engines(const void *obj, int lines, int w, int h)
+{
+	struct xe_pmu_device *show = ((struct xe_gputop *)obj)->eng_obj;
+
+	lines = print_device_description(obj, lines, w, h);
+
+	lines = print_engines_header(show, lines, w,  h);
+
+	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
+		lines = print_engine(show, i, lines, w, h);
+
+	lines = print_engines_footer(lines, w, h);
+
+	return lines;
+}
+
diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
new file mode 100644
index 000000000..825ac7e34
--- /dev/null
+++ b/tools/gputop/xe_gputop.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __XE_GPUTOP_H__
+#define __XE_GPUTOP_H__
+
+#include <dirent.h>
+
+#include "igt_device_scan.h"
+#include "igt_perf.h"
+#include "utils.h"
+#include "xe/xe_query.h"
+
+struct xe_pmu_pair {
+	uint64_t cur;
+	uint64_t prev;
+};
+
+struct xe_pmu_counter {
+	uint64_t type;	
+	uint64_t config;
+	unsigned int idx;
+	struct xe_pmu_pair val;
+	int fd;
+	bool present;
+};
+
+struct xe_engine {
+	const char *name;
+	char *display_name;
+	struct drm_xe_engine_class_instance drm_xe_engine;
+	unsigned int num_counters;
+	struct xe_pmu_counter engine_active_ticks;
+	struct xe_pmu_counter engine_total_ticks;
+};
+
+struct xe_pmu_device {
+	unsigned int num_engines;
+	unsigned int num_counters;
+	int fd;
+	char *device;
+	struct xe_engine engine;
+};
+
+struct xe_gputop {
+	char *pmu_device;
+	struct igt_device_card *card;
+	struct xe_pmu_device *eng_obj;
+};
+
+void xe_gputop_init(void *ptr,
+		    struct igt_device_card *card);
+void xe_populate_device_instances(struct gputop_device *dv);
+void *xe_populate_engines(const void *obj);
+void xe_pmu_sample(const void *obj);
+int xe_pmu_init(const void *obj);
+int xe_print_engines(const void *obj, int lines, int w, int h);
+void xe_clean_up(void *obj, int len);
+
+#endif /* __XE_GPUTOP_H__ */
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
2.43.0

