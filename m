Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E28C83F27
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 03:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CAA10E3E3;
	Thu, 17 Jul 2025 03:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrmhlQqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297D10E3E3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752722430; x=1784258430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B+yV+Vil/A3BNfmbgy17JdqPU2ZT3oWndv1F13dpVus=;
 b=LrmhlQqXWDJuJFP/qGOXcCeTgyGBetQwXpJZSQuWDzihK9iPC/xlUAnl
 q75d/tPRDsc9/n1/dkz8A1SaLOlufkJJrRPEVq4rZK/Kl8CBcCvh8aTiR
 y5B8kmKsB1UnRH0eA/rh7wWwseUpjyjWhok9BnhA6li7BR2jIQjs/Efij
 w0l99/R4Qsj4peQV8KUwdRsCL0Mw0yB7ZHG/xAt//91y+BodrHfmCnE81
 N57CMfGvXIScfvl+6SZhvtRlK4BN9C1lwwfS9INw5sB01kTJIFhaQ92ob
 o/lalvpMu+k2LPgnVTNLGJbmD9T+Ei1pzNLmSrWPPqJX6ss+RO3Phkxr0 w==;
X-CSE-ConnectionGUID: /HjlwS8/Ry2XiikwprJzjA==
X-CSE-MsgGUID: 3b0fYT3DTC6XzvsTOtPMCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58791418"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="58791418"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 20:20:30 -0700
X-CSE-ConnectionGUID: P3GeUv5lT2mzdVQGQINlTA==
X-CSE-MsgGUID: F24dmPh9SnS4GnrlL47APw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="157776410"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 20:20:29 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: peter.senna@linux.intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/kms_debugfs: Add a commit after
 igt_fit_modes_in_bw
Date: Thu, 17 Jul 2025 08:50:31 +0530
Message-ID: <20250717032031.1065575-1-karthik.b.s@intel.com>
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

A commit is required after igt_fit_modes_in_bw as this function only
does a try commit.

Fixes: ebe65a923a2b ("tests: Add kms_debugfs")
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index f8a3360e6..75ef15353 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -66,6 +66,8 @@ static void igt_display_all_on(igt_display_t *display)
 
 	/* Skip if bandwidth is insufficient for all simultaneous displays */
 	igt_require(igt_fit_modes_in_bw(display));
+
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
 /**
-- 
2.43.0

