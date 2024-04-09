Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB25CD1284
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 11:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B3112CD4;
	Tue,  9 Apr 2024 11:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIJRE1W3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CD2112537
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712661572; x=1744197572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5u8nbf2BVdYP2bwTIiJH+Hu6qJOUNiLF61Y18gGCTgM=;
 b=aIJRE1W3ZvMJtKEDPJ2Bd5tZsq1o6Wstmzwbjl7vZiYjC7jrVJoTYg47
 G9JRnSdxZg+fsDfhs39IX3VDGVBBRiotHuMyRpITjp/PK550aOJ5NUZjI
 itwFjcR1bmDc8q7qXkPR9bVLU/VkzApUrfl3QdcCpM5thvt++hiJdB2Rq
 sCt954L+4zXRUcJ6E8Oe/CdHBKCisyeiWNJukxxtSTSpy8BT1QONnp5iu
 a2HSNnqCK61ONkhcxkt/XWU2LWlbL632Haj8PYaMeU8bCea3W4oCz56iV
 ccdMmz9C9FVGmZdFWyrpV4aqcCXrxULJMKbvisA1t1Cmhq9vokyh/ScAR w==;
X-CSE-ConnectionGUID: Ea67l7naT6SqtsEQDe5ROA==
X-CSE-MsgGUID: UrbaDONtSmSI1/D6IKX3wQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8543842"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8543842"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:19:31 -0700
X-CSE-ConnectionGUID: 97SbR6YZQWq4aHd9kYz4gA==
X-CSE-MsgGUID: HkbTO1ZlSX+LxunAZCrysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24929677"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:19:31 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/5] Fix name collisions in Core test documentation
Date: Tue,  9 Apr 2024 11:19:10 +0000
Message-Id: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
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
 tests/intel/i915_selftest.c            | 24 ++++++++++++------------
 tests/intel/perf.c                     |  6 +++---
 tests/intel/prime_mmap_kms.c           |  2 +-
 tests/intel/xe_exec_compute_mode.c     |  2 +-
 tests/intel/xe_live_ktest.c            |  6 +++---
 tests/intel/xe_waitfence.c             |  1 +
 tests/prime_nv_api.c                   |  2 +-
 22 files changed, 46 insertions(+), 45 deletions(-)

-- 
2.34.1

