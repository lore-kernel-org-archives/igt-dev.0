Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE77AD5AE61
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 05:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A52D10E072;
	Thu,  7 Nov 2024 05:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFP3dDpT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDB910E072
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 05:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730958796; x=1762494796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jCxpJ1xEIgDy96VatUoKZfdltBbVzCXgEDYH01HexuM=;
 b=bFP3dDpTsdD+aMYvJdYHsdHK7zI8/zpx2dS9qwhuO8608BmJRoEXkBg/
 jhlOvJwnsLrN9Xp4bc9HvYDCR0sOzqTAKLiFnnab0UmxofndCaXN7fUiC
 R407SO4kFh2SiJhvxOkJejNj9nQU+yT6HxVT7d1Haf7qbTc5dZDOUz5dI
 /pwaJDPfHdCzie019OM+kbDvrCBJMOil4kp0/WZ9naTmDwPM0FuGLLCVy
 4Y23Ss89UlixyUqTYt1IB2bSvu4FFxo0b4XeiOUN7e8cx3z/sshNqgeC+
 j5Jnt54XZ9BzIHZk08NsgOWK1RWQGeyP1qJBqDOnaBxqrVcIJede+BslH A==;
X-CSE-ConnectionGUID: 3Di63wFaSXCouyuz5OpaVQ==
X-CSE-MsgGUID: vo1FarTjSxeIHnscziEtUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41381726"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="41381726"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:12 -0800
X-CSE-ConnectionGUID: ldSCJJQeS5i+3Dqe/9C83g==
X-CSE-MsgGUID: gUPagqfOQUmz8AMb5znCXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84879383"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 0/6] lib/igt_kmod: Drop legacy kunit integration
Date: Wed,  6 Nov 2024 21:52:48 -0800
Message-ID: <20241107055254.3129207-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Drop the legacy path with the minimum amount of conversion.

v2: Use igt_require() rather than igt_assert() and add 2 more patches.
v3:
  - Invert the order when checking by suite name
  - Simplify kunit_get_tests(), __igt_kunit() can skip by itself
  - Add a few more patches with refactors and leak fixes.

Lucas De Marchi (6):
  lib/igt_kmod: Drop legacy kunit fallback
  lib/igt_kmod: Fix leaking subtest name
  lib/igt_kmod: Stop passing debugfs_dir around
  lib/igt_kmod: Stop passing ktap around
  lib/igt_ktap: Just free ktap
  lib/igt_kmod: Do not leak kmod ctx

 lib/igt_kmod.c              | 364 +++++-------------------------------
 lib/igt_ktap.c              |   5 +-
 lib/igt_ktap.h              |   2 +-
 lib/tests/igt_ktap_parser.c |  24 +--
 4 files changed, 66 insertions(+), 329 deletions(-)

-- 
2.47.0

