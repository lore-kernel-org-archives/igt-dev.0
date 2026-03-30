Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F118FF4959
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 08:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F5A10E346;
	Mon, 30 Mar 2026 08:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EU2N9n7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346F610E346
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 08:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774857674; x=1806393674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yf3aJcALHg+QRNJt4N0miWfsRjhBSp58IXoTC6iVAwE=;
 b=EU2N9n7B5VuXNbRS3WapE8Hz/w3NzU68HBdziAemCrFvki/VWYSyeNIb
 U/X+A2yV2JSQbYANlKix1lcMMfnAzVTK+Le8sBqnKkfM5EAjyHbQLuswO
 /+xiweKL07AlHI7u3kZuqb1elu8HSaEaCxINbqr8fwX6omGCHShvFQ0cE
 El8fmu7NAdzcymCInbhkwAqJxmhqe5CkZbixosDGuDwH1aFR5Bq99aX6p
 AKlZCD9yBzVp9+VwXdbqV5QigN1MDvUK81dQLIDCqrJMp6I+PIlLgwr68
 z0Jo5l8PbRjiB8Fb1WYk444d/rwjVIQB7ADOBab2ePRFwFA6l+ltz0bOi A==;
X-CSE-ConnectionGUID: 9wUCFUfcQhGkuAlXNZE88A==
X-CSE-MsgGUID: kAWfhsCATlu+NGQjiYqKLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79445528"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="79445528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:01:13 -0700
X-CSE-ConnectionGUID: enaXRu8dSfaNFaMXIiogEw==
X-CSE-MsgGUID: EjougC+JRx6VQ8Gc30zAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="256495512"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:01:13 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v9 0/3] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Mon, 30 Mar 2026 08:01:00 +0000
Message-ID: <20260330080104.2956810-1-sobin.thomas@intel.com>
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
 lib/xe/xe_ioctl.c         |  41 +++-
 lib/xe/xe_ioctl.h         |   4 +
 tests/intel/xe_vm.c       | 394 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 439 insertions(+), 22 deletions(-)

-- 
2.52.0

