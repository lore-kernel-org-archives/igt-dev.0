Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F71C4345F
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9387112ADA;
	Sat,  4 May 2024 06:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKl6OZke";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9160E112AD9
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805159; x=1746341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pGr8MPJLBQwcNkRcut0agct/P4MqwJW72PP4JweaTDY=;
 b=nKl6OZkeWgASXL1zRtcBRIq72s7Pk5mh73ZImEJf5Rgosyhtge9qyXMS
 L2B4lFBNU3gbTjse5QY+ieI5mrW0iWY9VSK5zhyfiLaSfazeNvIYmobnX
 a1ReluNBO+JoK01o7SllAP0BaAZ69Rmec+Mt4y9K5v8ZayEOhCrrRCckt
 5Ead0ijO52v1A6UkpNqZ75l0Pkw8M2+6LGc1KlG5kLVMh1HjfJ8paS8Sy
 eqqqXDX7ord6cFJm/QP1YxYNGxcTQNTROdDd6XWZ5acizeHm0XZPGPEb5
 X2nl9CFkX0yIEku24Z5PD278wasWAURIvOmO7beTakbI8nEBwvsp16Amd A==;
X-CSE-ConnectionGUID: HsQjS15zQTSlM7cIM847MA==
X-CSE-MsgGUID: pnwe0ZTcT5yILvM4nrRTuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545753"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
X-CSE-ConnectionGUID: zPp0Pm/6SuOM7MWlpVnkPQ==
X-CSE-MsgGUID: +imxF7WZQEmO7I9P6/+c+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169806"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 05/13] lib/igt_drm_fdinfo: Remove prefix arg from
 parse functions
Date: Fri,  3 May 2024 23:46:35 -0700
Message-ID: <20240504064643.25863-6-lucas.demarchi@intel.com>
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

The prefix is not really needed and __igt_parse_drm_fdinfo()
can simply pass l + keylen as argument which simplifies the parse
functions.

While refactoring this, it also replaces the remaining calls to index()
to use strchr().

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 254f4c52b..2d8ad8b81 100644
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
@@ -112,25 +110,24 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 	return found;
 }
 
-static int parse_region(char *line, struct drm_client_fdinfo *info,
-			size_t prefix_len,
+static int parse_region(const char *name, struct drm_client_fdinfo *info,
 			const char **region_map, unsigned int region_entries,
 			uint64_t *val)
 {
-	char *name, *p;
+	char *p;
 	ssize_t name_len;
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
 
-	name = line + prefix_len;
+	p++;
 
 	if (region_map) {
 		for (i = 0; i < region_entries; i++) {
@@ -237,14 +234,14 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			v = ignore_space(l + keylen);
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
@@ -255,23 +252,23 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
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

