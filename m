Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7713C79F82
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 00:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3699810ECCD;
	Wed,  9 Sep 2026 00:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Twd9gTA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C39910E183
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 00:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788913630; x=1820449630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qjjaCfwIERcfxg3Syu9I7ABihlTCLeLsnS3RToHPNIM=;
 b=Twd9gTA1mWYrHLOQhbtseCErRf31Nbqyh38r1dxEB/lAJefXoriC875J
 NKjKCwjlAAbg8ZAn5J3rMwOFsg8mXxj6ZlzH+ACC/CGEMFXPy5yZbyvw+
 oZwUX1PNOjTd1NGlrhFmqNDRRt28jgN++imZUGaF4071CZx1lxTNVHwVw
 KoKV6jEYmRs6ghP4zZ1vXlswiJx4uThNtJRrQ0vGJO5puNRUErgCnP3pJ
 zPlp+NssF1xiEIr9wYUo7YLB2Un5B0iJlmgCzn6pdKz+jGFiBhev+2D2L
 OaezdDoN4P+58Lxs1Fs8IOVFxFs2JGAnpqsdtL1cEK9mkYaaug8++JJHj Q==;
X-CSE-ConnectionGUID: ZGxoV0UCRd2D94+PwEh+eQ==
X-CSE-MsgGUID: 9SOzd7xwT1uiS2RvEogunQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88265120"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="88265120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 17:27:09 -0700
X-CSE-ConnectionGUID: s0T376eTSCC8ZeFjDB8NMQ==
X-CSE-MsgGUID: DojXk/zAQdG6o1dnqHPfzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267905627"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 17:27:09 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t v2 0/3] tests/intel-ci: Enable PXP coverage on PTL,
 CRI and BAT
Date: Tue,  8 Sep 2026 17:27:03 -0700
Message-ID: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
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

Intel-CI test has PXP coverage that's out of sync. PTL has had PXP
support for some time and on platforms that has no PXP support,
like CRI, pxp-bo-alloc and pxp-queue-alloc subtests do negative testing.

This series drops stale PXP subtests from PTL blocklist and
narrows the CRI blocklist to not exclude the negative tests.
Additionally, it also adds a few basic PXP subtests to xe-fast-feedback.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes:
 v2: - Reduced fast-feedback addition to only the pxp-alloc-bo/queue
       subtests that can pass on platforms that don't support pxp by
       doing negative testing.

Alan Previn (3):
  tests/intel-ci: remove pxp from PTL blocklist.
  tests/intel-ci: Add a subset of pxp tests into xe-fast-feedback
  tests/intel-ci: Allow PXP negative testing on CRI.

 tests/intel-ci/xe.cri.core.blocklist.txt | 4 ++--
 tests/intel-ci/xe.fast-feedback.testlist | 2 ++
 tests/intel-ci/xe.ptl.core.blocklist.txt | 5 -----
 3 files changed, 4 insertions(+), 7 deletions(-)


base-commit: a89061ecccede222b8da2f310f3bf71ed908c365
-- 
2.43.0

