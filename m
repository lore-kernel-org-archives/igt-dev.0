Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5721CCCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 06:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E810910E047;
	Tue, 28 Oct 2025 06:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klRtmV28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786E510E047
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 06:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761631267; x=1793167267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WnftmvF3hYrSuBIelMZHlCYBeYFHYHtJjiadJ5cxUaI=;
 b=klRtmV28an5dD0lleFhAxQyiE5l/IQc2Sj979LfZZX6SA8D1Y+zNX0kW
 omFTPBvrSn/YSwQNYHIXBqSd7tlVCT8aSeuRy+21mj4gbz8NEuJii0LzU
 t7IjJ2XVh0s1xLW9Dtl+JYdrArSB5eX40BPm3si7XSyyqMG97lQh3mkKJ
 CSt6U8WymAbPZsLIwYnANLmLceK6W/ENaVKFHDPMU7Qh9qvPyfRPo5w7k
 XSh0NpGHE6tlFSiOAseYmiIpfxyLlnHpD3Q7H4blKKJuBWF+p8Lvs6qai
 LpbC92mpyDaP3KBWp6CMYDeEIToReKmNb/EEmD8niKzqGlD0lbcIQFht/ g==;
X-CSE-ConnectionGUID: xtPNQmmsSJWdraZPxQKO9w==
X-CSE-MsgGUID: bsLoUb9lRn+muNyuxjX2JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75066538"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="75066538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 23:01:07 -0700
X-CSE-ConnectionGUID: i7mR+b/vSMGsw5dHtcFXmw==
X-CSE-MsgGUID: 6iIGV0BNSAmpN8x3s4/fJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="185588562"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 23:01:05 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jouni.hogander@intel.com,
 vinod.govindapillai@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] intel-ci: Update PTL display blocklist
Date: Tue, 28 Oct 2025 11:26:07 +0530
Message-Id: <20251028055607.735698-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Remove fbc tests, update psr tests from display blocklist.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel-ci/xe.ptl.display.blocklist.txt | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 4c3803235..549de5f55 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -155,10 +155,8 @@ igt@kms_bw@.*4-displays.*
 ##############################################################################
 # Expected skip on PTL, FBC + PSR is unsupported
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

