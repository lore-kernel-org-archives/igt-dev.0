Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BD4FD5F85
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 07:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96A910E565;
	Wed,  8 Apr 2026 07:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5RpkQ2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12D710E565
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775633756; x=1807169756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iPmI3FLD30KejwRW8JgoKYT2NEsrSWM51Rgq1bGiTvQ=;
 b=F5RpkQ2H3Abdd6EMwqmNqMNXZIar2O7FmE3s2uU0VKpwuIpmcqnDiIOx
 d4OMBleXSHQhXyQFox2SDn1Ca13RmDeyDJXG+6pfUeL2vEkQflcTCy7uS
 fKHSXA/JnP9TTYaNr1VZU2w1fH3h9nmGFa0VXShKZq1XDhSVpdCUxVE8O
 Y3E4tv2hirjy1QZnBd84PdPMWe5znWemQlh+IGmu96/vrLTjwRx1BI9RF
 pE0O59y/AxecgpSMWmiHxlI0HsH40LQxTBgljsRO1gdi9EibL1redQhpW
 WV4d7Wqj/whmjd3peWvZ6UO1UyKdIqA2agBTEQxQ76aCala6QVIxeqyIj w==;
X-CSE-ConnectionGUID: MHP8wU1sRYC7V3l45HJm/A==
X-CSE-MsgGUID: ETYEYgYLREu9xW3PqlS4lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76488716"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76488716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 00:35:56 -0700
X-CSE-ConnectionGUID: 592iYDkgSdOXTcVj1CBdZw==
X-CSE-MsgGUID: BcYqVTEvTQaItp+YRUJmWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="233277955"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 00:35:55 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v10 0/2] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Wed,  8 Apr 2026 07:35:44 +0000
Message-ID: <20260408073546.3500698-1-sobin.thomas@intel.com>
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
 lib/xe/xe_ioctl.c         |  35 ++--
 lib/xe/xe_ioctl.h         |   2 +
 tests/intel/xe_vm.c       | 358 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 395 insertions(+), 22 deletions(-)

-- 
2.52.0

