Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F8AD58CDC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 06:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1A689DD8;
	Mon, 23 Mar 2026 06:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PY6YKk8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091A89DD8
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 06:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774247678; x=1805783678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QMdecHOynJCz1cdXb1Qb2rIG3etB/GNu90IWs2XGZVs=;
 b=PY6YKk8ABAktuN3kgK4amwvhnPH/2FMxWbKEEZ2U61COCpXHEP75lY8Y
 93iRy1/s4cysuEjs4bWv1BnpqWIayXO853QeY4HLXjg2LIv7+LS+0ZD60
 Y2TztGieeRCtUvxA0EbFjE8BEpkMoKlUqWUXAd03kf5lnL4C92c5b7Zz8
 rVDbYUERAmwKgZKaAJ5tRrqKR5c+vqCaw4gBw07xu7R8qbWPfFq7dSC7x
 bxIj940oBeAByrWQ+E0BW+1KGGwFW5RYJ3Eb9R85C7JlS2GzwbTZEwYQS
 sl3SAj+aPuPTOSNMl/R+BQTwhIf8jPENFVi+AijvIGiDiL+dK1sthDrLl g==;
X-CSE-ConnectionGUID: RaMhp+kLRcmZuQ2/MbYp0A==
X-CSE-MsgGUID: WNKTl4oUS2O43M3yMw2ReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75123164"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75123164"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:34:37 -0700
X-CSE-ConnectionGUID: xDEPK9m6TfyHhcNWVt2+vA==
X-CSE-MsgGUID: RFLDcZCOT62XBOVHwcqU0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228008434"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 23:34:36 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/3] Fix PSR handling for multi-eDP systems
Date: Mon, 23 Mar 2026 12:03:06 +0530
Message-ID: <20260323063309.99649-1-jeevan.b@intel.com>
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

PSR handling in a few tests currently relies on global checks by
passing NULL to PSR helper functions. This works on single eDP
systems, but breaks on platforms with multiple eDP panels where PSR
capability can differ per output.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Jeevan B (3):
  tests/intel/kms_fbc_dirty_rect: Avoid unnecessary PSR disable
  tests/kms_vrr: Avoid unnecessary PSR disable
  tests/intel/kms_psr_stress_test: Select PSR-capable output

 tests/intel/kms_fbc_dirty_rect.c  |  6 +++---
 tests/intel/kms_psr_stress_test.c | 16 +++++++++-------
 tests/kms_vrr.c                   |  6 +++---
 3 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.43.0

