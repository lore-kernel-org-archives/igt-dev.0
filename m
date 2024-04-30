Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51BCC25B10
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 19:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748CC112E71;
	Tue, 30 Apr 2024 19:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzYXAN6k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900BC112E6D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714503688; x=1746039688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5TFYQbONu808t9fRxDfBIsmvlGiH7vxQOhjny4I5lOg=;
 b=ZzYXAN6kYYpyWUv1f1CcsaA7j0gHB/cns3PjcJ6M9DlBeYBNEa51wqKk
 2rQrtk8AyLLVyspgSaCd8qpt9OAgIK19R5pyS3Ys9ie3xQ5VsBm+eSLgr
 RERWNxehvGUVziY57fLHDslkrcINHUdrcWoJnW5Z5KEhAogXRTLYAWOo0
 FU1ohtR/jUZDFpJOvUTF6v3w3wVDZQna8y4YS0Hw64MebHQQQGHPv9UBd
 qugve5Gr3GmYfRTJnCuG2mTWTJEzPOAaEaS57EGrM4vJslsi/wsFj5Tg3
 uaxCK4tGvjyg3ARjPe1+rU7r9covRD4wIXTmAPfv2mcDqi00AAiQJ9Usd Q==;
X-CSE-ConnectionGUID: 4bnOdiGXQu2o2zZwQ3ZklQ==
X-CSE-MsgGUID: UWtZbQ2FTGCicTfD1BL/jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14025091"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14025091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
X-CSE-ConnectionGUID: SILwYJGDRaCdUXiWH/EBRg==
X-CSE-MsgGUID: ga2y3Mh5TIeX5FTukpmYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="26570788"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [CI 2/6] lib/igt_drm_fdinfo: Assert pdev is not truncated
Date: Tue, 30 Apr 2024 12:01:46 -0700
Message-ID: <20240430190150.3654507-2-lucas.demarchi@intel.com>
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

Since strncpy() may truncate the output, just assert we have enough
room for the string. It's not a big problem since we always copy 1 byte
less than the capacity and info->pdev is zero-allocated. But we may as
well be sure we aren't truncating it.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index a1f4ad10d..bc3082d42 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -237,6 +237,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			good++;
 		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
 			/* optional */
+			assert(strlen(v) < sizeof(info->pdev));
 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
 		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
 			idx = parse_engine(l, info,
-- 
2.43.0

