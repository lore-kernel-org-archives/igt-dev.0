Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C4C109C02F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 15:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2010E7BC;
	Wed, 25 Mar 2026 15:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5BYmYvV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A2710E7BD
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 15:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453064; x=1805989064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gYvrIstXjzJOrm8aFmmJLhb2V4khFhty8i8Ll0eORxs=;
 b=K5BYmYvVVDdjzQPuSABo2fPjgOnDHIFIC5Y/9j/vJf/YfxzKzmQs32IP
 rp5x27SZl0p2j5MCA6hpWoNaANKm7GvkRZ+iHszWJutvQcB3BoNjn52JG
 d5pboj7TQX29tdsKC4mRqHgmOh45o9aTU3VcehPgIeNXJii9K1KWOioKM
 lFGKTSX8e90SV7xQ3sKOa3DTXqvfD5P1Pay6HY+SwsW10mfO7HAUw/H0g
 KBrIpJuJCiaSt5N2uuBsjYi2DiLGUmAgEIb+54GZ08Pql+IGILBwEHmhH
 AhLbFFXpWe2TXFAUA9rWpbVxJJgxfHj/bKm9NTBo4yxyhpYl2hgdx6dxx w==;
X-CSE-ConnectionGUID: HJBg/cfFRCinxW/odLRL6w==
X-CSE-MsgGUID: 9FiAFfC8SpC9XMDJt8XFnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75209578"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75209578"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:37:43 -0700
X-CSE-ConnectionGUID: TrY/FCdYS2q/q9t1+/oLAQ==
X-CSE-MsgGUID: I0i5u5dST6OO8LYuHFt6Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="228784683"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:37:39 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: [PATCH i-g-t v9 3/5] tools/gputop.src/xe_gputop: Use direct ioctls
 with card_fd cleanup
Date: Wed, 25 Mar 2026 21:00:36 +0530
Message-Id: <20260325153038.2099329-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325153038.2099329-1-soham.purkait@intel.com>
References: <20260325153038.2099329-1-soham.purkait@intel.com>
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

During xe engine initialization, card_fd is needed to query engines
and obtain PMU busyness configuration, but keeping it open makes the
process appear as a DRM client, which conflicts with KMS test
requirements. To avoid this, close card_fd once engine discovery is
complete and replace the lib/xe/* dependency with direct ioctl calls,
simplifying the implementation and reducing IGT test library dependencies.

v1:
 - Initialize pmu_device_obj to null.
v2:
 - Remove dependency on lib/xe/* libraries. (Kamil)
v3:
 - Refactor ioctl failure check. (Vinay)
 - Check q.size only once. (Vinay)
 - Add num_bytes for asprintf return value. (Vinay)
v4:
 - Replace malloc/memset with calloc. (Vinay)
 - Refactor the commit message to make it concise. (Kamil)

Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tools/gputop.src/xe_gputop.c | 150 ++++++++++++++++++++++++++---------
 tools/gputop.src/xe_gputop.h |   6 +-
 2 files changed, 114 insertions(+), 42 deletions(-)

diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
index bb2caa6ea..30f9c593f 100644
--- a/tools/gputop.src/xe_gputop.c
+++ b/tools/gputop.src/xe_gputop.c
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2025 Intel Corporation
+ * Copyright © 2025-2026 Intel Corporation
  */
 
+#include <sys/ioctl.h>
+
+#include "igt_perf.h"
 #include "xe_gputop.h"
 
 #define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
@@ -65,7 +68,7 @@ void xe_clean_up(void *obj, int len)
 			}
 			if (gputop_dev[i].pmu_device_obj->device)
 				free(gputop_dev[i].pmu_device_obj->device);
-			free(gputop_dev->pmu_device_obj);
+			free(gputop_dev[i].pmu_device_obj);
 		}
 	}
 }
@@ -92,6 +95,7 @@ void xe_gputop_init(void *ptr, int index,
 
 	obj = ((struct xe_gputop *)ptr) + index;
 	obj->card = card;
+	obj->pmu_device_obj = NULL;
 }
 
 static int pmu_format_shift(int xe, const char *name)
@@ -121,20 +125,50 @@ static int engine_cmp(const void *__a, const void *__b)
 		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
 }
 
