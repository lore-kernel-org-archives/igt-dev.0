Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B38C7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 16:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4630710E5F0;
	Tue,  1 Jul 2025 16:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGmRAt3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA4B10E5F0
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751389090; x=1782925090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r3hl+u5xLyzAfAct0A4XhGVAMHTJXvCIBbNFkgtsnf8=;
 b=IGmRAt3TJ/aQjfDqOKg96Ho6rm9ufeDP9HeG536xS1I6BVSFNqE9AAGY
 J+t+X6mBGEdBqlP2oKnwizzUL3d+tTs9g4ZsbPozwiQCs4ctheAjLeF9e
 lp3BXsnSK22eD828YKJjQnlooAbn1TcSMWVC7PQTi2PCHt5XdJwWW79sj
 aTIIT991i3c9dVBGTxRVeqS+EN7j6rHDxQUKebUpikeZEIcCRAqOfk4xj
 ZoVk9opCc1TpnyAzkyVNAY7nWuLossqSdcxSoS84SSpwviEgULq3uZTpo
 IGnfBWg99kKx5NFJLkt6WPEza6nr8ipFVHx7Bf5jdsD8/0UgWkdVUOiUg Q==;
X-CSE-ConnectionGUID: nuChQbq9QjKs46x7TqPYtg==
X-CSE-MsgGUID: Tc4qLyF6QKuOmuat0K6acQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53528088"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53528088"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:58:10 -0700
X-CSE-ConnectionGUID: 8BBvdxUoTUq+73LjrTOheg==
X-CSE-MsgGUID: ytiAZTNtSCCpTtthf4vL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154552483"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2025 09:58:09 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 RERUN 0/2] Skip PSR when disabled
Date: Tue,  1 Jul 2025 18:59:10 +0200
Message-ID: <20250701165913.443515-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

This series is a rerun of v1 [1]. Previous version didn't include
MSGID to the kernel change [2].

Test-with: <20250624164823.4118263-2-michal.grzelak@intel.com>

[1] https://lore.kernel.org/igt-dev/20250513121918.2758842-1-michal.grzelak@intel.com
[2] https://lore.kernel.org/intel-gfx/20250624164823.4118263-1-michal.grzelak@intel.com

Best regards,
Michał

Michał Grzelak (2):
  lib/igt_psr: Skip the test when PSR is disabled
  tests/intel/kms_frontbuffer_tracking: pass non-NULL output pointer

 lib/igt_psr.c                          | 4 +++-
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.45.2

