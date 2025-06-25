Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64980C7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 07:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E2210E0C3;
	Wed, 25 Jun 2025 07:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSqnm7+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4807A10E681
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750836908; x=1782372908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ebiOOanbZBOOfvCn0wvbXAsA/AqjWXWX0RkajpPZCsg=;
 b=iSqnm7+wAWO1G3cgJyuNGxjUeIeVgEYS05BMsQB3kwOE1pczZ4pc3Eys
 tuMGzMsQm6G6OTQDcsmfITZ8Nwsj9pMHkptj1shuC+pfAkdPB00MMjHKk
 o6dtmFdqnwLqxg4QohtPSvSFDbCK9LzxAsn/W0fnteniXiuWLpNEtNh1u
 1ICGrfoHLYNFbHuv3YO7JaVuuRXPWx+SJRCyuwVEdCAk3zck8FmTO6qR7
 pskVCRj8n4quNyh361Mvnk57PV+eiflI3c5PvogckWu1YnbaG8hOIi3dd
 8Lg3PM4l6maLo0pBwnDQ2Ubciu6mQBGLFw6WCGD5Mqm69ZtyJhgY8rIno A==;
X-CSE-ConnectionGUID: 8S0VvH7bRKW19rpq1j1yPw==
X-CSE-MsgGUID: cZYGlUyDRHCoY8K+ZBamnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75633369"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="75633369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:35:08 -0700
X-CSE-ConnectionGUID: 84NhpUMDSs2+qinRWVVEWw==
X-CSE-MsgGUID: EP/bscr/Rmq7hBUlk0I6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151892362"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:35:03 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v15 4/5] tools/gputop/xe_gputop: Add gputop support for xe
 specific devices
Date: Wed, 25 Jun 2025 12:58:47 +0530
Message-Id: <20250625072848.3479396-5-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625072848.3479396-1-soham.purkait@intel.com>
References: <20250625072848.3479396-1-soham.purkait@intel.com>
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

Add gputop support for xe-specific devices. Separate driver-specific code
into respective source files.

v1:
 - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
v2:
 - Allocate Engine memory all at once, remove PMU
   normalization and perform proper resource
   cleanup (Riana)
v3:
 - Add GT number.    (Riana)
 - Cosmetic changes. (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/xe_gputop.c | 361 +++++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h |  59 +++++++
 2 files changed, 420 insertions(+)
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
new file mode 100644
index 000000000..9757369a8
--- /dev/null
+++ b/tools/gputop/xe_gputop.c
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_gputop.h"
+
+#define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
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
+	struct xe_gputop *gputop_dev = (struct xe_gputop *)obj;
+	struct xe_pmu_counter pmu_counter;
+	struct xe_engine *eng;
+
+	for (int i = 0; i < len; i++) {
+		if (gputop_dev[i].card)
+			free(gputop_dev[i].card);
+		if (gputop_dev[i].pmu_device_obj) {
+			for (int j = 0;
+			     j < gputop_dev[i].pmu_device_obj->num_engines;
+			     j++) {
+				eng = engine_ptr(gputop_dev[i].pmu_device_obj,
+						 j);
+				if (eng->display_name)
+					free(eng->display_name);
+
+				pmu_counter = eng->engine_active_ticks;
+				if (pmu_counter.present)
+					close(pmu_counter.fd);
+
+				pmu_counter = eng->engine_total_ticks;
+				if (pmu_counter.present)
+					close(pmu_counter.fd);
+			}
+			if (gputop_dev[i].pmu_device_obj->device)
+				free(gputop_dev[i].pmu_device_obj->device);
+			free(gputop_dev->pmu_device_obj);
+		}
+	}
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
+void xe_gputop_init(void *ptr, int index,
+		    struct igt_device_card *card)
+{
+	struct xe_gputop *obj;
+
+	obj = ((struct xe_gputop *)ptr) + index;
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
+	if (a->drm_xe_engine.gt_id != b->drm_xe_engine.gt_id)
+		return a->drm_xe_engine.gt_id - b->drm_xe_engine.gt_id;
+	else if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
+		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
+	else
+		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
+}
+
+void *xe_populate_engines(const void *obj, int index)
+{
+	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
+	struct igt_device_card *card = ptr->card;
+	uint64_t engine_active_config, engine_total_config;
+	uint64_t engine_class, engine_instance, gt_shift;
+	struct drm_xe_engine_class_instance *hwe;
+	struct xe_pmu_device *engines;
+	char device[30];
+	int ret = 0;
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
+	gt_shift = pmu_format_shift(card_fd, "gt");
+	engine_class = pmu_format_shift(card_fd, "engine_class");
+	engine_instance = pmu_format_shift(card_fd, "engine_instance");
+	xe_perf_device(card_fd, device, sizeof(device));
+	engines->device = strdup(device);
+	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
+	if (ret < 0)
+		return NULL;
+
+	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
+	if (ret < 0)
+		return NULL;
+
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
+		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
+			       hwe->gt_id,
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
+	ptr->pmu_device_obj = engines;
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
+void xe_pmu_sample(const void *obj, int index)
+{
+	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
+	struct xe_pmu_device *engines = ptr->pmu_device_obj;
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
+int xe_pmu_init(const void *obj, int index)
+{
+	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
+	struct xe_pmu_device *engines = ptr->pmu_device_obj;
+	struct xe_engine *engine;
+	unsigned int i;
+	uint64_t type;
+	int fd;
+
+	type = igt_perf_type_id(engines->device);
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
+int xe_print_engines(const void *obj, int index, int lines, int w, int h)
+{
+	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
+	struct xe_pmu_device *show = ptr->pmu_device_obj;
+
+	lines = print_device_description(ptr, lines, w, h);
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
index 000000000..1e3856071
--- /dev/null
+++ b/tools/gputop/xe_gputop.h
@@ -0,0 +1,59 @@
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
+	struct igt_device_card *card;
+	struct xe_pmu_device *pmu_device_obj;
+};
+
+void xe_gputop_init(void *ptr, int index, struct igt_device_card *card);
+void *xe_populate_engines(const void *obj, int index);
+int xe_pmu_init(const void *obj, int index);
+void xe_pmu_sample(const void *obj, int index);
+int xe_print_engines(const void *obj, int index, int lines, int w, int h);
+void xe_clean_up(void *obj, int len);
+
+#endif /* __XE_GPUTOP_H__ */
-- 
2.34.1

