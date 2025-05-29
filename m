Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7025AC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 06:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D30510E037;
	Thu, 29 May 2025 06:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vu/XYGwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1473410E6FB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748500206; x=1780036206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WfxFkalqnwicwIyvpEaphVZaVRHxCp3Ap1Wt63491Vc=;
 b=Vu/XYGwrY21jCQCi7rMyjFnOHkVmLtD7yZV/GY6SWpuOxxFOa6jbtOqC
 bdo94+4YVpvwEbK+1hz0CYg4A8EPjV2KMOhd21HEIp61cOL1YMnUSH12U
 +RHPpDv0CPK39YelbxNki6kATtP5sc/qkctiROIsJTw0uah9ZE/IAXbfv
 MOBIUSCK0sGGLUNZwnSE/xCTCPYiwmPwygQ0qEJAKOTeKgzbBm69mVEyb
 ee7vSel+8T2bqGr62VZgANudADT2AfNkC38Kshs+mvvq73JGMDOMxAYM3
 3ZxVLYwq+Ntc7JuGFOisnNnAjQ1kr7mpgWODbCp5WN+3pwUmzL5y9L7dW A==;
X-CSE-ConnectionGUID: CXtyz138RnmKxefgbWrs+w==
X-CSE-MsgGUID: 2FUeEWIPTCqTcX//eA2EXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54210910"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="54210910"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:05 -0700
X-CSE-ConnectionGUID: /h7J5DMuTVWsRA0kvxoafw==
X-CSE-MsgGUID: DfhcGpm8SkO4jSsygCkg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="174347275"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v2 0/4] Add render-node,
 gt reset and suspend engine activity tests
Date: Thu, 29 May 2025 12:23:55 +0530
Message-ID: <20250529065359.915117-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add tests to validate engine activity on render node, after gt reset,
suspend and multi-client.

Also add a test to validate engine activity by opening PMU fd after
starting the cork

Tests added:

1) engine-activity-gt-reset
2) engine-activity-suspend
3) engine-activity-after-load-start
4) engine-activity-render-node-idle
5) engine-activity-render-node-load
6) engine-activity-render-node-load-idle
7) engine-activity-multi-client

Rev2: Add multi-client test
      fix render node test
     
Riana Tauro (4):
  tests/intel/xe_pmu: Validate engine activity on gt reset and suspend
  tests/intel/xe_pmu: Add tests to validate engine activity on render
    node
  tests/intel/xe_pmu: Add a test to validate engine activity after
    starting load
  tests/intel/xe_pmu: Add multi client engine activity test

 tests/intel/xe_pmu.c | 161 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

-- 
2.47.1

