Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2797BC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 21:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15B610E71C;
	Thu, 25 Apr 2024 21:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lg7WwBrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD74A10E71C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714080478; x=1745616478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tPg0vkpraJ1Ge1Jt0uvWZ39MduPzOGa7qNQWEexlNNM=;
 b=Lg7WwBrHPy4gJTb1vglTd9lS+dMM9IMgR1AgWKxfRegRi2tC8ZJi5PhS
 5qr7acrnK2RxaJ7Yf3VEoK1XaP0cc1heBh6rcpDa5ju8YRpqWadkm40ug
 TOaudjeJWoMD+oU9E9N7TRlF32YzLo+wxvzeARWhT91+s89dzVoPCczcH
 qo5/NhbLQjS8CFQgst0sdBPv0xMhPe4Ek3Ee0s2fpsCZGo4pw2XN/OtI3
 dyl/WQ96MtqxrXOLk+w9LfQ+F34PibBNnpGJ8Av/ZBiBnQaHttgNw0Wid
 CZv6vEHzO0C/sB4wh8h8NKPg7oga7WSWCBtoJXJOa2bfnJbOZvqAU4gVq w==;
X-CSE-ConnectionGUID: LxtnK2mBTMaJWPvTE8v4/w==
X-CSE-MsgGUID: IiXT7BoWTy6YxHgB2xMGzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9666395"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9666395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 14:27:57 -0700
X-CSE-ConnectionGUID: F7hY+etQQu2zcKzB6Bta8A==
X-CSE-MsgGUID: t7rpeTk/S2yzgEL0zDYuAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56146344"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 14:27:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 09/21] lib/igt_drm_fdinfo: Stop passing key twice
Date: Thu, 25 Apr 2024 14:27:47 -0700
Message-ID: <20240425212747.2705901-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423234431.1959354-10-lucas.demarchi@intel.com>
References: <20240423234431.1959354-10-lucas.demarchi@intel.com>
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
index 3b2778eee..a3a27fcb1 100644
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
@@ -230,34 +218,36 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 
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
@@ -267,25 +257,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
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

