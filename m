Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815F0C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 00:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB3310E15B;
	Thu, 16 Jan 2025 00:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYelZdxY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAB910E15B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736986807; x=1768522807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wlnRUl2duq1ffDgdfPxC+Osww72yWjm6fqyXWhkxUnE=;
 b=PYelZdxYV2Eh7HLlKL2cw7QiJBJNeWBAvVL9rzSmxbe+76QKqrZ6C2sq
 I1z2P+mHl9HsdxiY51Wdid68/bkv1S0t3aPWwksczlix2W0OeOrP74v4V
 g331VKrXX+N0tXqrUkFaMgJ/dBDKwZQ/8Y8tYl17UM/9NeyTCuf8N+YnZ
 tBxlKc0x+OjJmsczWlhYru1nXxeg9MF/1ci8rgyu4GAV086Ma7nA3zexq
 LrvQEnaZ/HNt6maZjaAc/8vY2ZST8Dnmobp5EWjAERK8qynCFQpfnhBjZ
 GYQGvvjDE+X3Km8L2yLNF541+zb1126VyajNZ7nczIBBjMxuhUIwUKbtu w==;
X-CSE-ConnectionGUID: Vm4ZoMdsRAOvKy5KuopdTw==
X-CSE-MsgGUID: mpll1cXHTIiRRVXpG9evVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37374269"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="37374269"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:20:07 -0800
X-CSE-ConnectionGUID: hgaWjAHSRAK5JdB6hO37gA==
X-CSE-MsgGUID: JRV3YhydSHGZRjpLvuod3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105146755"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:20:07 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v2 0/9] Xe: Add tests for PXP
Date: Wed, 15 Jan 2025 16:19:31 -0800
Message-ID: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
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

Minor changes have been done to common functions to propagate the
PXP info and error returns.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (9):
  drm-uapi/xe: Sync PXP uapi updates
  tests/intel/xe_vm: Update invalid flag subtest
  tests/intel/xe_query: Add test for PXP status query
  tests/intel/xe_create: Stop treating the extension field as MBZ
  tests/intel/xe_exec_queue_property: Update first invalid property
    value
  tests/intel/xe_pxp: Add PXP object and queue creation tests
  tests/intel/xe_pxp: Test PXP submissions
  tests/intel/xe_pxp: Termination tests
  tests/intel/xe_pxp: Test encrypted FBs

 include/drm-uapi/xe_drm.h            |   94 ++-
 lib/intel_batchbuffer.c              |   25 +-
 lib/intel_batchbuffer.h              |    1 +
 lib/xe/xe_ioctl.c                    |   26 +-
 lib/xe/xe_ioctl.h                    |    4 +-
 tests/intel/xe_create.c              |    5 -
 tests/intel/xe_exec_queue_property.c |    2 +-
 tests/intel/xe_mmap.c                |    1 +
 tests/intel/xe_pxp.c                 | 1172 ++++++++++++++++++++++++++
 tests/intel/xe_query.c               |   61 ++
 tests/intel/xe_vm.c                  |   25 +-
 tests/meson.build                    |    1 +
 12 files changed, 1392 insertions(+), 25 deletions(-)
 create mode 100644 tests/intel/xe_pxp.c

-- 
2.43.0

