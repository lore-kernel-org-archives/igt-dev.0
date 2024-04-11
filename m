Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE91CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A8010F0A8;
	Thu, 11 Apr 2024 13:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yu4vAXk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A8E10F0A8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841369; x=1744377369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XAMpvwqzCPr7FpYcB/Y6U4UuuLXnlyMm1Mr0jmeM4Xw=;
 b=Yu4vAXk/cpUzZViShieDeZKebD6ZoqssS8HfRqXqXB1WQRlUMnCba6CO
 yFQbTmWBvG+7+6yW8lWASOhY1pZlAqPZ5qnPff5cMeI1+r8QjUrHvf2vb
 k8XaOd+apDoOMpeLMbEpVzirPGSzilrTcc4xcBpcWzhsIZZJzTTrbk8L4
 84JPktx15vJsFQRtXgSsgC/e4XLuboTdpIJkJFZp32M2CZ5KwEBePMnQt
 lPVaa6bJKkE1vD5H23v3NswPVArIH1TMhk7Spyz62yfRrjPFzfJ/PLG5n
 cpQk0s0tEz/UdhAjw4YpYcXDyBL/FUlC2sDlBUkefanLBc3mPgsBNzVTp w==;
X-CSE-ConnectionGUID: HHU/jAyoR+ClvzDmRYcvcw==
X-CSE-MsgGUID: GEGBwMkrQ7Wt6olEJtLP1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25760705"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25760705"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:08 -0700
X-CSE-ConnectionGUID: MgxUnegiQQ65bVdjjeHXTg==
X-CSE-MsgGUID: h4rXTCUNQTW2lFXyjFbKXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21486836"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:05 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 0/5] Fix name collisions in Core test documentation
Date: Thu, 11 Apr 2024 13:15:49 +0000
Message-Id: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
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

After updating i915 and XE test documentation for Core there is a need
to fix some name collisions to make our infrastructure happy. These
changes are around Core tests. To make sure all name collisions were
removed I was using scripts/doc-tests-cross-check.sh.

Series contains also adding missing test documentation to xe_waitfence
testcases.

v2: Fix one more collision found by Kamil
v3: Remove remaining all collisions seen by doc-tests-cross-check.sh
script (Kamil)

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
 tests/intel/kms_fence_pin_leak.c       |  2 +-
 tests/intel/kms_pipe_b_c_ivb.c         |  2 +-
 tests/intel/perf.c                     |  6 +++---
 tests/intel/prime_mmap_kms.c           |  2 +-
 tests/intel/xe_exec_compute_mode.c     |  2 +-
 tests/intel/xe_live_ktest.c            |  6 +++---
 tests/intel/xe_waitfence.c             |  1 +
 tests/kms_tv_load_detect.c             |  2 +-
 tests/prime_nv_api.c                   |  2 +-
 25 files changed, 50 insertions(+), 49 deletions(-)

-- 
2.34.1

