Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A32D6ACFB
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 12:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371F410E403;
	Thu, 18 Dec 2025 12:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2VtaiLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C403C10E401
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766062756; x=1797598756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xc8BdS4nZBdRR3myqfwF8TzRp2M2cDIjh42xLUHZ0Ro=;
 b=D2VtaiLHcJmIdCSzd4alKs8A/Tm8dXRneOdp8hfIQ/D23g7O9uscrZwQ
 liQZ44jz0fo6U+5FCL+JW/wobX3SG4sx9DSKeCb0W5xgSwrteEPuiu8VA
 mCCbOfbTal5vyIqCV585C/XyPQc1uES8LXMIWmGQ1OW1VGKa+ugKqeMRt
 TKm0Dy8lgo7p9A/Oy5FK6syUAcZGBnP4/PJENfmLZESVm+wAHwps4Mh0b
 8QnbH1Ixf+Cr+khopaAGPmfGuMOyRUhGAq6IKQRiO89Urk5Mpc8osxKAS
 Qa3vqueQvYkMunJyDHwhI7L/k3Efx7xKvTXWhA4nmvOKA0DpUZ/Md+DGM w==;
X-CSE-ConnectionGUID: Bbw5rubRT3+oaf4eOglu9Q==
X-CSE-MsgGUID: qtdW/OvUQomr/BiM9C3tGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90672315"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="90672315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:16 -0800
X-CSE-ConnectionGUID: 6RQqRq8mSm2mR2EqndSyOw==
X-CSE-MsgGUID: 560ARiFMTPGF7OCF1OmJFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198637696"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.48])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:14 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t, v4 0/3] Enhance SVM compute tests
Date: Thu, 18 Dec 2025 13:56:04 +0100
Message-ID: <20251218125906.124925-1-francois.dugast@intel.com>
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

Add new tests used for SVM performance profiling.

v4:
- Correct size in xe_exec_system_allocator and remove unused variable (Zbigniew Kempczyński)

v3:
- Keep existing semantics of array_size (Zbigniew Kempczyński)

v2:
- Add first patch to differentiate array_size and loop_count
- Drop aligned_size as it is unused later, the test is always called with a size
- Remove the drm_xe_engine_class_instance argument as it was unused (Zbigniew Kempczyński)

Francois Dugast (3):
  tests/intel/xe_exec_system_allocator: Cleanup compute test
  lib/intel_compute: Allow user to override compute kernel loop_count
  tests/intel/xe_exec_system_allocator: Add new SVM compute tests

 lib/intel_compute.c                    | 36 ++++++++------
 lib/intel_compute.h                    |  2 +
 tests/intel/xe_exec_system_allocator.c | 65 ++++++++++++++++++++------
 3 files changed, 74 insertions(+), 29 deletions(-)

-- 
2.43.0

