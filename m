Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26957C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 09:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A7510E79C;
	Fri, 20 Feb 2026 09:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSQxBO9R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456E210E79C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771579844; x=1803115844;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3C2vJ16vP4hWHj3ECs4MSzeZaLWx7nV+K6KKdVImEGI=;
 b=JSQxBO9RrTgCNz7UNMu8O/xzeff48J08MiS6OljIokkFJooUh2kLuWIc
 VwloXH8Q+8ZZpPmPOIaTOoPnW3HM/A7rmDSjtkxAfSZ3wUJQbmcO5TN6P
 CPnzRgrNO962Qq/8V8FNVFegsVjXg0U3fxW6pi+9296oBeuWHnRxtHJzX
 90jI5CUlPvHeDNFHD9dcUE5fqzMWnCgNJdzwMHqxHJvu2BvdSNYavivKu
 D0lDrucgdiium9CGcBJD2xFGSgaYQUJkLfZYaHun5SBbxChPVNO0+bEYb
 phKnEjFe8PEHBZyVBz18EgENzh4g7BWu902kSraDVHmtXhoC7BcYM4I76 g==;
X-CSE-ConnectionGUID: H66Quem2SkuMqbC1cR5BAg==
X-CSE-MsgGUID: 1mYFNhhCTyuVxRFXREU6iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72373781"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72373781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 01:30:44 -0800
X-CSE-ConnectionGUID: 92oXU0KATI2zugAmO8CSrg==
X-CSE-MsgGUID: Zot8hB5dT52a2Tgu7M7Gsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214030422"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.6])
 by orviesa010.jf.intel.com with ESMTP; 20 Feb 2026 01:30:43 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/3] Add memory write ordering verification
Date: Fri, 20 Feb 2026 09:30:38 +0000
Message-Id: <20260220093041.1911492-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

The patch series introduce a new gynamic subtest which verifies memory
relax ordering using copy and write operations across different memory
regions and buffer sizes (1M, 2M, 8M). For each memory region, the test
checks both copy and write transaction ordering to ensure correct memory
behavior on Intel GPUs.

Nishit Sharma (3):
  tests/intel/xe_exec_store: Validate PCIe6 relax ordering
  tests/intel/xe_exec_store: Enforce per-instruction copy limit for
    MEM_COPY
  tests/intel/xe_exec_store: Extending test scope for PCIE6 relax
    ordering

 tests/intel/xe_exec_store.c | 230 ++++++++++++++++++++++++++++++------
 1 file changed, 197 insertions(+), 33 deletions(-)

-- 
2.34.1

