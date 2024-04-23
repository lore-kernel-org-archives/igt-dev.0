Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C11C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A86611376D;
	Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAv80RMt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCE610F32D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bzek3WG43NRvodtnKHVTS87UvdD1CwFsRbysNlGuGQM=;
 b=kAv80RMtRcaCihabdXmVHwSnyRv6jO/Hi1JnxEheF4VIsW9toCKpbZVj
 fN+ASyN9ttZ/mlssumOFcRLVXRaWe9gj+Ox6JGPvJdGCY/4p+OY2gw3//
 yesv1uEHonsQRIrKJuv590T4BbQfggsqy4fhl0Ju5uijrIaEbF20ZnzyH
 vWxIMRIzV0yPvuwSN34+LCZLhZN8TTi6siBGnniLVEaod8R8fd1Hc6AY6
 XysSpEgM5HC1E5T+2LeZ/j85w7aaL/EUkS2HwLKJjXmBsr+CsIYYD78qc
 bhjrEZUhLksvMVFX2wP+DX9Z5l4F+PnqpkMOCTw2xFB0Fioje6xq58Mr3 w==;
X-CSE-ConnectionGUID: JOGWzZc2Qgi81zMx+COZmA==
X-CSE-MsgGUID: D8ENzh4UTV+vIFNj1xx+cA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361979"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
X-CSE-ConnectionGUID: NcDNKmeQRKOJm0incwrJ8w==
X-CSE-MsgGUID: ohbE1+hwT861ZsXSeGYIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180890"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 00/21] gputop: Add support for xe
Date: Tue, 23 Apr 2024 16:44:10 -0700
Message-ID: <20240423234431.1959354-1-lucas.demarchi@intel.com>
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

v2 of https://lore.kernel.org/all/20240405060056.59379-1-lucas.demarchi@intel.com/

This contains all the patches I had pending for igt to add support in
gputop for the xe driver.

Not all of the patches are critical, some are more on the category
"drive by improvements/fixes". Let me split them for ease of review:

Patches 1-6: already reviewed in previous version, but needed to
refactor them a little bit to detangle them from other patches. I kept
the previous R-b for those.

Patches 7-10: these were already in the previous version as well, but in
a more noisy approach. This new version tries not to change multiple
times the same part of the code.

Tvrtko, worth noting that patches 7-10 still contain the strstartwith()
rather than find_kv(). I did try adding find_kv() back but due to that
function not inlining the strlen() was being computed again and again. I
decided to keep as is so could move to the more important part. Maybe we
can try something else on top.

Patches 11-16 implement the new interface from the kernel. Difference
from v1 is that it's now using the drm-cycles + drm-total-cycles
suggested in the kernel side review. The state tracking is a little bit
heavier due to having to handle 2 keys, possibly appearing in different
order and at the same time decide what strategy to use (drm-engine vs
drm-cycles). However with the additional renames I think this is much
cleaner than v1.

Patches 17-21 are gputop improvements to the visualization and
performance: last patch with lazy stat is back from an older series, now
with proper performance measurements.

Lucas De Marchi (21):
  lib/igt_drm_fdinfo: Fix wrong name len assert
  lib/igt_drm_fdinfo: Assert pdev is not truncated
  lib/igt_drm_fdinfo: Detect invalid drm-client-id
  lib/igt_drm_fdinfo: Stop ignoring space where not needed
  gputop: Extract method to update console size
  gputop: Extract clrscr()
  lib/igt_drm_fdinfo: Extract ignore_space()
  lib/igt_drm_fdinfo: Allow any number of spaces before unit
  lib/igt_drm_fdinfo: Stop passing key twice
  lib/igt_drm_fdinfo: Remove prefix arg from parse functions
  lib/igt_drm_fdinfo: Parse drm-cycles
  lib/igt_drm_fdinfo: Parse drm-total-cycles
  lib/igt_drm_clients: Rename engine busyness variables
  lib/igt_drm_clients: Move engine fields to substruct
  lib/igt_drm_clients: Record total cycles
  gputop: Add support to drm-cycles/drm-total-cycles
  gputop: print percentage number
  gputop: Add option parsing
  gputop: Allow to limit number of executions
  gputop: Allow to set delay interval
  lib/igt_drm_clients: lazy stat process

 lib/igt_core.h        |   1 +
 lib/igt_drm_clients.c | 106 ++++++++++++++++----------
 lib/igt_drm_clients.h |   9 ++-
 lib/igt_drm_fdinfo.c  | 172 ++++++++++++++++++++++++------------------
 lib/igt_drm_fdinfo.h  |  12 +++
 tools/gputop.c        | 142 +++++++++++++++++++++++++++++-----
 tools/intel_gpu_top.c |  15 ++--
 7 files changed, 315 insertions(+), 142 deletions(-)

-- 
2.43.0

