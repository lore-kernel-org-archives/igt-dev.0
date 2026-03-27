Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B2510ED675
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 13:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C920110EE77;
	Fri, 27 Mar 2026 13:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjiQoeCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445E510EE77
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617985; x=1806153985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ax10YgP1SH+wpsFgkeHky9pBk0nUh55GipDq9Nnp6eE=;
 b=gjiQoeClR2Du9ikGHGfvuCyqk6yTZ4tuYC0+wI2SPkh9hRU8x8rFiyeN
 aFIY8xzUHsHsfZM5ODMR9eJXQIEa6VOPWZ6unYSDRKOfu0AkIegprmTad
 KF7LYPorDA0EXwIxcUNa8BJWegjLlbgDRkidNFtd/ScVTLZMwx66BcM4e
 2zPynjfCxNXnQJIFqvOFGLSp5XuZdcBBplRFwXra/IkRQNFhlbtl45xb7
 Q9lLAVoBvddG4ATv2xzOgdFCUhtCnZc/TyzxcIKBtfsz5M6k7djMjuNlF
 6IsOQoMTUBL5kvnHlr8Wlx4ZtCbrPPm/kdJ841gY0dow0b9WE5QfEnKV6 A==;
X-CSE-ConnectionGUID: QWN+x7mMSIGFTosfRNlG3g==
X-CSE-MsgGUID: SRBMwioYS2GVTwM2fWtTVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75582201"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75582201"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:26:24 -0700
X-CSE-ConnectionGUID: Qw4oqzN5QO2aDmJ2Oa3VtQ==
X-CSE-MsgGUID: 9JS5OUX+RpGJ+bS4IIapIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="225567559"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:26:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v2 0/3] Verify PTA entries contains expected values
Date: Fri, 27 Mar 2026 14:26:18 +0100
Message-ID: <20260327132617.974862-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

According to spec verify PTA entries in reset / suspend scenarios.
Extending parsing to media gt was necessary as it may contain
different PTA values for main / media gts.

v2: use pat debugfs instead of pat_sw_config

Cc: Matthew Auld <matthew.auld@intel.com>

Zbigniew Kempczyński (3):
  lib/intel_pat: Support other than gt0 during parsing debugfs PAT
  lib/intel_pat: Expose getter of PAT registers
  tests/xe_pat: Verify PTA PAT entries contain expected values

 lib/intel_pat.c      |  49 +++++++++++++++++++-
 lib/intel_pat.h      |   3 +-
 lib/xe/xe_query.c    |   2 +-
 tests/intel/xe_pat.c | 104 ++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 153 insertions(+), 5 deletions(-)

-- 
2.43.0

