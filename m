Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A6DC83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 04:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AED610E2F6;
	Thu, 17 Jul 2025 04:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgQI3jhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3910E2F6
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 04:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752726473; x=1784262473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DVCMU4rV841h88GFpioDURdbVrBwulF26PvpQs8gJmY=;
 b=MgQI3jhZdkqQlpWE2H6djVj/4OGxh326ybaFUt+eNiaPnAT3oNRPQoAi
 vT3jfmNbpxNnow5f4gFqtRvrRJxGy5UV70vq5zeiE9Lkd0mrJIoEWeuxJ
 XirbeOAH3BoXWI62Vtqk+XeFR/aVGP98814CjhkR3OegAq4oRdmKzDxY5
 JCTti0xKlpSEJB4OaZtAyc4cSNivZoCn/dy99k9IMn6wz1u2o3+iXKr7C
 BjfLrgVG/5SZUIugi/bQin3RN0Uf+6L4Q4LRvC523zwwSfpU6MAUU2vNW
 cqw331YTc3URNM0N8jZ9pOKBuhcdnjd+CyzQtYEH3WR0uD97GpbVV6reS w==;
X-CSE-ConnectionGUID: wPfcNnEvRe6RbhF+KT05PQ==
X-CSE-MsgGUID: 0JPj7U6bRE+5YbKLKtoXsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54863769"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="54863769"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 21:27:53 -0700
X-CSE-ConnectionGUID: MmtYm0ktQhSR4FA2RU+EEg==
X-CSE-MsgGUID: 6wPSevWCSLK6MGn9R3TvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="194814836"
Received: from unknown (HELO cs1n2.iind.intel.com) ([10.223.104.22])
 by orviesa001.jf.intel.com with ESMTP; 16 Jul 2025 21:27:52 -0700
From: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: khaled.almahallawy@intel.com, jeevaka.badrappan@intel.com,
 Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Subject: [PATCH] tools/xe_gputop: Adding GPU frequency support
Date: Thu, 17 Jul 2025 09:39:17 +0530
Message-ID: <20250717040917.3485107-1-disantkumar.isvarbhai.mistry@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

