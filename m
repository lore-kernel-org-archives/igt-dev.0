Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBDCE77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 09:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408EE10E1CC;
	Mon,  6 Jan 2025 09:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFjLcnDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C9310E1CC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736156678; x=1767692678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bFfAMMQMMYyNKjkMYnCqu9+xzlVutG0TloCBvVFfAnk=;
 b=IFjLcnDvGYa5MWImvjB9wKoGdVUuyBRmboqfXhIjByFvCG9nNcm69AK0
 TGa0n+QVIBVCXFMtRD20IAxofLjHFyZH4x21W1y+rSxKyoU4IkeijbnW5
 fLuXsNLho2bMcOAyz+WDhTEdCjZCK4cRoK6hncNx2sw4S6RT+iXAUM5Ti
 fGWP0DeK/UZjZZ2TnYrVA366QwOUmtdlGmEEnzywiMaz78HZYzfNaOQ9b
 ljq9fXcMPNgfSi8PXa4pMmCkQglaOXOy85gufNGTB/lzIAbCqt0qeKW2k
 GmZduCE5u5x1SsI2nZlWAopTPd1+6Ymrzk+IrKZTbTFqJUwdy0TusBOgQ g==;
X-CSE-ConnectionGUID: KCmr40pYRfOXLZ8KcBesOw==
X-CSE-MsgGUID: HW5FT0e7R0WhPhG8FWatqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36413267"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="36413267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 01:44:37 -0800
X-CSE-ConnectionGUID: tgvbmLUqSwKiXGrYlGI6lw==
X-CSE-MsgGUID: tauEDGbaTIeGSx2+V6VaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="107251561"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 01:44:35 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Remove redundant hotplug detection assertion
Date: Mon,  6 Jan 2025 15:12:57 +0530
Message-ID: <20250106094259.931356-1-ramanaidu.naladala@intel.com>
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

Remove Hotplug assertion from chamelium edid test.

Naladala Ramanaidu (2):
  tests/chamelium/kms_chamelium_edid: Remove unnecessary hotplug
    detection in EDID test
  HAX patch do not merge

 tests/chamelium/kms_chamelium_edid.c     |   2 -
 tests/intel-ci/fast-feedback.testlist    | 171 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 276 +----------------------
 3 files changed, 8 insertions(+), 441 deletions(-)

-- 
2.43.0

