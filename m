Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316E5C2A062
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BDC10E088;
	Mon,  5 Jan 2026 08:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYVRkOc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEDA10E088
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767601266; x=1799137266;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vhN+qSF6xihcn9OeNlPnByhqRg2cgdYTCwuX5dPJBxA=;
 b=LYVRkOc18E1dWWwFDLCfdeEHFhdBtAD3qLbNKvSPJMrCWNeOGKFsDGo/
 +Qd18tJPvYoiWU46gPkrhNR2q/BaodY6pVlAxAjkoojIYgzkihhhQMqCh
 dkcxkfCp1AsnbS79IkzAP+AXUVIrkjLYUjHZu4W101wa5nnuqB8fClQMN
 ELT03wbKxAoCFjwzx3VX6t3of/VeQXPj3A8IhLmUL7QTZ/YC7DrHPKgYf
 FBoGya8O2a8tBKroHhJ4Giehb7i16+2fNBeHrY24OBQlmh0waPl9B7sXr
 sK236CPOH5EVGikdbf409y6nLWoFFM2ejhxzg5+38aRWDlDDYWw5QHZ6U w==;
X-CSE-ConnectionGUID: LUxuIqjqRAq3zBbvZ3j8Ag==
X-CSE-MsgGUID: dfvv1H35QCecMTIKau4FvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="91616528"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="91616528"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:21:05 -0800
X-CSE-ConnectionGUID: 5DrINKOzSeaCHuMxg7HwSg==
X-CSE-MsgGUID: nr1BQtxESeKiLJFGRLbdhg==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 00:21:04 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update LNL/BMG display blocklist
Date: Mon,  5 Jan 2026 13:50:48 +0530
Message-ID: <20260105082048.27590-1-jeevan.b@intel.com>
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
 tests/intel-ci/xe.bmg.display.blocklist.txt | 2 +-
 tests/intel-ci/xe.lnl.display.blocklist.txt | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index d6af8e2b4..5a03dc9de 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -10,7 +10,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_async_flips@invalid-async-flip
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
-igt@kms_pipe_stress@.*ytiled$
+igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
 #########################################
 # Valid skip :- 90/270 rotation is not supported
 ##########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index cd1e6d19c..7a236b214 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -10,6 +10,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
 igt@kms_async_flips@invalid-async-flip
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
 #########################################
 # Valid skip :- 90/270 rotations are not supported
 ##########################################
-- 
2.43.0

