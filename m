Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE560C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 06:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9813210E2DC;
	Mon, 12 May 2025 06:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dj/pDEQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3113C10E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 06:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747032151; x=1778568151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GqB+JKOU4/pDjz1lKRwzQBd28ZC1Qv7PaTv98jtZc50=;
 b=dj/pDEQAUY61o3bcGZSGPfUoG2YjpAg8jiKaZ7Z4T12+EDSZbPgtngku
 0CaRH3bY+RPhluVHdDHF+HAV5TIbfhcAY4Z5kABfu/yEX5v/exOVmNh4O
 Y6VwI95hKovcoFQRgwUQ8ndhvb5VR+yYjQrT0Ce0Z7z/qFldGoBrGoYdo
 qJx+NWeiYmFg2WusDjSBCJPWx0YdGaPmiq5JC2dFxRql2k2xot307+TjD
 ZnpoxKJvIxkUI0DYZEyVdC+LmiSvpSMtVakpHcLWyEgtFwfOKcmYsnEe4
 aUdzYqasaoNgcHextx943/zuLGmwA8d+B2bIYS5LJ5nz43K3q869W/p0n Q==;
X-CSE-ConnectionGUID: lw7xd1tCSESKyIU68M0VGA==
X-CSE-MsgGUID: 8xvA3E1LQZqAzIH7ZMB4sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48888451"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48888451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:42:31 -0700
X-CSE-ConnectionGUID: hjMzRPJqQdy+/mU/pWQT1g==
X-CSE-MsgGUID: 688VanDrRx+TNmQA2j2GtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137292682"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:42:28 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v3 0/5] Add more tests to validate engine activity
Date: Mon, 12 May 2025 12:35:46 +0530
Message-ID: <20250512070551.774270-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add more tests to validate engine activity

1) engine-activity-single-(load/load-idle) : Validates engine activity
by loading a single engine and checking if others are idle

2) engine-activity-all-(load/load-idle) : Validates engine activity by
loading all engines simultaneously.

3) engine-activity-most-(load/load-idle) : Validates engine activity by
loading most engines except some

v2: fix CI failures using allocator
v3: rename to check_all_engines and use flag per engine (Umesh)

Riana Tauro (5):
  tests/intel/xe_pmu: Add a helper function to check and end cork
  tests/intel/xe_pmu: Move descriptions of tests to the top of file
  tests/intel/xe_pmu: Add tests to validate engine activity with single
    engine active
  tests/intel/xe_pmu: Add tests to validate engine activity on all
    engines
  test/intel/xe_pmu: Add tests to validate engine activity by loading
    most engines

 tests/intel/xe_pmu.c | 320 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 280 insertions(+), 40 deletions(-)

-- 
2.47.1

