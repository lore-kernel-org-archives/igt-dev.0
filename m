Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088D5C67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 22:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F03410E30D;
	Tue,  9 Apr 2024 22:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QclfgQPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0950F10FC05
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 22:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712702477; x=1744238477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Es352CcUdi6L8CuAAfw6Nyy/7RIQKbOa+UkKuJDk0Gw=;
 b=QclfgQPXphO20otGM9TXd0cS/hh2P4Nh/SVovobiy+2wSJy+2h9C60dL
 KnK1Zz/4BUz8KFcztPnaABtDYqyya+dfdBvbfL5Q9Ux+TM/wl1M+zdUZy
 FgfwzjYZcqQhXydHPCjwARZdJ93ZNgw/5fDOwdAEgvkybi2qHiaMXtMmr
 hSbmalUOzwxqJr3bC91GD3hd0GFq/JqXZCpbIyLM1rdwsNpXXHiYp3HER
 jvjKfVWfhczhlMFvn/TvyMaiZUdAgT2z5B3DHX2LD+9GE8sAXWNZvWMEr
 U0DeoHai8r9Uyh3afZRUnRdU6fW/EqEPzGywiyEM0AhEoNAiThmEgEdKE w==;
X-CSE-ConnectionGUID: x7e5RMtGSVmVKE8BJ1R5jA==
X-CSE-MsgGUID: 52k0dHFGTSuXMEptW4Ufjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25487805"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25487805"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:41:16 -0700
X-CSE-ConnectionGUID: VdxcqzwjQDasTbjvmcUa4Q==
X-CSE-MsgGUID: 6JOWMzBhRLGL7K81j9Xk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57808231"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:41:16 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 jonathan.cavitt@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v3 0/2] Update compression check based on platform
Date: Wed, 10 Apr 2024 03:39:12 -0700
Message-Id: <cover.1712745305.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
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

In Xe2+ platforms, we need to run the xe_ccs test regardless of the status of
flat-ccs.
Check if the platform supports compression and has flat ccs enabled,
and if it doesn't, then update the check on compression
and proceed with the test.

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform has flat-ccs
    enabled
  tests/xe_ccs: Update compression check based on flat-ccs enablement

 lib/intel_blt.c      | 14 ++++++++++++++
 lib/intel_blt.h      |  1 +
 tests/intel/xe_ccs.c | 15 ++++++++++-----
 3 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.34.1

