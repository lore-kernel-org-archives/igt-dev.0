Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A231D29DE0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 07:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5E510E456;
	Tue, 13 Jan 2026 07:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5TmIrK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79FC10E456
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 07:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768288108; x=1799824108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hr1PN1YV6SgYKU4KSDu9WKTJMlfxK4e6fE98VYTrK5k=;
 b=i5TmIrK4KE4cqRooYEDagVMdPrU9Nvrqpt54urRqSegyXPIiIk9q43Ur
 qbkahBJ5aAmxkWWuiOvgf0u0KIyPjKDS5KslP8KhDfIYFH27HcvwMNrZa
 PETAwL1DzhGtQhww/9QE9asFWMCkjOrPFVo3pdDcZwP7HtZogrNNr0z3+
 B1wm+wtb2UTMSq0NgS6LLVXnHogu9A4tcdknkY8V8NV98pWOSl5VNawal
 ZfnfGzdbb4SUbC9odtdqexetX7Vw0YL+ZDxdQDuFyWdJpXsB15u2DaAvb
 XF/KZ5oda69O7wLBty+jMv5TYmsrhFajjcgQvoWZWR9p8iTiUNidX58XI A==;
X-CSE-ConnectionGUID: LbnOlbdARTe7gcbBoYJIeg==
X-CSE-MsgGUID: mqtxdhUmRCugpeWejEaT+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69621017"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69621017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 23:08:28 -0800
X-CSE-ConnectionGUID: uQ9rfaaOReGVeND4puWNdQ==
X-CSE-MsgGUID: ajbCbOz2S3KdRrX+kkJOUA==
X-ExtLoop1: 1
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 23:08:28 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
Date: Tue, 13 Jan 2026 07:08:05 +0000
Message-ID: <20260113070806.189718-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

 tests/intel/xe_evict.c | 330 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 330 insertions(+)

-- 
2.51.0

