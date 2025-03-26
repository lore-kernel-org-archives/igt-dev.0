Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96287C3600C
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 12:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DE710E6B2;
	Wed, 26 Mar 2025 12:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afjoCUPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E44310E6B3
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742990837; x=1774526837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bgkPgL22KqfepECOkoI7mVLA9d6y7w0qXMZtLWeuE/c=;
 b=afjoCUPINbO0j9x4yjjITMvR8pa4wL8qOc4b3u9eDyt989oVbqroWLAb
 XZ+QbCBOr0UJJXtgcrD8Y1Lvny1z9/ByALkIlv5xFdHpKRgtKFufmvIgU
 SZgnEkPsPkUBdWw5vVGokAE27lAvZefPiFT1iHlxPTOo4d+Exxe5ZopYx
 VigBa8kg3Ki18ALVdhP2FkTOqEixxlZKu+c1SIEgAPYbe7fFii3si2O0L
 9kLs1jE1XrV83QPBLD2CPbAAoeD8tpsd0pmoQeFuvaS932pud9787bbX1
 oluQ1Zr6QfF06Oud5VAZB430XrcNL0gSheFtRaiLepu21/iy8TAyTAh+d A==;
X-CSE-ConnectionGUID: D8VjadxYR/awb41CX5nffA==
X-CSE-MsgGUID: yTt0nsB7QGCDL3mx8R7ruw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44161994"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44161994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:07:11 -0700
X-CSE-ConnectionGUID: 7jArriuQRdOoq3NAY5eKLw==
X-CSE-MsgGUID: XY/Yg5U7QmCY3f5Qw4Jenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="155756659"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:07:10 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v3 0/5] Stress copy engines during render
Date: Wed, 26 Mar 2025 13:02:55 +0100
Message-ID: <20250326120623.124595-1-francois.dugast@intel.com>
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

    IGT-Version: 2.0-g21c8917a9 (x86_64) (Linux: 6.14.0-rc3+ x86_64)
    Using IGT_SRANDOM=1742990501 for randomisation
    Opened device: /dev/dri/card0
    Starting subtest: render-stress-0-copies
    Render duration: avg = 3924293 ns, min = 3187704 ns, max = 8860981 ns
    Subtest render-stress-0-copies: SUCCESS (0.404s)
    Starting subtest: render-stress-1-copies
    Render duration: avg = 2504371 ns, min = 1724688 ns, max = 3979533 ns
    Subtest render-stress-1-copies: SUCCESS (0.279s)
    Starting subtest: render-stress-2-copies
    Render duration: avg = 7610632 ns, min = 1784311 ns, max = 261435774 ns
    Subtest render-stress-2-copies: SUCCESS (0.546s)
    Starting subtest: render-stress-4-copies
    Render duration: avg = 17915510 ns, min = 1913233 ns, max = 778946986 ns
    Subtest render-stress-4-copies: SUCCESS (1.055s)
    Starting subtest: render-stress-16-copies
    Render duration: avg = 80099175 ns, min = 1620635 ns, max = 3885120584 ns
    Stack trace:
      #0 ../lib/igt_core.c:2054 __igt_fail_assert()
      #1 ../tests/intel/xe_render_copy.c:690 __igt_unique____real_main662()
      #2 ../tests/intel/xe_render_copy.c:662 main()
      #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
      #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
      #5 [_start+0x25]
    Subtest render-stress-16-copies: FAIL (4.246s)

v3: Rename to xe_blt_mem_copy() and promote to xe_util instead of
    lib/intel_blt as this is xe-specific

Francois Dugast (5):
  lib/xe/xe_util: Promote xe_blt_mem_copy()
  lib/intel_blt: Allow forcing multiple runs in blt_mem_copy()
  lib/xe/xe_util: Control ncopies in xe_blt_mem_copy()
  tests/intel/xe_render_copy: Expose render duration
  tests/intel/xe_render_copy: Render under copy stress

 lib/intel_blt.c              |  32 +++---
 lib/intel_blt.h              |   3 +-
 lib/xe/xe_util.c             |  56 +++++++++
 lib/xe/xe_util.h             |   3 +
 tests/intel/xe_copy_basic.c  |  36 +-----
 tests/intel/xe_render_copy.c | 217 ++++++++++++++++++++++++++++++++++-
 6 files changed, 295 insertions(+), 52 deletions(-)

-- 
2.43.0

