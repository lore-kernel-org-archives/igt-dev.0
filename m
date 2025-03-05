Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F83C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 09:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CB910E719;
	Wed,  5 Mar 2025 09:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjZM8PJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153B10E706
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741165695; x=1772701695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=URZXgdrUpMlfD/oPUTwDv8oELLu2gtjTtWGtGJJo+a8=;
 b=PjZM8PJ9vux3IQfBRicjYVjlHDlp3pXRroqiR/UCpPgUgOLEymFYz5wk
 8D+Btsmtvk6fGGCw7APUuXcmRw7S+99q4nUQt3031+QBk+tDmjXVMQxWs
 efCsMlfJW6DcX4Sy6VxWKMOVf6y8VMP7Pos7w6eE2cXCy2nvqWiXvmYio
 MFo4Kp2dvvfN6mvRV+FGf39YqIEanzTDji39May47JZojNkVcKP1o+slN
 ZYGgCq7XzavcM3wMYRVIJ5P4WmbkkIHlEIMre98Whqu0Q+grJ8EHiEv5X
 kRZAae+94yewMkveMuFa8GLuUI/WSp/GQawDf4E0HzHhTbf4Swh3KTVUH A==;
X-CSE-ConnectionGUID: DLwrJe+jTBKWFH4zGJGPXw==
X-CSE-MsgGUID: kjuFPnGITHqF3AIUMyn08A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44925839"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="44925839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:08:13 -0800
X-CSE-ConnectionGUID: jrzjkolZTLCiV4fSnZoV3g==
X-CSE-MsgGUID: YfWaTLm7SVSQguD64zzazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123650995"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.38])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:08:11 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/5] Stress copy engines during render
Date: Wed,  5 Mar 2025 10:06:10 +0100
Message-ID: <20250305090743.16894-1-francois.dugast@intel.com>
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