+static int engine_query(int fd, struct drm_xe_query_engines **engine_q)
+{
+	struct drm_xe_device_query q;
+	int ret = 0, num_eng;
+
+	memset(&q, 0, sizeof(q));
+	q.query = DRM_XE_DEVICE_QUERY_ENGINES;
+
+	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
+	if (ret != 0 || q.size == 0)
+		return 0;
+
+	num_eng = (int)((q.size - sizeof(struct drm_xe_query_engines)) /
+			sizeof(struct drm_xe_engine_class_instance));
+
+	*engine_q = (struct drm_xe_query_engines *)calloc(1, q.size);
+	if (!*engine_q)
+		return -1;
+
+	q.data = (uintptr_t)(*engine_q);
+
+	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
+	if (ret != 0) {
+		free(*engine_q);
+		return -1;
+	}
+
+	return num_eng;
+}
+
 void *xe_populate_engines(const void *obj, int index)
 {
 	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
 	struct igt_device_card *card = ptr->card;
 	uint64_t engine_active_config, engine_total_config;
 	uint64_t engine_class, engine_instance, gt_shift;
-	struct drm_xe_engine_class_instance *hwe;
-	struct xe_pmu_device *engines;
+	struct drm_xe_query_engines *engine_q = NULL;
+	struct xe_pmu_device *engines = NULL;
 	char device[30];
-	int ret = 0;
-	int card_fd;
+	int ret = 0, num_eng;
+	int card_fd = -1;
 
-	if (!card || !strlen(card->card) || !strlen(card->render))
-		return NULL;
+	if (!card || (!strlen(card->card) && !strlen(card->render)))
+		goto err;
 
 	if (strlen(card->card)) {
 		card_fd = igt_open_card(card);
@@ -142,39 +176,53 @@ void *xe_populate_engines(const void *obj, int index)
 		card_fd = igt_open_render(card);
 	} else {
 		fprintf(stderr, "Failed to detect device!\n");
-		return NULL;
+		goto err;
+	}
+
+	num_eng = engine_query(card_fd, &engine_q);
+	if (num_eng <= 0) {
+		fprintf(stderr, "Engine query failed!\n");
+		goto err;
 	}
-	xe_device_get(card_fd);
-	engines = malloc(sizeof(struct xe_pmu_device) +
-			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
-	if (!engines)
-		return NULL;
 
-	memset(engines, 0, sizeof(struct xe_pmu_device) +
-	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
+	engines = calloc(1, sizeof(struct xe_pmu_device) +
+			 num_eng * sizeof(struct xe_engine));
+	if (!engines)
+		goto err;
 
 	engines->num_engines = 0;
 	gt_shift = pmu_format_shift(card_fd, "gt");
 	engine_class = pmu_format_shift(card_fd, "engine_class");
 	engine_instance = pmu_format_shift(card_fd, "engine_instance");
 	xe_perf_device(card_fd, device, sizeof(device));
+	close(card_fd);
+	card_fd = -1;
+
 	engines->device = strdup(device);
+	if (!engines->device) {
+		errno = ENOMEM;
+		goto err;
+	}
 	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
 	if (ret < 0)
-		return NULL;
+		goto err;
 
 	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
 	if (ret < 0)
-		return NULL;
+		goto err;
 
-	xe_for_each_engine(card_fd, hwe) {
+	while (engines->num_engines < engine_q->num_engines) {
+		int num_bytes = 0;
 		uint64_t  param_config;
 		struct xe_engine *engine;
+		struct drm_xe_engine_class_instance hwe;
+
+		hwe = engine_q->engines[engines->num_engines].instance;
 
 		engine = engine_ptr(engines, engines->num_engines);
-		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
-			| hwe->engine_instance << engine_instance;
-		engine->drm_xe_engine = *hwe;
+		param_config = (uint64_t)hwe.gt_id << gt_shift | hwe.engine_class << engine_class
+			| hwe.engine_instance << engine_instance;
+		engine->drm_xe_engine = hwe;
 		engine->engine_active_ticks.config = engine_active_config | param_config;
 		engine->engine_total_ticks.config = engine_total_config | param_config;
 
@@ -184,12 +232,12 @@ void *xe_populate_engines(const void *obj, int index)
 			break;
 		}
 
-		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
-			       hwe->gt_id,
-			       class_display_name(engine->drm_xe_engine.engine_class),
-			       engine->drm_xe_engine.engine_instance);
+		num_bytes = asprintf(&engine->display_name, "GT:%u %s/%u",
+				     hwe.gt_id,
+				     class_display_name(engine->drm_xe_engine.engine_class),
+				     engine->drm_xe_engine.engine_instance);
 
-		if (ret <= 0) {
+		if (num_bytes <= 0) {
 			ret = errno;
 			break;
 		}
@@ -197,9 +245,12 @@ void *xe_populate_engines(const void *obj, int index)
 		engines->num_engines++;
 	}
 
-	if (!ret) {
+	free(engine_q);
+	engine_q = NULL;
+
+	if (ret) {
 		errno = ret;
-		return NULL;
+		goto err;
 	}
 
 	qsort(engine_ptr(engines, 0), engines->num_engines,
@@ -208,9 +259,26 @@ void *xe_populate_engines(const void *obj, int index)
 	ptr->pmu_device_obj = engines;
 
 	return engines;
+
+err:
+	if (card_fd >= 0)
+		close(card_fd);
+	if (engines) {
+		for (unsigned int i = 0; i < engines->num_engines; i++) {
+			struct xe_engine *engine = engine_ptr(engines, i);
+
+			free(engine->display_name);
+		}
+		if (engines->device)
+			free(engines->device);
+		free(engines);
+	}
+	if (engine_q)
+		free(engine_q);
+	return NULL;
 }
 
-static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+static int pmu_read_multi(int fd, unsigned int num, uint64_t *val)
 {
 	uint64_t buf[2 + num];
 	unsigned int i;
@@ -219,15 +287,16 @@ static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
 	memset(buf, 0, sizeof(buf));
 
 	len = read(fd, buf, sizeof(buf));
-	assert(len == sizeof(buf));
+	if (len != sizeof(buf))
+		return -1;
 
 	for (i = 0; i < num; i++)
 		val[i] = buf[2 + i];
 
-	return buf[1];
+	return 0;
 }
 
-void xe_pmu_sample(const void *obj, int index)
+int xe_pmu_sample(const void *obj, int index)
 {
 	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
 	struct xe_pmu_device *engines = ptr->pmu_device_obj;
@@ -235,7 +304,8 @@ void xe_pmu_sample(const void *obj, int index)
 	uint64_t val[2 + num_val];
 	unsigned int i;
 
-	pmu_read_multi(engines->fd, num_val, val);
+	if (pmu_read_multi(engines->fd, num_val, val) < 0)
+		return -1;
 
 	for (i = 0; i < engines->num_engines; i++) {
 		struct xe_engine *engine = engine_ptr(engines, i);
@@ -243,6 +313,8 @@ void xe_pmu_sample(const void *obj, int index)
 		update_sample(&engine->engine_active_ticks, val);
 		update_sample(&engine->engine_total_ticks, val);
 	}
+
+	return 0;
 }
 
 int xe_pmu_init(const void *obj, int index)
@@ -263,11 +335,11 @@ int xe_pmu_init(const void *obj, int index)
 		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
 			       &engines->fd);
 		if (fd < 0)
-			return -1;
+			return fd;
 		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
 			       &engines->fd);
 		if (fd < 0)
-			return -1;
+			return fd;
 	}
 	return 0;
 }
