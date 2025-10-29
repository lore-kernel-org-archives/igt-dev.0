Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39B8CCD1BF
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 03:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667D210E0D3;
	Wed, 29 Oct 2025 03:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FihbC8W2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274BE10E0D3
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 03:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761707121; x=1793243121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BA927TRNTSe0UtLXdxbdDICXWaDLTuHfisa52VT1/jQ=;
 b=FihbC8W2Dk6FutLGGah3+JWz2e5WBgSSzWIHYTNeeNjZ1Agjr7raAVPV
 I7kaylJIf5Ybnb1viyPAk3BBwHTIz+SoLPunEIDa7aNcHrOoNuSQ+o3co
 u22xvClzN7NpOMLCpszUIG9QmmrGCBdVjJA9ri3C8Hd5CYuBCVfY+q6n0
 A+rA1y0tp+2dkqSNbz78X0UluvKhsYV1Bo1phI3nj3DjJrGZkoipzAUhC
 d70LENx1duFr4ajuEhDYKauJsumc3Fy6wNepAlAsXf6ploxn1tdasrWf3
 XFeP44TXd7K+x0bXgJWg7LLV1q+W/BduyOvEu42jXKI/D3gwsTEwHeyd6 A==;
X-CSE-ConnectionGUID: qXygY9aZQQe5Uh36inb/Jg==
X-CSE-MsgGUID: AcVm9LoDRmeMbxhziFNk/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75267236"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="75267236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 20:05:20 -0700
X-CSE-ConnectionGUID: KS0NF5nrTgeGYA/psZca8Q==
X-CSE-MsgGUID: OL+CKP4dToKGocrQcdMD2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="189585813"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 20:05:16 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jouni.hogander@intel.com,
 vinod.govindapillai@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] intel-ci: Update PTL and lnl display blocklist
Date: Wed, 29 Oct 2025 08:30:17 +0530
Message-Id: <20251029030017.749145-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028055607.735698-1-santhosh.reddy.guddati@intel.com>
References: <20251028055607.735698-1-santhosh.reddy.guddati@intel.com>
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

Remove frontbuffer_tracking subtests from PTL blocklist
Include fbc and psr2 concurrent tests to blocklist for ptl and lnl as
invalid.

v2: Update the commit message to reflect the changes and add blocklist
for lnl also. (Karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel-ci/xe.lnl.display.blocklist.txt | 8 +++-----
 tests/intel-ci/xe.ptl.display.blocklist.txt | 6 ++----
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index fd2065659..cd1e6d19c 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -162,12 +162,10 @@ igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
 #########################################
 igt@kms_joiner@basic-max-non-joiner
 #########################################
-# FBC with PR/PSR2 is a valid skip
+# FBC with PSR2 is a valid skip
 #########################################
-igt@kms_psr2_sf@fbc-pr-.*
-igt@kms_psr2_sf@fbc-psr2.*
-igt@kms_psr@fbc-psr2.*
-igt@kms_psr@fbc-pr.*
+igt@kms_psr@fbc-psr2-.*
+igt@kms_psr2_sf@fbc-(psr2|pr)-.*
 #########################################
 # DRRS not supported on LNL+
 #########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 4c3803235..27261fa00 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -153,12 +153,10 @@ igt@kms_pipe_stress@stress-xrgb8888-xtiled
 ##############################################################################
 igt@kms_bw@.*4-displays.*
 ##############################################################################
-# Expected skip on PTL, FBC + PSR is unsupported
+# Expected skip on PTL, FBC + PSR2 is unsupported
 ##############################################################################
-igt@kms_front_buffer_tracking@fbcpsr-.*
-igt@kms_psr@fbc-(psr|psr2|pr)-.*
+igt@kms_psr@fbc-psr2-.*
 igt@kms_psr2_sf@fbc-(psr2|pr)-.*
-igt@kms_front_buffer_tracking@plane-fbc-rte
 ##############################################################################
 # Expected skip on PTL, UJ not supported
 ##############################################################################
-- 
2.34.1

