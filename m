Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC2EC01A6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C1C10E3E4;
	Mon, 23 Mar 2026 09:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJicKykv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570A410E493
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774257213; x=1805793213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gfu9gasUjag82vNj6dVwpOnWg73JGnIR9SNKs8vnXOY=;
 b=MJicKykvuoTx9aM2pd5YuAjvbhI+KYZLYK56rabQlYhzrnVEz304B9WP
 J/kjh3ASDF8nB7JO/zJwlgY9KI0tM39XfNflF7IJAf6mTOWodUr7QxraM
 s2qXx0Q5lofEVAd7zJxASncnhwRO7uclNx55P1Qa16OrRRke31mdaeGsL
 q2+l8Rm9g/ee0pSoICpNId6SZoA8fQxf85AgtHT/Hxb1Hl27l63xb/5F6
 y2V4nNTV0j0pXeCTgITcS4UyL2ElEQ+jrkYoS6/YKBrKPiXQpRGiou+zE
 sfgn84Ma1aQrduQc6yHflPImjx8EwsfWYnEY73wQylW69o+bAiEx6hY/w w==;
X-CSE-ConnectionGUID: GNEWXFQVSqmswlTCecqSGg==
X-CSE-MsgGUID: cB8SrpGIRN6aB4WreDi8zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75371569"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75371569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:13:33 -0700
X-CSE-ConnectionGUID: G3ccaqbgQy+lUvRFupTDWw==
X-CSE-MsgGUID: y+7TLh5sT+6x7ha5QZf56g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="219164483"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:13:32 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/4] Fix PSR handling for multi-eDP systems
Date: Mon, 23 Mar 2026 14:42:01 +0530
Message-ID: <20260323091205.100585-1-jeevan.b@intel.com>
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
Jeevan B (4):
  tests/intel/kms_fbc_dirty_rect: Avoid unnecessary PSR disable
  tests/kms_vrr: Avoid unnecessary PSR disable
  tests/intel/kms_psr_stress_test: Select PSR-capable output
  tests/intel/kms_pm_dc: Scope PSR handling to output

 tests/intel/kms_fbc_dirty_rect.c  |  6 +++---
 tests/intel/kms_pm_dc.c           | 26 ++++++++++++++------------
 tests/intel/kms_psr_stress_test.c | 16 +++++++++-------
 tests/kms_vrr.c                   |  6 +++---
 4 files changed, 29 insertions(+), 25 deletions(-)

-- 
2.43.0

