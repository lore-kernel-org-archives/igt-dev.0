Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53143C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 11:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37C210E75A;
	Wed,  2 Apr 2025 11:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4Xa7Ens";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7AE10E75A
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743594684; x=1775130684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ymBCOUz3Rwa5lSE+P8kfEB/JmnCkBJm/Dk+7gUviv7M=;
 b=X4Xa7EnsXFkjrMwdrzyTOHruqTNOlT0Dwes9BGfU5FRnQS/xJnEtIZ27
 0qg25RFs6f+LtpzH++XE4Vy5z8ESUJsVPoVinh2aVgYRrmn7nN9ziGBYI
 Hhf9EmY1dMFZtekvwQs+vfVIsxQC+oIJQHTUzAaLlQHv4ey1ZKCBl1PEO
 EPtIDb3Uws1juP+oNryGTz7vZeC2CjYCEt9B7PiU1KGoZlluHAAth230R
 05qvmQgwRLfMyiDsJGVUVw0wqkE9VsX6mBXd1Ri9k7K00i5CWi8PplMy9
 FAY/gic0hjEd3mt0lj8k2WO6jFEPf1xfSxzoUf+2WuVUD/1qm9Ovzd8Eq A==;
X-CSE-ConnectionGUID: rfOIvL+TQdK7PAoyPy8pTQ==
X-CSE-MsgGUID: 1+g88fmTSSCMAxDMeCSdHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48743536"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="48743536"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:51:24 -0700
X-CSE-ConnectionGUID: IVnSZLdBSzGNF8S2qq+18A==
X-CSE-MsgGUID: B4aOSSrjQxinRfqfcD2Etg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="127184641"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:51:22 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v5 0/5] Stress copy engines during render
Date: Wed,  2 Apr 2025 13:49:58 +0200
Message-ID: <20250402115055.156765-1-francois.dugast@intel.com>
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

This series adds new tests to stress the copy engines with multiple jobs
in parallel, while measuring the impact on the execution duration of a
rendering job. This has been tested on BMG, where a typical run looks like
this:

    $ ./build/tests/xe_render_copy --r render-stress-*
    IGT-Version: 2.0-g9357110dd (x86_64) (Linux: 6.14.0-rc3+ x86_64)
    Using IGT_SRANDOM=1743593972 for randomisation
    Opened device: /dev/dri/card0
    Starting subtest: render-stress-0-copies
    461 render() loops in 3 seconds
    Render duration: avg = 3283131 ns, min = 2164366 ns, max = 6409991 ns
    Subtest render-stress-0-copies: SUCCESS (3.228s)
    Starting subtest: render-stress-1-copies
    616 render() loops in 3 seconds
    Render duration: avg = 2055815 ns, min = 1894560 ns, max = 4476194 ns
    Subtest render-stress-1-copies: SUCCESS (3.228s)
    Starting subtest: render-stress-2-copies
    456 render() loops in 3 seconds
    Render duration: avg = 3475385 ns, min = 2506288 ns, max = 5031407 ns
    Subtest render-stress-2-copies: SUCCESS (3.233s)
    Starting subtest: render-stress-4-copies
    186 render() loops in 3 seconds
    Render duration: avg = 10001653 ns, min = 8279572 ns, max = 12589235 ns
    Subtest render-stress-4-copies: SUCCESS (3.245s)

v3: Rename to xe_blt_mem_copy() and promote to xe_util instead of
    lib/intel_blt as this is xe-specific

v4: Follow Zbigniew's recommendation and adopt a new approach: the spinner
    is extended to optionnally perform copies. In the test, rndering only
    starts when copies are running. It runs for a defined time thanks to
    igt_until_timeout().

v5: Add XE2_ prefix to MEM_COPY_MOCS_SHIFT to make purpose clearer, fix
    documentation, use mutex to protect spinner initialization and avoid
    race

Francois Dugast (5):
  lib/intel_blt: Promote MEM_COPY_MOCS_SHIFT
  lib/xe/xe_spin: Add mem copy capability to spinner
  tests/intel/xe_spin_batch: Add basic test for mem copy from spinner
  tests/intel/xe_render_copy: Expose render duration
  tests/intel/xe_render_copy: Add new test for render under copy stress

 lib/intel_blt.c              |   3 +-
 lib/intel_blt.h              |   1 +
 lib/xe/xe_spin.c             |  14 +++
 lib/xe/xe_spin.h             |  19 +++
 tests/intel/xe_render_copy.c | 231 ++++++++++++++++++++++++++++++++++-
 tests/intel/xe_spin_batch.c  | 109 ++++++++++++++++-
 6 files changed, 372 insertions(+), 5 deletions(-)

-- 
2.43.0

