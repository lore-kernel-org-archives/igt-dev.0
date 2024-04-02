Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15965CD1294
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3E01120E9;
	Tue,  2 Apr 2024 22:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uage7u9c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356461120E8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=frGlJ7AV2VYbtMxUBK+p6gYaDYOx51CHhmibskJT9aE=;
 b=Uage7u9cdKBt0v0oHcTxJHAsko0zvkTZ/8CePzR9JdgKxMa2A2xIzSj5
 lHpqjXOAevlQjlXuQo6P0avdnvU/V3Fbg/4gaHay4n4pGhC24XXNu/Tp8
 7aIBQQK1aSBGalrRpTsHqjK66728Le8kwkXhoLA3EPt/QpAm9p0hb9fGd
 611uv//Rbka5adj0hdkpvdX2KVtGQzXROmFDq/wsp6PWPOgUkxrxF/uA7
 xxuG5JjFMkboM1YmNHvWCg1XOBLCz7E7ClSoTKE1vTG37b3f7A2wAonRH
 dtQJi6zpX0HZFEUWBFaqaIDdOIQ2lPZzG0FN4lyveVC33Wsw1Ax0Nm6M0 Q==;
X-CSE-ConnectionGUID: HuWOpsXfTMCSwCb6BK33Cg==
X-CSE-MsgGUID: XJ5flCTmRe+q88XJkk/6QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424330"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:58 -0700
X-CSE-ConnectionGUID: oimYI/nvQFmNV1uQZMs6Qw==
X-CSE-MsgGUID: qx5DL0U+STSobaY2MlwhBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035610"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 6/8] lib/igt_drm_fdinfo: Stop passing key twice
Date: Tue,  2 Apr 2024 15:17:14 -0700
Message-ID: <20240402221716.1840148-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402221716.1840148-1-lucas.demarchi@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 84 +++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 15f71e172..a0b41e956 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -53,6 +53,14 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
 	return count > 0 ? count : 0;
 }
 
+static const char *ignore_space(const char *s)
+{
+	for (; *s && isspace(*s); s++)
+		;
+
+	return s;
+}
+
 static int parse_engine(char *line, struct drm_client_fdinfo *info,
 			size_t prefix_len,
 			const char **name_map, unsigned int map_entries,
@@ -104,21 +112,12 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 	return found;
 }
 
-static const char *find_kv(const char *buf, const char *key, size_t keylen)
+static const char *ignore_space(const char *s)
 {
-	const char *p;
-
-	if (strncmp(buf, key, keylen))
-		return NULL;
-
-	p = buf + keylen;
-	if (*p != ':')
-		return NULL;
-
-	for (p++; *p && isspace(*p); p++)
+	for (; *s && isspace(*s); s++)
 		;
 
-	return *p ? p : NULL;
+	return s;
 }
 
 static int parse_region(char *line, struct drm_client_fdinfo *info,
@@ -205,6 +204,11 @@ out:
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
@@ -222,30 +226,39 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 
 	while ((l = strtok_r(_buf, "\n", &ctx))) {
 		uint64_t val = 0;
+		size_t keylen;
 		const char *v;
 		int idx;
 
 		_buf = NULL;
 
-		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
-			strncpy(info->driver, v, sizeof(info->driver) - 1);
-			good++;
-		}  else if ((v = find_kv(l, "drm-client-id", strlen("drm-client-id")))) {
-			info->id = atol(v);
-			good++;
-		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
-			/* optional */
+		if (strstartswith(l, "drm-driver:", &keylen)) {
+			v = l + keylen;
+			v = ignore_space(v);
+			if (*v) {
+				strncpy(info->driver, v, sizeof(info->driver) - 1);
+				good++;
+			}
+		}  else if (strstartswith(l, "drm-client-id:", &keylen)) {
+			v = l + keylen;
+			v = ignore_space(v);
+			if (*v) {
+				info->id = atol(v);
+				good++;
+			}
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
@@ -255,25 +268,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
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

