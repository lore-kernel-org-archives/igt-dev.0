Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C331C2BA1B
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 06:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D551810E7FC;
	Thu, 13 Mar 2025 06:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRguIQYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C9310E7F8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741847119; x=1773383119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h+e0lWntpk0fczF075IGq/7PgCSuVtEO3ReCkCdEpkA=;
 b=mRguIQYoch1slTD3hstAxwlCRT2kz1p7Wg4/jtCok3F4VsZAtaP8WAhT
 zhp9mV8fJ7nealiq8upw653blVl0nEucOcOItdIqhd3tKqXZ/OdJ82HsK
 cMVccfJMhjv+nV9hZM6Hw4Dg7/bQWj/R+RmeeFoJrycYePuWqHPzfYNo5
 MG8/5jlFJfNDVciR8FMp9iXS/W0JFIVOTcr9k2wq/Ow/arpCoz9Vr4Kce
 9pJQlev92m479Tl8m+Zy2I03veclVHk9+LwzZWj+8140Hqgbp/FWlwU5g
 fHJzddPxnyFuGcg8zIBHsBYPEsblE279efcB+D0MzcQgrbZUDqlXhN5VT A==;
X-CSE-ConnectionGUID: +zTZBx09SUOX2Ae4GKioNQ==
X-CSE-MsgGUID: Tlygos6CRBWDlcmimmZK7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42829725"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42829725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:19 -0700
X-CSE-ConnectionGUID: tIxdrQ5lRTSJtUYkulcMNg==
X-CSE-MsgGUID: Ag8KrqkxRMyr8BciaQpWAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="158022917"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:12 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH <i-g-t> v4 3/4] tools/gputop/xe_gputop: Add gputop support for
 xe specific devices
Date: Thu, 13 Mar 2025 11:51:53 +0530
Message-Id: <20250313062154.1601701-4-soham.purkait@intel.com>
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

    Add gputop support for xe-specific devices. Separate 
driver-specific code into respective source files.

v2 : fix for refactoring GPUTOP into a
     vendor-agnostic tool (Lucas)

v3 : Separate commit (Kamil)

