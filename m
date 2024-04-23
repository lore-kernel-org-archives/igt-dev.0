Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1305DC10F15
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C74C113774;
	Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDx7ySYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A56B113769
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Na6L3pO9mF6ot9wB7/XF5OWiT+0L8W70m9qrGzWzK94=;
 b=TDx7ySYG36LZQLKQsXRTGRP8z91mkCGHhm5EaSu9XcD2HX/rBwUii24F
 ckd1PWSTMffz32HMMLqBnQ8RE3Wj0faa7/BxUiMeVc/vGwSx/dzRxuypx
 44B+4pioGF8kdmradw08Ks0GJOWVE/zyy5JoJkscLiCKDh6m50lFvQgbP
 DElFP+m9RIkAVmFgQYv+ho4NxggryaEXfJOtjfMXFWiI4lR297jQYt68C
 /BdgQGc7MRkLsKxK9G5QHlnld1jF/KMEQ/yD0xxqCug2AeOawQuhVS/MW
 mbMDmgUFbwc1qUV+VVF8flE/BkIqeMW2R4xHAhxYPBsDVuZx1DZpyOZld Q==;
X-CSE-ConnectionGUID: YOBWuyVWT4mSFykZPE77lQ==
X-CSE-MsgGUID: 3UIBM12ZQbaXGpzHGIbmwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362011"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
X-CSE-ConnectionGUID: HnbIDi93Ti+6zvvb+b721Q==
X-CSE-MsgGUID: RN+jbzdCQ6CoirQQT/WcAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180939"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 14/21] lib/igt_drm_clients: Move engine fields to
 substruct
Date: Tue, 23 Apr 2024 16:44:24 -0700
Message-ID: <20240423234431.1959354-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423234431.1959354-1-lucas.demarchi@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
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

Instead of keep adding arrays, move all the arrays indexed by engine to
a substruct.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 19 ++++++++-----------
 lib/igt_drm_clients.h |  6 ++++--
 tools/gputop.c        |  2 +-
 tools/intel_gpu_top.c | 14 +++++++-------
 4 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 940c95381..71a938b18 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -109,13 +109,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
 		assert(i < ARRAY_SIZE(info->busy));
 
-		if (info->busy[i] < c->last_busy[i])
+		if (info->busy[i] < c->u[i].last_busy)
 			continue; /* It will catch up soon. */
 
 		c->total_runtime += info->busy[i];
-		c->delta_busy[i] = info->busy[i] - c->last_busy[i];
-		c->last_runtime += c->delta_busy[i];
-		c->last_busy[i] = info->busy[i];
+		c->u[i].delta_busy = info->busy[i] - c->u[i].last_busy;
+		c->last_runtime += c->u[i].delta_busy;
+		c->u[i].last_busy = info->busy[i];
 	}
 
 	/* Memory regions */
@@ -183,11 +183,9 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 		c->engines->max_engine_id = i;
 	}
 
-	c->delta_busy = calloc(c->engines->max_engine_id + 1,
-			       sizeof(*c->delta_busy));
-	c->last_busy = calloc(c->engines->max_engine_id + 1,
-			      sizeof(*c->last_busy));
-	assert(c->delta_busy && c->last_busy);
+	c->u = calloc(c->engines->max_engine_id + 1,
+		      sizeof(*c->u));
+	assert(c->u);
 
 	/* Memory regions */
 	c->regions = calloc(1, sizeof(*c->regions));
@@ -225,8 +223,7 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
 	}
 	free(c->engines);
 
-	free(c->delta_busy);
-	free(c->last_busy);
+	free(c->u);
 
 	if (c->regions) {
 		for (i = 0; i <= c->regions->max_region_id; i++)
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 06b29cfd1..5c6130ff1 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -65,8 +65,10 @@ struct igt_drm_client {
 	unsigned int samples; /* Count of times scanning updated this client. */
 	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
 	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
-	unsigned long *delta_busy; /* Array of engine busyness data, relative to previous scan. */
-	uint64_t *last_busy; /* Array of engine busyness data as parsed from fdinfo. */
+	struct igt_drm_client_utilization {
+		unsigned long delta_busy; /* Engine busyness data, relative to previous scan. */
+		uint64_t last_busy; /* Engine busyness data as parsed from fdinfo. */
+	} *u; /* Array of engine utilization */
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
 };
 
diff --git a/tools/gputop.c b/tools/gputop.c
index 2946aaa5e..bca7f4bc7 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -208,7 +208,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		if (!c->engines->capacity[i])
 			continue;
 
-		pct = (double)c->delta_busy[i] / period_us / 1e3 * 100 /
+		pct = (double)c->u[i].delta_busy / period_us / 1e3 * 100 /
 		      c->engines->capacity[i];
 
 		/*
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index adc95a95e..a4aa8414b 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -893,9 +893,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 			strcpy(ac->pid_str, c->pid_str);
 			strcpy(ac->print_name, c->print_name);
 			ac->engines = c->engines;
-			ac->delta_busy = calloc(c->engines->max_engine_id + 1,
-						sizeof(ac->delta_busy[0]));
-			assert(ac->delta_busy);
+			ac->u = calloc(c->engines->max_engine_id + 1,
+				       sizeof(*ac->u));
+			assert(ac->u);
 			ac->regions = c->regions;
 			ac->memory = calloc(c->regions->max_region_id + 1,
 					    sizeof(ac->memory[0]));
@@ -912,7 +912,7 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 		ac->last_runtime += c->last_runtime;
 
 		for (i = 0; i <= c->engines->max_engine_id; i++)
-			ac->delta_busy[i] += c->delta_busy[i];
+			ac->u[i].delta_busy += c->u[i].delta_busy;
 
 		for (i = 0; i <= c->regions->max_region_id; i++) {
 			ac->memory[i].total += c->memory[i].total;
@@ -946,7 +946,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
 	 * or borrowed fields which we don't want the library to try and free.
 	 */
 	igt_for_each_drm_client(clients, c, tmp) {
-		free(c->delta_busy);
+		free(c->u);
 		free(c->memory);
 	}
 
@@ -2161,7 +2161,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 				continue;
 			}
 
-			pct = (double)c->delta_busy[i] / period_us / 1e3 * 100;
+			pct = (double)c->u[i].delta_busy / period_us / 1e3 * 100;
 
 			/*
 			 * Guard against possible time-drift between sampling
@@ -2235,7 +2235,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 					 iclients->classes.names[i]);
 				pops->open_struct(buf);
 
-				pct = (double)c->delta_busy[i] / period_us / 1e3 * 100;
+				pct = (double)c->u[i].delta_busy / period_us / 1e3 * 100;
 				snprintf(buf, sizeof(buf), "%f", pct);
 				__json_add_member("busy", buf);
 
-- 
2.43.0

