Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FE7E7717D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 00:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C665810E053;
	Thu, 12 Dec 2024 00:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/DMTzSR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDDE10E053
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 00:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733962719; x=1765498719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p4ozR9ULagqbwmleW7sFHPljyReaHukq65AiFk83w64=;
 b=W/DMTzSRqNk9wqLVhxXfLu9x6n9mw4NkQ30U6ZbOu1y4S4rR9jfZW1tD
 wDLZwlidhOw79W6sgkv2tBJTBldt7KREZhCKOETQwQmAyJ6DTGLZRPmrZ
 TMzdB99B9D0Dgq1C8gPId+p6s8ylE6W4SgJ3O+BbHN6kyXdL2le8jY9Us
 bq05J9t6eKj/afPHfm5CVmPSvDc4xNpPeXfEtUTjaXPcq7WguCKv+JIXr
 xzZ+Fe56St7Vsi8/8XspZOvnw+HREloDOxtE2OxlaNDH1dXyb2mfejrR1
 4yXNsL2L6ObNFZDWfanJBmOvlLqBjOlvE/dyrvOXJMcyICo022xEysXMN g==;
X-CSE-ConnectionGUID: LSTkQ3haRkiva27QjLcoBw==
X-CSE-MsgGUID: OD1hgO4/SsqYEvU/E/QBbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45040476"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="45040476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:18:38 -0800
X-CSE-ConnectionGUID: UxJ1nXcKS0upcdONZWEDgQ==
X-CSE-MsgGUID: uVQ0Nuj5Sn2J5Xmzfwmjeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126840857"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:18:38 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 0/7] Xe: Add tests for PXP 
Date: Wed, 11 Dec 2024 16:18:21 -0800
Message-ID: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
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

The PXP kernel patches are currently in review here:
https://patchwork.freedesktop.org/series/136052/

Given that PXP introduces new interfaces and behaviors, we need to
update existing IGTs and add new ones to cover all the new scenarios.

Monor changes have been done to common functions to propagate the
PXP info and error returns.

Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (7):
  drm-uapi/xe: Sync PXP uapi updates
  tests/intel/xe_vm: Update invalid flag subtest
  tests/intel/xe_query: Add test for PXP status query
  tests/intel/xe_pxp: Add PXP object and queue creation tests
  tests/intel/xe_pxp: Test PXP submissions
  tests/intel/xe_pxp: Termination tests
  tests/intel/xe_pxp: Test encrypted FBs

 include/drm-uapi/xe_drm.h |   94 ++-
 lib/intel_batchbuffer.c   |   25 +-
 lib/intel_batchbuffer.h   |    1 +
 lib/xe/xe_ioctl.c         |   26 +-
 lib/xe/xe_ioctl.h         |    4 +-
 tests/intel/xe_mmap.c     |    1 +
 tests/intel/xe_pxp.c      | 1144 +++++++++++++++++++++++++++++++++++++
 tests/intel/xe_query.c    |   61 ++
 tests/intel/xe_vm.c       |    7 +-
 tests/meson.build         |    1 +
 10 files changed, 1345 insertions(+), 19 deletions(-)
 create mode 100644 tests/intel/xe_pxp.c

-- 
2.43.0

