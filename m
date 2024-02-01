Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ED6C47DB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 00:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CC110FE04;
	Thu,  1 Feb 2024 00:47:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C55910FE03
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 00:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748464; x=1738284464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4wor7ZnDnJbNct9g0K4fxGnoTL41RftFVxri2WIzl8Q=;
 b=hpecjvj5Ikg36s/6XzuZSoNPV7hRwgMJwcVuOE00LHe3Zo7c98OOviuA
 wqHSriy/ahwxXgMZsHrVApP8ptGYhPDBCxtEk+oyLhp2U8WuxUqbGeTqb
 2EdzU6hXHlk8u+ycQyYdFkEX8cOEr1YYW9TuqXGuoHEPkAGjm/aKgIb6j
 r29bolCeTOrHDx1MfkNF5trMDqJm+vIZgbTEppq0zJEMHZTgeF2C3jvvR
 fwPGBVJbON7uiaPaey2uHGgfiFtU4/il6SipcYKVsIbokker4aD7XuSDy
 AHLwgA8ICQk0kZFW1q17eBMpER8WYOO8wpyB3DUeOqamb6mSiMATU3yAq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3635849"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="3635849"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119789348"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="1119789348"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:47:38 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] lib/igt_drm_fdinfo: Mandatory drm-fields first
Date: Wed, 31 Jan 2024 16:46:25 -0800
Message-ID: <20240201004744.352041-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201004744.352041-1-lucas.demarchi@intel.com>
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

drm-driver and drm-client-id are 2 keys that should be on any driver's
implementation of fdinfo. Move them earlier so it's clear what the
"good" tracking is doing.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 5c0ccf624..17cac4009 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -233,12 +233,13 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
 			strncpy(info->driver, v, sizeof(info->driver) - 1);
 			good++;
-		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
-			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
 		}  else if ((v = find_kv(l, "drm-client-id",
 					 strlen("drm-client-id")))) {
 			info->id = atol(v);
 			good++;
+		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
+			/* optional */
+			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
 		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
 			idx = parse_engine(l, info,
 					   strlen("drm-engine-capacity-"),
-- 
2.43.0

