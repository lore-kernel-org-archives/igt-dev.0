Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E57C25B78
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86772113109;
	Sat,  4 May 2024 06:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2f/xuub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F35112ADC
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805159; x=1746341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ecidqN7opHvfC/EbZaixDOWqOLgBNxinV7B7MJjhRa8=;
 b=K2f/xuubbxrJ1qziHqR3LzGWDlYlqIOkQGIuMHIQaWsOsm5P/wM12XLr
 k7jriIDk5eCWJdpJBiWt7KwkvMf98zM1tJ4FnLVKRuKhr7YC+j9ShqSyk
 p06hDAmbrirXragF71lnOmOoKVA/p00bL8QU/SgOda29RyF4SPirLP0tq
 BCM9XBY8NSudTae9p1Na+kHyrYzFzWKpuBjpKVAAKUpZqm4M+1zpYYeZm
 1+L3/Um2sMCa7lN+ObH6LwnHjIhcTOjgIx2wouz8WQeSB/ROo5POZ1MWg
 yX5/vTn1u042TaytM3ejkfFHaGuWHuDiShkl7HhuJ3nSZq/3DqC9hlctU w==;
X-CSE-ConnectionGUID: b6Y5JULMToiVgAO8+OyW7w==
X-CSE-MsgGUID: b0wdiLuxSN2SIBtX56Nh+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545761"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
X-CSE-ConnectionGUID: uOP0LxL+QoeYAel+SrMzDw==
X-CSE-MsgGUID: xKXHGMsAS6SxjgLndm6TAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169818"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 09/13] lib/igt_drm_clients: Move engine fields to
 substruct
Date: Fri,  3 May 2024 23:46:39 -0700
Message-ID: <20240504064643.25863-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504064643.25863-1-lucas.demarchi@intel.com>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
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
 lib/igt_drm_clients.c | 20 +++++++++-----------
 lib/igt_drm_clients.h | 12 ++++++++----
 tools/gputop.c        |  2 +-
 tools/intel_gpu_top.c | 14 +++++++-------
 4 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 3f4265015..91d71a7bd 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -109,13 +109,14 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
 		assert(i < ARRAY_SIZE(info->engine_time));
 
-		if (info->engine_time[i] < c->last_engine_time[i])
+		if (info->engine_time[i] < c->utilization[i].last_engine_time)
 			continue; /* It will catch up soon. */
 
 		c->total_engine_time += info->engine_time[i];
-		c->delta_engine_time[i] = info->engine_time[i] - c->last_engine_time[i];
-		c->agg_delta_engine_time += c->delta_engine_time[i];
-		c->last_engine_time[i] = info->engine_time[i];
+		c->utilization[i].delta_engine_time =
+			info->engine_time[i] - c->utilization[i].last_engine_time;
+		c->agg_delta_engine_time += c->utilization[i].delta_engine_time;
+		c->utilization[i].last_engine_time = info->engine_time[i];
 	}
 
 	/* Memory regions */
@@ -183,11 +184,9 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 		c->engines->max_engine_id = i;
 	}
 
-	c->delta_engine_time = calloc(c->engines->max_engine_id + 1,
-			       sizeof(*c->delta_engine_time));
-	c->last_engine_time = calloc(c->engines->max_engine_id + 1,
-			      sizeof(*c->last_engine_time));
-	assert(c->delta_engine_time && c->last_engine_time);
+	c->utilization = calloc(c->engines->max_engine_id + 1,
+				sizeof(*c->utilization));
+	assert(c->utilization);
 
 	/* Memory regions */
 	c->regions = calloc(1, sizeof(*c->regions));
@@ -225,8 +224,7 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
 	}
 	free(c->engines);
 
-	free(c->delta_engine_time);
-	free(c->last_engine_time);
+	free(c->utilization);
 
 	if (c->regions) {
 		for (i = 0; i <= c->regions->max_region_id; i++)
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index f2ff13182..d44daa6dc 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -63,10 +63,14 @@ struct igt_drm_client {
 	char name[24]; /* Process name of the owning PID. */
 	char print_name[24]; /* Name without any non-printable characters. */
 	unsigned int samples; /* Count of times scanning updated this client. */
-	unsigned long total_engine_time; /* Aggregate of @agg_delta_engine_time, i.e. engine time on all engines since client start. */
-	unsigned long agg_delta_engine_time; /* Aggregate of @delta_engine_time, i.e. engine time on all engines since previous scan. */
-	unsigned long *delta_engine_time; /* Array of engine time data, relative to previous scan. */
-	uint64_t *last_engine_time; /* Array of engine time data as parsed from fdinfo. */
+
+	unsigned long total_engine_time; /* Aggregate of @utilization.agg_delta_engine_time, i.e. engine time on all engines since client start. */
+	unsigned long agg_delta_engine_time; /* Aggregate of @utilization.delta_engine_time, i.e. engine time on all engines since previous scan. */
+	struct igt_drm_client_utilization {
+		unsigned long delta_engine_time; /* Engine time data, relative to previous scan. */
+		uint64_t last_engine_time; /* Engine time data as parsed from fdinfo. */
+	} *utilization; /* Array of engine utilization */
+
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
 };
 
diff --git a/tools/gputop.c b/tools/gputop.c
index 80bc94be4..aa88a8021 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -208,7 +208,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		if (!c->engines->capacity[i])
 			continue;
 
-		pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100 /
+		pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100 /
 		      c->engines->capacity[i];
 
 		/*
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 35122493c..9b65ae4eb 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -893,9 +893,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 			strcpy(ac->pid_str, c->pid_str);
 			strcpy(ac->print_name, c->print_name);
 			ac->engines = c->engines;
-			ac->delta_engine_time = calloc(c->engines->max_engine_id + 1,
-						sizeof(ac->delta_engine_time[0]));
-			assert(ac->delta_engine_time);
+			ac->utilization = calloc(c->engines->max_engine_id + 1,
+						 sizeof(*ac->utilization));
+			assert(ac->utilization);
 			ac->regions = c->regions;
 			ac->memory = calloc(c->regions->max_region_id + 1,
 					    sizeof(ac->memory[0]));
@@ -912,7 +912,7 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 		ac->agg_delta_engine_time += c->agg_delta_engine_time;
 
 		for (i = 0; i <= c->engines->max_engine_id; i++)
-			ac->delta_engine_time[i] += c->delta_engine_time[i];
+			ac->utilization[i].delta_engine_time += c->utilization[i].delta_engine_time;
 
 		for (i = 0; i <= c->regions->max_region_id; i++) {
 			ac->memory[i].total += c->memory[i].total;
@@ -946,7 +946,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
 	 * or borrowed fields which we don't want the library to try and free.
 	 */
 	igt_for_each_drm_client(clients, c, tmp) {
-		free(c->delta_engine_time);
+		free(c->utilization);
 		free(c->memory);
 	}
 
@@ -2161,7 +2161,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 				continue;
 			}
 
-			pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
+			pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100;
 
 			/*
 			 * Guard against possible time-drift between sampling
@@ -2235,7 +2235,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 					 iclients->classes.names[i]);
 				pops->open_struct(buf);
 
-				pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
+				pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100;
 				snprintf(buf, sizeof(buf), "%f", pct);
 				__json_add_member("busy", buf);
 
-- 
2.43.0

