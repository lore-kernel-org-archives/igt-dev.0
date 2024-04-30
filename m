Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2BFC10F16
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 19:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EE9112E6D;
	Tue, 30 Apr 2024 19:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaByj+rm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FE6112E6D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714503689; x=1746039689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5FV9BL7vCywEwG45WVFE4C/zC/Y2TO/UVcOi4nnoIt4=;
 b=UaByj+rmx4xxSHJtHRTDRKCp33d+k24sF8OpoL01K2gGmo3yYD6K3Voz
 NuE9R7FBLDUU5OfUrpcgChn8dQKnmzSo2y7wgiopExBgNTljoueuUYFOi
 x6aVvfIHzAx9FZ/UyJ/RWIKI9gHNsHNk2oKkJwwc0ydIeMAYW1XdpTbHw
 QuxMtk2YUqM5TOUdQ217INGOcLXFDuzXXEJZtAtdgTCnBfuOflGBGZbZL
 sExu/AQbrvjXbotEldjYyLYMeWa6Z9sFV0oH+eJtKtM3iHhqnMuojRrf6
 sYicGqUcwRjhq2dzVbI09UYksjLlRKxpwolcfRPI/LU4u0Bu8+lCw09yX w==;
X-CSE-ConnectionGUID: o12LoUfIRLilRTWNenlffg==
X-CSE-MsgGUID: P6fcH/XdQIuJB2B6yyUdiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14025095"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14025095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
X-CSE-ConnectionGUID: xEnh+6SdREm0J/ze1yN7eg==
X-CSE-MsgGUID: Ika2tNQuRnioGXjHetw2KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="26570794"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [CI 4/6] lib/igt_drm_fdinfo: Stop ignoring space where not needed
Date: Tue, 30 Apr 2024 12:01:48 -0700
Message-ID: <20240430190150.3654507-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430190150.3654507-1-lucas.demarchi@intel.com>
References: <20240430190150.3654507-1-lucas.demarchi@intel.com>
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

