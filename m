Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FA8CA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 09:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0E110EAA7;
	Fri, 22 Aug 2025 09:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jys6p6aQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A6610EAA6
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755853602; x=1787389602;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yYrJFn65ZwuRVX/OQhB9KBacsS4CcTw2BkdqvPfrsPA=;
 b=Jys6p6aQq/5S9WbZSFLdhWqBk4wg9VwsA7HzWC51f8EgDXq0Vm9S4JFp
 ATS3FwwcpTR4+jYRqAAFmg3l80ZB3rk6h5flabOdt7Y9/mkoyJ0nUSm8W
 vut5qghgyUWrKs8waGlKeLAH2BRQI4K1bp1Sg0MoWG8zJ7+SP7FBSRf5+
 LgtL1FkVW5FzWhw0tQQk8MjjQQWVX2S2YogEetO/0AGyY+WkXUvt/c3bD
 yukNZjig928ExBujCWHTutwvfSKLhWDmDz+Le6lL1ZPZMeNipwQgunhfE
 yuFgeyBQk16ZiYBmbRUDL/sNIpXht7ZWXYRk0hsWYR5f0ciqtdSlwCwbe Q==;
X-CSE-ConnectionGUID: wfr3Wv+pS5usKTtjNfEZyw==
X-CSE-MsgGUID: W6NfeS0bTgyeKne9ENQXZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58021087"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58021087"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:06:41 -0700
X-CSE-ConnectionGUID: Ee11Ssk2Qoq7XzlBFq9ujw==
X-CSE-MsgGUID: wFMsZEt+RLGIJ2ILzGR/PQ==
X-ExtLoop1: 1
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 02:06:40 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/5] Madvise Tests in IGT
Date: Fri, 22 Aug 2025 09:06:34 +0000
Message-ID: <20250822090639.508747-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Revision 1:
Added madvise tests in IGT which validate different features related
to attributes passed. Madvise tests related to Atomic operation,
Preferred Loc have been added and validated. Madvise tests are called as
part of different struct section and available as madvise-<test-name> in
list of subtests.

ver2:
- added back subtest which was deleted due to rebasing

ver3:
- added variable deleted during rebase.

Nishit Sharma (5):
  include/drm-uap: Added drm_xe_madvise structure
  lib/xe: Added xe_vm_madvise ioctl support
  lib/xe: Helper added to get memory attributes
  tests/intel/xe_exec_system_allocator: Added preferred_loc_smem test
  tests/intel/xe_exec_system_allocator: Added atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 +++++++++-
 lib/xe/xe_ioctl.c                      | 148 +++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 714 ++++++++++++++++++++++---
 4 files changed, 1074 insertions(+), 86 deletions(-)

-- 
2.43.0

