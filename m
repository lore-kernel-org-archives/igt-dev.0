Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A69FC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 09:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C7B10E6A1;
	Tue, 15 Apr 2025 09:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkD7aw/E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0874C10E6A1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744709009; x=1776245009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O9OX99G7PWVl8Emd/gfHVRfxGoombUDfmlfZUPmeUI0=;
 b=PkD7aw/EvHyMMdF0bJti+kVFMSBjsgvawBU85VRXYTMCfNbA2jAWrMnB
 soxPFmT3xN2d2PME7inCckWa0E+fmuzixynF/fES3Oja4Uh76n0n+KoT7
 dQlkzTm9ofQ3wy9g4SKr8ySv38LJ9p/QsrDARE44V8Py0xT1PLA6gh0xu
 ZZ4jVWHjgJumf235Pf/2CctjVodo9gA8wuUlDAJgo9Wa6oFF3I2Au45jL
 YMKDx9C1JVX3DgxCs6dfaJmvJ/99KqwkAns8J+cgAsJkwPYwiPGCx5Eby
 W6RcP2IrW2ah56d7IsnOSGxbiGoPb1hsuvHCX8bzZ3whijSgg9of1Ygy4 g==;
X-CSE-ConnectionGUID: JY+C+482Q3W6os9gc4C1DQ==
X-CSE-MsgGUID: XiQEN5g3TqGwlZGZn96PBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46124154"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46124154"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:23:29 -0700
X-CSE-ConnectionGUID: DjJyZ64gTJCk/FwjnifYAg==
X-CSE-MsgGUID: uVIW+0DITAaul7HuVikXLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130072250"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:23:26 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 1/1] lib/xe/xe_eudebug: skip when disabling eudebug
 with no eudebug support
Date: Tue, 15 Apr 2025 09:22:17 +0000
Message-Id: <20250415092217.11835-1-jan.sokolowski@intel.com>
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

Tests using eudebug are not compatible with VF functionality.
In such scenarios attempting to toggle eudebug support fails,
which causes the test to fail, but we should instead
skip it.

Skip a test that tries to use eudebug toggle if it doesn't
exist.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index ec946058b..667c31c6e 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1794,10 +1794,7 @@ bool xe_eudebug_enable(int fd, bool enable)
 	bool old = false;
 	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
 
-	if (ret) {
-		igt_skip_on(enable);
-		old = false;
-	}
+	igt_skip_on(ret);
 
 	return old;
 }
-- 
2.34.1

