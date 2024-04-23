Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F29BC19F53
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9701113768;
	Tue, 23 Apr 2024 23:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7oDFUea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033B511376B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iCU3B3zVoiEAZPKo5KQ488x683GlxP0TWzTTk008XEo=;
 b=f7oDFUearZfS3w1XEJTIp8Leeig8oqiDBA77tkR5P5WIxOYeYF3iiCXR
 /y/8n6h6qy1rzVm8gh/cUwMZ2jmhyxnYA+0MhFOrAeSfLCYGC/NlV6hPD
 xn5ou5VX417qkiwnWz4UP5ZVkTzexmRriTvo7lDZQ1OJBI2YSsEf/bD4h
 RfjpIYaFmac64KtCv5TcMfBn1ERjqx388f08Y4Xq/g+m+0ygWB56kcC9Y
 OFO7SCAkp/754vdEe8QxFIReOfVcuGw5MYVVb1cbjqoKyTyk/doO85Oki
 6O3nAc0PbaNK4l8g3F5azQKli4d3QF2/WGHoswBWMj3IU9mpM4OTp+ie3 Q==;
X-CSE-ConnectionGUID: Sl4ZkHkERx6pN33xpF2CAg==
X-CSE-MsgGUID: yGCNVStlThmqox/ojgBTRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361998"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361998"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
X-CSE-ConnectionGUID: 9K27pNuhR5m/acxKyu+82g==
X-CSE-MsgGUID: OewnNR5IRvKMcDk0kctXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180919"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 09/21] lib/igt_drm_fdinfo: Stop passing key twice
Date: Tue, 23 Apr 2024 16:44:19 -0700
Message-ID: <20240423234431.1959354-10-lucas.demarchi@intel.com>
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

Change strstartswith() so it also returns the length, which then can be
used inside the branch when it matches. A good compiler shall optimize
out the strlen call since the argument is a constant literal.

With this, the find_kv() is not needed anymore and the difference with
regard the other branches can be summarized with a new ignore_space()
helper and the fact it matches the entire key by appending the ':'. The
helper is added on top of the file so it can be reused later.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 72 +++++++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 41 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 3b2778eee..e3a8ab0fd 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -112,23 +112,6 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 	return found;
 }
 
-static const char *find_kv(const char *buf, const char *key, size_t keylen)
-{
-	const char *p;
-
-	if (strncmp(buf, key, keylen))
-		return NULL;
-
-	p = buf + keylen;
-	if (*p != ':')
-		return NULL;
-
-	p++;
-	p = ignore_space(p);
-
-	return *p ? p : NULL;
-}
-
 static int parse_region(char *line, struct drm_client_fdinfo *info,
 			size_t prefix_len,
 			const char **region_map, unsigned int region_entries,
@@ -213,6 +196,11 @@ out:
 		}							\
 	} while (0)
 
+#define strstartswith(a, b, plen__) ({					\
+		*plen__ = strlen(b);					\
+		strncmp(a, b, *plen__) == 0;				\
+})
+
 unsigned int
 __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		       const char **name_map, unsigned int map_entries,
@@ -230,34 +218,37 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 
 	while ((l = strtok_r(_buf, "\n", &ctx))) {
 		uint64_t val = 0;
+		size_t keylen;
 		const char *v;
 		char *end_ptr;
 		int idx;
 
 		_buf = NULL;
 
-		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
-			strncpy(info->driver, v, sizeof(info->driver) - 1);
-			good++;
-		}  else if ((v = find_kv(l, "drm-client-id",
-					 strlen("drm-client-id")))) {
+		if (strstartswith(l, "drm-driver:", &keylen)) {
+			v = l + keylen;
+			if (*v) {
+				strncpy(info->driver, v, sizeof(info->driver) - 1);
+				good++;
+			}
+		}  else if (strstartswith(l, "drm-client-id:", &keylen)) {
+			v = l + keylen;
 			info->id = strtol(v, &end_ptr, 10);
 			if (end_ptr != v)
 				good++;
-		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
-			/* optional */
-			assert(strlen(v) < sizeof(info->pdev));
+		} else if (strstartswith(l, "drm-pdev:", &keylen)) {
+			v = l + keylen;
+			v = ignore_space(v);
 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
-		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
-			idx = parse_engine(l, info,
-					   strlen("drm-engine-capacity-"),
+		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
+			idx = parse_engine(l, info, keylen,
 					   name_map, map_entries, &val);
 			if (idx >= 0) {
 				info->capacity[idx] = val;
 				num_capacity++;
 			}
-		} else if (!strncmp(l, "drm-engine-", 11)) {
-			idx = parse_engine(l, info, strlen("drm-engine-"),
+		} else if (strstartswith(l, "drm-engine-", &keylen)) {
+			idx = parse_engine(l, info, keylen,
 					   name_map, map_entries, &val);
 			if (idx >= 0) {
 				if (!info->capacity[idx])
@@ -267,25 +258,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 				if (idx > info->last_engine_index)
 					info->last_engine_index = idx;
 			}
-		} else if (!strncmp(l, "drm-total-", 10)) {
-			idx = parse_region(l, info, strlen("drm-total-"),
+		} else if (strstartswith(l, "drm-total-", &keylen)) {
+			idx = parse_region(l, info, keylen,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, total, val);
-		} else if (!strncmp(l, "drm-shared-", 11)) {
-			idx = parse_region(l, info, strlen("drm-shared-"),
+		} else if (strstartswith(l, "drm-shared-", &keylen)) {
+			idx = parse_region(l, info, keylen,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, shared, val);
-
-		} else if (!strncmp(l, "drm-resident-", 13)) {
-			idx = parse_region(l, info, strlen("drm-resident-"),
+		} else if (strstartswith(l, "drm-resident-", &keylen)) {
+			idx = parse_region(l, info, keylen,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, resident, val);
-		} else if (!strncmp(l, "drm-purgeable-", 14)) {
-			idx = parse_region(l, info, strlen("drm-purgeable-"),
+		} else if (strstartswith(l, "drm-purgeable-", &keylen)) {
+			idx = parse_region(l, info, keylen,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, purgeable, val);
-		} else if (!strncmp(l, "drm-active-", 11)) {
-			idx = parse_region(l, info, strlen("drm-active-"),
+		} else if (strstartswith(l, "drm-active-", &keylen)) {
+			idx = parse_region(l, info, keylen,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, active, val);
 		}
-- 
2.43.0

