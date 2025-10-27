Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA4BCCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 15:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E2B10E4CF;
	Mon, 27 Oct 2025 15:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbCLzCjO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE4F10E4CB
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761577406; x=1793113406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yspt/gqJ7fiW+LMDLJ8Jrf7f9XUktQfiM1z+C9lHUck=;
 b=jbCLzCjObOhO7+7rTsK5KbpeLwfe9FW96fDrD9+o2YsVN8i96tsI7WyC
 KgmT0+iZTCuWeA1eN46vWD826NxweYL/pJNbwKqtJpvsRbseEe65GiwNz
 G8sZW5gdDitp5lPwxuK6mnDmw3b1Ky0WI6FkQGjQP7VezvZsHlpejdaa9
 XzL1SXunFFhnxQ0Z3c6PwUeJ/puJdbrYY8Vgy4vRx0cKj2Vmfs/QvsRi2
 0mULRXq5UE/S1KYdEjPzkMboMhHjBZBfPMI0uhkzd5UDuyPrBsfhg3kok
 bpjNwd1yMdvai8oxEhFg1OUiOonAIkhE9BNGeQJGJoPJtuuEM1tBUR19t g==;
X-CSE-ConnectionGUID: d9U7JzveRfqsGtlyurERIw==
X-CSE-MsgGUID: rr5oC/i4RMyyd9b0ORR8Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63547586"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63547586"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:03:26 -0700
X-CSE-ConnectionGUID: M9BohdIfQz6Rgp5RCeFLSA==
X-CSE-MsgGUID: ekXxST2yS4S6S5zsV9w1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="189101654"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:03:24 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update LNL/PTL display blocklists
Date: Mon, 27 Oct 2025 20:33:12 +0530
Message-ID: <20251027150312.2209085-1-karthik.b.s@intel.com>
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

Remove fbdev tests from display blocklist.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.lnl.display.blocklist.txt | 3 +--
 tests/intel-ci/xe.ptl.display.blocklist.txt | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index edde67d75..fd2065659 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -1,8 +1,7 @@
 #########################################
 # non-KMS tests
 #########################################
-igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
-
+igt@(?!.*kms|testdisplay|fbdev|.*display-vs-wb-transient)(.*)
 #########################################
 # Valid skip :- Y and Yf-Tiling are not supported
 #########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 12219f89a..4c3803235 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -1,7 +1,7 @@
 ##############################################################################
 # non-KMS tests
 ##############################################################################
-igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
+igt@(?!.*kms|testdisplay|fbdev|.*display-vs-wb-transient)(.*)
 ##############################################################################
 # Valid skip :- HDMI not enabled in VBT
 ##############################################################################
-- 
2.43.0

