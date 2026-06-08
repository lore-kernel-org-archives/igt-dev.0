Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514A9CD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 05:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9BB10ECFD;
	Mon,  8 Jun 2026 05:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRs5tjof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3042F10ECFC
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780896109; x=1812432109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z+Xh5MA1Wnf/EoytuxNXujA7mv0bySr1QjwJGHZWvEc=;
 b=lRs5tjof/bnucybtjQjTYyXjtZntjtbk5pBiHlQSfXe+3PyBPiv9E7fP
 JcCGV8k7iRBYAZz3ab8rsl/xNcE5+bK7rozR4oUxNEkw1ut4VJXkGDTNv
 bSyspUJHTAYPdaalwUy/ygYeFtzsoHMJNQeRXnG2J18WChQskS7YsfTJB
 HFWsKQntjCBJDtiITEbNzOuLSyofi9mBbkUTf97IsRvpd/PeuJN9B3fny
 kpuUl7o81ENtudW5D875fDPsuMnE2v1FT2hd7JVJU7Cceu3E2a48VgTHp
 JIiiVTjEJ5JtQwQuTxpDBzpIQExOdz93p2OHgw1O3rS1M6mclZJg2yPuk A==;
X-CSE-ConnectionGUID: BFLfj0zQSl+QfZL+W1s0Gg==
X-CSE-MsgGUID: xcQyEMQRQ6uHtcezpC8OCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85510345"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="85510345"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:21:48 -0700
X-CSE-ConnectionGUID: zR1hFSQCS16DqFdUMFfJhg==
X-CSE-MsgGUID: jlYpZkhiRT2S75mKRu/okA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="240993741"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:21:47 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci: Blocklist kms_dsc ultrajoiner tests
Date: Mon,  8 Jun 2026 10:47:59 +0530
Message-ID: <20260608051759.2787899-1-karthik.b.s@intel.com>
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

Blocklist the ultrajoiner subtests added on kms_dsc on LNL, PTL and NVL
as ultra joiner is not supported on these platforms.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.lnl.display.blocklist.txt | 1 +
 tests/intel-ci/xe.nvl.display.blocklist.txt | 1 +
 tests/intel-ci/xe.ptl.display.blocklist.txt | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 82655802a..5f918a003 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -74,6 +74,7 @@ igt@kms_bw@.*-4-displays-.*
 # Ultrajoiner is not supported with only 3 pipes
 #########################################
 igt@kms_joiner@.*ultra-joiner.*
+igt@kms_dsc@.*ultrajoiner
 ##########################################
 # Valid skip :- Feature is not enabled on kernel
 ##########################################
diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
index 5d8398918..e6390d16b 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -118,6 +118,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
 # Bspec: 69556
 ##############################################################################
 igt@kms_joiner@.*ultra-joiner.*
+igt@kms_dsc@.*ultrajoiner
 ##############################################################################
 # Valid skip: Display 12+ is not supporting FBC with PSR2
 # in case of selective update.
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 99758c2ec..c897f3c69 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -158,6 +158,7 @@ igt@kms_psr2_sf@fbc-(psr2|pr)-.*
 # Expected skip on PTL, UJ not supported
 ##############################################################################
 igt@kms_joiner@.*ultra-joiner.*
+igt@kms_dsc@.*ultrajoiner
 ##############################################################################
 # Deep-pkgc IGT not applicable
 ##############################################################################
-- 
2.43.0

