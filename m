Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFF4C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF27B10E398;
	Mon, 17 Feb 2025 08:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgD0h83R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F59A10E398
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739780337; x=1771316337;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jg4k2zxCcBk/HUcAgyIxJTbkwWfuPRxnyj2aRX0JLKE=;
 b=IgD0h83RHPi0OIV8sfX8e3gVp241yNRZNB7OtvgrZAhOgNwXyXcOsp8S
 kJPuP1CVcU8TbU0xj4eeiPUdztgwOK2n5jsicrpFqNop/WgEbvIg9iaSN
 a9dm8e0ummc6Q+lXaiAWVJljnd4QDsJP/+RfzN192iK397zFqHB0xyXm9
 hb7MbKBYw6aAPsnsUWuu0TArMSVRuAEF1pLoHvyQFK+bqvUPX9IoderVZ
 kGFlP/mBPFUGKziCUWvmBVt6UeWnp40g3rYc8++fVpwiYBWnZwSXPtwDp
 6PRSEBdUg8xPsTsk/2VpNZCJI125cTdeMGZokhF2N11GKgHatuvDKXPna g==;
X-CSE-ConnectionGUID: bMy/xyUwRDaCedwRLSXsYg==
X-CSE-MsgGUID: scFZuAQTSBCxw4NAz5fGDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40157769"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40157769"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:18:57 -0800
X-CSE-ConnectionGUID: GVVJoDgsSgK41mYpYtKspg==
X-CSE-MsgGUID: 8WnhL1ozRxOVJVW+gT+oeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144978424"
Received: from dut1069atsm.igk.intel.com ([10.211.176.182])
 by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2025 00:18:55 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/5] Add PTL support for compute preempt
Date: Mon, 17 Feb 2025 08:18:49 +0000
Message-Id: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add PTL support for compute preempt tests.

Priyanka Dandamudi (5):
  lib/intel_compute: Add ptl library support for wmtp test
  lib/intel_compute_square_kernels: Add PTL opencl kernels
  tests/xe_compute: Update documentation
  lib/intel_chipset.h: Add macro for PTL device id
  tests/intel/xe_compute_preempt.c: Reduced child count for PTL

 lib/intel_chipset.h                |    1 +
 lib/intel_compute.c                |    5 +
 lib/intel_compute_square_kernels.c | 2678 ++++++++++++++++++++++++++++
 tests/intel/xe_compute.c           |    2 +-
 tests/intel/xe_compute_preempt.c   |   16 +-
 5 files changed, 2697 insertions(+), 5 deletions(-)

-- 
2.34.1

