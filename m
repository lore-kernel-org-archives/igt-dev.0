Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F14FAD3E7
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 04:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9498E10E2EB;
	Thu, 23 Apr 2026 04:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dj8EVQuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FAE10E2EB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 04:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776917943; x=1808453943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/P/0oKpaKqUAlNwpzNFjbN9D6NPB0yUgPrhe/WwSJzo=;
 b=dj8EVQuFJuFC46GfYLu5Vd8tYRDAfc3XF03Mi/NQBXjwsR2T88AE1lVS
 5m8x94BKw6yQQSQbH3uzbpFOb12sN079yp+VHl++J2rmYGOT12BcFn1r0
 4Mehqxl8wjlXCMyyLQYMAi+bMz3QEd0wYSEEZ1M0ZQNf/70qIGvq23hBP
 0OyhVMwam+vCks83Wnal978PYNXO97CepA05le2HZS6bkrLhRrkQAxZ9K
 twaw3HfdueGgfBRfRn0A8v2KP7E5742A35jW+foOjVL+M1QYBtrzD9W4E
 pw2DyzzwlyBSNHQ5k/75HyiYtvfPcIOeHpcOyOiOLpnuvy0K6f3udfxPW A==;
X-CSE-ConnectionGUID: 50R4WKx9SJefWivk+gPipQ==
X-CSE-MsgGUID: gy+ZuanlQc+96F1RchSehA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88186944"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88186944"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 21:19:02 -0700
X-CSE-ConnectionGUID: cr63VXPISSCR/JC3ZOofkw==
X-CSE-MsgGUID: CsZtBBuRSWqHNwEipD/UTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232855925"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 21:19:03 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v12 0/2] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Thu, 23 Apr 2026 04:18:52 +0000
Message-ID: <20260423041854.496640-1-sobin.thomas@intel.com>
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
 tests/intel/xe_vm.c | 391 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 417 insertions(+), 11 deletions(-)

-- 
2.52.0

