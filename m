Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2FFC4345F
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70319112AD5;
	Sat,  4 May 2024 06:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X57gexWZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B12112ADA
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805159; x=1746341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yIHq5yxbTeI//CCbv61p9lWfHLn3EbDI3qY0goqXJZg=;
 b=X57gexWZ2bSf84+w+2ZdGY/kBFxFMwQE1aiXLGAcvCdh1gm2OHggC/DF
 LFM64bR4grouhncceBErAO2fe0XFNzTm1VS/R5iz30PAC5vDQIhegNboB
 CsOEee6zz4fh9JMYAKVcCbgRDSohwRW7xciLOXEC/srvHw1JKwGFNvD8F
 xYgG3AOMACwFn9RM4h/uRS9ScWi8MqOCpKeuz94vA7kMSe1mnD8/Jzj/4
 3FngblBL9M4PImoQ3dI32voZOjmjaOPEUtwiFhRh1nejajhZNgEXuN+sK
 HennSz9Oz4UhMqCLtqnP0S5u1vqbjTiZX/OoYGx9Qu1TuahQPcFMueMdX w==;
X-CSE-ConnectionGUID: Hjn+nmn7SRKkuVXFyN6Wtw==
X-CSE-MsgGUID: i+++MfDQQgSfppLKCh0hdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545755"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545755"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
X-CSE-ConnectionGUID: iYzRFvT1QTCyML7ULmQOTw==
X-CSE-MsgGUID: zF4Mhyw8S/S0OzzjmX2JHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169809"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 06/13] lib/igt_drm_fdinfo: Parse drm-cycles
Date: Fri,  3 May 2024 23:46:36 -0700
Message-ID: <20240504064643.25863-7-lucas.demarchi@intel.com>
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

Read drm-cycles from fdinfo and save it for later use. Like with the mem
regions, allow the number of engines to be updated regardless if
drm-engine-* or drm-cycles-* shows up first.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 29 +++++++++++++++++++++--------
 lib/igt_drm_fdinfo.h |  4 ++++
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 2d8ad8b81..f0a30677c 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -190,6 +190,21 @@ out:
 		}							\
 	} while (0)
 
+#define UPDATE_ENGINE(idx, engine, val)					\
+	do {								\
+		if (idx >= 0) {						\
+			info->engine[idx] = val;			\
+			if (!info->capacity[idx])			\
+					info->capacity[idx] = 1;	\
+			if (!engines_found[idx]) {			\
+				info->num_engines++;			\
+				engines_found[idx] = true;		\
+				if (idx > info->last_engine_index)	\
+					info->last_engine_index = idx;	\
+			}						\
+		}							\
+	} while (0)
+
 #define strstartswith(a, b, plen__) ({					\
 		*plen__ = strlen(b);					\
 		strncmp(a, b, *plen__) == 0;				\
@@ -201,6 +216,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		       const char **region_map, unsigned int region_entries)
 {
 	bool regions_found[DRM_CLIENT_FDINFO_MAX_REGIONS] = { };
+	bool engines_found[DRM_CLIENT_FDINFO_MAX_ENGINES] = { };
 	unsigned int good = 0, num_capacity = 0;
 	char buf[4096], *_buf = buf;
 	char *l, *ctx = NULL;
@@ -243,14 +259,11 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
-			if (idx >= 0) {
-				if (!info->capacity[idx])
-					info->capacity[idx] = 1;
-				info->busy[idx] = val;
-				info->num_engines++;
-				if (idx > info->last_engine_index)
-					info->last_engine_index = idx;
-			}
+			UPDATE_ENGINE(idx, busy, val);
+		} else if (strstartswith(l, "drm-cycles-", &keylen)) {
+			idx = parse_engine(l + keylen, info,
+					   name_map, map_entries, &val);
+			UPDATE_ENGINE(idx, cycles, val);
 		} else if (strstartswith(l, "drm-total-", &keylen)) {
 			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index 1999c4f2b..17a47f94a 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -50,7 +50,11 @@ struct drm_client_fdinfo {
 	unsigned int last_engine_index;
 	unsigned int capacity[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	char names[DRM_CLIENT_FDINFO_MAX_ENGINES][256];
+
+	/* drm-engine-<engine> values */
 	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
+	/* drm-cycles-<engine> values */
+	uint64_t cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
 
 	unsigned int num_regions;
 	unsigned int last_region_index;
-- 
2.43.0

