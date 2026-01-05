Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9EBC2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A656410E088;
	Mon,  5 Jan 2026 08:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9bgQAUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797310E088
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767601154; x=1799137154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yyJ3ziJvSj0GGZK0zAfdkGe9WrSc7SjQbc/1JKXS7uY=;
 b=Q9bgQAUNEvTm20N9XrlF+/Jq3G/VK2SAc+9B+YmCUHXxs/vF0wppfpP8
 43u63KvAmsei3xNjRyK6VxyM1E3UPHntdG8oCYH/FxN9wsl9v8zOEURHN
 nRIMgAFUn33YiNoXOxXNSVIVRYrKd7Uuj/qe5hWLgS+IdUcepKIt3nPeR
 XvnAFY9E95bsnVs05zGij7e6k7d+lrTBLgpN5yZwP3skwjfySv2baFA81
 LPjsonclwXMnC4VNER8aNaYNuUjuyUfwAxC7rbYSTa96NucQeapJw+puV
 CxhQWyAg1dTAgM+LnVvFpA2/u3Kz+j1IqPT9IlvG/7jUnzxtzK4yfWpG3 w==;
X-CSE-ConnectionGUID: qc/boFgPTACXeAZTI+LVug==
X-CSE-MsgGUID: HrwU5lH1Taa4R1tWIsjQMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69016642"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69016642"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:19:14 -0800
X-CSE-ConnectionGUID: niKDY7/0Qjqwgwf9xF+ltw==
X-CSE-MsgGUID: Pkzn8cioSVa9kTryDmpQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="203307829"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 00:19:12 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update LNL/BMG display blocklist
Date: Mon,  5 Jan 2026 13:48:54 +0530
Message-ID: <20260105081854.27525-1-jeevan.b@intel.com>
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

Add y/yf tile kms_pipe_stress subtests to blocklist.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 3 ++-
 tests/intel-ci/xe.lnl.display.blocklist.txt | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index d6af8e2b4..01084db1c 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -10,7 +10,8 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_async_flips@invalid-async-flip
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
-igt@kms_pipe_stress@.*ytiled$
+igt@kms_pipe_stress@.*ytiled
+igt@kms_pipe_stress@.*yftiled
 #########################################
 # Valid skip :- 90/270 rotation is not supported
 ##########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index cd1e6d19c..4d20f4d06 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -10,6 +10,8 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_async_flips@invalid-async-flip
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_pipe_stress@.*ytiled
+igt@kms_pipe_stress@.*yftiled
 #########################################
 # Valid skip :- 90/270 rotations are not supported
 ##########################################
-- 
2.43.0

