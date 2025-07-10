Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEB3C83F18
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 08:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26CD10E89B;
	Thu, 10 Jul 2025 08:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgacGycP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D8C10E89B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752134876; x=1783670876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/4wXFxlMsRPRr4jyVitEonnSpXK77zTABZsUWIkTulA=;
 b=WgacGycPzAtboeBWmdxb8AZ23gOb04tdYtt+C342CyzhStFeVhVrK4jt
 HH4bNrAW+sV2Tq53vG7wnd0GFnW8qcvs79aQcG5da7L6xis5zEvSCd5kS
 434/K+dWZyV6CujakEtRoXpbTdhMgFLVFwiu9gpZRlny8LzMqkE5HHvJf
 ix3sIOOq4aCvlvZkfVggVDonZZjW6/MDgQGojVUNVGPkK0dBiwRPreJoH
 H1eGHMT8M+nNeDhcIKLFlUcmriC9Zce0KuEoUGJ5zn5T4fwW47LzNJ4Jn
 Oq3K1rWzMkS8+wYUX7rsg8erQZaTyxzDCMilmzt6SehNr5WuMxBuvbPRk g==;
X-CSE-ConnectionGUID: wJuEjJQmSxytZb2cwglDgA==
X-CSE-MsgGUID: Hl6jcMZwTaKkcd5043Vjog==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54379545"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54379545"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:07:56 -0700
X-CSE-ConnectionGUID: wczG0K+YR76Mb+7QobMe5g==
X-CSE-MsgGUID: IhmDSbnRTvOTyCq9mf2ofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156114247"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:07:54 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/intel/xe_eudebug: Reduce debug loglevel
Date: Thu, 10 Jul 2025 08:09:28 +0000
Message-Id: <20250710080929.412509-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

This test exceeds disk usage limit on CI environment
due to logging too many logs.

Reduce the debug log level to a CI-friendly value
if it's bigger than that.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index d2a1932fb..4a2c43635 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -20,6 +20,7 @@
 #include <sys/prctl.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "xe/xe_eudebug.h"
@@ -2800,6 +2801,9 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		was_enabled = xe_eudebug_enable(fd, true);
+
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		update_debug_mask_if_ci(DRM_UT_KMS);
 	}
 
 	igt_subtest("sysfs-toggle")
-- 
2.34.1

