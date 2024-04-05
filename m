Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24448CD129C
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8D5113942;
	Fri,  5 Apr 2024 06:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLVENVZh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9794211393C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296879; x=1743832879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jpt8on4tIYMpGB4BL1EDjsGvZYsP1Yuhe+AZRYHOzTo=;
 b=BLVENVZhz+0FISJSjXVybrU9oacfOq0gy4TdCYr1YDZrwwnpfJNfxs+X
 F0l2Ykh/e5vcOn4W/ADp0SInKxUiqPmBsf3DutieGuX0EVyiQofSEgQma
 Rq20cqyjhquoEd28Ftxv/vP+I446vmmlDhRGRssmD/iEeDJPE7S357LsH
 HIFbbPNBR3q/eFAcT1tikDIbbrT9uGSdvYlZM67Dvbce5gnoG2i2JcFmE
 QRqOdxafc1DH+nDf7Lkvr1z6nV92Eyd8zAmvF15o7xr3ZC3oEAB5++gKH
 QYldD6e9lq+tGioF1sDGj9IR51F+qEKdQQaxy+bn4F47273J0ykDt9Y/w g==;
X-CSE-ConnectionGUID: kgCNFddPSlChL0KBsKfWJA==
X-CSE-MsgGUID: 50kNUa3PSlWuP8IIGWry3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121760"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:17 -0700
X-CSE-ConnectionGUID: /dwlCFBqTyWh/obRuoiMZA==
X-CSE-MsgGUID: go1sW2K4R9e8UqI6kSOEuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19616006"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 12/12] RFC: gputop: Add support for ticks unit
Date: Fri,  5 Apr 2024 01:00:56 -0500
Message-ID: <20240405060056.59379-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405060056.59379-1-lucas.demarchi@intel.com>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
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

Add support for "ticks" that take out the CPU time elapsed from account
and rather uses the GPU timestamp as recorded from fdinfo. The busyness
is calculated as, for each engine class:

	         u[i+1] - u[i]
	pct  = -----------------
	        Gt[i+1] - Gt[i]

where u[i] is the number of GPU ticks used by a client on an engine and
Gt[i] is the GPU timestamp in ticks. Main advantage over previous "ns"
unit type is that there's only one clock domain involved and it's
expected to work better with SR-IOV when each VF gets a certain quanta
of the GPU - that quanta should be reported as 100% GPU utilization,
which would never be achieved if the CPU clock domain was involved.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 2 ++
 lib/igt_drm_clients.h | 1 +
 tools/gputop.c        | 8 ++++++--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index da966769f..22c56b279 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -195,6 +195,7 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	c->val2 = calloc(c->engines->max_engine_id + 1, sizeof(*c->val2));
 	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
 	c->last2 = calloc(c->engines->max_engine_id + 1, sizeof(*c->last2));
+	c->unit = calloc(c->engines->max_engine_id + 1, sizeof(*c->unit));
 	assert(c->val && c->last);
 
 	/* Memory regions */
@@ -237,6 +238,7 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
 	free(c->val2);
 	free(c->last);
 	free(c->last2);
+	free(c->unit);
 
 	if (c->regions) {
 		for (i = 0; i <= c->regions->max_region_id; i++)
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index cfc53a344..9c2e96d1e 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -69,6 +69,7 @@ struct igt_drm_client {
 	unsigned long *val2; /* Array of engine busyness data2, relative to previous scan. */
 	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
 	uint64_t *last2; /* Array of engine busyness data2 as parsed from fdinfo. */
+	enum  drm_client_engine_unit *unit; /* Array of unit used for engine busyness data. */
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
 };
 
diff --git a/tools/gputop.c b/tools/gputop.c
index ea23e1de5..3649bf4d7 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -183,8 +183,12 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		if (!c->engines->capacity[i])
 			continue;
 
-		pct = (double)c->val[i] / period_us / 1e3 * 100 /
-		      c->engines->capacity[i];
+		if (c->unit[i] == DRM_CLIENT_ENGINE_UNIT_NS)
+			pct = (double)c->val[i] / period_us / 1e3 * 100 /
+			      c->engines->capacity[i];
+		else if (c->unit[i] == DRM_CLIENT_ENGINE_UNIT_TICKS)
+			pct = (double)(c->val2[i] * 100) / c->val[1] /
+			      c->engines->capacity[i];
 
 		/*
 		 * Guard against fluctuations between our scanning period and
-- 
2.44.0

