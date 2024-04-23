Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0229AC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E76113771;
	Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G86BGasV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C3D113768
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dts3b1wju+JNnxq7UyRV7fEg9yC/9uZwYRuZg9Qm2kU=;
 b=G86BGasVppcddU2hE66nNP8FC7k/jn9IXfwNUxULxTXqwUZ0NiprEhaz
 NNiGJNf9NBof5Ru6SNXMvImvSSal3rNu5BrdotcS4yLbQ43K4LxY5duWN
 eIKOxN8+inux8JvCNEvqMn9oYHzto/LkkEV4YKo16cMPwFJJbPWwM+dqs
 Itskvif6aaLEPly/pAmZKbpta3wdqkE5OVTzMA7u0dGS6/o6NDSx2VHKm
 tFCL6VfPRyFLFEwWhclqlEDh7nmgpQZCMnqldDrQF1jMMgyq+LOjO5LpD
 s9mMiRlB+/u1Cq1s7mb5Znh/716pjVSRQKgqW1nX+pbK5YqApnfQItq9j g==;
X-CSE-ConnectionGUID: GkDpWr+7QaOfK/jl7zlQ4w==
X-CSE-MsgGUID: Ph5TaTz7ToSzuhBzXK9Rag==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362008"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362008"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
X-CSE-ConnectionGUID: f2Q53jvPRjCp27LmtUBL5g==
X-CSE-MsgGUID: gQ1xuRRTTRWqrGYH0I114Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180935"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 13/21] lib/igt_drm_clients: Rename engine busyness
 variables
Date: Tue, 23 Apr 2024 16:44:23 -0700
Message-ID: <20240423234431.1959354-14-lucas.demarchi@intel.com>
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

Follow the comment documenting "val" and "last" that it's related to the
engine busyness.  This will make it easier to follow the code when
additional methods to calculate utilization is added: "busy" refers to
the time in the CPU clock domain parsed from drm-engine-*.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 20 +++++++++++---------
 lib/igt_drm_clients.h |  4 ++--
 tools/gputop.c        |  2 +-
 tools/intel_gpu_top.c | 14 +++++++-------
 4 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 40d494441..940c95381 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -109,13 +109,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
 		assert(i < ARRAY_SIZE(info->busy));
 
-		if (info->busy[i] < c->last[i])
+		if (info->busy[i] < c->last_busy[i])
 			continue; /* It will catch up soon. */
 
 		c->total_runtime += info->busy[i];
-		c->val[i] = info->busy[i] - c->last[i];
-		c->last_runtime += c->val[i];
-		c->last[i] = info->busy[i];
+		c->delta_busy[i] = info->busy[i] - c->last_busy[i];
+		c->last_runtime += c->delta_busy[i];
+		c->last_busy[i] = info->busy[i];
 	}
 
 	/* Memory regions */
@@ -183,9 +183,11 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 		c->engines->max_engine_id = i;
 	}
 
-	c->val = calloc(c->engines->max_engine_id + 1, sizeof(*c->val));
-	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
-	assert(c->val && c->last);
+	c->delta_busy = calloc(c->engines->max_engine_id + 1,
+			       sizeof(*c->delta_busy));
+	c->last_busy = calloc(c->engines->max_engine_id + 1,
+			      sizeof(*c->last_busy));
+	assert(c->delta_busy && c->last_busy);
 
 	/* Memory regions */
 	c->regions = calloc(1, sizeof(*c->regions));
@@ -223,8 +225,8 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
 	}
 	free(c->engines);
 
-	free(c->val);
-	free(c->last);
+	free(c->delta_busy);
+	free(c->last_busy);
 
 	if (c->regions) {
 		for (i = 0; i <= c->regions->max_region_id; i++)
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 52888aedc..06b29cfd1 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -65,8 +65,8 @@ struct igt_drm_client {
 	unsigned int samples; /* Count of times scanning updated this client. */
 	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
 	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
-	unsigned long *val; /* Array of engine busyness data, relative to previous scan. */
-	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
+	unsigned long *delta_busy; /* Array of engine busyness data, relative to previous scan. */
+	uint64_t *last_busy; /* Array of engine busyness data as parsed from fdinfo. */
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
 };
 
diff --git a/tools/gputop.c b/tools/gputop.c
index 8cec951b4..2946aaa5e 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -208,7 +208,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		if (!c->engines->capacity[i])
 			continue;
 
-		pct = (double)c->val[i] / period_us / 1e3 * 100 /
+		pct = (double)c->delta_busy[i] / period_us / 1e3 * 100 /
 		      c->engines->capacity[i];
 
 		/*
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 5b4f94d7d..adc95a95e 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -893,9 +893,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 			strcpy(ac->pid_str, c->pid_str);
 			strcpy(ac->print_name, c->print_name);
 			ac->engines = c->engines;
-			ac->val = calloc(c->engines->max_engine_id + 1,
-					 sizeof(ac->val[0]));
-			assert(ac->val);
+			ac->delta_busy = calloc(c->engines->max_engine_id + 1,
+						sizeof(ac->delta_busy[0]));
+			assert(ac->delta_busy);
 			ac->regions = c->regions;
 			ac->memory = calloc(c->regions->max_region_id + 1,
 					    sizeof(ac->memory[0]));
@@ -912,7 +912,7 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 		ac->last_runtime += c->last_runtime;
 
 		for (i = 0; i <= c->engines->max_engine_id; i++)
-			ac->val[i] += c->val[i];
+			ac->delta_busy[i] += c->delta_busy[i];
 
 		for (i = 0; i <= c->regions->max_region_id; i++) {
 			ac->memory[i].total += c->memory[i].total;
@@ -946,7 +946,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
 	 * or borrowed fields which we don't want the library to try and free.
 	 */
 	igt_for_each_drm_client(clients, c, tmp) {
-		free(c->val);
+		free(c->delta_busy);
 		free(c->memory);
 	}
 
@@ -2161,7 +2161,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 				continue;
 			}
 
-			pct = (double)c->val[i] / period_us / 1e3 * 100;
+			pct = (double)c->delta_busy[i] / period_us / 1e3 * 100;
 
 			/*
 			 * Guard against possible time-drift between sampling
@@ -2235,7 +2235,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 					 iclients->classes.names[i]);
 				pops->open_struct(buf);
 
-				pct = (double)c->val[i] / period_us / 1e3 * 100;
+				pct = (double)c->delta_busy[i] / period_us / 1e3 * 100;
 				snprintf(buf, sizeof(buf), "%f", pct);
 				__json_add_member("busy", buf);
 
-- 
2.43.0

