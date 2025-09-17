Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE44CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 14:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FAE10E858;
	Wed, 17 Sep 2025 14:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcYY/nDc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6610E858
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758120198; x=1789656198;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LURkCk+jsVBfZb8c3HJnJ5xU5jcsHkzkdHf1bNSb+dI=;
 b=CcYY/nDcejdkJUAKtCUz2DTqVQdrjW+WpjOUKdzdSjA8A2zou/WFero4
 Zs8/ZfrCUmaA6dVrFxB2XSjvwUA2xYjpuEtvv76E/3yFdlp1TubC9pyIo
 2Q8N5PzLXrBkfGv3FyXjGbh3TLY1k4rWvFK5xhIJSyQ6uMM10SmqYEgc8
 06GiUVXx+8ZnMwdkvVzqeHsjtbdzwYrA/NzS2UHxOoE1y4K6jUlNQ0GND
 mDC+vLgwQ6zHeLiBYaMYjsdAo25qrv0ew229yyF2C0OsikqcZNNy2i1ZJ
 3qg8xAOXPPJDPQqEJLYWF0KyY/ccvsam3yDGIqhyrj3U01M8Nvn44eS/F g==;
X-CSE-ConnectionGUID: JBocCs9gQemPQ/NOuPoTFw==
X-CSE-MsgGUID: YWa0UmddSw+CEpRM38ykTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64249997"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="64249997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 07:43:17 -0700
X-CSE-ConnectionGUID: bJ5mSBbiQ9O+CCHKLxFgYA==
X-CSE-MsgGUID: OWn1dzGKTzq4A8kXgzyz1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175062293"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 07:43:16 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Wed, 17 Sep 2025 20:13:06 +0530
Message-ID: <20250917144308.1355953-1-jeevan.b@intel.com>
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

If an eDP connector is present, prefer selecting its default mode for
cloning. Some eDP panels support only high refresh rate (HRR) modes,
which may not be compatible with external displays. To avoid invalid
clone configurations and test failures, we choose the default mode
from the eDP connector when available.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/kms_setmode: simplify mode selection by removing goto
  tests/kms_setmode: Fix clone mode mismatch by preferring eDP mode

 tests/kms_setmode.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

-- 
2.43.0

