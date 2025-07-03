Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D987C83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 14:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ED510E854;
	Thu,  3 Jul 2025 14:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a78MKJgt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E70A10E854
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751551436; x=1783087436;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dIX6UxC0Chko8kaTeJ+lN8PL89z04032iWlTUq6WKmA=;
 b=a78MKJgtzk1rDPvey4DZi13bxQzjapawbRTEwTG0UQDCsM/0dgSWZdA6
 z5UE9GGSZvIpVQrqbeqUgEQ0zEwylmEo0Q0yMmAyoIAS1sd/lJbrvcG5w
 CD8ZIHkxsZasuFdVuFwdfvtK8IN4p3k10l1sVyMyeVMQhjZh6tKbPAp5F
 6VRwTs2Kqzbm1rzujotYqJmfigfif9lJuy3my24BhJO/PgikahGBETsbb
 nkLsOsCao+jCQhYc6sWTE6Z7ycGacVNPfTYzIHsFEExP/C3YNVwLkRB+i
 ABtw1kAPJEtP78ZmslAD4XDXg5qC3ErGzouQknmvkDqlGm8EyrS+cuzcK w==;
X-CSE-ConnectionGUID: f3rQrSCxRzW1FBXUMwQyQA==
X-CSE-MsgGUID: +G7ZEBIeRAyE6yO4FZfxzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53993349"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53993349"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:03:55 -0700
X-CSE-ConnectionGUID: 6v0bdCs/SXWl9w/P/zQ8yg==
X-CSE-MsgGUID: HCrtLCEjRKSvbyhuU6xH+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="159879178"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2025 07:03:54 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 RERUN 0/2] Skip PSR when disabled
Date: Thu,  3 Jul 2025 16:04:49 +0200
Message-ID: <20250703140451.491593-1-michal.grzelak@intel.com>
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

This series is a next rerun of v1. Previous rerun didn't pick the
IGT tag.

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

