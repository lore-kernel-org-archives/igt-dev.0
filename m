Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8474CD1284
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A712B113938;
	Fri,  5 Apr 2024 06:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bst+bSZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DCD113937
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296871; x=1743832871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S8DMLXluyVsYjATMH08my+SpaEO2JOQC6CNjEJC3btE=;
 b=Bst+bSZO+h7QqVNs8VORYL2UcjZoUZm6gj5gAtjmqPmoyFXe4CilUbUV
 VOnNb54em8zOpJuFiJ6xN9CExaZsw2z+nUEUCLJ4K1W3XRA/e+ELHD4oO
 i3R2eWZfDWCpSJz+6NX11pOyxoQ6foDAyVUbGLHk4AcZJl9aJSCnPbUTQ
 9RFfGPgsmfXlmJ93pwID+V06C2ExtdsUoSfxORmoRdMc8n6IZYQvwDyA7
 CQnye7kf6zgGGdzcRx/BR47qIFmzl8k78He1rxMtROqJT5jWGBdWcGHYN
 GLwpln891gnEWhZY//lrUb6Hq8DOwo4HH2baXffU5o2Q77GVMnanSgERn g==;
X-CSE-ConnectionGUID: iVexw6FATmS961hbMea90w==
X-CSE-MsgGUID: sJMUGM6xTU+1x4dz1l75Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121732"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121732"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:09 -0700
X-CSE-ConnectionGUID: cbAuVunLRgycRbzzmZSJUQ==
X-CSE-MsgGUID: z/fFGVK8RmGwVT2XOtUyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615798"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 01/12] lib/igt_drm_fdinfo: Stop passing key twice
Date: Fri,  5 Apr 2024 01:00:45 -0500
Message-ID: <20240405060056.59379-2-lucas.demarchi@intel.com>
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

Change strstartswith() so it also returns the length, which then can be
used inside the branch when it matches. A good compiler shall optimize
out the strlen call since the argument is a constant literal.

With this, the find_kv() is not needed anymore and the difference with
regard the other branches can be summarized with a new ignore_space()
helper and the fact it matches the entire key by appending the ':'. The
helper is added on top of the file so it can be reused later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 87 +++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 42 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 18dbb5d0b..bfc946f24 100644
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
@@ -104,23 +112,6 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
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
-	for (p++; *p && isspace(*p); p++)
-		;
-
-	return *p ? p : NULL;
-}
-
 static int parse_region(char *line, struct drm_client_fdinfo *info,
 			size_t prefix_len,
 			const char **region_map, unsigned int region_entries,
@@ -205,6 +196,11 @@ out:
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
@@ -222,31 +218,39 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 
 	while ((l = strtok_r(_buf, "\n", &ctx))) {
 		uint64_t val = 0;
+		size_t keylen;
 		const char *v;
 		int idx;
 
 		_buf = NULL;
 
-		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
-			strncpy(info->driver, v, sizeof(info->driver) - 1);
-			good++;
-		}  else if ((v = find_kv(l, "drm-client-id",
-					 strlen("drm-client-id")))) {
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
@@ -256,25 +260,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
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
2.44.0

