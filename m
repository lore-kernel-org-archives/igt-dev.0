Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E54C25B7C
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 16:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CEF10E62E;
	Tue, 21 May 2024 16:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKZTp66H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ECC10E62D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716308127; x=1747844127;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=V/n+X2gMokUscwt3KBlp5OiuyW3ifLOiIL4rc1FlvmI=;
 b=WKZTp66HZ8duag7mSI1mmXzrHJDY15XrB70F3CBbzjruVqNbjE2pxj+h
 NG09OM7FK83c+7hjrcSl6OdL9E82ud01PgSQP/7U8q3H89oCK6T7XJd9B
 LlA5L8meleh/Q4IIXMIhQTIMcrlu7rkd5PuQV7Ns9gi2GvfQ7hQ5Z5ab+
 hQlOj6xjGsSrJ2Uxp26WxqMxGR00xHLWpIu7T0/iXZSK1jZjxptEQqIbc
 5wuUA4fdGrSddCKMqxE8LPc/airHvl47iIqlenO6KlgVzjz7KIjNAttyv
 KapYMIBXwCs37OJgnnXlMpiZCHCjjhDvUkzz9zhr+OwIRlliWfKv8y89J A==;
X-CSE-ConnectionGUID: iIuUBK+qR9e8ukDs0aeEKg==
X-CSE-MsgGUID: N9xEVea6R2ShNNy8a1rRdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23920038"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23920038"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:15:25 -0700
X-CSE-ConnectionGUID: boQFheXoSfaLODLacm9Qdw==
X-CSE-MsgGUID: /4KTkW2gRxyrBOm+B8Hh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32896284"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:15:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI 4/6] lib/igt_drm_fdinfo: Parse drm-total-cycles
Date: Tue, 21 May 2024 09:15:23 -0700
Message-ID: <20240521161525.159720-4-lucas.demarchi@intel.com>
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Link: https://lore.kernel.org/r/20240504064643.25863-12-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 4 ++++
 lib/igt_drm_fdinfo.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 9622d05b7..539d15056 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -265,6 +265,10 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
 			UPDATE_ENGINE(idx, cycles, val, DRM_FDINFO_UTILIZATION_CYCLES);
+		} else if (strstartswith(l, "drm-total-cycles-", &keylen)) {
+			idx = parse_engine(l + keylen, info,
+					   name_map, map_entries, &val);
+			UPDATE_ENGINE(idx, total_cycles, val, DRM_FDINFO_UTILIZATION_TOTAL_CYCLES);
 		} else if (strstartswith(l, "drm-total-", &keylen)) {
 			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index ea90edd79..35f43305b 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -44,6 +44,7 @@ struct drm_client_meminfo {
 enum drm_fdinfo_utilization {
 	DRM_FDINFO_UTILIZATION_ENGINE_TIME	= 1U << 0,
 	DRM_FDINFO_UTILIZATION_CYCLES		= 1U << 1,
+	DRM_FDINFO_UTILIZATION_TOTAL_CYCLES	= 1U << 2,
 };
 
 struct drm_client_fdinfo {
@@ -63,6 +64,8 @@ struct drm_client_fdinfo {
 	uint64_t engine_time[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	/* drm-cycles-<engine> values */
 	uint64_t cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
+	/* drm-total-cycles-<engine> values */
+	uint64_t total_cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
 
 	unsigned int num_regions;
 	unsigned int last_region_index;
-- 
2.43.0

