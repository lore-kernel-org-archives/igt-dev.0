Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD29C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 16:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4DD10E74A;
	Tue, 21 May 2024 16:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcNr6fzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FE610E520
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716308127; x=1747844127;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iiXE73tiMNMDz+LOBnwcIlRu2CdBN9CPfp27DVtfG1Y=;
 b=IcNr6fzv20G7tsrIzW5N/4pOffDdJdZKbr3rd9qdrbwqL9MP/Jl8ViPR
 duG+JPw0OOwt4CLgEgidF+1LD1IcJGTHFvGT/CM2ehzXaLeEnvQMobg/R
 1ONJQ3Qdjevh3seD5Jf9GFT/2T7dk2jFD1w1zEXsf8FXfywrg9e9zb8rT
 /CaKT6Rv7OhVu2vHKhn1G9qlvaSrpZ6+7cRsb7EAqN2XktaIFikwyUgIj
 jlVw07pBTG5vRleIYZbSs7hHy2lOfwVTuTTySbZ0lrsm09d4an7sdbUIm
 /qncoJ7UebuEIragmmkuE90laNS0tD3gKHD/My8IkeOis96Pcwv0IE934 Q==;
X-CSE-ConnectionGUID: 67pqb06eSmCOYFWJyYyQAg==
X-CSE-MsgGUID: WzdkgC0xQSWGzoXEzyMhvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23920036"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23920036"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:15:25 -0700
X-CSE-ConnectionGUID: OJFRSjrAQi69g1KgdqFcpA==
X-CSE-MsgGUID: WG4ZrTcNRCqb1tzCJimS5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32896281"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:15:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI 3/6] lib/igt_drm_clients: Record drm-cycles
Date: Tue, 21 May 2024 09:15:22 -0700
Message-ID: <20240521161525.159720-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240521161525.159720-1-lucas.demarchi@intel.com>
References: <20240521161525.159720-1-lucas.demarchi@intel.com>
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

Record drm-cycles and delta between 2 sample updates, just like done
with engine time. This also duplicates the utilization_mask so it's
available to the next layer.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Link: https://lore.kernel.org/r/20240504064643.25863-11-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 30 ++++++++++++++++++++++--------
 lib/igt_drm_clients.h | 10 ++++++++++
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 91d71a7bd..fbbb763f7 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -105,18 +105,32 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 
 	c->agg_delta_engine_time = 0;
 	c->total_engine_time = 0;
+	c->agg_delta_cycles = 0;
+	c->total_cycles = 0;
 
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
 		assert(i < ARRAY_SIZE(info->engine_time));
+		assert(i < ARRAY_SIZE(info->cycles));
+
+		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_ENGINE_TIME &&
+		    info->engine_time[i] >= c->utilization[i].last_engine_time) {
+			c->utilization_mask |= IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME;
+			c->total_engine_time += info->engine_time[i];
+			c->utilization[i].delta_engine_time =
+				info->engine_time[i] - c->utilization[i].last_engine_time;
+			c->agg_delta_engine_time += c->utilization[i].delta_engine_time;
+			c->utilization[i].last_engine_time = info->engine_time[i];
+		}
 
-		if (info->engine_time[i] < c->utilization[i].last_engine_time)
-			continue; /* It will catch up soon. */
-
-		c->total_engine_time += info->engine_time[i];
-		c->utilization[i].delta_engine_time =
-			info->engine_time[i] - c->utilization[i].last_engine_time;
-		c->agg_delta_engine_time += c->utilization[i].delta_engine_time;
-		c->utilization[i].last_engine_time = info->engine_time[i];
+		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_CYCLES &&
+		    info->cycles[i] >= c->utilization[i].last_cycles) {
+			c->utilization_mask |= IGT_DRM_CLIENT_UTILIZATION_CYCLES;
+			c->total_cycles += info->cycles[i];
+			c->utilization[i].delta_cycles =
+				info->cycles[i] - c->utilization[i].last_cycles;
+			c->agg_delta_cycles += c->utilization[i].delta_cycles;
+			c->utilization[i].last_cycles = info->cycles[i];
+		}
 	}
 
 	/* Memory regions */
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index d44daa6dc..514c09e71 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -33,6 +33,11 @@ enum igt_drm_client_status {
 	IGT_DRM_CLIENT_PROBE
 };
 
+enum igt_drm_client_utilization_type {
+	IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME	= 1U << 0,
+	IGT_DRM_CLIENT_UTILIZATION_CYCLES	= 1U << 1,
+};
+
 struct igt_drm_client_engines {
 	unsigned int num_engines; /* Number of discovered active engines. */
 	unsigned int max_engine_id; /* Largest engine index discovered.
@@ -64,11 +69,16 @@ struct igt_drm_client {
 	char print_name[24]; /* Name without any non-printable characters. */
 	unsigned int samples; /* Count of times scanning updated this client. */
 
+	uint32_t utilization_mask; /* mask of enum igt_drm_client_utilization_type */
 	unsigned long total_engine_time; /* Aggregate of @utilization.agg_delta_engine_time, i.e. engine time on all engines since client start. */
 	unsigned long agg_delta_engine_time; /* Aggregate of @utilization.delta_engine_time, i.e. engine time on all engines since previous scan. */
+	unsigned long total_cycles; /* Aggregate of @utilization.agg_delta_cycles, i.e. engine time on all engines since client start. */
+	unsigned long agg_delta_cycles; /* Aggregate of @utilization.delta_cycles, i.e. engine time on all engines since previous scan. */
 	struct igt_drm_client_utilization {
 		unsigned long delta_engine_time; /* Engine time data, relative to previous scan. */
+		unsigned long delta_cycles; /* Engine cycles data, relative to previous scan. */
 		uint64_t last_engine_time; /* Engine time data as parsed from fdinfo. */
+		uint64_t last_cycles; /* Engine cycles data as parsed from fdinfo. */
 	} *utilization; /* Array of engine utilization */
 
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
-- 
2.43.0

