Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C160CD1297
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8093B1120F1;
	Tue,  2 Apr 2024 22:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PF65GVuj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4423A1120E5
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sZCb0jgZxMSm28i3mxJ9Dw3+dmjru1TM86ee5yU6LqQ=;
 b=PF65GVujo+Yuzu3ZVZWu/YMlazNDreeq65Kc9mHFUC2u1IAJidAwvPoh
 UEtLFX8+Z0VciDpJz3cqti09UeBMgO4HCUJ5LXd8Zafh27tRe5qOa6YLI
 5B2V4NyZNRvgUHRS7zKDFy5XoM7lhCsLjuWVejt2dXHFs6p3A/uKym6M6
 FSSgoOg0xZK9O06tR0IYpwO46oDF7saizRTJpIIrSlafB9V5IV/YBsn74
 rRh9OBixEnLYDUhgQsRFJjfsq0NOQyKiPR87U/NPPJfk5rtWSza36P5y6
 3/QMKjy4n1+VJELCb4KRAOpXTzAOpncX3hy3tiC80QlvdyOlf2LIEBiAj A==;
X-CSE-ConnectionGUID: W35r7pxyRkmxrYyhdh7BJA==
X-CSE-MsgGUID: bswhV3s+S5CxLScb/i8O/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424332"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:58 -0700
X-CSE-ConnectionGUID: d3nglXCTTaeZ2ouIVIijJg==
X-CSE-MsgGUID: moZAhQPMSlGEAG+2Gf9oBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035613"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 7/8] lib/igt_drm_fdinfo: Remove prefix arg from parse
 functions
Date: Tue,  2 Apr 2024 15:17:15 -0700
Message-ID: <20240402221716.1840148-8-lucas.demarchi@intel.com>
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

The prefix is not really needed and __igt_parse_drm_fdinfo()
can simply pass l + keylen as argument which simplifies the parse
functions.

While refactoring this, it also replaces the remaining calls to index()
to use strchr().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 69 ++++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 41 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index a0b41e956..7a9ae94f0 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -61,25 +61,23 @@ static const char *ignore_space(const char *s)
 	return s;
 }
 
-static int parse_engine(char *line, struct drm_client_fdinfo *info,
-			size_t prefix_len,
+static int parse_engine(const char *name, struct drm_client_fdinfo *info,
 			const char **name_map, unsigned int map_entries,
 			uint64_t *val)
 {
-	ssize_t name_len;
-	char *name, *p;
+	const char *p;
+	size_t name_len;
 	int found = -1;
 	unsigned int i;
 
-	p = index(line, ':');
-	if (!p || p == line)
+	p = strchr(name, ':');
+	if (!p)
 		return -1;
 
-	name_len = p - line - prefix_len;
+	name_len = p - name;
 	if (name_len < 1)
 		return -1;
-
-	name = line + prefix_len;
+	p++;
 
 	if (name_map) {
 		for (i = 0; i < map_entries; i++) {
@@ -105,40 +103,30 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 	}
 
 	if (found >= 0) {
-		while (*++p && isspace(*p));
+		p = ignore_space(p);
 		*val = strtoull(p, NULL, 10);
 	}
 
 	return found;
 }
 
-static const char *ignore_space(const char *s)
-{
-	for (; *s && isspace(*s); s++)
-		;
-
-	return s;
-}
-
-static int parse_region(char *line, struct drm_client_fdinfo *info,
-			size_t prefix_len,
+static int parse_region(const char *name, struct drm_client_fdinfo *info,
 			const char **region_map, unsigned int region_entries,
 			uint64_t *val)
 {
-	char *name, *p, *unit = NULL;
-	ssize_t name_len;
+	const char *p;
+	size_t name_len;
 	int found = -1;
 	unsigned int i;
 
-	p = index(line, ':');
-	if (!p || p == line)
+	p = strchr(name, ':');
+	if (!p)
 		return -1;
 
-	name_len = p - line - prefix_len;
+	name_len = p - name;
 	if (name_len < 1)
 		return -1;
-
-	name = line + prefix_len;
+	p++;
 
 	if (region_map) {
 		for (i = 0; i < region_entries; i++) {
@@ -170,20 +158,19 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
 	if (found < 0)
 		goto out;
 
-	while (*++p && isspace(*p))
-		;
+	p = ignore_space(p);
 	*val = strtoull(p, NULL, 10);
 
-	p = index(p, ' ');
+	p = strchr(p, ' ');
 	if (!p)
 		goto out;
+	p++;
 
-	unit = ++p;
-	if (!strcmp(unit, "KiB")) {
+	if (!strcmp(p, "KiB")) {
 		*val *= 1024;
-	} else if (!strcmp(unit, "MiB")) {
+	} else if (!strcmp(p, "MiB")) {
 		*val *= 1024 * 1024;
-	} else if (!strcmp(unit, "GiB")) {
+	} else if (!strcmp(p, "GiB")) {
 		*val *= 1024 * 1024 * 1024;
 	}
 
@@ -251,14 +238,14 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			v = ignore_space(v);
 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
 		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
-			idx = parse_engine(l, info, keylen,
+			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
 			if (idx >= 0) {
 				info->capacity[idx] = val;
 				num_capacity++;
 			}
 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
-			idx = parse_engine(l, info, keylen,
+			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
 			if (idx >= 0) {
 				if (!info->capacity[idx])
@@ -269,23 +256,23 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 					info->last_engine_index = idx;
 			}
 		} else if (strstartswith(l, "drm-total-", &keylen)) {
-			idx = parse_region(l, info, keylen,
+			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, total, val);
 		} else if (strstartswith(l, "drm-shared-", &keylen)) {
-			idx = parse_region(l, info, keylen,
+			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, shared, val);
 		} else if (strstartswith(l, "drm-resident-", &keylen)) {
-			idx = parse_region(l, info, keylen,
+			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, resident, val);
 		} else if (strstartswith(l, "drm-purgeable-", &keylen)) {
-			idx = parse_region(l, info, keylen,
+			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, purgeable, val);
 		} else if (strstartswith(l, "drm-active-", &keylen)) {
-			idx = parse_region(l, info, keylen,
+			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, active, val);
 		}
-- 
2.43.0

