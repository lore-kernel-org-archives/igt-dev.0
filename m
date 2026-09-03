Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6416EC61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 21:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39910E094;
	Thu,  3 Sep 2026 21:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0TXCAhU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB5810E094
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 21:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788472161; x=1820008161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ukH0+LsEqt52L00QFpecUrBa5bySHPlLehlVS0nv+F4=;
 b=c0TXCAhUmE/jyia8am7yjDImj/gBtp/iJAnj2LGafwxM4/fiCFJsNlPj
 VndU49oKDDvkGRiKj3TldULXAJ5PgSxW06Iyyo3Sf5I0uhXyey7JRDaFr
 4pDMwTagoed61NbDTD5JtwpGPQw72IG18WkgDyxr5JDCrUWmR34l54Nk3
 BpgWpwlkfCx4240SE0SI9bfN+KUrWH1lavoahraqMm+rN2yJEB2EIb9pn
 Bti6P7jiROzusLS3DIUOGQo3B1dBwmqfauaVpSyPzU1tF7jDnupG5HB1+
 hiTiML8lk0wBLoYN1QB7AHKDDXI2ifkYfSUjuHXy0RiPVqR5f+qTQnks/ A==;
X-CSE-ConnectionGUID: L0W/rPUBSFuFya5S1tx/eA==
X-CSE-MsgGUID: HhTmxmSeQAWc1ZKSYh12ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89003165"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="89003165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 14:49:21 -0700
X-CSE-ConnectionGUID: jGfP4Vo6SrWPQMP4urYUow==
X-CSE-MsgGUID: BfO0KhhbQXqSCYoMM2ubig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299707520"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa002.jf.intel.com with ESMTP; 03 Sep 2026 14:49:21 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel-ci: Enable PXP coverage on PTL,
 CRI and BAT
Date: Thu,  3 Sep 2026 14:49:17 -0700
Message-ID: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
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

Alan Previn (3):
  tests/intel-ci: remove pxp from PTL blocklist.
  tests/intel-ci: Add a subset of pxp tests into xe-fast-feedback
  tests/intel-ci: Allow PXP negative testing on CRI.

 tests/intel-ci/xe.cri.core.blocklist.txt | 4 ++--
 tests/intel-ci/xe.fast-feedback.testlist | 3 +++
 tests/intel-ci/xe.ptl.core.blocklist.txt | 5 -----
 3 files changed, 5 insertions(+), 7 deletions(-)


base-commit: 85f040c8f0b9bcc56d73fc7c989a7296cd867b07
-- 
2.43.0

