Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0ABC3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 12:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059E710EACC;
	Wed, 17 Jul 2024 12:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYtVZzof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA3E10EAD0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 12:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721219503; x=1752755503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iR4JjMHVmORzCkA0IvU/vV7mfVUvosuGwsiZaayOAXc=;
 b=LYtVZzofi8uNTY5J3aDs55wHkO+ZBUSY+0sVCtQGBgX8LZohTgncLOI4
 YCK3BTLSkQNzkDcK96g3fFggXpUp+DQ/P9miygJs7dCxqjzoXDy5GHieo
 TuRGDq5PbVBdT1AlAngwgO77hEPbgVvYYQ7MFo0yIpRGjfUIxX/k2HubY
 e0XhQBh7YudrKdJ6H7671K5pSj1nDr4eAqnNT/+duclr07Xgk9qXBVXWb
 BnTkeOMZl9x19iEm33XCYhZZAVKAZjZMPt1ylp6oGIUUipzOXDOi8ukIi
 MHp9VC2iDRDRgc1LJpeuRMuuJDNXDLj9Zwyeu0a2rvhaH/TgdRyatPSMM A==;
X-CSE-ConnectionGUID: kE7kWMRjRtG1uMK+dATrBA==
X-CSE-MsgGUID: wjdyBgAfRZG523A8s5OCTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29386629"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29386629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:31:42 -0700
X-CSE-ConnectionGUID: vr07FaJARvSEImLCnbdbQw==
X-CSE-MsgGUID: OxjriGSaSNiLFyhEOYcmBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54699269"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:31:41 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/1] xe_exec_mix_modes: Add new tests for parallel
 execution
Date: Wed, 17 Jul 2024 14:30:47 +0200
Message-ID: <20240717123120.1065167-1-francois.dugast@intel.com>
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

These new tests as expecting to fail on current KMD as submitting dma
fence jobs and faulting long running jobs on the same device is
forbidden. A KMD series is coming to remove this restriction.

Francois Dugast (1):
  tests/intel/xe_exec_mix_modes: Add new tests for parallel execution

 tests/intel/xe_exec_mix_modes.c | 277 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 278 insertions(+)
 create mode 100644 tests/intel/xe_exec_mix_modes.c

-- 
2.43.0

