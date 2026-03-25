Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46ACFEA80A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 06:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C87D10E1EB;
	Wed, 25 Mar 2026 06:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ct+RKwhO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2CA10E1EB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 06:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774418471; x=1805954471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RVUbYb6JkNhdu2OYwMG0ByajvbROJl9DM//8tlwNN/g=;
 b=ct+RKwhOuv501Suq9Adpjwl/0pjg004hBXhXkxFjbkeJx2kSvAJ3bgGm
 r/u6ztMKPTobS4RBTlzCaBRpuOCjMOoqAX8oUO2ZW5MaRyy7v+Dv7Ol1c
 fltfzf4RHf3+Ufxs3Q7N9KbFhXtmk/DCzsUzGDqhDgew43CgO/thBsccG
 IxHVrvQF9r35SvLYfq1kRAXR4DSijmBgUSL9Nb6gZtQjQcXu67R1vQpkx
 zn66H/uVgimczs+SF4w7WLxCP7+WcPQ4qDT6u2c+s4rP2Tab0W5e7zgel
 nl+8npEV9qCXp3EFi1rkrVtzruJKE/z84a2W5HiCpeGtv3wTdMfGOZU/v A==;
X-CSE-ConnectionGUID: sxOaeAGpRgqIY38GJuij8Q==
X-CSE-MsgGUID: IlbSS6lIRPq1H4r5LQPVig==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86525352"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86525352"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 23:01:10 -0700
X-CSE-ConnectionGUID: JX5Z484LQrO6VlrhTIQoyA==
X-CSE-MsgGUID: 7zE/eNl7TCKg3tbmrbsvbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="221686759"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 23:01:09 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v7 i-g-t 0/3] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Wed, 25 Mar 2026 06:00:44 +0000
Message-ID: <20260325060051.2498340-1-sobin.thomas@intel.com>
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
  lib/xe: Add failable variant of xe_vm_bind_lr_sync
  tests/intel/xe_vm: Add support for overcommit tests

 include/drm-uapi/xe_drm.h |  22 +-
 lib/xe/xe_ioctl.c         |  36 ++++
 lib/xe/xe_ioctl.h         |   2 +
 tests/intel/xe_vm.c       | 417 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 465 insertions(+), 12 deletions(-)

-- 
2.43.0

