Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9818CD129D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EC6113941;
	Fri,  5 Apr 2024 06:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7VDAaS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E07113936
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296873; x=1743832873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oCA64ZWfSmAo+qNiDWW2jPP64fyU+KswKHamSHq86KI=;
 b=Q7VDAaS1EGplQGXbc8qc7jk+e6YcwnOCnLjs5UZh0bhCuNqNhWNgwXDi
 X/D14bXaF38Qnndn3aHwWtL9cIv+qHo5PfMeXHs8jGtHUD3bd2+ETMqQR
 aztIH/EHE9pAtSsT0sHP8dy6oPyxbnbKl04gYAPnycMDymjkVkdn1QJ+D
 JAdDbamfu9ReMiBF3hlEerb2em4XfhtiG7W3OXlF5rkDq9hC9viCLdtfD
 Un047EspY39fMXGnkYoUIvPPmZgZruMnrPCGcsCH3X2MTlZAbNOTTVNBL
 o+GCw64kRBiK3JULgl90Tkaso+yjutygB/m6TZQhBhDArstVM7ssu/Vua g==;
X-CSE-ConnectionGUID: anidci3YSg2KbGda3gDG5w==
X-CSE-MsgGUID: cc4iFujHTW+jg6ek0OLk0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121751"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121751"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:13 -0700
X-CSE-ConnectionGUID: kzEV2Gi4SayUF50PnkNjlA==
X-CSE-MsgGUID: MjUV615LTP+E2NCTg7oyLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615834"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 09/12] lib/igt_drm_clients: Store second data for ticks
 busyness
Date: Fri,  5 Apr 2024 01:00:53 -0500
Message-ID: <20240405060056.59379-10-lucas.demarchi@intel.com>
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

When unit is "ticks" store the second counter to be used by tools.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 22 +++++++++++++++++-----
 lib/igt_drm_clients.h |  2 ++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 40d494441..da966769f 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -108,14 +108,22 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
 		assert(i < ARRAY_SIZE(info->busy));
-
 		if (info->busy[i] < c->last[i])
 			continue; /* It will catch up soon. */
 
-		c->total_runtime += info->busy[i];
-		c->val[i] = info->busy[i] - c->last[i];
-		c->last_runtime += c->val[i];
-		c->last[i] = info->busy[i];
+		if (info->unit[i] == DRM_CLIENT_ENGINE_UNIT_NS) {
+			c->total_runtime += info->busy[i];
+			c->val[i] = info->busy[i] - c->last[i];
+			c->last_runtime += c->val[i];
+			c->last[i] = info->busy[i];
+		} else if (info->unit[i] == DRM_CLIENT_ENGINE_UNIT_TICKS) {
+			c->total_runtime += info->busy2[i];
+			c->val[i] = info->busy[i] - c->last[i];
+			c->val2[i] = info->busy2[i] - c->last2[i];
+			c->last[i] = info->busy[i];
+			c->last2[i] = info->busy2[i];
+			c->last_runtime += c->val2[i];
+		}
 	}
 
 	/* Memory regions */
@@ -184,7 +192,9 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	}
 
 	c->val = calloc(c->engines->max_engine_id + 1, sizeof(*c->val));
+	c->val2 = calloc(c->engines->max_engine_id + 1, sizeof(*c->val2));
 	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
+	c->last2 = calloc(c->engines->max_engine_id + 1, sizeof(*c->last2));
 	assert(c->val && c->last);
 
 	/* Memory regions */
@@ -224,7 +234,9 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
 	free(c->engines);
 
 	free(c->val);
+	free(c->val2);
 	free(c->last);
+	free(c->last2);
 
 	if (c->regions) {
 		for (i = 0; i <= c->regions->max_region_id; i++)
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 52888aedc..cfc53a344 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -66,7 +66,9 @@ struct igt_drm_client {
 	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
 	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
 	unsigned long *val; /* Array of engine busyness data, relative to previous scan. */
+	unsigned long *val2; /* Array of engine busyness data2, relative to previous scan. */
 	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
+	uint64_t *last2; /* Array of engine busyness data2 as parsed from fdinfo. */
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
 };
 
-- 
2.44.0

