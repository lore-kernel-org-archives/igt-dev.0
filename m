Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9654ECD37BE
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 17:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6F010E819;
	Mon, 11 May 2026 17:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFZXEDby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA5A10E850
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778520003; x=1810056003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lyx249vEop2wgzfHgbKx6RwCl+HYsqChdR+nctO5pyA=;
 b=cFZXEDbyPcbmAk9BQX9YGD2YYNXIOmY1P1kQNSVKG+fdRdwpm2lFRegZ
 nH2FPWRA0CBtKtfowue5kBqgBQK80mH1z3d2dFQa640R3LH7saq7gbMgO
 kIXiaUHhfSvctj5ldqO59epgGgJYj7Uti7QYaeXUribiVWWooDBei+d8t
 Ya05oIFK+lCYn5nq09ISxNh/nqK/t6GWVMqgXAF6kqbCePuWlj06ZHnpf
 iHLrDTjcXQbAioWm1kcmisSOuccKCQ3Dh1MjQDvv7WprldzYHHwOXaCHX
 C10f8XnJob9D781vxTpV5cZJwoyTHlcKJiB4X/sSUWqNBi/MvlGSi1QJp A==;
X-CSE-ConnectionGUID: CCWaWQKSRZes4Ets9L4tfA==
X-CSE-MsgGUID: f6IT8E4nQbGM5mU38vM8WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="81979816"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="81979816"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:20:03 -0700
X-CSE-ConnectionGUID: PjtmHeLjR5qmwxxgIBvQ+g==
X-CSE-MsgGUID: Py76fkatRtKqOd6C2+NqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="233192526"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:20:01 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v4 0/7] Enable and Add new tests for DC3CO
Date: Mon, 11 May 2026 22:48:13 +0530
Message-ID: <20260511171820.461666-1-jeevan.b@intel.com>
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

Enable DC3CO tests for PSR/PR for display versions >= 35, add a new
test for DC3CO to validate frame drops, and test DC3CO with LOBF.

v3: Adds a test to verify DC3CO continues to function properly
    after a DC6 power cycle and rename function name in first patch.
v4: Add a new test to verify DC3CO continues to function after a
    frame-gap of more than 6. 

Jeevan B (7):
  tests: s/check_dc_counter/assert_dc_counter
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add new test for dc3co framedrop validation
  tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6
  tests/intel/kms_pm_dc: Add dc3co-vpb-framegap subtest

 tests/intel/kms_pm_dc.c | 304 +++++++++++++++++++++++++++++++++++++---
 tests/kms_vrr.c         |  34 +++++
 2 files changed, 319 insertions(+), 19 deletions(-)

-- 
2.43.0

