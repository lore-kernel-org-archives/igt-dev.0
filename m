Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2C5CA601C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 10:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81E611204D;
	Fri,  9 Oct 2026 10:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZgXhGBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3AC112047
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541715; x=1823077715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Av7pK0VlSia5U9MV1/PP/yQDQ9nrtp7j8SMyGv6Y+Mw=;
 b=EZgXhGBGfa89NzfalXA+IrdRIshW2r1+Z6W93VhSB7bUN+0aUUxVT7JP
 uieCMwaaNvBZF8oHt72klGx5hdx5H5rECs7oA9Z7LetvXe3Jpf35wxJy+
 100MUgVIE+XpkkgWLj3lIRE3hVwQid/RjTmZi7D1RC/Ndkmr453pEHW7x
 PqxnvNMP1ZGa4e0a+YSFyKi+SF1/S8k5IhMdV6hYbQsAobBv4JAh25H/I
 lWBdGgu/WKFXPaoRMw5iQvuEcyY6d3L7AvtJFO40Oo31BrIBiB8n9Xes1
 6AJE8bHQD/R6AoIyMVFZTcEvH/9FZKg+piLQa9nIWt0GEc+G2tekMrdNz w==;
X-CSE-ConnectionGUID: 1A3h3lYFRe+rCfMvnPBvUg==
X-CSE-MsgGUID: ygy7PGmxQb23HfFEf421Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="218776"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="218776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:28:34 -0700
X-CSE-ConnectionGUID: bvXIiKUCTtqGXHH+XmsjWg==
X-CSE-MsgGUID: pzr4j+ldTWy2YhjmREQu1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="621478"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 03:28:34 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v6 0/5] Add BO Allocation and VM Bind stress infra
Date: Fri,  9 Oct 2026 10:28:27 +0000
Message-ID: <20261009102832.2839902-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
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

This series adds the base BO allocation infra for exercising Xe VM
bind/unbind with varying BO sizes and execution workloads 

This infra supports individual and array VM binds, random sized BO
allocation, threaded execution across engines, unaligned VA access and
leak/eviction scenarios.

Sobin Thomas (5):
  tests/intel: add BO allocation stress coverage
  tests/intel: Add random-size BO leak tests
  tests/intel: Add array-of-binds random-size allocation tests
  tests/intel: Add threaded random-size allocation stress tests
  tests/intel: Add oversubscribe concurrent bind stress subtest

 tests/intel/xe_bo_alloc.c | 1644 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1645 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

-- 
2.55.0

