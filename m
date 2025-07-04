Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BA5C8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 09:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568D510E9C5;
	Fri,  4 Jul 2025 09:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJ5VikTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE81010E9C5
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751621750; x=1783157750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZaGhB22QifZkPRzyBiEs+R8x1rMmfJIBQz5ZYz6eOrY=;
 b=AJ5VikTYV2PLfzBU3QX456Tc+s73sdK2RbrlaMc7YeUXMo71ZUuUSY8S
 X6dL2xAcEtM+/zii89pDTe86AKyDs6hkKrFoRSYTVeiOyz8kfI3R3Bj2H
 cv6MbAA012ADjYL+wLOwUrkxkSveIohEpYIAQm7mwM3+qIB0gL+y4pSPX
 h3K4hphCYw561aX3MFT/h0Kk8k9ornP9rI6TcT+Tr34r3CO4dKP9onRNB
 HIeSfJI4D3NMq62NyEf2SMIRvgqcHpIdRUYcyc7MRzmzHkNquUaN6AYCT
 /81xUfEMpRyu4y4uPvkhoBS6wn4XdxZbyVLOkzMGBxXTlD4D9FmUZUnNi Q==;
X-CSE-ConnectionGUID: CZOey8hQSveGbWrr9mgU/A==
X-CSE-MsgGUID: H25EqLUySnqOHqtnmVSbnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54098926"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="54098926"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 02:35:50 -0700
X-CSE-ConnectionGUID: Snor/viVSIeyWkLc2qymvA==
X-CSE-MsgGUID: 3K2xmzSARnmXfjSw9fybTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154688068"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2025 02:35:49 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 RERUN 0/2] Skip PSR when disabled
Date: Fri,  4 Jul 2025 11:35:55 +0200
Message-ID: <20250704093557.499836-1-michal.grzelak@intel.com>
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

This series is a next rerun of v1. Kernel change picked the
IGT tag, now it's turn for IGT to pick the kernel tag.

Test-with: 20250703220845.493893-2-michal.grzelak@intel.com

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