@@ -280,7 +352,10 @@ static double pmu_active_percentage(struct xe_engine *engine)
 				 engine->engine_total_ticks.val.prev;
 	double percentage;
 
-	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
+	if (pmu_total_ticks)
+		percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
+	else
+		percentage = 0.0;
 
 	return clamp(percentage, 0., 100.);
 }
@@ -359,4 +434,3 @@ int xe_print_engines(const void *obj, int index, int lines, int w, int h)
 
 	return lines;
 }
-
diff --git a/tools/gputop.src/xe_gputop.h b/tools/gputop.src/xe_gputop.h
index 1e3856071..81c41a2bd 100644
--- a/tools/gputop.src/xe_gputop.h
+++ b/tools/gputop.src/xe_gputop.h
@@ -7,11 +7,9 @@
 #define __XE_GPUTOP_H__
 
 #include <dirent.h>
+#include <xe_drm.h>
 
-#include "igt_device_scan.h"
-#include "igt_perf.h"
 #include "utils.h"
-#include "xe/xe_query.h"
 
 struct xe_pmu_pair {
 	uint64_t cur;
@@ -52,7 +50,7 @@ struct xe_gputop {
 void xe_gputop_init(void *ptr, int index, struct igt_device_card *card);
 void *xe_populate_engines(const void *obj, int index);
 int xe_pmu_init(const void *obj, int index);
-void xe_pmu_sample(const void *obj, int index);
+int xe_pmu_sample(const void *obj, int index);
 int xe_print_engines(const void *obj, int index, int lines, int w, int h);
 void xe_clean_up(void *obj, int len);
 
-- 
2.34.1

