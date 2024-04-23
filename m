Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FCBC18E72
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7C5113766;
	Tue, 23 Apr 2024 23:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYX7FYdg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DFC11376C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ST5SCIxfc5coyVUFmjVc8/bEfgCcqi+EzzMftD7YZ8=;
 b=GYX7FYdgidzaVSAzskNW6RDNv3ChsC65bOYOjRpCaTGl+AlnL82+LCjE
 JHVjamBbG0QkzBsoBg2vj9kQUC/KLkbRBx3//wLtR1zdjz1TOTDEOdjSY
 HmRH9g1tfdq4iFlfVnbgzjEo2JienyZjiQ35S9IAHlcduewXJq1qdm+rs
 1CABMoROUBBVSnQT47/WVvjPYYNgYeHSxHMB5DjdwxaSBD1Cup8derOoo
 AE3SMLje32J31vd6kfKJ1PRve0clZ4zBTCZaD8S6qINuSQS4bu+4Y7d4y
 K08GeGquUVZreKAd80/IgHby7sP4aACt3sLUhKCVafCcS1ySw6tGQr4lk Q==;
X-CSE-ConnectionGUID: G9k7YsaqQuauJQ390XLHfA==
X-CSE-MsgGUID: 6FgLLdeZS0SPjHVmGeUtUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362006"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
X-CSE-ConnectionGUID: 5b7QNBHZRL6NDZ09kRuwDA==
X-CSE-MsgGUID: tFjkMYXiStetmkSsspMN8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180932"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 12/21] lib/igt_drm_fdinfo: Parse drm-total-cycles
Date: Tue, 23 Apr 2024 16:44:22 -0700
Message-ID: <20240423234431.1959354-13-lucas.demarchi@intel.com>
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

Parse drm-total-cycles and annotate what are the possible engine
utilization types that can be used. Currently there are 2 possible ways
to calculate utilization:

1) via drm-engine, that uses the time and derive the utilization by
   comparing to the CPU time
2) via drm-cycles + drm-total-cycles, that uses the GPU time

igt_drm_fdinfo just marks the presence of the keys, letting the caller
decide which method to use.

It is assumed that if any drm-engine, drm-cycles or drm-total-cycles is
available, it's available for all engines with non-zero utilization.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 9 +++++++++
 lib/igt_drm_fdinfo.h | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 723e2e340..7a1485c66 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -218,6 +218,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		       const char **name_map, unsigned int map_entries,
 		       const char **region_map, unsigned int region_entries)
 {
+	bool has_cycles = false, has_total_cycles = false;
 	bool regions_found[DRM_CLIENT_FDINFO_MAX_REGIONS] = { };
 	bool engines_found[DRM_CLIENT_FDINFO_MAX_ENGINES] = { };
 	unsigned int good = 0, num_capacity = 0;
@@ -264,10 +265,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
 			UPDATE_ENGINE(idx, busy, val);
+			info->dcut |= DCUT_ENGINE_TIME;
 		} else if (strstartswith(l, "drm-cycles-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
 			UPDATE_ENGINE(idx, cycles, val);
+		} else if (strstartswith(l, "drm-total-cycles-", &keylen)) {
+			idx = parse_engine(l + keylen, info,
+					   name_map, map_entries, &val);
+			UPDATE_ENGINE(idx, total_cycles, val);
 		} else if (strstartswith(l, "drm-total-", &keylen)) {
 			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
@@ -294,6 +300,9 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 	if (good < 2 || (!info->num_engines && !info->num_regions))
 		return 0; /* fdinfo format not as expected */
 
+	if (has_cycles && has_total_cycles)
+		info->dcut |= DCUT_GPU_TOTAL_CYCLES;
+
 	return good + info->num_engines + num_capacity + info->num_regions;
 }
 
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index 17a47f94a..4fbd7fe08 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -41,6 +41,11 @@ struct drm_client_meminfo {
 	uint64_t active;
 };
 
+enum drm_client_utilization_type {
+	DCUT_ENGINE_TIME	= 1U << 0,
+	DCUT_GPU_TOTAL_CYCLES	= 1U << 1,
+};
+
 struct drm_client_fdinfo {
 	char driver[128];
 	char pdev[128];
@@ -51,10 +56,13 @@ struct drm_client_fdinfo {
 	unsigned int capacity[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	char names[DRM_CLIENT_FDINFO_MAX_ENGINES][256];
 
+	enum drm_client_utilization_type dcut;
 	/* drm-engine-<engine> values */
 	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	/* drm-cycles-<engine> values */
 	uint64_t cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
+	/* drm-total-cycles-<engine> values */
+	uint64_t total_cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
 
 	unsigned int num_regions;
 	unsigned int last_region_index;
-- 
2.43.0

