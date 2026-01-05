Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5403DC2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D0110E212;
	Mon,  5 Jan 2026 08:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJFE1Qr2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203E810E23A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767600507; x=1799136507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pcQpAKPGh8REnlAH3gbI9o+q0iXd1TVnCOcdrNdgTnQ=;
 b=RJFE1Qr2NZOkuyjT1rBnHZN+oDZ7qnsrit2Xz0QDViTsvg/Rt1rRiGlV
 YWA1PWFpkHcB1jFUx50n8DPs9YSW/zMeo8BauRoAIVwlkDU3JUtOjQ58o
 cbn56oCqThymDlj/LKm2AmNuS3NIsMUVQEbM5tFj28r3UM67cMVfDBNHi
 GeHuvwOpo3L68N4jO/hdfDzKmkjMCcrQxrN/NQ5HpxgmE00FvD1yqZ6Ei
 Vf0+9hvxjKjN7jNQsuj5H31rRa2Q7uGs42Qrcq3OZ8vTyNnK0QUzqRt/B
 z8LGP0+0708jDaQJO7efCzURHJyHQgYxcR5nY5tDTJxbidl5ofacJDPau w==;
X-CSE-ConnectionGUID: J/CoSGesQpaAZSwiF4lmJQ==
X-CSE-MsgGUID: HL/hNAjHRlOQvV2vkfAHVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="67977014"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="67977014"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:08:26 -0800
X-CSE-ConnectionGUID: YuSj6zUvQme60ui1nH4TJw==
X-CSE-MsgGUID: Hyb2UoS3R8yMGcrNFdHDKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201569700"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 00:08:25 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update LNL/BMG display blocklist
Date: Mon,  5 Jan 2026 13:38:01 +0530
Message-ID: <20260105080801.27307-1-jeevan.b@intel.com>
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

Update y/yf tile kms_pipe_stress subtests to blocklist.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
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