v4 : Headers in alphabetical order
     Engines memory allocation at
     the beginning all at once
     Removed PMU normalization (Riana)     

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/xe_gputop.c | 372 +++++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h |  73 ++++++++
 2 files changed, 445 insertions(+)
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
new file mode 100644
index 000000000..4137bb771
--- /dev/null
+++ b/tools/gputop/xe_gputop.c
@@ -0,0 +1,372 @@
+/* SPDX-License-Identifier: MIT */
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
+static inline void *clean_up(void *engines)
+{
+	if (engines)
+		free(engines);
+
+	return NULL;
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
+	}
+
+	return fd__;
+}
+
+void xe_gputop_init(struct xe_gputop *obj,
+		    struct igt_device_card *card)
+{
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
+void *xe_discover_engines(const void *obj)
+{
+	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
+	struct xe_engines *engines;
+	int ret = 0;
+	char device[30];
+	struct drm_xe_engine_class_instance *hwe;
+	int card_fd;
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
+		return clean_up(engines);
+	}
+	xe_device_get(card_fd);
+	engines = malloc(sizeof(struct xe_engines) +
+			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
+	if (!engines)
+		return NULL;
+
+	memset(engines, 0, sizeof(struct xe_engines) +
+	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
+
+	engines->num_engines = 0;
+	engines->device = ((struct xe_gputop *)obj)->pmu_device;
+	xe_for_each_engine(card_fd, hwe) {
+		uint64_t engine_class, engine_instance, gt_shift, param_config;
+		struct xe_engine *engine;
+
+		engine = engine_ptr(engines, engines->num_engines);
+		gt_shift = pmu_format_shift(card_fd, "gt");
+		engine_class = pmu_format_shift(card_fd, "engine_class");
+		engine_instance = pmu_format_shift(card_fd, "engine_instance");
+		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
+			| hwe->engine_instance << engine_instance;
+
+		engine->drm_xe_engine = *hwe;
+
+		ret = perf_event_config(xe_perf_device(card_fd, device, sizeof(device)),
+					"engine-active-ticks", &engine->busy_ticks.config);
+		if (ret < 0)
+			break;
+
+		engine->busy_ticks.config |= param_config;
+
+		ret = perf_event_config(xe_perf_device(card_fd, device, sizeof(device)),
+					"engine-total-ticks", &engine->total_ticks.config);
+		if (ret < 0)
+			break;
+
+		engine->total_ticks.config |= param_config;
+
+		if (engine->busy_ticks.config == -1 || engine->total_ticks.config == -1) {
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
+		ret = asprintf(&engine->short_name, "%s/%u",
+			       xe_engine_class_short_string(engine->drm_xe_engine.engine_class),
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
+		return clean_up(engines);
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
+	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
+	const int num_val = engines->num_counters;
+	uint64_t val[2 + num_val];
+	unsigned int i;
+
+	engines->ts.prev = engines->ts.cur;
+	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
+
+	for (i = 0; i < engines->num_engines; i++) {
+		struct xe_engine *engine = engine_ptr(engines, i);
+
+		update_sample(&engine->busy_ticks, val);
+		update_sample(&engine->total_ticks, val);
+	}
+}
+
+int xe_pmu_init(const void *obj)
+{
+	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
+	unsigned int i;
+	int fd;
+	struct xe_engine *engine;
+	uint64_t type = igt_perf_type_id(engines->device);
+
+	engines->fd = -1;
+	engines->num_counters = 0;
+
+	engine = engine_ptr(engines, 0);
+	fd = _open_pmu(type, &engines->num_counters, &engine->busy_ticks, &engines->fd);
+	if (fd < 0)
+		return -1;
+	fd = _open_pmu(type, &engines->num_counters, &engine->total_ticks, &engines->fd);
+	if (fd < 0)
+		return -1;
+
+	for (i = 1; i < engines->num_engines; i++) {
+		engine = engine_ptr(engines, i);
+		fd = _open_pmu(type, &engines->num_counters, &engine->busy_ticks, &engines->fd);
+		if (fd < 0)
+			return -1;
+		fd = _open_pmu(type, &engines->num_counters, &engine->total_ticks, &engines->fd);
+		if (fd < 0)
+			return -1;
+	}
+	return 0;
+}
+
+static double pmu_calc_total(struct xe_pmu_pair *p)
+{
+	double v;
+
+	v = p->cur - p->prev;
+	return v;
+}
+
+static double pmu_calc(struct xe_pmu_pair *p, double total_tick)
+{
+	double bz = p->cur - p->prev;
+	double total;
+
+	total = (bz * 100) / total_tick;
+	return total;
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
+print_engines_header(struct xe_engines *engines,
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
+		a = "            ENGINES   BUSY  ";
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
+print_engine(struct xe_engines *engines, unsigned int i,
+	     int lines, int con_w, int con_h)
+{
+	struct xe_engine *engine = engine_ptr(engines, i);
+	double total_tick = pmu_calc_total(&engine->total_ticks.val);
+	double percentage = pmu_calc(&engine->busy_ticks.val, total_tick);
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
+	struct xe_engines *show = ((struct xe_gputop *)obj)->eng_obj;
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
index 000000000..1f23b2ed0
--- /dev/null
+++ b/tools/gputop/xe_gputop.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: MIT
+ *
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
+	bool present;
+};
+
+struct xe_engine {
+	const char *name;
+	char *display_name;
+	char *short_name;
+	struct drm_xe_engine_class_instance drm_xe_engine;
+	unsigned int num_counters;
+	struct xe_pmu_counter busy_ticks;
+	struct xe_pmu_counter total_ticks;
+};
+
+struct xe_engines {
+	unsigned int num_engines;
+	unsigned int num_classes;
+	unsigned int num_counters;
+	DIR *root;
+	int fd;
+	struct xe_pmu_pair ts;
+	bool discrete;
+	char *device;
+	int num_gts;
+
+	/* Do not edit below this line.
+	 * This structure is reallocated every time a new engine is
+	 * found and size is increased by sizeof (engine).
+	 */
+	struct xe_engine engine;
+
+};
+
+struct xe_gputop {
+	char *pmu_device;
+	struct igt_device_card *card;
+	struct xe_engines *eng_obj;
+};
+
+void xe_gputop_init(struct xe_gputop *obj,
+		    struct igt_device_card *card);
+
+void xe_populate_device_instances(struct gputop_device *dv);
+void *xe_discover_engines(const void *obj);
+void xe_pmu_sample(const void *obj);
+int xe_pmu_init(const void *obj);
+int xe_print_engines(const void *obj, int lines, int w, int h);
+
+#endif /* __XE_GPUTOP_H__ */
-- 
2.34.1

