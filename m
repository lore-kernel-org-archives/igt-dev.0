Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00059C02198
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 00:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E1D10E9B5;
	Thu, 13 Feb 2025 00:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3e8l4X0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEC910E9B5
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 00:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739407154; x=1770943154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Eut39vLgvzwX4aRAZHu8emLnzin1PUU12S+HnTlJBsw=;
 b=f3e8l4X0L7L7a4wMH95Ve3GE00/BROnG3oLyBvbM+fMTQD58g5fOSHQe
 s7L3S1os43fkAqAMvGIoqgqUPqPI1RNIEeSaw+kehcQm4PkOD4hwRbaz/
 Tf+8jilgqb2UQBUKbMpT3G4DqfJl8e7pm6zjvI4iGVVqIjZTCKJxLi3kp
 vqMeU3HLKkoSSN7kg2Xb1tHptR6+M4VN/hDQKmfbVfLgEcEYytN3iUVc0
 gYFfwkLb8IeOjHuT2+17FDCStZvtPdE1MObFDMZ71p5Hd9bk1wIvFpugL
 4eDTKSUaJYOplJ6Yti6YS5rw8576TvvvEJxDUwk1qX/N5d9VqhSA1eCvJ Q==;
X-CSE-ConnectionGUID: hfExTFAZQN6L+CHp7aMO5w==
X-CSE-MsgGUID: PmoiIRaIQd+e3cXhjBhA/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65447639"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65447639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 16:39:14 -0800
X-CSE-ConnectionGUID: KL8J8f3kSVG4zKAuuBPyxw==
X-CSE-MsgGUID: Cm4BIhPWQeK+H5pmRmjFEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113887366"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 16:39:15 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v3 0/7] Xe: Add tests for PXP
Date: Wed, 12 Feb 2025 16:38:54 -0800
Message-ID: <20250213003904.2059770-1-daniele.ceraolospurio@intel.com>
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

Given that PXP introduces new interfaces and behaviors, we need to
update existing IGTs and add new ones to cover all the new scenarios.

Minor changes have been done to common functions to propagate the
PXP info and error returns.

v3: part of the v2 series has been split off and merged (see [1]) to
allow the kernel side to be merged without IGT failures. This is rebased
on top of that and addresses the review comments on v2 on the remaining
patches.

[1] https://patchwork.freedesktop.org/series/144158/
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (7):
  drm-uapi/xe: Sync with PXP uapi updates
  tests/intel/xe_vm: Update invalid flag subtest with valid PXP flag
  tests/intel/xe_query: Add test for PXP status query
  tests/intel/xe_pxp: Add PXP object and queue creation tests
  tests/intel/xe_pxp: Test PXP submissions
  tests/intel/xe_pxp: Termination tests
  tests/intel/xe_pxp: Test encrypted FBs

 include/drm-uapi/xe_drm.h |  123 +++-
 lib/intel_batchbuffer.c   |   45 +-
 lib/intel_batchbuffer.h   |    1 +
 lib/xe/xe_ioctl.c         |   26 +-
 lib/xe/xe_ioctl.h         |    4 +-
 tests/intel/xe_mmap.c     |    1 +
 tests/intel/xe_pxp.c      | 1173 +++++++++++++++++++++++++++++++++++++
 tests/intel/xe_query.c    |   61 ++
 tests/intel/xe_vm.c       |   23 +
 tests/meson.build         |    1 +
 10 files changed, 1435 insertions(+), 23 deletions(-)
 create mode 100644 tests/intel/xe_pxp.c

-- 
2.43.0

