Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6284EA795F
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 03:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4797010E7A2;
	Thu,  5 Feb 2026 03:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYcFJHzk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D926E10E7A1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 03:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770263474; x=1801799474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g4FlnGG/3pljrE4qGmbmpKBi6vfuIz2hcJSSfyXNZJM=;
 b=IYcFJHzkV8OUvcjm8zRRyd7pe6jpryW3c2g64i8hILECaKTS+wF6xtx/
 7bHdUK1QsxPgVd/ZoWXXE9TSB9yPK6CrQcSev+X9D9XfZQaU50a15QFl3
 s+OuOk/Dq1xnOHVo+H7mo1VPWwzm6XW4ED+MGN+Ud7++Xxo6E02/ruyWZ
 3KWr/HYFc0GQwGR/IwN4TxfwakdsFdc7snEmh3161LtKR0xjYL+gRUzsF
 BH3SQC9d9cXDogOdj92M8gWcqj85vnsf6GI2QZlz6oGyAV+2hoUiUU3Fk
 JxHn3QEPuQOitismmHzSqWOKY8eZbD2FXggFIy3mHH0m9Xw+AyD0B/JWI A==;
X-CSE-ConnectionGUID: PbmZCc20QPaz0LkJi6Tm8Q==
X-CSE-MsgGUID: mwxWbYt+Rf2rxntKraLShA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75310123"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="75310123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:51:14 -0800
X-CSE-ConnectionGUID: oW1yxet2Sfy809imOjapOg==
X-CSE-MsgGUID: dOkE1oz3R8OTruA7A9oo2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="215343014"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:51:14 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com, thomas.hellstrom@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v4 i-g-t 0/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
Date: Thu,  5 Feb 2026 03:50:34 +0000
Message-ID: <20260205035041.413552-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

The existing tests in xe_evict focuses on system-wide memory allocation
across multiple processes. However, OOM error handling in different VM
modes was not being tested, and the previous test_svm_overcommit() had
a critical bug that prevented proper overcommit scenarios.

Add three new tests to verify graceful OOM failure handling:

- test_evict_oom(): Allocates BOs aggressively in a loop until
  OOM occurs. Tests error handling in LR mode and expects
  -ENOSPC or -ENOMEM.

- test_vm_nonfault_mode_overcommit(): Verifies that non-fault mode VMs
  properly reject overcommit attempts with -ENOSPC or -ENOMEM as
  expected.

- test_vm_fault_mode_overcommit(): Validates that fault-mode VMs can
  handle memory pressure gracefully by touching pages to trigger page
  faults.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>

Sobin Thomas (1):
  tests/intel/xe_evict: overcommit tests for fault-mode and
    non-fault-mode VMs

 tests/intel/xe_evict.c | 689 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 687 insertions(+), 2 deletions(-)

-- 
2.52.0

