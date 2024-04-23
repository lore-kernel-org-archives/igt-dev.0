Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11667C25B5C
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC1311376E;
	Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3IW4Sb2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DE5113768
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5FV9BL7vCywEwG45WVFE4C/zC/Y2TO/UVcOi4nnoIt4=;
 b=i3IW4Sb2p0sFydH9OpMAUWmZ124KMYpxiLo/LH5TtLtoI49qf0W/TIsS
 bm+7vpZlcgDkz/uI94GVOgRYy4SWBA/is4G9N6So8tDL9s1vtPcfDtJl5
 2rhegxdXKEMkGCv+EErWpgtE5zq0By5gKiJ5HX+rivAPbAY0J5R/9HnWP
 1JK50BGOwjgK+1O/dWKbjKSUiL9klrU0uu/qyp/ZTrV/cDE76xAuZ0fdl
 rZWxNsaWuHEUaD5a/qfhmym08zbMhS4l4fAsFIrrjcGv5dPpperTK7I9Y
 ZG2PI146QtE3Y6eqbnoSIDKrptY/D76leOQsXUWMWTfp0gNpA4qd/S7F1 g==;
X-CSE-ConnectionGUID: FuYz3VLcSduqLQANhXc0SA==
X-CSE-MsgGUID: CEO2jdVCQa+rYLTFj6EIMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361988"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361988"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
X-CSE-ConnectionGUID: 4uTSXdb+Rqm3D6RhnwxwBA==
X-CSE-MsgGUID: ay7HSokFR2u+nY0ZxaZtEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180904"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 04/21] lib/igt_drm_fdinfo: Stop ignoring space where
 not needed
Date: Tue, 23 Apr 2024 16:44:14 -0700
Message-ID: <20240423234431.1959354-5-lucas.demarchi@intel.com>
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

strto[ul]l() family of functions already ignore leading spaces. There's
no need to be explicit.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index b700ec317..cab677df2 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -97,10 +97,9 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 		}
 	}
 
-	if (found >= 0) {
-		while (*++p && isspace(*p));
+	p++;
+	if (found >= 0)
 		*val = strtoull(p, NULL, 10);
-	}
 
 	return found;
 }
@@ -172,9 +171,8 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
 	if (found < 0)
 		goto out;
 
-	while (*++p && isspace(*p))
-		;
-	*val = strtoull(p, NULL, 10);
+	p++;
+	*val = strtoull(p, &p, 10);
 
 	p = index(p, ' ');
 	if (!p)
-- 
2.43.0

