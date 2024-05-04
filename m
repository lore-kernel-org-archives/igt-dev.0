Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F1C25B5C
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D553112ADF;
	Sat,  4 May 2024 06:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zg1M0uph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9EE112AD7
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805159; x=1746341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6rE8qpv8iAFc+yixL6MAAhQCUGe6gm0dPHcHw9bjfyA=;
 b=Zg1M0uphbZ1BBKiD/J7y4drjHRSYcEZf/umiW0a6NoVVBvpcIaGSOAXg
 mnMB2czDL9TgJibOv1RL2UXRJ8H8hQw2OgB2/lYT2jj/vjDZxrdl8aYrB
 j7aVWZGDKjihqjlKAvBE85PtLIm03TFOZ76iPl4bIisJXPAWSZ7PjtPzv
 d4qHFauBzJfNfp7RQNULL8U6oboqTXL4yumRW3wnJt5Pb6VAC7Gf9XWTB
 qtT2Gq7XA2kFR3ryJDGsr98ApXQW0ofEBt2oxRyhNrqSMu0QCpZhjCu9H
 hye5kOw05wFOxdG25ZTsrJO8tp2mISSmmcX+K9m3BhseGkOyeduwfvZzH g==;
X-CSE-ConnectionGUID: k4Z4BWFMTICH9atxDckWBQ==
X-CSE-MsgGUID: zX9Z+RqvTmanzmPY4DD2Lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545767"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:59 -0700
X-CSE-ConnectionGUID: VIcvjHiqTniDfekl0NadpQ==
X-CSE-MsgGUID: x6nudWlTTWuFe0XYpmvQzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169827"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 12/13] lib/igt_drm_clients: Record total cycles
Date: Fri,  3 May 2024 23:46:42 -0700
Message-ID: <20240504064643.25863-13-lucas.demarchi@intel.com>
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

If the fdinfo data indicates there's drm-total-cycles, use it to
propagate the engine utilization. Also add an assert in intel_gpu_top
since it only knows how to deal with with engine time busyness.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 13 +++++++++++++
 lib/igt_drm_clients.h |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index fbbb763f7..105c7d298 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -107,10 +107,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 	c->total_engine_time = 0;
 	c->agg_delta_cycles = 0;
 	c->total_cycles = 0;
+	c->agg_delta_total_cycles = 0;
+	c->total_total_cycles = 0;
 
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
 		assert(i < ARRAY_SIZE(info->engine_time));
 		assert(i < ARRAY_SIZE(info->cycles));
+		assert(i < ARRAY_SIZE(info->total_cycles));
 
 		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_ENGINE_TIME &&
 		    info->engine_time[i] >= c->utilization[i].last_engine_time) {
@@ -131,6 +134,16 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 			c->agg_delta_cycles += c->utilization[i].delta_cycles;
 			c->utilization[i].last_cycles = info->cycles[i];
 		}
+
+		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_CYCLES &&
+		    info->total_cycles[i] >= c->utilization[i].last_total_cycles) {
+			c->utilization_mask |= IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES;
+			c->total_total_cycles += info->total_cycles[i];
+			c->utilization[i].delta_total_cycles =
+				info->total_cycles[i] - c->utilization[i].last_total_cycles;
+			c->agg_delta_total_cycles += c->utilization[i].delta_total_cycles;
+			c->utilization[i].last_total_cycles = info->total_cycles[i];
+		}
 	}
 
 	/* Memory regions */
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 514c09e71..946d709de 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -36,6 +36,7 @@ enum igt_drm_client_status {
 enum igt_drm_client_utilization_type {
 	IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME	= 1U << 0,
 	IGT_DRM_CLIENT_UTILIZATION_CYCLES	= 1U << 1,
+	IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES	= 1U << 2,
 };
 
 struct igt_drm_client_engines {
@@ -74,11 +75,15 @@ struct igt_drm_client {
 	unsigned long agg_delta_engine_time; /* Aggregate of @utilization.delta_engine_time, i.e. engine time on all engines since previous scan. */
 	unsigned long total_cycles; /* Aggregate of @utilization.agg_delta_cycles, i.e. engine time on all engines since client start. */
 	unsigned long agg_delta_cycles; /* Aggregate of @utilization.delta_cycles, i.e. engine time on all engines since previous scan. */
+	unsigned long total_total_cycles; /* Aggregate of @utilization.agg_delta_total_cycles, i.e. engine time on all engines since client start. */
+	unsigned long agg_delta_total_cycles; /* Aggregate of @utilization.delta_total_cycles, i.e. engine time on all engines since previous scan. */
 	struct igt_drm_client_utilization {
 		unsigned long delta_engine_time; /* Engine time data, relative to previous scan. */
 		unsigned long delta_cycles; /* Engine cycles data, relative to previous scan. */
+		unsigned long delta_total_cycles; /* Engine total cycles data, relative to previous scan. */
 		uint64_t last_engine_time; /* Engine time data as parsed from fdinfo. */
 		uint64_t last_cycles; /* Engine cycles data as parsed from fdinfo. */
+		uint64_t last_total_cycles; /* Engine total cycles data as parsed from fdinfo. */
 	} *utilization; /* Array of engine utilization */
 
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
-- 
2.43.0

