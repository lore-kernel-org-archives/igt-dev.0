Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DA2E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 23:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135C610E0DD;
	Wed, 18 Dec 2024 23:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZu9b+o7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F207110E0DD
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 23:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734565152; x=1766101152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sBmBBxI55HOqpqCLznAl8pCRwoAmdtV6yjfPMutTt4Q=;
 b=DZu9b+o7B1/Fhwnr4x9tq37q7s+ttEgxdS7hJap/W/L70TzVXlirwPEf
 XkbJ19XMFQUzsTLkDXxcGqV2Ien04eSsPYyglKPyMRJ6raY+4W44QTMH7
 xpC6RyktFtQmcGJCDuO90afvoaUDvxoH1fJtEggapSXarBjJZv3eNmD2H
 fBgyn/92H+5PukXMwLrP7kDV6EfCLl2uUjwZ2juI0Ci/j2EpgNwNpbS6c
 DKA6YQXAOQReJEtYGGrWRpwGAIP7gCHcIILzpchP7GYSA82VlZZSxXqgT
 96f+4fEjArEfuiGUnUmfvCuI0eBT7FPFBepns7Whm4TdwnUsm/H0s4UAy A==;
X-CSE-ConnectionGUID: JLHS1H6eTWuQzoRUBAJmMQ==
X-CSE-MsgGUID: oFu+xzXhRnSsTHCkwfbQ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38844372"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="38844372"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 15:39:12 -0800
X-CSE-ConnectionGUID: jcMUg0IUQgmiwCM+ZnXfRQ==
X-CSE-MsgGUID: EDJrirFqRAGmWuqwyqgXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="97800865"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 15:39:09 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kmod: fix check to confirm correct driver
 unload
Date: Wed, 18 Dec 2024 15:38:29 -0800
Message-ID: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The driver variable is a string, so we need to pass it in as a variable
for the driver name instead of stringifying it.

Fixes: e5edf7ea7 ("lib/igt_kmod: add support for Xe driver")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d58867d7e..a8b0339b9 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -731,7 +731,7 @@ igt_intel_driver_unload(const char *driver)
 	igt_kmod_unload("drm_kms_helper");
 	igt_kmod_unload("drm");
 
-	if (igt_kmod_is_loaded("driver")) {
+	if (igt_kmod_is_loaded(driver)) {
 		igt_warn("%s.ko still loaded!\n", driver);
 		return -EBUSY;
 	}
-- 
2.43.0

