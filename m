Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6093D37E42
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 15:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4669B10E2C2;
	Wed, 14 Jan 2026 15:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzOpDgqR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C087210E2C2
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 15:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768403988; x=1799939988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HmbRTIYwUgoZ72zoe6NKsLx4innEfYSXmY5IoJpYHhs=;
 b=GzOpDgqRjs3lkgRV6LPJRpjHP2/LhF8ZbvrQm1sp79KmFQKuSrMWSZPJ
 yjLGWHfFyltCDhq/+RY/5LtRKZKxDlrC6qMOpC/2cnWa9zpo3zHDkcsjz
 uYzEh6nYZ1THaKsOkpzbXBl38S89zcB7O472dIuvEpkDZ+t2oiql3Zq3j
 tAwG32fOWh2Fn11K/a8G6WSqpexuMLg18ODjUoTCrdI5WAKgD9Wh+XNhY
 0DJwOuJ9L4zzIAQhZ7HAoR+qRlEMb5yR2LSRXcBl4QUlNyvbjXwEe8PCI
 ahT1xEygeHU4rdksEmVzM8H7WltW0ymaoFcH/8+OzfWZH40RDDc2N0Iua g==;
X-CSE-ConnectionGUID: l5+WpZYBTCit2u9KhHXkaQ==
X-CSE-MsgGUID: DlmxlLg+TbqupZR056E1aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69764345"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69764345"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 07:19:46 -0800
X-CSE-ConnectionGUID: C577O5l0RP295CxDRhl4Sg==
X-CSE-MsgGUID: rvcEL529QkWTLouEuypOyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204595891"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.77])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 07:19:44 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH i-g-t v3 0/5] Add xe3p compute kernels and preemption support
Date: Wed, 14 Jan 2026 16:19:31 +0100
Message-ID: <20260114151930.211512-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Enable compute-square + preemption tests for CrescentIsland.

v2: reorder, loop_kernel_duration requires loop kernel added before
v3: drop kernel_addr variable and reuse XE2_ADDR_STATE_CONTEXT_DATA_BASE

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>

Shuicheng Lin (1):
  lib/intel_compute: Add loop_kernel_duration support for xe3p

Zbigniew Kempczyński (4):
  lib/intel_compute: Add compute-square for xe3p
  lib/intel_compute: Add loop and loop-count shaders for xe3p
  lib/intel_compute: Add xe3p SIP support
  lib/intel_compute: Enable xe3p preemption testing

 lib/intel_compute.c                |  395 +++-
 lib/intel_compute_krn_loop.h       |   36 +
 lib/intel_compute_krn_loop_count.h |   34 +
 lib/intel_compute_krn_sip.h        | 3127 ++++++++++++++++++++++++++++
 lib/intel_compute_krn_square.h     |   41 +
 lib/intel_compute_square_kernels.c |   11 +
 lib/xehp_media.h                   |    1 +
 7 files changed, 3644 insertions(+), 1 deletion(-)

-- 
2.43.0

