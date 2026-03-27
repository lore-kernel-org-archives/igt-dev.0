Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FAC10ED678
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 13:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906B810E073;
	Fri, 27 Mar 2026 13:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fK5hbQtf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E6310E073
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617879; x=1806153879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dBOmqjhNFklevKCIFre5uv2pgyy0CelovOJhPmeuLCE=;
 b=fK5hbQtfQip+u9G2kFdB0FawPf8cf4FPRviHAP+ptMBYZKt1IbvRSl3W
 5R11RNsRRwCEGMGhUWhzocVFYCfFu543OBG96+rqDtQNfh3unryahxfH3
 c0yiEL1YAgCXWMmcLcCkcVHQmkud6Z2fGlZ8hABAFs5NG1oR8BrxbCKCU
 y3DqQLTE0oX48if5+SbNpbfjUcyVMiPKAmwAMbxHzrNPjE6cLrKPZEbXX
 U3BBuUyhg+VDGPffrFMqF/VDOQO7h97UWmVP6SeGkzMnK/lJNuJ9PwoAO
 X0ntqdYagekeQKfnOfo8xm4uZbr4kaadBv9aenJ9u1d7nYpAVnoCp9VmH g==;
X-CSE-ConnectionGUID: zlVkE/GgQkeqnR/qIaUhug==
X-CSE-MsgGUID: ask2TBl0Q8Wd5fJzbyYgvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75804630"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75804630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:24:39 -0700
X-CSE-ConnectionGUID: KQ8Boqi0Tuu+xnf02tTSBQ==
X-CSE-MsgGUID: EjeZkOjITSijzj44hNhCrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="230239069"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:24:39 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v8 0/3] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Fri, 27 Mar 2026 13:24:23 +0000
Message-ID: <20260327132427.2681193-1-sobin.thomas@intel.com>
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


Sobin Thomas (3):
  drm-uapi/xe: sync with kernel header
  lib/xe: Add failable variant of xe_vm_bind_lr_sync()
  tests/intel/xe_vm: Add support for overcommit tests

 include/drm-uapi/xe_drm.h |  22 +--
 lib/xe/xe_ioctl.c         |  36 +++-
 lib/xe/xe_ioctl.h         |   4 +
 tests/intel/xe_vm.c       | 395 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 439 insertions(+), 18 deletions(-)

-- 
2.52.0

