Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220B5C25B76
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876E9112AE1;
	Sat,  4 May 2024 06:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMjT8PK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0530112AD8
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805159; x=1746341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cXpox+nM+oeL6Z+P5bW+dCpyBnMaG+nXhDLB8sv/G48=;
 b=fMjT8PK1YIvio2RNJZi3csxMtLH23Snu+8ywawcGBn4osauNaWPznt/4
 V0YJ+Pl0qw/ZNEFeSnvPtlVE6ymYjT2tfy+xXbNnZsrx/XcUb+umshjFl
 IoBBazW9MuYoY9fJzBlaOLMV8YLtZLDmwWlTENPs4gX9rDCKaMmgpwVK7
 fAq1xCKZOQDA7ZQ1PW/at9dn5XfG2BlHBpcg0DRuYC4IuKhwMrHrZtQxM
 RACIpu0KkvOsPpG2N0w8DVS7kK2j24XmvLgYShkzc98/PbuE1MGH8I2eo
 7MhlJp4WxaSP02cD/cxQ+hl3vo6uTmVXbXekH5z16/g3yFZdcUKeH/HY5 Q==;
X-CSE-ConnectionGUID: U6M2yo0LRMWv+mFvWqDDOw==
X-CSE-MsgGUID: x4IYJwdkTXO4DOBAJ8WBfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545757"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545757"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
X-CSE-ConnectionGUID: ftnQgaxuSSuk7ZcCVPTORw==
X-CSE-MsgGUID: IiPCJH2BQCeLXquO6b0YiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169812"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 07/13] lib/igt_drm_fdinfo: Start tracking available
 engine keys
Date: Fri,  3 May 2024 23:46:37 -0700
Message-ID: <20240504064643.25863-8-lucas.demarchi@intel.com>
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

Start tracking what are the available keys related to engine utilization
that were parsed from fdinfo. This can be later used by application to
make decisions on which of them to use.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 7 ++++---
 lib/igt_drm_fdinfo.h | 8 ++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index f0a30677c..79b72c54d 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -190,10 +190,11 @@ out:
 		}							\
 	} while (0)
 
-#define UPDATE_ENGINE(idx, engine, val)					\
+#define UPDATE_ENGINE(idx, engine, val, utilization_key)		\
 	do {								\
 		if (idx >= 0) {						\
 			info->engine[idx] = val;			\
+			info->utilization_mask |= utilization_key;	\
 			if (!info->capacity[idx])			\
 					info->capacity[idx] = 1;	\
 			if (!engines_found[idx]) {			\
@@ -259,11 +260,11 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
-			UPDATE_ENGINE(idx, busy, val);
+			UPDATE_ENGINE(idx, busy, val, DRM_FDINFO_UTILIZATION_ENGINE_TIME);
 		} else if (strstartswith(l, "drm-cycles-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
-			UPDATE_ENGINE(idx, cycles, val);
+			UPDATE_ENGINE(idx, cycles, val, DRM_FDINFO_UTILIZATION_CYCLES);
 		} else if (strstartswith(l, "drm-total-", &keylen)) {
 			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index 17a47f94a..3f641d79d 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -41,6 +41,11 @@ struct drm_client_meminfo {
 	uint64_t active;
 };
 
+enum drm_fdinfo_utilization {
+	DRM_FDINFO_UTILIZATION_ENGINE_TIME	= 1U << 0,
+	DRM_FDINFO_UTILIZATION_CYCLES		= 1U << 1,
+};
+
 struct drm_client_fdinfo {
 	char driver[128];
 	char pdev[128];
@@ -51,6 +56,9 @@ struct drm_client_fdinfo {
 	unsigned int capacity[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	char names[DRM_CLIENT_FDINFO_MAX_ENGINES][256];
 
+	/* mask of enum drm_fdinfo_utilization parsed from fdinfo */
+	unsigned int utilization_mask;
+
 	/* drm-engine-<engine> values */
 	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	/* drm-cycles-<engine> values */
-- 
2.43.0

