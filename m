Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D5FD358DA
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EAE10E30C;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFoVTEw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7902E10E30C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769672821; x=1801208821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rcpgoE5lcCwBeDV5sY4r43HWBHr05LLA6PPwODLEBFs=;
 b=gFoVTEw6DHRjkynRklDDSNIQL2/NoLoC6/4PYcBNpiSWT0P10Qi4g1Vd
 sxCg3I32h1g1349hKHBOXjUVczR1C/bS5yMIWRZHLc/BSyK6Xj0ybwEHR
 /f2HKNKSVWuEzzUJPqGw+LenAU93qAIWUbCr4Q9t98ckzvdzvbrrYTLBp
 /tS11+qiFGeY8vLRySkRiOJsohzWwPeubTbUzisVy1FX+hbk+VLUjeg9G
 m+Mhc9zmnn6sbVxApTrlx6/eIUqjWhVban+zxcRyqBVg/Ae8VlZmxzoFX
 6LcxLW5Af4DnsLSXzFU9H7yoUnaln3LoPnouK9WpvWt8UMDMlXUOA1pVL w==;
X-CSE-ConnectionGUID: USv6xttKS9ur08nR2ptgSA==
X-CSE-MsgGUID: H0DOxCJzRgGetY0x1Ad5oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70874007"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70874007"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:47:00 -0800
X-CSE-ConnectionGUID: yRxulzOASRK55HO6wDZfaQ==
X-CSE-MsgGUID: 8mVokos5QqmmXkasO35VmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213372837"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:46:59 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v6 0/2] Fix chamelium port allocation during igt_fixture
Date: Thu, 29 Jan 2026 13:15:18 +0530
Message-ID: <20260129074520.397133-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

The current fixture implementation executes even for unrelated subtests,
causing false failures when expected inputs were not present.
Refactor the DP/HDMI/VGA hotplug tests to use a common
connector lookup pattern so that each test skips cleanly.

v3:
- Introduce a unified connector test macro (Sebastien)
- Remove unused variable (Sebastien)
- Drop per-connector fixture usage (Sebastien)
- Refactor DP/HDMI/VGA hotplug tests (Sebastien)

v4:
- Rename helper to igt_chamelium_get_port (Jeevan)
- Add documentation for helper and macro (Jeevan)
- Use lowercase name for test macro (Sebastien)

v5:
-Iterate and test all matching connected ports (Kunal)

v6:
- Fix macro structure to ensure safe expansion and proper scoping (Kunal)
- Make the macro independent of assumptions in the calling test (Kunal)
- Move connector_test macro to kms_chamelium_helper
  for correct layering (Kunal)
- Use suffixed local variables to avoid name collisions (Kunal)
- Add igt_info logging to show which port is being
  exercised by each subtest (Kunal)

Mohammed Bilal (2):
  tests/chamelium/kms_chamelium: Add connector_test() macro
  tests/chamelium/kms_chamelium_hpd: use helper function for connector
    lookup in DP/HDMI/VGA tests

 tests/chamelium/kms_chamelium_helper.h |  33 ++++
 tests/chamelium/kms_chamelium_hpd.c    | 239 ++++++++++---------------
 2 files changed, 131 insertions(+), 141 deletions(-)

-- 
2.48.1

