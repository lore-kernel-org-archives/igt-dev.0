Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE19C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 10:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D94A10E0A7;
	Mon, 14 Apr 2025 10:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnudj+nA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB0010E0A7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744626808; x=1776162808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TborzrykOMhMFx3vG3NkEwHelO+VEOrpe7GOMWSuS+U=;
 b=jnudj+nA0ci+R5KG7QGOLvhWiaHgIH5NuqUOcv9rex82QWCZinG/3zxH
 oKEVyZsLPtplySOwd3mMQHrUPCz70qeXg0jLzdJ3ItIntM+QMEqxVYxBY
 I9rxcXV4+5PJ25m6Pt7SnlZsQ3XFxE0FTNcCf7J5dBSch8DRqKR7iGJr9
 I6MDuNA00c3mDk021gDrXqU+gp+ZyapG/Uoxz5bWR2Nij7mTzqJyR7JNK
 6DSg8t5de3GfNcZAp46UecaFN/Coq5dmnlYUugIPr9V9/0WKhwsa+RUIB
 VtfzQ/qjpSPQ2sNUmzlN6bryjktCtWZECW5Ktj6caMUO09x4aSIP0dQUl Q==;
X-CSE-ConnectionGUID: YWJUxd0VScC1l1IiuBVbHw==
X-CSE-MsgGUID: iBqlwUMbSkSo7UtJCD0TcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57474332"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="57474332"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:33:27 -0700
X-CSE-ConnectionGUID: W8xkrrrhTdOQQHJxypS0IA==
X-CSE-MsgGUID: gV9nsJDCRlueEzGi0jfJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="166961127"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:33:26 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t, v6 0/5] Stress copy engines during render
Date: Mon, 14 Apr 2025 12:31:40 +0200
Message-ID: <20250414103316.27082-1-francois.dugast@intel.com>
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

v6: Use /* */ for comment, add igt_require(blt_has_mem_copy(fd))

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
 tests/intel/xe_render_copy.c | 234 ++++++++++++++++++++++++++++++++++-
 tests/intel/xe_spin_batch.c  | 109 +++++++++++++++-
 6 files changed, 375 insertions(+), 5 deletions(-)

-- 
2.43.0

