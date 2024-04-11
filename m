Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B547DCD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 11:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C90C10E3A1;
	Thu, 11 Apr 2024 11:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rq9BZsTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9354D10E3A1
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712834252; x=1744370252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KzqxmePtOb26oBfhC48Grp+5Nwt/63afnPij3bG8Pws=;
 b=Rq9BZsThUbLQ1AfDGlNcGSHWN/Xo+0CAdhSDtqTOAG+Ts4v83bYAUHCr
 LY0f7Dlp1Wi+Oj1w2yL15f3F8HlFNrQX1IZUF6L+VR16F3sKLPHxz9akq
 e8gCdnxOMXqjSTIFBZCjHwS3rRu3cUT8Nvf3mXCNYLxWdsHF6jzy3vuUV
 rq7Z+zqM5Um+F7I87aYguq55c2draeVy2/KjmQ0hOMAO6Bqn8U3CNmSWe
 a6B9yKpZ6RAvdBEH17bhCfPZoH12NXjR5Nc985mFoFOlX2DNqypPLSyHA
 mXw0aXgFjXYcsjxSt5Ck6eAooPJbNjc7pTgeoPy7i2Sn6PAw+ppo6ljun g==;
X-CSE-ConnectionGUID: FA1AfPOwRSehFdk3v+M5pA==
X-CSE-MsgGUID: NIyfKK1/Qve32KXNSyTJmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8344471"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8344471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:17:31 -0700
X-CSE-ConnectionGUID: LsBR2rneSbm7PgL7R6TDtA==
X-CSE-MsgGUID: gYteRY4SRVivjCE4SkxbvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="44156072"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:17:28 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 0/5] Fix name collisions in Core test documentation
Date: Thu, 11 Apr 2024 11:17:12 +0000
Message-Id: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
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

After updating i915 and XE test documentation for Core there is a need to fix
some name collisions to make our infrastructure happy. These changes are around
Core tests. To make sure all name collisions were removed I was using
scripts/doc-tests-cross-check.sh. Remaining collisions are around KMS tests.

Series contains also adding missing test documentation to xe_waitfence
testcases.

v2: Fix one more collision found by Kamil

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Katarzyna Piecielska (5):
  tests/intel: Add missing Sub-category for xe_waitfence
  tests/intel: Remove name collision in Display tests visible in Core
    docs
  tests/intel: Remove documentation collision for Obsolete category
  tests/intel: Remove documentation collisions in i915_selftest
  tests: Remove collisions with Subcategory and Functionality

 tests/dmabuf.c                         |  2 +-
 tests/dmabuf_sync_file.c               |  2 +-
 tests/drm_mm.c                         |  2 +-
 tests/drm_read.c                       |  2 +-
 tests/intel/gem_exec_endless.c         |  4 ++--
 tests/intel/gem_exec_params.c          |  4 ++--
 tests/intel/gem_fence_thrash.c         |  2 +-
 tests/intel/gem_fence_upload.c         |  2 +-
 tests/intel/gem_fenced_exec_thrash.c   |  6 +++---
 tests/intel/gen3_mixed_blits.c         |  4 ++--
 tests/intel/gen3_render_linear_blits.c |  4 ++--
 tests/intel/gen3_render_mixed_blits.c  |  4 ++--
 tests/intel/gen3_render_tiledx_blits.c |  4 ++--
 tests/intel/gen3_render_tiledy_blits.c |  4 ++--
 tests/intel/i915_pipe_stress.c         |  2 +-
 tests/intel/i915_selftest.c            | 26 +++++++++++++-------------
 tests/intel/perf.c                     |  6 +++---
 tests/intel/prime_mmap_kms.c           |  2 +-
 tests/intel/xe_exec_compute_mode.c     |  2 +-
 tests/intel/xe_live_ktest.c            |  6 +++---
 tests/intel/xe_waitfence.c             |  1 +
 tests/prime_nv_api.c                   |  2 +-
 22 files changed, 47 insertions(+), 46 deletions(-)

-- 
2.34.1

