Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDB8C7115D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 19:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D252B10E15D;
	Thu, 19 Jun 2025 19:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNCy7IR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA3E10E153
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 19:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750361265; x=1781897265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u8W+higasZbAm1ferT4sPxlWfF3/0nN8y0e3COzC//g=;
 b=NNCy7IR1bzrVy3GzUIKRBzfskut3mmGlUZuTeEIdgye815Sl9FKk/IcD
 Ps7qO2jWtEHiy6Q0l95s5OumDOoLsV6oyn5q+PPkWR4BzQVq2r4zyOB1i
 B+2eidTw2oBXXlLaHAKhwf4VVa8UnKgpGG2yVXFjoceUcFuGhZU+vvQw2
 v3PBxFok5ZMtaeF7Xi3b67LEWGPjrWd6Z702gW/6kVk2XrTULUFc7x00H
 ILm3lMGLA5Wbay8ulvCUwvz6Nq9CqULU9mN5SFOBj2ARY5TK4P74EXJhI
 zvqrHEQ3GwgSWzx47GTvZ+npyEcvEZ/Y2hFfTeP3do2cM2QEhBsAdSGsx g==;
X-CSE-ConnectionGUID: 1dJgufJPQaiSGGAhRrIPJQ==
X-CSE-MsgGUID: ZgJTdiWjQrGUg4tcHOEXxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52319508"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="52319508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 12:27:44 -0700
X-CSE-ConnectionGUID: UL96iDEDR8GblXdv94PUyQ==
X-CSE-MsgGUID: wN/ElfRTQKeIh+ywGGiQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="155101192"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 12:27:41 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v13 4/5] tools/gputop/xe_gputop: Add gputop support for xe
 specific devices
Date: Fri, 20 Jun 2025 00:51:35 +0530
Message-Id: <20250619192136.3026910-5-soham.purkait@intel.com>
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

Add gputop support for xe-specific devices. Separate
driver-specific code into respective source files.

v2 : Fix for refactoring GPUTOP into a
     vendor-agnostic tool. (Lucas)

v3 : Separate commit. (Kamil)

v4 : Headers in alphabetical order
     Engines memory allocation at
     the beginning all at once.
     Removed PMU normalization. (Riana)

v5 : Refactor to eliminate redundant
     and unused code segments.
     Fix for proper resource cleanup. (Riana)

v8 : Allocated card structure memory inplace and
     accordingly modified the clean up code.

v11 : Loop optimization in xe_populate_engines.
      Removed short_name.
      PMU fds are closed on cleanup.
      Removed unnecessary comments. (Riana)

v13 : Cosmetic changes.
                     (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/xe_gputop.c | 353 +++++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h |  59 +++++++
 2 files changed, 412 insertions(+)
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
new file mode 100644
index 000000000..4088ccfde
--- /dev/null
+++ b/tools/gputop/xe_gputop.c
@@ -0,0 +1,353 @@
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
+	struct xe_gputop *dev = (struct xe_gputop *)obj;
+	struct xe_pmu_counter pmu;
+	struct xe_engine *eng;
+
+	for (int i = 0; i < len; i++) {
+		if ((dev + i)->card)
+			free((dev + i)->card);
+		if ((dev + i)->eng_obj) {
+			for (int j = 0;
+			     j < ((struct xe_pmu_device *)(dev + i)->eng_obj)->num_engines;
+			     j++) {
+				eng = engine_ptr((struct xe_pmu_device *)(dev + i)->eng_obj, j);
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
+		if (((struct xe_pmu_device *)(dev + i)->eng_obj)->device)
+			free(((struct xe_pmu_device *)(dev + i)->eng_obj)->device);
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
+void xe_gputop_init(void *ptr,
+		    struct igt_device_card *card)
+{
+	struct xe_gputop *obj;
+
+	obj = (struct xe_gputop *)ptr;
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
+int xe_print_engines(const void *obj, int lines, int w, int h)
+{
+	struct xe_pmu_device *show = ((struct xe_gputop *)obj)->eng_obj;
+
+	lines = print_device_description(obj, lines, w, h);
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
index 000000000..c5ad510f5
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
+	struct xe_pmu_device *eng_obj;
+};
+
+void xe_gputop_init(void *ptr, struct igt_device_card *card);
+void *xe_populate_engines(const void *obj);
+int xe_pmu_init(const void *obj);
+void xe_pmu_sample(const void *obj);
+int xe_print_engines(const void *obj, int lines, int w, int h);
+void xe_clean_up(void *obj, int len);
+
+#endif /* __XE_GPUTOP_H__ */
-- 
2.34.1

