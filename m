Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4FED29DC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 03:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AD710E2E8;
	Tue, 13 Jan 2026 03:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0SlaTHw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD9D10E2E8
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 03:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768276744; x=1799812744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+MM12iWMpiZmhpsd5wd4waMXvCFGb9pFzvHFwivv/4I=;
 b=n0SlaTHwrKvhdcom9D0vMnjLNzYbOX+fTq576c4LEvK6GdRlBvNOWDTv
 OxhFrx822M9EjPZTpkrr4syC25F65CgFJ8decMD/Q3zp/IkatDQKgwMRH
 fIlp6Vb1F2hp5a/cjZcLHsNFuazMmJiinYjZFK4F/BoSULgtGyAsonshu
 RIUKE6D/uhkIcObQITpygIGP+cuTxrJKYOto+V+HaZBTaeuSwF6CVE4yC
 B09EoWb1O89Sh7yq+uX6paNlnoSdm+0r67rVPX4/VPxQPTUv6VEI6AuMf
 9uarybtDuDT4eYEPs0mFT57u5rPOlcn8GVYbG49n3EZ6trKzc0BnZtebw A==;
X-CSE-ConnectionGUID: TmdOE4BUT+6yox2wheVxJg==
X-CSE-MsgGUID: zUOWzS4MSAyxoLsWjEh25w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69718738"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69718738"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 19:58:59 -0800
X-CSE-ConnectionGUID: R5gUUpNeQFux/Y4ma2ZZsQ==
X-CSE-MsgGUID: EbP5T7WBTV+uaUZkkFiW1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="234974770"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 19:58:59 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
Date: Tue, 13 Jan 2026 03:58:51 +0000
Message-ID: <20260113035852.143711-1-sobin.thomas@intel.com>
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

Sobin Thomas (1):
  tests/intel/xe_evict: overcommit tests for fault-mode and
    non-fault-mode VMs

 tests/intel/xe_evict.c | 288 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 288 insertions(+)

-- 
2.51.0

