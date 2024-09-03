Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1127CD37AA
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 19:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6272C10E1C5;
	Tue,  3 Sep 2024 19:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aht+OumP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7B810E071
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725393587; x=1756929587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xck8DIEjek8EAGdcJvcRXY5Ryp9a2Ax5h7hUU4AYbfo=;
 b=Aht+OumPCgllV0aXxDCI9XZuOFPulR1AvmLMuzPZhCzQ4lnGSIi8tvq1
 frLhKVVFr1H3aIsIIgIdopQCBBPmyNYY9Yg5C2wEX46ywY8Hl6UROR9dB
 EjLmPwSYayIvsBrTc6XZZFUBY/Il2lUzCZP/SYUUaGtb9hRyEhxNT5AeS
 RLpT936Fb+k5XWsftcAMwVNRo1uZoi9wOWiih7zuXWSoIL/nvxQvsVoeG
 RhedLguZR8bWpdHzoFh/nzKB3SdJXP4ykyF96w3PANKIfojFrMwZC8BPy
 pg+whTSAJjB8BvexnQn+mpD2lqAjFT9q/6U2y1Wlg4boVgV7DX3qNaEhj A==;
X-CSE-ConnectionGUID: UusmvuvoQv26TeyxqAMXIA==
X-CSE-MsgGUID: EYqFapiqRNCjQ1yCJvtZcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34587315"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="34587315"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 12:59:46 -0700
X-CSE-ConnectionGUID: 9qcdvyXmQvKM1Jliiay1Zg==
X-CSE-MsgGUID: u1z+/URfRXWXax5I6iGVeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69183811"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 12:59:45 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/kms_psr: DP2.1 PR IGT Fixes
Date: Wed,  4 Sep 2024 01:29:16 +0530
Message-ID: <20240903195917.1527829-1-ramanaidu.naladala@intel.com>
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

This patch set contains fixes for DP2.1 Panel Replay issues we have
found while debugging the code. These issues are related to DP2.1
monitor always being MST. Also wrong usage of SRD_STATUS and
PSR2_STATUS registers are fixed.

Naladala Ramanaidu (1):
  tests/intel/kms_psr: Add condition to check for eDP output before
    asserting PSR update

 tests/intel/kms_psr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.43.0

