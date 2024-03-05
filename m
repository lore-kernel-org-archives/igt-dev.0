Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63A7C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 05:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B841123DE;
	Tue,  5 Mar 2024 05:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFnkeUfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11CE1123DE
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 05:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709617273; x=1741153273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zuSa7KYZlSCggGhQ7724RLPQyc8F31nSnTAFuusouvE=;
 b=YFnkeUfEIYdlGjgZvSrDp7m+umOXzE1CHawiYJ/Mu7epUoeAebXCowKK
 gyJotPopHHV4LXD+h68zyRLZ8gSHkVkPYBnI1NkD3tP6p4OkO6tMuR1/D
 n/b3ieyfqFBoGmlUEkCDQQ3i4o+E5ARPnd7v91EoCX2WJ7NTdJti6Equz
 L2unvSnPKhwCE30Sfx1kSAXazrj28XipFFzWwutvFcCKd6bZx7toemMUY
 oC+TCc/pDacEbzxhV1wuW6PIQ6hQYLNLGRPZo42Ymc5hhvPa9MYeItxyp
 Im9XQr9XXsoR3nYGc0ANOARvB7LFk12l8RHdFsm4QjbCEOXobxsiZXdwY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14729370"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14729370"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9325526"
Received: from unknown (HELO localhost) ([10.245.244.112])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:41:11 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 0/4] Add xe_render_copy tests
Date: Tue,  5 Mar 2024 06:40:52 +0100
Message-Id: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
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

Fill gap testing render-copy on xe driver.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_blt: Add blitter tile to legacy tile id helper
  lib/intel_bufops: Use printf style filename formatting
  lib/rendercopy_gen9: Add Tile64 support for render-copy
  tests/xe_render_copy: Add render-copy test for xe

 lib/intel_blt.c              |  25 ++
 lib/intel_blt.h              |   2 +
 lib/intel_bufops.c           |  14 +-
 lib/intel_bufops.h           |   2 +-
 lib/rendercopy_gen9.c        |  24 +-
 tests/intel/xe_render_copy.c | 430 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 7 files changed, 489 insertions(+), 9 deletions(-)
 create mode 100644 tests/intel/xe_render_copy.c

-- 
2.34.1

