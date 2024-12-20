Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB96BE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 19:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A278510E4C0;
	Fri, 20 Dec 2024 19:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SP0XPnvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1047810E4C0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 19:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734721495; x=1766257495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nI1ejg8AzdXEB+ghBn45gpMNXc2OpDqSoUmVnHWpiH0=;
 b=SP0XPnvv5BvTpBUNd4hQfPluiX24BKkQlvd6j290J2SEn00OPFp5CMII
 d90RO+Lx6LTb/w6UHM1HLMxpgydfvgynETgwDZIuNber0yBRZSTwvsQ6d
 BLOMfNBKlfwqWWBaAN6EX6dg1z4e4EL/9nwdCa7h7iXsaYiY0pylDjo7N
 DlkPOGaHy3cGd9kFZ13Q3Q4xsMD5SvZXLueLl5gqiPLAxGbxg456F7bhb
 RoQl3GCqzODsxfze3dm3mT06rESiCXamQu9b4MksYioxDAiGnGb+jcwTi
 hwX+Y/zwxnc/D8twAhHdIqjOOlYBDlM4pEN7VhScv7/4838Luk4L6JDT6 A==;
X-CSE-ConnectionGUID: L8Oke3hCQQ2nE9f5aNx5kw==
X-CSE-MsgGUID: /zhVIbwASFigXWsNNxZU6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34993397"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34993397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:04:55 -0800
X-CSE-ConnectionGUID: fafRzuYxTSaVaXFDLyR6Tg==
X-CSE-MsgGUID: QQqVBBH7QkujKcdKQX6alw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98360076"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:04:54 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 1/3] lib/igt_kmod: fix check to confirm correct
 driver unload
Date: Fri, 20 Dec 2024 11:04:38 -0800
Message-ID: <20241220190440.2543689-1-daniele.ceraolospurio@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index ed283c14b..d73cb4101 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -723,7 +723,7 @@ igt_intel_driver_unload(const char *driver)
 	igt_kmod_unload("drm_kms_helper");
 	igt_kmod_unload("drm");
 
-	if (igt_kmod_is_loaded("driver")) {
+	if (igt_kmod_is_loaded(driver)) {
 		igt_warn("%s.ko still loaded!\n", driver);
 		return -EBUSY;
 	}
-- 
2.43.0

