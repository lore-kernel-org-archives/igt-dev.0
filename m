Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2094FCE8D7A
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 01:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C031010E083;
	Sat, 15 Nov 2025 01:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASFG5Zn3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB9B10E083
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 01:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763169458; x=1794705458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lXFs3nV8C2eW0O5A9x/Zp3m7xeMPyPrNT4GecrSrBHI=;
 b=ASFG5Zn3Po5NqWMfAgBlJkpE1Fn8bfDxI9M/d864hR1FZwFwNX+QaNOL
 8nWLVT6TmxNWl8ZswtD3I/2Hax4tLo+5T0IhnAoDzUWlloeF0j10kDNyT
 NtLjG/eAwkHLCcqFIGbXosWXfO7uti+KZ2LQIFKlWy4Gjg6nY5R46Gmo4
 EG0SNwbuUW0Px8Ec2c1n3tJ9KCcFVPgVSLLbq6r/DFL2oPm372QbEZ6qA
 6qnv86IZ30lr9MrEcsfA7Lzen1ooEOLKdaOwwbmhkIWK299teYdyqVvIy
 d062KjOCrJoEQkXC04b+xPPT4Q4iQg14AF3OGTWOstaN4P97loWBm1xpW g==;
X-CSE-ConnectionGUID: J4yZL8/VROqVXw2cq8IeWg==
X-CSE-MsgGUID: qO66wfERRs+Gubmha5Kf/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="67873536"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208,223";a="67873536"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:17:37 -0800
X-CSE-ConnectionGUID: cNb0oAOFTZGOXtIW2iK1Hg==
X-CSE-MsgGUID: haqjEmSIQx+msre9VH0cRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
 d="scan'208,223";a="220800852"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2025 17:17:37 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 0/2] Randomize PAT test subset
Date: Sat, 15 Nov 2025 01:17:28 +0000
Message-ID: <20251115011730.3700391-1-zongyao.bai@intel.com>
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

From Xe2 onwards, the PAT index has become large, making exhaustive
testing of all combinations impractical. This patch introduces a hybrid
testing approach to maintain comprehensive coverage. The PAT index test
list is constructed using a two-phase approach: Mandatory Entries and
Random Entries.

Zongyao Bai (2):
  tests/intel/xe_pat: switch PAT tests to igt_srandom()
  tests/intel/xe_pat: randomize PAT test subset for xe2

 tests/intel/xe_pat.c | 135 +++++++++++++++++++++++++++++++++----------
 1 file changed, 104 insertions(+), 31 deletions(-)

-- 
2.43.0

