Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86653D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 09:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE9C10E941;
	Fri, 30 Jan 2026 09:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APzzYD/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1F610E941
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769767119; x=1801303119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zQorH78L7CkvNTiEKDkW6Z411TZygdb+DGHrarOcp3c=;
 b=APzzYD/9/iqoTw/YZVXVkJs2v1+GWGyhD/C2mTizZMcm9pMGd4pB9uvG
 w9nUhYUmPphjfXFOzTZaTyu6NkYYXaT3z7xfPdoHYvrS1iokYT9SblrvM
 pQmum/LMPD3KXsqShL4/6YUe24gnxVhPUCxH8LD+K9GF6SZKqcRhQ0Uio
 4pF22Fl2dT6kUckWSlgMZwR7Qj7noUwhC5T459P/9OctUp0kBl7Aue92F
 86gZG8dL3QN1MzruoObmc8ThGoC67F068u0la59Tukluj3VHK1Z3CFOzY
 IU6nY0DslHFqYfZyMxvvlkf19po7gjqcnvwQfyRnKRm1TdoA/eAFI/Y0k Q==;
X-CSE-ConnectionGUID: Axz2KL2oT5qaX0zBI3KRew==
X-CSE-MsgGUID: 5mRcTT92Qzme57T4v1vs4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58595951"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="58595951"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:58:39 -0800
X-CSE-ConnectionGUID: sUisKVyQQAKRIIqooFMkAg==
X-CSE-MsgGUID: nT2SPz9jQL2PO1bmsNxELg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208413997"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:58:37 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v7 3/5] tools/gputop.src/xe_gputop: Refactor
 xe_populate_engines to close card_fd and use direct ioctl calls
Date: Fri, 30 Jan 2026 15:23:16 +0530
Message-Id: <20260130095318.644256-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130095318.644256-1-soham.purkait@intel.com>
References: <20260130095318.644256-1-soham.purkait@intel.com>
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

During GPUTOP engine initialization, the opened card fd is required to
query engines and obtain configurations for PMU busyness calculation, but
leaving it open causes the process to appear as a DRM client, which
conflicts with KMS test requirements. To avoid this, card_fd is closed
immediately after engine discovery, and engine queries are refactored to
remove the lib/xe/* dependency in favor of direct ioctl calls, simplifying
the implementation and reducing igt test library dependencies.

v1:
 - Initialize pmu_device_obj to null.
v2:
 - Remove dependency on lib/xe/* libraries. (Kamil)

Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop.src/xe_gputop.c | 100 ++++++++++++++++++++++++++++-------
 tools/gputop.src/xe_gputop.h |   3 +-
 2 files changed, 81 insertions(+), 22 deletions(-)

diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
index bb2caa6ea..7793cd62f 100644
--- a/tools/gputop.src/xe_gputop.c
+++ b/tools/gputop.src/xe_gputop.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2025 Intel Corporation
+ * Copyright © 2025-2026 Intel Corporation
  */
 
+#include <sys/ioctl.h>
+
 #include "xe_gputop.h"
 
 #define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
@@ -92,6 +94,7 @@ void xe_gputop_init(void *ptr, int index,
 
 	obj = ((struct xe_gputop *)ptr) + index;
 	obj->card = card;
+	obj->pmu_device_obj = NULL;
 }
 
 static int pmu_format_shift(int xe, const char *name)
@@ -121,20 +124,54 @@ static int engine_cmp(const void *__a, const void *__b)
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
+	if (ret != 0) {
+		if ((errno != ENOSPC && errno != E2BIG) || q.size == 0)
+			return -1;
+	}
+	if (q.size == 0)
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
+	struct drm_xe_query_engines *engine_q;
 	struct xe_pmu_device *engines;
 	char device[30];
-	int ret = 0;
-	int card_fd;
+	int ret = 0, num_eng;
+	int card_fd = -1;
 
 	if (!card || !strlen(card->card) || !strlen(card->render))
-		return NULL;
+		goto err;
 
 	if (strlen(card->card)) {
 		card_fd = igt_open_card(card);
@@ -142,39 +179,51 @@ void *xe_populate_engines(const void *obj, int index)
 		card_fd = igt_open_render(card);
 	} else {
 		fprintf(stderr, "Failed to detect device!\n");
-		return NULL;
+		goto err;
 	}
-	xe_device_get(card_fd);
+
+	num_eng = engine_query(card_fd, &engine_q);
+	if (num_eng <= 0) {
+		fprintf(stderr, "Engine query failed!\n");
+		goto err;
+	}
+
 	engines = malloc(sizeof(struct xe_pmu_device) +
-			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
+			 num_eng * sizeof(struct xe_engine));
 	if (!engines)
-		return NULL;
+		goto err;
 
 	memset(engines, 0, sizeof(struct xe_pmu_device) +
-	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
+	       num_eng * sizeof(struct xe_engine));
 
 	engines->num_engines = 0;
 	gt_shift = pmu_format_shift(card_fd, "gt");
 	engine_class = pmu_format_shift(card_fd, "engine_class");
 	engine_instance = pmu_format_shift(card_fd, "engine_instance");
 	xe_perf_device(card_fd, device, sizeof(device));
+	close(card_fd);
+	card_fd = -1;
+
 	engines->device = strdup(device);
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
 
@@ -185,7 +234,7 @@ void *xe_populate_engines(const void *obj, int index)
 		}
 
 		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
-			       hwe->gt_id,
+			       hwe.gt_id,
 			       class_display_name(engine->drm_xe_engine.engine_class),
 			       engine->drm_xe_engine.engine_instance);
 
@@ -197,9 +246,11 @@ void *xe_populate_engines(const void *obj, int index)
 		engines->num_engines++;
 	}
 
+	free(engine_q);
+
 	if (!ret) {
 		errno = ret;
-		return NULL;
+		goto err;
 	}
 
 	qsort(engine_ptr(engines, 0), engines->num_engines,
@@ -208,6 +259,15 @@ void *xe_populate_engines(const void *obj, int index)
 	ptr->pmu_device_obj = engines;
 
 	return engines;
+
+err:
+	if (card_fd >= 0)
+		close(card_fd);
+	if (engines)
+		free(engines);
+	if (engine_q)
+		free(engine_q);
+	return NULL;
 }
 
 static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
@@ -263,11 +323,11 @@ int xe_pmu_init(const void *obj, int index)
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
diff --git a/tools/gputop.src/xe_gputop.h b/tools/gputop.src/xe_gputop.h
index 1e3856071..dcd82de7d 100644
--- a/tools/gputop.src/xe_gputop.h
+++ b/tools/gputop.src/xe_gputop.h
@@ -7,11 +7,10 @@
 #define __XE_GPUTOP_H__
 
 #include <dirent.h>
+#include <xe_drm.h>
 
-#include "igt_device_scan.h"
 #include "igt_perf.h"
 #include "utils.h"
-#include "xe/xe_query.h"
 
 struct xe_pmu_pair {
 	uint64_t cur;
-- 
2.34.1