XE PMU expose GT frequency events to user space via perf interface.
Reading each GT's frequency using PMU interface(gt-actual-frequency,
gt-requested-frequency). Calculate average frequency of all GT and
showing frequency details in gputop as device description section.

Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
---
 tools/gputop/xe_gputop.c | 88 ++++++++++++++++++++++++++++++++++++++--
 tools/gputop/xe_gputop.h |  5 +++
 2 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index 9757369a8..bcc08226d 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -47,6 +47,20 @@ void xe_clean_up(void *obj, int len)
 		if (gputop_dev[i].card)
 			free(gputop_dev[i].card);
 		if (gputop_dev[i].pmu_device_obj) {
+			/* Free FDs from GT Frequency PMU counter */
+			for (int j = 0; j < gputop_dev[i].pmu_device_obj->num_gts; j++) {
+				pmu_counter = gputop_dev[i].pmu_device_obj->gt_act_freq[i];
+				if (pmu_counter.present)
+					close(pmu_counter.fd);
+
+				pmu_counter = gputop_dev[i].pmu_device_obj->gt_req_freq[i];
+				if (pmu_counter.present)
+					close(pmu_counter.fd);
+			}
+
+			free(gputop_dev[i].pmu_device_obj->gt_act_freq);
+			free(gputop_dev[i].pmu_device_obj->gt_req_freq);
+
 			for (int j = 0;
 			     j < gputop_dev[i].pmu_device_obj->num_engines;
 			     j++) {
@@ -127,6 +141,7 @@ void *xe_populate_engines(const void *obj, int index)
 	struct igt_device_card *card = ptr->card;
 	uint64_t engine_active_config, engine_total_config;
 	uint64_t engine_class, engine_instance, gt_shift;
+	uint64_t gt_actual_freq, gt_requested_freq;
 	struct drm_xe_engine_class_instance *hwe;
 	struct xe_pmu_device *engines;
 	char device[30];
@@ -157,7 +172,32 @@ void *xe_populate_engines(const void *obj, int index)
 	gt_shift = pmu_format_shift(card_fd, "gt");
 	engine_class = pmu_format_shift(card_fd, "engine_class");
 	engine_instance = pmu_format_shift(card_fd, "engine_instance");
+
 	xe_perf_device(card_fd, device, sizeof(device));
+
+	engines->num_gts = xe_number_gt(card_fd);
+
+	engines->gt_act_freq = malloc(sizeof(struct xe_pmu_counter) * engines->num_gts);
+	if (!engines->gt_act_freq)
+		return NULL;
+
+	engines->gt_req_freq = malloc(sizeof(struct xe_pmu_counter) * engines->num_gts);
+	if (!engines->gt_req_freq)
+		return NULL;
+
+	ret = perf_event_config(device, "gt-actual-frequency", &gt_actual_freq);
+	if (ret < 0)
+		return NULL;
+
+	ret = perf_event_config(device, "gt-requested-frequency", &gt_requested_freq);
+	if (ret < 0)
+		return NULL;
+
+	for (int i = 0; i < engines->num_gts; i++) {
+		engines->gt_act_freq[i].config = i << gt_shift | gt_actual_freq;
+		engines->gt_req_freq[i].config = i << gt_shift | gt_requested_freq;
+	}
+
 	engines->device = strdup(device);
 	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
 	if (ret < 0)
@@ -237,6 +277,28 @@ void xe_pmu_sample(const void *obj, int index)
 
 	pmu_read_multi(engines->fd, num_val, val);
 
+	engines->act_freq.val.prev = 0;
+	engines->act_freq.val.cur = 0;
+	engines->req_freq.val.prev = 0;
+	engines->req_freq.val.cur = 0;
+
+	for (i = 0; i < engines->num_gts; i++) {
+		update_sample(&engines->gt_act_freq[i], val);
+		engines->act_freq.val.prev = engines->act_freq.val.cur;
+		engines->act_freq.val.cur += engines->gt_act_freq[i].val.cur -
+					     engines->gt_act_freq[i].val.prev;
+
+		update_sample(&engines->gt_req_freq[i], val);
+		engines->req_freq.val.prev = engines->req_freq.val.cur;
+		engines->req_freq.val.cur += engines->gt_req_freq[i].val.cur -
+					     engines->gt_req_freq[i].val.prev;
+	}
+
+	engines->act_freq.val.cur /= engines->num_gts;
+	engines->act_freq.val.prev /= engines->num_gts;
+	engines->req_freq.val.cur /= engines->num_gts;
+	engines->req_freq.val.prev /= engines->num_gts;
+
 	for (i = 0; i < engines->num_engines; i++) {
 		struct xe_engine *engine = engine_ptr(engines, i);
 
@@ -258,6 +320,20 @@ int xe_pmu_init(const void *obj, int index)
 	engines->fd = -1;
 	engines->num_counters = 0;
 
+	for (i = 0; i < engines->num_gts; i++) {
+		fd = _open_pmu(type, &engines->num_counters,
+			       &engines->gt_act_freq[i],
+			       &engines->fd);
+		if (fd < 0)
+			return -1;
+
+		fd = _open_pmu(type, &engines->num_counters,
+			       &engines->gt_req_freq[i],
+			       &engines->fd);
+		if (fd < 0)
+			return -1;
+	}
+
 	for (i = 0; i < engines->num_engines; i++) {
 		engine = engine_ptr(engines, i);
 		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
@@ -289,10 +365,14 @@ print_device_description(const void *obj, int lines, int w, int h)
 {
 	char *desc;
 	int len;
-
-	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
-		       ((struct xe_gputop *)obj)->card->driver,
-		       ((struct xe_gputop *)obj)->card->pci_slot_name);
+	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
+	struct xe_pmu_device *device = ((struct xe_gputop *)obj)->pmu_device_obj;
+
+	len = asprintf(&desc, "DRIVER: %s || BDF: %s || FREQUENCY: %lu/%lu MHz",
+		       card->driver,
+		       card->pci_slot_name,
+		       device->act_freq.val.cur,
+		       device->req_freq.val.cur);
 
 	printf("\033[7m%s%*s\033[0m\n",
 	       desc,
diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
index 1e3856071..8c599e9d5 100644
--- a/tools/gputop/xe_gputop.h
+++ b/tools/gputop/xe_gputop.h
@@ -39,8 +39,13 @@ struct xe_engine {
 struct xe_pmu_device {
 	unsigned int num_engines;
 	unsigned int num_counters;
+	unsigned int num_gts;
 	int fd;
 	char *device;
+	struct xe_pmu_counter act_freq;
+	struct xe_pmu_counter *gt_act_freq;
+	struct xe_pmu_counter req_freq;
+	struct xe_pmu_counter *gt_req_freq;
 	struct xe_engine engine;
 };
 
-- 
2.34.1

