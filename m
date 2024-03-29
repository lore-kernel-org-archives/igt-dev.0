Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ACCCD1283
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 05:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F3D10E8C4;
	Fri, 29 Mar 2024 05:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdyTCwaE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E55B10E701
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 05:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711690134; x=1743226134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wMkJl8NAEWe9bTnFcL4kuvZUpPi2mCBn2H1uWIk6V28=;
 b=VdyTCwaETstWt1tujCp5SLA1W+X3HpMrcQi3A2iqLIDKEJxAfCDeUqqb
 Ajvl6no6Jd/HQgXokxlscBIyamn18quvc4sWYc0HIyH7FcmiNopHiYihR
 /sdbFe2/eurdofV3wBzN3b+zt/gwjxjxicj4VCvOZsEyLxj1i2WVk75dG
 P/XOM7qpDS/OUKM/ndm2F01QImtAhOtKFScqwfAG1sXnv8++v/YXehUiH
 SbvjmNWP2o2OdivjXFhqp5mRm0LPGph0RdmNgUU9KP04sYyGRDsiMNAI8
 uwTwt7BX7j6ypZfNi10NL5iNMNtMl3LHe3UeEHlc08NNyVTcFNAupFHyE w==;
X-CSE-ConnectionGUID: WlhQFgIXQi2fcwRpZEX+Eg==
X-CSE-MsgGUID: OAkKxEp6RRGHePnZkITogw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6731322"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="6731322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="16757694"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:28:53 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v3 0/2] Update compression in config based on platform
Date: Fri, 29 Mar 2024 10:26:59 -0700
Message-Id: <cover.1711733054.git.akshata.jahagirdar@intel.com>
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

In Xe2+ platforms, we need to run the xe_ccs test regardless of the status of
flat-ccs.
Check if the platform supports compression and has flat ccs enabled before
the execution of this test, and if it doesn't, then update to compression
disabled and proceed with the test.

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform has flat-ccs
    enabled
  tests/xe_ccs: Update compression in config based on flat-ccs
    enablement

 lib/intel_blt.c      | 14 ++++++++++++++
 lib/intel_blt.h      |  1 +
 tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++++--
 3 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.34.1

