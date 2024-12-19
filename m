Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2053E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 23:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870D010E2CE;
	Thu, 19 Dec 2024 23:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxjvsTN1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B400C10E4B2
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734649530; x=1766185530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eBGwUkUbf8jbrxT9BMrjvAqu1qqHBa+nszgO87cJv78=;
 b=mxjvsTN1r1yEUORlO/QWM/Q8LhfRJoHlqC42vKufKa6M5gppBz4CFVBX
 CUSUryNRzelXcUV2EM4SiozGDmC+eTGkN4boAfVof2T9Z8E/yYmlmbLX9
 XOEDHhZD0OunpHWO7GBuuUxmY4rWaG49beePnTDeNUUyRr5NPC8+wkndc
 1Q2ngR63+UCztij2uA21SVTQrvqjlTJ1ibEyr/WAA88oWnS8XfxlqGslI
 5p5ohNKN0vMzGdF/gNnGy48x8HtVTC3Ub7s2Ri92JGReC0lBIKYjarOs4
 q/sGdwnj2duLIG76fNwSyottjLBGHanWBSEehAq1IMtGeL86pmqGnM6QP A==;
X-CSE-ConnectionGUID: YJXFmDlWTzazDCmMmy3NIA==
X-CSE-MsgGUID: ImamuRxTTNinMrIdge2iyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45874515"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="45874515"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:05:30 -0800
X-CSE-ConnectionGUID: 3sjQmx2tQLGjrhuzwLckhw==
X-CSE-MsgGUID: vTCboR7WQzeEUcVSfpBxkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98141500"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:05:30 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/3] lib/igt_kmod: fix check to confirm correct
 driver unload
Date: Thu, 19 Dec 2024 15:05:15 -0800
Message-ID: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
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

