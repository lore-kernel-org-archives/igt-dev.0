Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5B8C83F17
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB26610E4E8;
	Mon, 14 Jul 2025 16:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fz2Ky8vX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D94810E4E8
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752509810; x=1784045810;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0DVqS0lI4y/DhcMQCfGgJtm9/dPrJWxH0DUDPM2CnMA=;
 b=fz2Ky8vX5ucSwJpJYnR3kOi5EAU3+C+/S1DKurhkjesetaeYhAk1yd/S
 oweecY0jmTOiRAledSVWNAjOfvhECEMuadJtsJiojPCO3fmzZkBqfXAvB
 hQNgJCraskS7YEuYhn61K6HNid8r6nFQBro7CQpyWATjKLR/dna+roBRt
 T+A3Cc5WrZiFbRTsgDqEefdLRWdK/oz8nqZcMwumPulNg0FPqOgYi/6HB
 vUV1qqQu5brym0Oyk7i/IUgcmGhXPKdODkwRXdYSiE3iPYMxNAkceTb1S
 /NQa7vhGPxPaZ3l3Esp/DpjXL0RRuDs4yuhgYYKiqyW/NIDEGqfqoC/4Z A==;
X-CSE-ConnectionGUID: 3TnzKgr9QES0eegJnn4T8A==
X-CSE-MsgGUID: vyGyXDfwS5eNg8m+2niF4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58514522"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="58514522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:16:50 -0700
X-CSE-ConnectionGUID: ySJzVbFlQdKv9v9Yz4+ZXw==
X-CSE-MsgGUID: A/4ugZmvRXufrqWqQdZIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156378775"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 14 Jul 2025 09:16:49 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 RERUN 0/2] Skip PSR when disabled
Date: Mon, 14 Jul 2025 18:18:00 +0200
Message-ID: <20250714161802.821516-1-michal.grzelak@intel.com>
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

This series again is a next rerun of v1. This time tag points to the
kernel change which does not have any tag, thus maybe Patchwork will
pick the IGT change this time.

Test-with: 20250714160931.821383-2-michal.grzelak@intel.com

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

