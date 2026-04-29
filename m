Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C251EFF8875
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 09:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727BA10EF12;
	Wed, 29 Apr 2026 09:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDhbOX6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4D010EF12
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777454945; x=1808990945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zGDDe4S2h7jV5DiX+ODeMbv7hWTsDaNm2tb2eYACGjE=;
 b=HDhbOX6Hv6a0c01GTg8S5JnWSeemPNfTnCpXbnlyx2t2f9cgweu39zZb
 9PMfAjWly34FsoeZPmM5WO/WDvf4sN44zSDgbkzvtS/XrEwcpm76pvAmP
 BDmPyRZMHnX3D1Lcb4oXYDCzkIkkpfwFFs4HwkAm9pgM3g9WunMnnwmf5
 Y2yl4An3Vtgqqy8+a0QBPQ7QHz4BWp/oFT+3jlgjVFMR/xqiGko38WywO
 F+m2RZmJBffrMpTiTcK9Vu2CXkvfFaLeUUCELAjPAJQSECOWwQEdVil+T
 y/16S0kwbtJmYkYS2ylcqqTqf2yFz5OSUVDUWGBiJiAtG2+stZWnhCEfQ g==;
X-CSE-ConnectionGUID: vhepmn9NSGGkx1XL7xewag==
X-CSE-MsgGUID: RCMortxGSZ2aQcXWQ8AV8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95798149"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95798149"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:29:05 -0700
X-CSE-ConnectionGUID: htMOuio9RHyILZLLGRBpXg==
X-CSE-MsgGUID: rzdpOMHmRsWRwbKTvsVUiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="234223118"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa009.jf.intel.com with ESMTP; 29 Apr 2026 02:29:04 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 0/3] Fix incorrect skips and improve cleanup
Date: Wed, 29 Apr 2026 15:09:52 +0530
Message-Id: <20260429093955.3726263-1-pranay.samala@intel.com>
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

This series fixes issues where tests were being skipped 
incorrectly and cleanup was not always happening.

Capability checks were earlier done outside dynamic subtests, 
which could cause valid cases to be skipped if a later output 
checks fails. Move these checks inside igt_dynamic_f() to ensure 
each case runs independently.

Cleanup is also improved by centralizing framebuffer handling 
and calling test_fini() after each dynamic subtest, so resources 
are always released even on early exits.

Pranay Samala (3):
  tests/kms_hdr: Move framebuffer into data_t for centralized cleanup
  tests/kms_hdr: Move test_fini() for proper cleanup
  tests/kms_hdr: Move capability checks inside dynamic subtests

 tests/kms_hdr.c | 207 +++++++++++++++++++++---------------------------
 1 file changed, 90 insertions(+), 117 deletions(-)

-- 
2.34.1

