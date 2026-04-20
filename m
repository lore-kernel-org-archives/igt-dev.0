Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4F9F588E4
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 15:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D99410E688;
	Mon, 20 Apr 2026 15:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nt3TpQkQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1A210E0E2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776697211; x=1808233211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=br+WZuhasKFaU0ASV1KQQ41OS2+7cbS31O9N5Y6teKU=;
 b=Nt3TpQkQoILs+HftOMM+G/LsQxnmb1tYpdSCN91BktY6tRKZsJjiu8X3
 qUZQ5N0LTyG2WIZvbcwQ3MGQ/MTFuLTFfm5aR7ZxBl4kvxneW6evbC5+V
 fs9a85HmFgJpB71n5mIFkAphXiNSXkZXV0xV3FgmnrAhcodVau4awFNlS
 R3cvij62A6LWBsEv152WsMYAXzpHmMq7a86hXdIca+P7EdCTy6xNA6U4I
 go38w99vjkmYafHdi8BI4re4gmyj7HPUsYlR0Vf3DZIBtAG3cqZTD9n6w
 G08l4YYb+GiyqaeT4mFYm8nSA2heCSIZvRdjgcAvSAVGj3JpSYa2tcAyD g==;
X-CSE-ConnectionGUID: ASwu5n9pSNiDnvUZ9Zy3tg==
X-CSE-MsgGUID: U0KMVBSmSjSirYxFOUbuAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77489157"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="77489157"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 08:00:10 -0700
X-CSE-ConnectionGUID: glr+CJmvRwevI9w5IiihsA==
X-CSE-MsgGUID: 0zuQS0vxQTC/t811pxe2xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="231622172"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 08:00:10 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v11 0/2] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Mon, 20 Apr 2026 14:59:59 +0000
Message-ID: <20260420150001.270588-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Current tests focus on VM creation and basic mode selection, but do not
cover overcommit scenarios.

This change adds tests to verify overcommit behavior across different VM
modes.

Non-fault mode tests:
 - vram-lr-defer: DEFER_BACKING rejects overcommit at bind time
 - vram-lr-external-nodefer: Long-running mode with an external BO and
                             no deferred backing
 - vram-no-lr: Non-long-running mode

Fault mode tests:
 - vram-lr-fault: Fault handling allows graceful overcommit via page faults
 - vram-lr-fault-no-overcommit: Verifies NO_VM_OVERCOMMIT blocks same-VM
   BO eviction during VM_BIND, while still allowing eviction during
   page-fault OOM handling

These tests validate that VMs respond correctly to memory pressure based
on their configuration—by rejecting at bind time, failing during execution,
or handling overcommit gracefully via page faults.

Currently, overcommit behavior is tested for VRAM only.

--------------------------------------
Link (historical context):
https://patchwork.freedesktop.org/series/161557/


Sobin Thomas (2):
  lib/xe: Add failable variant of xe_vm_bind_lr_sync()
  tests/intel/xe_vm: Add support for overcommit tests

 lib/xe/xe_ioctl.c   |  35 ++--
 lib/xe/xe_ioctl.h   |   2 +
 tests/intel/xe_vm.c | 396 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 422 insertions(+), 11 deletions(-)

-- 
2.52.0

