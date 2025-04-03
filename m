Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6767AC3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 11:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0C910E224;
	Thu,  3 Apr 2025 11:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNx7H/Rn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B5E10E224
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743681238; x=1775217238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i93cueP1MErOhDApdEQ+8AbWR/1UdSmxVkX34fWa7Pg=;
 b=kNx7H/Rne3ul+Fs9DLFB1c4TBS3ckCtXUL2FEQCNyRV3f8zmHqMJkEDA
 6Qup5kXHC89e0cd6nohRgDuJRBSs1ZT5n6KAFl9I5s4sVyHh9TukjL3SL
 pwllt8YHWaa5raD/pV+2aeTcLiLOT0l03do6k8DY5id5TK+RpdBGlto+u
 Z2S2s+rNNiFUppAkQgL/PB6CRUyXvZIa/LgMgqyo/gF9eVCRThyAc/lhI
 DDs0yb8vo8LsNh24tJeVszwCWNOXAsTjxxFW6r9LlIqcVi69eGdVScdRM
 Qy5GkTyqJJK3SMF2z1hIHIbN0+bmqdUoFcSAkLIQIfvBPw73yc5pR5Sol A==;
X-CSE-ConnectionGUID: 7V2KEQXxQSqCP0yh6PTyPQ==
X-CSE-MsgGUID: v/CMXcpUSWGMiPoxK5LJkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56450757"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56450757"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 04:53:57 -0700
X-CSE-ConnectionGUID: Fjm8Oi+UQTurMzSBvTECZA==
X-CSE-MsgGUID: /dlGIZ+1RnOCVewjOR+pZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127919860"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 04:53:55 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_sip_eudebug: skip eudebug
 tests on VF
Date: Thu,  3 Apr 2025 11:53:07 +0000
Message-Id: <20250403115307.232213-1-jan.sokolowski@intel.com>
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
A way to check for that scenario is to check eudebug toggle
capability.

Skip a test that tries to use eudebug toggle if it doesn't
exist.

v2: Changed the idea from disabling a single test to disabling
all possible tests.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
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

