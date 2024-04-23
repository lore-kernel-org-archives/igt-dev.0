Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D1CC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9DE113225;
	Tue, 23 Apr 2024 08:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWbs+Ecr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628CB113225
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862681; x=1745398681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1x5bb+rdp/wttzKzMweOSIMXKVTisyTVqxyBvh6+tDU=;
 b=aWbs+EcrnAqOpGOda44KL3rwcG4u+NvNxtypHpCxInIS0RzjGJDrkcFZ
 sY/DN6utmLvL1OmK+lB3ZZ/Mu9pe34fTjw/P9W5LN34MxkL7WvK0pZB3Z
 nkSeJmb5EXmFA92LBybAQo72XOmcL8KoCSusyTnCzA45/Mgn+7f7CNEq6
 yct2OL7W4BOfAfU0Ynd6vLEoY6MuWuWjPIVpNatBSaCtFVQJ0/Vf+AYvE
 N2bOlz2dqTL5pdNwPjFBaDdZ2aQvA/DotN+7eYCDha5r9+Ki1qOTqFfP4
 U8DMbfYaEnsYAqgf7IzcKaKCYhozhaADNHi7vHilOcC7UpnAOMATGz4Uf w==;
X-CSE-ConnectionGUID: eLIq311cSnW059+cfxXdTw==
X-CSE-MsgGUID: Bs792BbERVqjmj/ZkjAw7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9602681"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9602681"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:58:00 -0700
X-CSE-ConnectionGUID: jxNFGOQqSuCqoKQLb+gEGA==
X-CSE-MsgGUID: rCMOybUISSqQqXiA1b8SqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="47587932"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:57:59 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 i-g-t 4/6] benchmarks/gem_wsim: Update request_idx in
 prepare phase
Date: Tue, 23 Apr 2024 10:56:44 +0200
Message-Id: <20240423085646.6672-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
References: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
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

Renamed `request` to `request_idx` for consistency with `engine_idx`.
The index references an element of device's physical engines array.
Similar to engine_idx the field is initialized in workload's preparation
phase. Field is used for throttling functionality, enabling control over
the rate of requests on a given engine.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index b50de78ec..821746feb 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -181,7 +181,7 @@ struct w_step {
 	/* Implementation details */
 	unsigned int idx;
 	struct igt_list_head rq_link;
-	unsigned int request;
+	unsigned int request_idx;
 	unsigned int preempt_us;
 
 	union {
@@ -1300,7 +1300,7 @@ add_step:
 			step.delay = __duration(step.delay, scale_time);
 
 		step.idx = nr_steps++;
-		step.request = -1;
+		step.rq_link.next = step.rq_link.prev = NULL;
 		steps = realloc(steps, sizeof(step) * nr_steps);
 		igt_assert(steps);
 
@@ -2229,7 +2229,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 			};
 			struct i915_context_engines_bond *last = NULL;
 
-			/* update engine_idx */
+			/* update engine_idx and request_idx */
 			for_each_w_step(w, wrk) {
 				if (w->context != ctx_idx)
 					continue;
@@ -2242,6 +2242,8 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 						w->engine_idx = map_idx + 1;
 					else
 						igt_assert(ctx->load_balance);
+
+					w->request_idx = ctx->engine_map.engines[map_idx];
 				}
 			}
 
@@ -2301,12 +2303,13 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 
 			gem_context_set_param(fd, &param);
 		} else {
-			/* update engine_idx */
+			/* update engine_idx and request_idx */
 			for_each_w_step(w, wrk) {
 				if (w->context != ctx_idx)
 					continue;
 				if (w->type == BATCH) {
 					w->engine_idx = engine_to_i915_legacy_ring(&w->engine);
+					w->request_idx = w->engine;
 				}
 			}
 		}
@@ -2399,8 +2402,10 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 			for_each_w_step(w, wrk) {
 				if (w->context != ctx_idx)
 					continue;
-				if (w->type == BATCH)
+				if (w->type == BATCH) {
 					w->engine_idx = 0;
+					w->request_idx = ctx->engine_map.engines[w->engine_idx];
+				}
 			}
 
 			xe_exec_queue_create_(ctx, eq);
@@ -2415,8 +2420,9 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 					continue;
 				if (w->type == BATCH) {
 					engine_classes[w->engine]++;
-					/* update engine_idx */
+					/* update engine_idx and request_idx */
 					w->engine_idx = w->engine;
+					w->request_idx = w->engine;
 				}
 			}
 
@@ -2733,7 +2739,6 @@ static void *run_workload(void *data)
 		clock_gettime(CLOCK_MONOTONIC, &repeat_start);
 
 		for_each_w_step(w, wrk) {
-			enum intel_engine_id engine = w->engine;
 			int do_sleep = 0;
 
 			if (!wrk->run)
@@ -2854,13 +2859,12 @@ static void *run_workload(void *data)
 			else
 				do_eb(wrk, w);
 
-			if (w->request != -1) {
+			if (w->rq_link.next) {
 				igt_list_del(&w->rq_link);
-				wrk->nrequest[w->request]--;
+				wrk->nrequest[w->request_idx]--;
 			}
-			w->request = engine;
-			igt_list_add_tail(&w->rq_link, &wrk->requests[engine]);
-			wrk->nrequest[engine]++;
+			igt_list_add_tail(&w->rq_link, &wrk->requests[w->request_idx]);
+			wrk->nrequest[w->request_idx]++;
 
 			if (!wrk->run)
 				break;
@@ -2869,17 +2873,16 @@ static void *run_workload(void *data)
 				w_step_sync(w);
 
 			if (qd_throttle > 0) {
-				while (wrk->nrequest[engine] > qd_throttle) {
+				while (wrk->nrequest[w->request_idx] > qd_throttle) {
 					struct w_step *s;
 
-					s = igt_list_first_entry(&wrk->requests[engine],
+					s = igt_list_first_entry(&wrk->requests[w->request_idx],
 								 s, rq_link);
 
 					w_step_sync(s);
 
-					s->request = -1;
 					igt_list_del(&s->rq_link);
-					wrk->nrequest[engine]--;
+					wrk->nrequest[w->request_idx]--;
 				}
 			}
 		}
-- 
2.31.1

