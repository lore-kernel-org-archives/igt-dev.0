Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBBFFF8867
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 03:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3FF10EA0F;
	Tue, 28 Apr 2026 03:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wr2M6xIN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B6F10EA20
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 03:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777346762; x=1808882762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/P/0oKpaKqUAlNwpzNFjbN9D6NPB0yUgPrhe/WwSJzo=;
 b=Wr2M6xINu0i2Twu4De2pKiEl9Ea+zRLvcU9q39h9G7U1poQ/v+a0nf3Y
 wWf2jQNTUFCWiyW0t+in0ReTXd7dnMTZkkGLxvK8X4oY9befVHJhI44hJ
 GzEdrt4PTkCPEDljzM7jX/cxOec4qmMpnps7BcaiRFtGYqfNONxxBGkxI
 CXqgJ2Piawdg72tBIM3O/XtLBeuR7WV3RbKeabtF5xRJB+QCfU2G6ywye
 n5b7S06iACgG+2st/ZTic1BiWvbtYXOeDIZwSVgLJj6uDPA2zl/4hBb8R
 MwUQCazReAC0XKbOoDk7vnbv+XpcJubSXbtQ17kxXscJhqRe162JI5K47 g==;
X-CSE-ConnectionGUID: 3LorbldhRRuiLh5xlvNczw==
X-CSE-MsgGUID: 8WsSiZXeQXO5OnxqsAtDAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77949480"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="77949480"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 20:26:01 -0700
X-CSE-ConnectionGUID: Knr1wdInRDWwz9zonADV9g==
X-CSE-MsgGUID: LAkm6sRTQFiRHDgZ0i4gvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="234108357"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 20:26:01 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v13 0/2] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Tue, 28 Apr 2026 03:25:49 +0000
Message-ID: <20260428032551.752707-1-sobin.thomas@intel.com>
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

