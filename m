Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04CECD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870FD1120EA;
	Tue,  2 Apr 2024 22:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnCOzPww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2419B1120E7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cygGBZ2OkhgQQWygxYkyW9vTBOmlrDsp8bPPNreCLlk=;
 b=DnCOzPww2mIfyocv/RhqmP/mRFPN8HXfHR0iTipBl9BlWt0DRf9iNtj4
 oC30nmOoPcUa6JA0n4tnrSD80x+EBmivBuszxwmmK6cwfMlN8bstY19qV
 TFj5HK2dWXN1MKW8AO6dNfMZ+RfPIwk3dkf/BVIjppf1L7RNfhsR4+Jnl
 PIk9FXRK5+6/JaFzdzPyPJJzhJjel04cpn/G2HZk+Gxoz9X+g/QIJ7N3Y
 pdWlhT6GyO1Hj2zYMpzgcbJZo964JJWEMSDRKBu+z+nAyiJAlKqI4IUdq
 41zfDPMneljttJQ/HmQ58SnTO0VNLF4wZwJr3BamGr0ICDwZlt0ifdYBI Q==;
X-CSE-ConnectionGUID: exWK8kNkQpGLxelROik9lA==
X-CSE-MsgGUID: rTwSZxgvQPqAxDs+9Wx3iA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424328"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
X-CSE-ConnectionGUID: c+cTWMIDQsmLsZN/xVe5Jw==
X-CSE-MsgGUID: t8tvRSy8SaybKU4FXxHlQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035607"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 5/8] lib/igt_drm_fdinfo: Simplify find_kv()
Date: Tue,  2 Apr 2024 15:17:13 -0700
Message-ID: <20240402221716.1840148-6-lucas.demarchi@intel.com>
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

index() is deprecate from libc and strchr() should rather be used.
Moreover the return value is NULL or a pointer to the occurrence, never
the initial string and `(p - buf) != keylen` can only be true if ':' is
the next char after the key.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 17cac4009..15f71e172 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -106,20 +106,17 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 
 static const char *find_kv(const char *buf, const char *key, size_t keylen)
 {
-	const char *p = buf;
+	const char *p;
 
 	if (strncmp(buf, key, keylen))
 		return NULL;
 
-	p = index(buf, ':');
-	if (!p || p == buf)
-		return NULL;
-	if ((p - buf) != keylen)
+	p = buf + keylen;
+	if (*p != ':')
 		return NULL;
 
-	p++;
-	while (*p && isspace(*p))
-		p++;
+	for (p++; *p && isspace(*p); p++)
+		;
 
 	return *p ? p : NULL;
 }
@@ -233,8 +230,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
 			strncpy(info->driver, v, sizeof(info->driver) - 1);
 			good++;
-		}  else if ((v = find_kv(l, "drm-client-id",
-					 strlen("drm-client-id")))) {
+		}  else if ((v = find_kv(l, "drm-client-id", strlen("drm-client-id")))) {
 			info->id = atol(v);
 			good++;
 		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
-- 
2.43.0

