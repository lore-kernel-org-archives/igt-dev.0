Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A85CD129A
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDC611393B;
	Fri,  5 Apr 2024 06:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLlXv3TL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2359113936
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296873; x=1743832873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TO23JQ6D/bL3679V/GLxmg3MDF0F1N6uI3OB7uwOs9I=;
 b=OLlXv3TLHtVMtb7sQlbKskBZ98aw7nJOS6TYTbNUtjXIjJIkxu4XAc8z
 5AdVr1JTWI521l7qR4bPGflbcyLLsZbb132/oOxk9OGz/noOLtTLZiBwn
 GgKmnKlgXaL7TKrszWPYqtwjN2zu4XQSyl2KgH65DO8xwXMwixnYxp+1F
 b/lZA1HmontwgrsWqbvWUBmsIQFLxr1AOapgDiF71B3mlGUegtDxqcOcJ
 IoWoXmvDWlgMHQsq8t+rl9Ysn7ueO8V2pIxrQ/yuGyySPLNunTgWhd3yL
 xNZOAr8e5YKcCDaXp2PCXK9VZDsgWIry169cer5+bEtPD4RmWvBoFaAz/ w==;
X-CSE-ConnectionGUID: awfBY+9YSWuiT74dTF5bIQ==
X-CSE-MsgGUID: qe094ehCRCy44uNbiMtecw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121749"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121749"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:12 -0700
X-CSE-ConnectionGUID: 6g7CE741TCemwHKC344C/w==
X-CSE-MsgGUID: 7qeHph1SRUSfZ8zCspp6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615829"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 08/12] lib/igt_drm_fdinfo: Store 2 counters for "ticks"
 unit
Date: Fri,  5 Apr 2024 01:00:52 -0500
Message-ID: <20240405060056.59379-9-lucas.demarchi@intel.com>
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

When using "ticks" as the unit for engine busyness, 2 counters are
expected. Add the second counter and store it inside the info, together
with the unit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 39 ++++++++++++++++++++++++++++-----------
 lib/igt_drm_fdinfo.h |  7 +++++++
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 1541a62c9..12da1d699 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -63,7 +63,7 @@ static const char *ignore_space(const char *s)
 
 static int parse_engine(const char *name, struct drm_client_fdinfo *info,
 			const char **name_map, unsigned int map_entries,
-			uint64_t *val, const char **unit)
+			uint64_t *val, uint64_t *val2, const char **unit)
 {
 	const char *p;
 	char *end_ptr;
@@ -111,6 +111,11 @@ static int parse_engine(const char *name, struct drm_client_fdinfo *info,
 	if (p == end_ptr)
 		return -1;
 
+	if (val2) {
+		p = end_ptr;
+		*val2 = strtoull(p, &end_ptr, 10);
+	}
+
 	if (unit)
 		*unit = end_ptr;
 
@@ -218,7 +223,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		return 0;
 
 	while ((l = strtok_r(_buf, "\n", &ctx))) {
-		uint64_t val = 0;
+		uint64_t val = 0, val2 = 0;
 		size_t keylen;
 		const char *v, *unit;
 		char *end_ptr;
@@ -245,21 +250,33 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
 		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
-					   name_map, map_entries, &val, NULL);
+					   name_map, map_entries, &val, NULL, NULL);
 			if (idx >= 0) {
 				info->capacity[idx] = val;
 				num_capacity++;
 			}
 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
-					   name_map, map_entries, &val, &unit);
-			if (idx >= 0 && !strcmp(unit, " ns")) {
-				if (!info->capacity[idx])
-					info->capacity[idx] = 1;
-				info->busy[idx] = val;
-				info->num_engines++;
-				if (idx > info->last_engine_index)
-					info->last_engine_index = idx;
+					   name_map, map_entries, &val, &val2, &unit);
+			if (idx >= 0) {
+			       if (!strcmp(unit, " ns")) {
+				       if (!info->capacity[idx])
+					       info->capacity[idx] = 1;
+				       info->busy[idx] = val;
+				       info->unit[idx] = DRM_CLIENT_ENGINE_UNIT_NS;
+				       info->num_engines++;
+				       if (idx > info->last_engine_index)
+					       info->last_engine_index = idx;
+			       } else if (!strcmp(unit, " ticks")) {
+				       if (!info->capacity[idx])
+					       info->capacity[idx] = 1;
+				       info->busy[idx] = val;
+				       info->busy2[idx] = val2;
+				       info->unit[idx] = DRM_CLIENT_ENGINE_UNIT_TICKS;
+				       info->num_engines++;
+				       if (idx > info->last_engine_index)
+					       info->last_engine_index = idx;
+			       }
 			}
 		} else if (strstartswith(l, "drm-total-", &keylen)) {
 			idx = parse_region(l + keylen, info,
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index 1999c4f2b..7f5bafd2a 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -41,6 +41,11 @@ struct drm_client_meminfo {
 	uint64_t active;
 };
 
+enum drm_client_engine_unit {
+	DRM_CLIENT_ENGINE_UNIT_NS = 0,
+	DRM_CLIENT_ENGINE_UNIT_TICKS,
+};
+
 struct drm_client_fdinfo {
 	char driver[128];
 	char pdev[128];
@@ -51,6 +56,8 @@ struct drm_client_fdinfo {
 	unsigned int capacity[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	char names[DRM_CLIENT_FDINFO_MAX_ENGINES][256];
 	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
+	uint64_t busy2[DRM_CLIENT_FDINFO_MAX_ENGINES];
+	uint8_t unit[DRM_CLIENT_FDINFO_MAX_ENGINES];
 
 	unsigned int num_regions;
 	unsigned int last_region_index;
-- 
2.44.0

