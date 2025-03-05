Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281F7C282EC
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 13:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4AF10E2A1;
	Wed,  5 Mar 2025 13:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC1qRKcq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4409410E2A1
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741183115; x=1772719115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=URZXgdrUpMlfD/oPUTwDv8oELLu2gtjTtWGtGJJo+a8=;
 b=DC1qRKcq4TkBQoxH0eGV5tYyyXH7O6iSBgvaNr0F+lWmwgRSZ3S0E+Sn
 1KQ0WKxn46jsTRfRO+MTPFMnYRnMnWVrCwa4yMrOMrZLUfG9lszM7N99Z
 V0yzzT71KDorq2ODBvGTumFwkHttOXySujC3M73Uvlw/K4ljL7zFQ/7sK
 xNvKib7GLE8OJWACYC4rFcbmr6Uj/P4rUYIsdwlowy2oIB0E3VRXKMWKT
 ENJz4LjtbFW7k4hdjkvYUnSY1Q7tpuy93qpCDFTWNm6bvZBYUfURQMTjd
 6Z6PyWWUic+t25dbClqCsnX7D+Tc2ggRLesrIzSdJN+9T2JN70XRpCENK Q==;
X-CSE-ConnectionGUID: 1tIe7aRcQ4S6dZ9GFsSK7A==
X-CSE-MsgGUID: VcnWkYa6R96C/2JUESk6cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52350130"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="52350130"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:58:35 -0800
X-CSE-ConnectionGUID: nIygX22KSf6XwEaOpBwkJA==
X-CSE-MsgGUID: CuTTFWnxQq62MCLYdlGslw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118517111"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.38])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:58:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/5] Stress copy engines during render
Date: Wed,  5 Mar 2025 14:57:55 +0100
Message-ID: <20250305135821.37517-1-francois.dugast@intel.com>
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

This series uses existing BLT copy code to stress the copy engines with many
jobs in parallel, while measuring the impact on the execution duration of a
rendering job. This has been tested on BMG, where a typical run looks like
this:

    IGT-Version: 1.30-gd625bfd4f (x86_64) (Linux: 6.14.0-rc3+ x86_64)
    Using IGT_SRANDOM=1741100923 for randomisation
    Opened device: /dev/dri/card0
    Starting subtest: render-stress-0-copies
    Render duration: avg = 3026116 ns, min = 2366875 ns, max = 6821519 ns
    Subtest render-stress-0-copies: SUCCESS (0.326s)
    Starting subtest: render-stress-1-copies
    Render duration: avg = 2301721 ns, min = 2053743 ns, max = 3889482 ns
    Subtest render-stress-1-copies: SUCCESS (0.276s)
    Starting subtest: render-stress-2-copies
    Render duration: avg = 7398805 ns, min = 1673659 ns, max = 261850405 ns
    Subtest render-stress-2-copies: SUCCESS (0.535s)
    Starting subtest: render-stress-4-copies
    Render duration: avg = 17759307 ns, min = 2036909 ns, max = 780867436 ns
    Subtest render-stress-4-copies: SUCCESS (1.059s)
    Starting subtest: render-stress-16-copies
    Render duration: avg = 79980375 ns, min = 2014429 ns, max = 3884022695 ns
    Subtest render-stress-16-copies: SUCCESS (4.180s)

Francois Dugast (5):
  lib/intel_blt: Promote blt_bo_copy()
  lib/intel_blt: Allow forcing multiple runs in blt_mem_copy()
  lib/intel_blt: Use blt_mem_copy() to stress copy functions
  tests/intel/xe_render_copy: Expose render duration
  tests/intel/xe_render_copy: Render under copy stress

 lib/intel_blt.c              |  86 +++++++++++---
 lib/intel_blt.h              |   6 +-
 tests/intel/xe_copy_basic.c  |  36 +-----
 tests/intel/xe_render_copy.c | 212 ++++++++++++++++++++++++++++++++++-
 4 files changed, 288 insertions(+), 52 deletions(-)

-- 
2.43.0

