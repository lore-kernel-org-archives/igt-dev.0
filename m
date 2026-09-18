Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C38C982D8
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 14:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E7E10F3DF;
	Fri, 18 Sep 2026 14:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPZ++x/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439F210F3EA
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789741222; x=1821277222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aqqb463LeJB2D1trGZeBvGN/VafhtoJw7Xn/WSE9XiE=;
 b=RPZ++x/++cVj/c5da5qKcR4NHkzn8le+mtC1NzNNAhbZQxb7frQi3Pq5
 O8/i4jjafLqunQ/gPvoKdCpXyJqFa0WryojJ3uxD1mr+CE3My+j/kzDth
 SUDbmlp4E3vS3H1OLoZAh2olAl30W/RfbcL7S1CrHKAIB0WuHCjcpCe91
 HXgw/jRvXLs0FykQMsoZLtkh7cUHlkR1ugVQ8BO6EvWCx99OF5REkKfmR
 Pf/M5SXdAKtEc/gz84csfGEirp/cuFXXcoeJnJfckSK/O7rmGcvr95d4F
 2hlhANCQxhciocly6VCPv3rxAQqiE8G95lT3L2fYAl1r7KV+qCvFQNTvj Q==;
X-CSE-ConnectionGUID: kr/Gl5rDRROZQYepD6KPsw==
X-CSE-MsgGUID: C1FKGGikR6SGvMfhK4cdNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="100913926"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="100913926"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:20:22 -0700
X-CSE-ConnectionGUID: poE0eDbiRh6NekJenlYgUg==
X-CSE-MsgGUID: XMBCDrOST72y26CEO/P++g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="268164347"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:20:20 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/2] Improve LOBF reliability with low RR retry
Date: Fri, 18 Sep 2026 19:50:20 +0530
Message-ID: <20260918142022.4096908-1-ramanaidu.naladala@intel.com>
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

This series improves the validation by retrying the content-rate sweep
on the low refresh rate mode when LOBF is not detected in the high
refresh rate mode.

Naladala Ramanaidu (2):
  tests/kms_vrr: Retry LOBF detection on low refresh mode
  HAX patch do not merge

 tests/intel-ci/xe.fast-feedback.testlist |  2 +
 tests/kms_vrr.c                          | 72 ++++++++++++++++++------
 2 files changed, 58 insertions(+), 16 deletions(-)

-- 
2.43.0

