Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C71D729EC
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 17:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2621B10E354;
	Fri, 29 Nov 2024 17:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGcKOcIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B489D88735
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732902182; x=1764438182;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+zXe3VgGGOfpWNWxhoYEcd9N577FtnI7koFlYyTpKxE=;
 b=LGcKOcIA4k+piepDYpbfBKUxm/5Hk1SOl2TvC+8yPUDEECdh48ls7/sR
 NVVWpLAwDX5+lJeVU/dgC91iD2DDGSJcNFjxQt9xFDAYSl6XccKIlBH8f
 7+KOmjFF+XcLFSW/eJSC0ewazVFFT/op9umG1xuTs2u06KVI6/61XwywL
 XHPNug4MbPkbN4qmZYWLl2N0uP1FHRVAX0z2MhQSAoSTABqMMKeiOUVAP
 8oXh20ffK78tT8B/aNPvCF4WFaLa+dSDHrGh8FGvBosyJkBIASQ3IUrpZ
 my9utfarXwaaAmxlTZkZbgSajuUb88rRsIw+t23Zf0fXIH9pnYoNRhELD Q==;
X-CSE-ConnectionGUID: xTHpsYwGQ3yY06YhP92WZw==
X-CSE-MsgGUID: P//3xdY5QgK3cEtSyTRV1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32504127"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="32504127"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 09:43:02 -0800
X-CSE-ConnectionGUID: 50WLw6wTT8uqoF/oWeYhNw==
X-CSE-MsgGUID: zx44XyWUTUSTm7YYHUyxew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="97644731"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.148])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 09:43:01 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/pciids: add missing PTL pciid
Date: Fri, 29 Nov 2024 17:42:21 +0000
Message-ID: <20241129174221.313955-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
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

It's there on KMD side but missing in IGT.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 32480b556..7883384ac 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -829,6 +829,7 @@
 	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
 	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__)
+	MACRO__(0xB0A2, ## __VA_ARGS__), \
+	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.47.0

