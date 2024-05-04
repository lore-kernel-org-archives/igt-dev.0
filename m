Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB669C25B75
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD72112ADB;
	Sat,  4 May 2024 06:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHNwykPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909B0112AD7
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805159; x=1746341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9t3GfTqgdB0y5UlfqQ7pij8CUTyUY8rZztZ8J5wbs1A=;
 b=hHNwykPkrAvdtZGHp4AWMoJ7OEyMH9rk3M/Gs+jWISTE+PFJrOdJ8YeX
 SQ/7bw5dvw3LoN/J3PnrFsKAAo3O/EkoMEN5EfXih1qu57e1Sk34+yKlg
 2LZtHUR7TEDPHxC9btKRXsO5CWL3RqyCUslV/KqBh1vbEwMKOVDiMm/XT
 nnza1NAebMvv9rzweOno4E1YHn8YFOgN157fJm4K/xYjZQO3774rJyO9M
 LjKjV6I4NAwRj204vv5Pbs34bSM9jYlIW3WTUxbSdns6uEQ/+ksbodumY
 N/+WukIZtU0n84Kv8s4R2ASgyNh4FHnuv9O3QOBxpAEh38ZtrA9fic9Zu Q==;
X-CSE-ConnectionGUID: Twn4ydesSUO9b1OfaS7grA==
X-CSE-MsgGUID: 551wQQX0SwOf84ucymd9og==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545751"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545751"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
X-CSE-ConnectionGUID: f7L+ovdoSXujLVJogV262Q==
X-CSE-MsgGUID: QHN+jDHhS9+j8vU0pyZjbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169803"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 04/13] lib/igt_drm_fdinfo: Stop passing key twice
Date: Fri,  3 May 2024 23:46:34 -0700
Message-ID: <20240504064643.25863-5-lucas.demarchi@intel.com>
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

Change strstartswith() so it also returns the length, which then can be
used inside the branch when it matches. A good compiler shall optimize
out the strlen call since the argument is a constant literal.

With this, the find_kv() is not needed anymore and the difference with
regard the other branches can be summarized with a new ignore_space()
helper and the fact it matches the entire key by appending the ':'. The
helper is added on top of the file so it can be reused later.

v2: Fix missing ignore_space() on drm-driver and drm-pdev

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 71 +++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 41 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 3b8e79a35..254f4c52b 100644
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
@@ -210,6 +193,11 @@ out:
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
@@ -227,34 +215,36 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 
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
+			v = ignore_space(l + keylen);
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
+			v = ignore_space(l + keylen);
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
@@ -264,25 +254,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
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

