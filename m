Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F679CD1296
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FD011393F;
	Fri,  5 Apr 2024 06:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SA54CJiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75979113939
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296872; x=1743832872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F6K0P4gP/QoqYDYOc1RpxITk0jAD/OIgdjm3NyYOLro=;
 b=SA54CJiAaNliWll/WAGF1r0Ww2J2S/2/L8X3+NvXvytCsCxyYYtA+Hlq
 oPfEkZXe/Ki4oJV7rH9jYtUY65Tu1M6xCKm5WXfWjcgLs+br9yOq7XfA9
 ahkpAxAOytoI2dfT02DxMKAr5TlCxKJ/gf+41GxRRdz+9SG3JiCVUosGj
 Ywlq14r5/Bdp10qIJmpSTaHgxgPdPfvNz1vssxTy7gmqm1hyG0xUzIs/V
 8HHlBdFRzNGI9y7x7odh7jmR0bQUcnOKH19AGUy7sYcKvpwMYOnxzkDUn
 12jfZWbCMl/pcIWVVAUoNTpCN+QKzP973QdaUjPmnwzTw/qscQOsc2IE9 w==;
X-CSE-ConnectionGUID: zy2bJnI/RISP1h4Djmp2kQ==
X-CSE-MsgGUID: q8y4qxadQ66MNMbJ32W/+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121746"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121746"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:12 -0700
X-CSE-ConnectionGUID: qqjQqvMjRt6dvxKQR+c7Uw==
X-CSE-MsgGUID: v5ZC59K2TmiZvWvV/lBy6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615825"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 07/12] lib/igt_drm_fdinfo: Parse unit for engine
 utilization
Date: Fri,  5 Apr 2024 01:00:51 -0500
Message-ID: <20240405060056.59379-8-lucas.demarchi@intel.com>
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

Kernel adds a " ns" at the end of engine utilization. Make sure we parse
it so we don't fail if there's another suitable unit chosen by the
driver or another format.

This prepares the ground for xe driver which will use 2 timestamps
rather than 1 with a different unit, to make sure it's compatible with
SR-IOV so we don't have to handle the conversion between GPU and CPU
clock domains.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 5f05f210e..1541a62c9 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -63,9 +63,10 @@ static const char *ignore_space(const char *s)
 
 static int parse_engine(const char *name, struct drm_client_fdinfo *info,
 			const char **name_map, unsigned int map_entries,
-			uint64_t *val)
+			uint64_t *val, const char **unit)
 {
 	const char *p;
+	char *end_ptr;
 	size_t name_len;
 	int found = -1;
 	unsigned int i;
@@ -103,8 +104,15 @@ static int parse_engine(const char *name, struct drm_client_fdinfo *info,
 		}
 	}
 
-	if (found >= 0)
-		*val = strtoull(p, NULL, 10);
+	if (found < 0)
+		return found;
+
+	*val = strtoull(p, &end_ptr, 10);
+	if (p == end_ptr)
+		return -1;
+
+	if (unit)
+		*unit = end_ptr;
 
 	return found;
 }
@@ -212,7 +220,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 	while ((l = strtok_r(_buf, "\n", &ctx))) {
 		uint64_t val = 0;
 		size_t keylen;
-		const char *v;
+		const char *v, *unit;
 		char *end_ptr;
 		int idx;
 
@@ -237,15 +245,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
 		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
-					   name_map, map_entries, &val);
+					   name_map, map_entries, &val, NULL);
 			if (idx >= 0) {
 				info->capacity[idx] = val;
 				num_capacity++;
 			}
 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
-					   name_map, map_entries, &val);
-			if (idx >= 0) {
+					   name_map, map_entries, &val, &unit);
+			if (idx >= 0 && !strcmp(unit, " ns")) {
 				if (!info->capacity[idx])
 					info->capacity[idx] = 1;
 				info->busy[idx] = val;
-- 
2.44.0

