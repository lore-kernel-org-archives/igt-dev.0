Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE04CC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D03E10E096;
	Wed, 28 Feb 2024 14:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sh79QaZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E9810E9FD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132055; x=1740668055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fua4ooAj6yvAoUZ6bwr0f0h8Y9I0ThH0gctsCqKRmA0=;
 b=Sh79QaZP6NRfS6fwAyVB4fa7LYjEUt03JDHxJnqYJ9vb1xYlPi54wxum
 F6c0nTy+Bs/o/Wp88iAMDSpHS5X9P+DaDaVnek6U3goUK6qkdXJeCMkoR
 e64orJTJdurwXqkkMLiGDGHeqTwjU3GU0OUQqy0oZtbVby1hGSbwpitNE
 x5mppFN7x4hEGenhwS8warZHjJ5JzI480JUNz6BIwFKZBeLcuFsqc8FNi
 dAWNWKxBPCPik0VicHguHjR5XVAMP+XxLhskF4RtiYqoZNwYe1hk2CrWz
 gMPkRFI5wcjePCs4QUFYwComF0WAyiLNifHLy8vA7kHiUdsrWHjOveyl5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7314179"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7314179"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="8022463"
Received: from wbosek-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:13 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 0/7] intel-buf changes for xe render-copy tests
Date: Wed, 28 Feb 2024 15:54:00 +0100
Message-Id: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We're missing xe render-copy tests. I learned this hard way on
kms-big-fb in which blits which are not started on (0, 0) are
wrong (see https://patchwork.freedesktop.org/series/130379/ for
reference).

I'm working on xe_render_copy tests (which will vary than
gem_render_copy counterpart) but before sending them I want
to separate library part changes - those are also used in i915
so I need to ensure no regression will be introduced due to
width/height separation and simplification of stride/height
calculation.

Cc: Matthew Auld <matthew.auld@intel.com>

Zbigniew Kempczyński (7):
  lib/intel_batchbuffer: Add I915_TILING_64 definition
  lib/intel_batchbuffer: Fix intel_bb_dump for Xe
  lib/intel_bufops: Add width and height to intel_buf
  lib/intel_bufops: Simplify buffer dimension calculations
  lib/intel_bufops: Use common helper to fill buffer with pattern
  lib/intel_bufops: Add png dump helper without detiling
  tests/xe_intel_bb: Dump do png without detiling

 lib/intel_batchbuffer.c       |  29 ++++-
 lib/intel_batchbuffer.h       |   5 +-
 lib/intel_bufops.c            | 204 +++++++++++++++++++++++++---------
 lib/intel_bufops.h            |  11 +-
 lib/rendercopy_gen7.c         |   2 +-
 lib/rendercopy_gen8.c         |   2 +-
 lib/rendercopy_gen9.c         |   2 +-
 tests/intel/api_intel_bb.c    |  84 ++------------
 tests/intel/gem_render_copy.c |  68 +-----------
 tests/intel/xe_intel_bb.c     |  84 ++------------
 10 files changed, 216 insertions(+), 275 deletions(-)

-- 
2.34.1

