Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68A6CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 08:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A1F10E2EC;
	Tue, 26 Aug 2025 08:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpnD0i+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBEE10E2EC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756197696; x=1787733696;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X43L14Lg67/BHPhGzOQ/Cmfot+nipcAQfCxqy1eChqc=;
 b=mpnD0i+T7VMv4DmnlF0Nv0vi7FMjxltp0eiG6QkhrsPFraoChdcDLr/6
 iFLtSYMh60ke3BDZdG9cSITdOsKrrl9jCFeFJmkWkSNWJIle8lDWkvhgs
 te1Hf/GBnNEwC6AJjWT8VyJVRzb7vlEBkr73RtIzJWaqo8s7ePrZciapk
 smIj8rN+EgmehI5rC6G+LnpMMBXvfGib+clM4a2anbB5emjhNA7tY6nMm
 wgKcmT8ygWiMOX/mBP4gky38F2bMemDehEYaxKBeh30SWSPU6EldhlZur
 S5ahllReZPUwEx7AydkGZMHtnB1ZPfceJyNFQlPNzmD3VRr4NKx6VlaGM g==;
X-CSE-ConnectionGUID: GLB5D3wAQu6t9YqoIiZKLw==
X-CSE-MsgGUID: lx9iyPBxSaKGqBraGNEvxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69020496"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69020496"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 01:41:36 -0700
X-CSE-ConnectionGUID: qXBMYAEYQr+b8giafpskmQ==
X-CSE-MsgGUID: 7OHPJq6MTUmw32eE9BucXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169124819"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 01:41:34 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com, nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/5] Madvise Tests in IGT
Date: Tue, 26 Aug 2025 08:41:28 +0000
Message-ID: <20250826084133.897768-1-nishit.sharma@intel.com>
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

ver4:
- Removed redundant loop for multi-vma test. Instead added multi-vma check
  in which is manipulating address, batch addreess only and the
  remaining execution is done as per default flow.
- Passed region DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC in prefetch tests.

Nishit Sharma (5):
  include/drm-uap: Added drm_xe_madvise structure
  lib/xe: Added xe_vm_madvise ioctl support
  lib/xe: Helper added to get memory attributes
  tests/intel/xe_exec_system_allocator: Added preferred_loc_smem test
  tests/intel/xe_exec_system_allocator: Added atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 ++++++++++-
 lib/xe/xe_ioctl.c                      | 148 ++++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 645 ++++++++++++++++++++++---
 4 files changed, 1005 insertions(+), 86 deletions(-)

-- 
2.43.0

