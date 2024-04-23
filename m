Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDB0C10F15
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1ED11376C;
	Tue, 23 Apr 2024 23:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSX/dmX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4763011376E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LsdpEx6r8kejGPdwu8pCAtUXWeadamsSJAYA4BQ2qtk=;
 b=OSX/dmX6TXKqR3kYP6y6ircNIbN0Rum60IGmakiB+/8LJbl4t54ArkiA
 fWT8tseRI3gGdFM7jsPG3uuuLNCMSNC/7cLSaBQhuGbtUH6fntEvcgLDf
 2nyQ3QW3tINyzIW4GKF5okFGB8k2EI4b9kEN+ImKDv8l4P2N/ejekgOHL
 CwsFGc2repp3F1E9+ACMrovy8pfhpj/fRNBeb8WNnRrid5Q3DXvSIY/2u
 JRvMlZVlUDLfoM0EaIdlR7GDpqvR/RdkpAo+DIkxW87O7AbKZdM+nZb4V
 FUoVONedEpZWvyohhNGQQv3MMnWHeVk5cf+nNlagAlwOl05d6cvRllGZ8 A==;
X-CSE-ConnectionGUID: XKx1f1jsRiO3GB22XT45Qg==
X-CSE-MsgGUID: K+JaC0/aR+yFR224xdVyrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362013"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362013"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
X-CSE-ConnectionGUID: e7RuCCmyRiO2QZYA+ckb1Q==
X-CSE-MsgGUID: TfKe7agiQ2isbcjRciZesg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180942"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 15/21] lib/igt_drm_clients: Record total cycles
Date: Tue, 23 Apr 2024 16:44:25 -0700
Message-ID: <20240423234431.1959354-16-lucas.demarchi@intel.com>
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

If the fdinfo data indicates there's drm-total-cycles, use it to
propagate the engine utilization. Also add an assert in intel_gpu_top
since it only knows how to deal with with engine time busyness.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 47 +++++++++++++++++++++++++++++++++++--------
 lib/igt_drm_clients.h |  7 +++++--
 lib/igt_drm_fdinfo.c  |  2 ++
 tools/intel_gpu_top.c |  1 +
 4 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 71a938b18..8b1959ae1 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -106,16 +106,41 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 	c->last_runtime = 0;
 	c->total_runtime = 0;
 
+	/*
+	 * Make sure utilization type doesn't change between any 2 samples,
+	 * otherwise the units don't match
+	 */
+	assert(c->dcut | info->dcut);
+
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
 		assert(i < ARRAY_SIZE(info->busy));
-
-		if (info->busy[i] < c->u[i].last_busy)
-			continue; /* It will catch up soon. */
-
-		c->total_runtime += info->busy[i];
-		c->u[i].delta_busy = info->busy[i] - c->u[i].last_busy;
-		c->last_runtime += c->u[i].delta_busy;
-		c->u[i].last_busy = info->busy[i];
+		assert(i < ARRAY_SIZE(info->cycles));
+		assert(i < ARRAY_SIZE(info->total_cycles));
+
+		switch (c->dcut) {
+		case DCUT_ENGINE_TIME:
+			if (info->busy[i] < c->u[i].last_busy)
+				continue; /* It will catch up soon. */
+
+			c->total_runtime += info->busy[i];
+			c->u[i].delta_busy = info->busy[i] - c->u[i].last_busy;
+			c->last_runtime += c->u[i].delta_busy;
+			c->u[i].last_busy = info->busy[i];
+			break;
+		case DCUT_GPU_TOTAL_CYCLES:
+			if (info->cycles[i] < c->u[i].last_busy)
+				continue; /* It will catch up soon. */
+
+			c->total_runtime += info->cycles[i];
+			c->u[i].delta_busy = info->cycles[i] - c->u[i].last_busy;
+			c->last_runtime += c->u[i].delta_busy;
+			c->u[i].last_busy = info->cycles[i];
+
+			c->u[i].delta_total_cycles = info->total_cycles[i]
+							- c->u[i].last_total_cycles;
+			c->u[i].last_total_cycles = info->total_cycles[i];
+			break;
+		}
 	}
 
 	/* Memory regions */
@@ -207,6 +232,12 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	c->memory = calloc(c->regions->max_region_id + 1, sizeof(*c->memory));
 	assert(c->memory);
 
+	/* Prefer using GPU_TOTAL_CYCLES if available */
+	if (info->dcut & DCUT_GPU_TOTAL_CYCLES)
+		c->dcut = DCUT_GPU_TOTAL_CYCLES;
+	else
+		c->dcut = DCUT_ENGINE_TIME;
+
 	igt_drm_client_update(c, pid, name, info);
 }
 
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 5c6130ff1..5ab6f6e2e 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -65,9 +65,12 @@ struct igt_drm_client {
 	unsigned int samples; /* Count of times scanning updated this client. */
 	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
 	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
+	enum drm_client_utilization_type dcut; /* Select method to calculate engine utiliazation */
 	struct igt_drm_client_utilization {
-		unsigned long delta_busy; /* Engine busyness data, relative to previous scan. */
-		uint64_t last_busy; /* Engine busyness data as parsed from fdinfo. */
+		unsigned long delta_busy; /* Engine busyness (either drm-cycles or drm-engine data), relative to previous scan. */
+		unsigned long delta_total_cycles; /* Total engine cycles, relative to previous scan. */
+		uint64_t last_busy; /* Engine busyness (either drm-cycles or drm-engine data) as parsed from fdinfo. */
+		uint64_t last_total_cycles; /* Total engin cycles as parsed from fdinfo */
 	} *u; /* Array of engine utilization */
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
 };
diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 7a1485c66..292c7e4d8 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -270,10 +270,12 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
 			UPDATE_ENGINE(idx, cycles, val);
+			has_cycles = true;
 		} else if (strstartswith(l, "drm-total-cycles-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
 			UPDATE_ENGINE(idx, total_cycles, val);
+			has_total_cycles = true;
 		} else if (strstartswith(l, "drm-total-", &keylen)) {
 			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index a4aa8414b..abbc30006 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -880,6 +880,7 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 			break;
 
 		assert(c->status == IGT_DRM_CLIENT_ALIVE);
+		assert(c->dcut == DCUT_ENGINE_TIME);
 
 		if (!cp || c->pid != cp->pid) {
 			ac = &aggregated->client[num++];
-- 
2.43.0

