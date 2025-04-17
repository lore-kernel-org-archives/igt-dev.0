Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B401C369C2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 23:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C923E10E1A9;
	Thu, 17 Apr 2025 23:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmZvl5jU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555D310E1A9
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 23:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744934249; x=1776470249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gd8wnZeT/6FlxOZwy7CFcoAZsfxwHjBKTpfcshlgvQs=;
 b=MmZvl5jUJnswRHXcNq8ix3FsXnf0y2F/6+lKn8MArNvRqIq3ZcbOeRTe
 seekfggQ4ReiF7NQRLD5DSiAT5IC3nIpv4qJg/x6G5GrTtlmNX7QaaDB/
 9MeNoV68APgMw9+ODl4J/7WoAcF3eDJEt6QOdhaaq/kyHqJSXjjZeIfgO
 evfkawcp6OOn+IKKtGFXlZaX+/gAtJUjfXiS2GC+6wePG/mBOWPOm12Wc
 wTzAJ6ltZM/GlxJBqGoPsI4vgzhkucJckqmP4BPAPTeVo3efZSQZ+vTNq
 sRAP70sMWo0F3ZmoVjeZwytyneM6sZZarWBPG2Q/1KoDTQOl6/gLq2KDy g==;
X-CSE-ConnectionGUID: FKLszsSfTFa1PM/s6k4smw==
X-CSE-MsgGUID: PcA4Vn/pQEe1HIk+UBzibA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46683058"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46683058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 16:57:29 -0700
X-CSE-ConnectionGUID: q5WsIseJSHWEi3HtjQKBVA==
X-CSE-MsgGUID: sMLMDeivRc+XEBhc0JJzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="131504505"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 16:57:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pxp: Terminate PXP on exit
Date: Thu, 17 Apr 2025 16:57:19 -0700
Message-ID: <20250417235720.1379479-1-daniele.ceraolospurio@intel.com>
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

Most of out tests expect to start their execution from a clean GPU state.
However, the PXP tests currently leave a PXP session running when they
complete, so follow up tests will not have a clean starting state; given
that PXP can impact the timing of some operations (e.g. suspend/resume),
this could pollute the results of those tests. Therefore, let's make
sure that PXP is de-activated before we exit.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel/xe_pxp.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 458d32322..3442396b2 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -1140,9 +1140,23 @@ static void termination_tests(int fd, bool pxp_supported, drmModeResPtr res,
 		}
 }
 
+int xe_fd = -1;
+
+static void exit_handler(int sig)
+{
+	/*
+	 * PXP can interact with some operations (e.g. suspend/resume), which
+	 * could impact the behavior of other tests if they unknowingly start
+	 * when PXP is already active. Therefore, let's make sure PXP is
+	 * de-activated before we exit.
+	 */
+	trigger_termination(xe_fd, PXP_TERMINATION_IRQ);
+	drm_close_driver(xe_fd);
+	usleep(50 * 1000); /* give time for the termination to be processed */
+}
+
 igt_main
 {
-	int xe_fd = -1;
 	bool pxp_supported = true;
 	drmModeResPtr res;
 
@@ -1151,6 +1165,7 @@ igt_main
 		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
 		pxp_supported = is_pxp_hw_supported(xe_fd);
 		res = drmModeGetResources(xe_fd);
+		igt_install_exit_handler(exit_handler);
 	}
 
 	igt_subtest_group {
@@ -1213,8 +1228,6 @@ igt_main
 		}
 	}
 
-	igt_fixture {
+	igt_fixture
 		drmModeFreeResources(res);
-		close(xe_fd);
-	}
 }
-- 
2.43.0

