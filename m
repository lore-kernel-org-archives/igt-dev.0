Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A18BC83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 09:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A397D10E156;
	Thu, 17 Jul 2025 09:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erYn7FVg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CF510E156
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752743301; x=1784279301;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R0Y3dkMbr7HKURJgloeo7uOFPUcu3tTmq1PEgWBzOmg=;
 b=erYn7FVgpul280abhLuOpxKkcDlUxT3sc71fhU74xsxSDCfDsuyi5hL2
 cMnAV16/Gw7dOm5IDPWuSjQW1hT+EionO/kUH6/y4aRJ2ONvte3jbrSO4
 ArR8AH2uQ8dTVsk1g4JZIbQc9VDEKxc3GtNWSfrKMiDlAV/rxixDVF0rC
 8l8v+0C2qGvfV8BuV6IKBEOXX2RYJFWLbfUGW6Hvap24m1R2OAWZa6DG1
 o/APx2Y1ULt1Mc7ZKmD3cNctFRMvnrU05+IejE3BVOfy8Z3T5XiF2Tq/v
 23T9vg/0wzJXitFaoir2kIXUcm9wjhe2q6pYSaXm5q+/aiatP51eYXDsm A==;
X-CSE-ConnectionGUID: BvB563avQNC9t2m486MIIQ==
X-CSE-MsgGUID: gRoCgnsDShu3FH8dJmNK6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55129513"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="55129513"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:08:20 -0700
X-CSE-ConnectionGUID: JWr6PiZMQCuQ6H/uX/SwlQ==
X-CSE-MsgGUID: BORoYNt1S7qwV+f9x26rYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="158444278"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:08:17 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, satyanarayana.k.v.p@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t 0/4] Validate VF accesses to VRAM via BAR
Date: Thu, 17 Jul 2025 11:08:08 +0200
Message-Id: <20250717090812.28628-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Series includes a test to validate VF access to VRAM via BAR. The
following scenarios are covered:
- VF can access all provisioned memory via the VRAM BAR,
- VF cannot access memory beyond what's provisioned via the VRAM BAR,
- VF can access memory via the VRAM BAR after reprovisioning.

Additionally, it introduces a library for VRAM accesses and helper to
iterate over enabled VFs.

Lukasz Laguna (4):
  lib/igt_sriov_device: Add helper to iterate over enabled VFs
  lib/intel_vram: Add library for VRAM accesses
  tests/intel/xe_sriov_flr: Use VRAM access helpers from intel_vram
    library
  tests/intel/xe_sriov_vram: Add test checking VF access to VRAM

 lib/igt_sriov_device.h      |  12 ++
 lib/intel_vram.c            | 183 +++++++++++++++++++++
 lib/intel_vram.h            |  22 +++
 lib/meson.build             |   1 +
 tests/intel/xe_sriov_flr.c  | 106 +++---------
 tests/intel/xe_sriov_vram.c | 310 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 7 files changed, 549 insertions(+), 86 deletions(-)
 create mode 100644 lib/intel_vram.c
 create mode 100644 lib/intel_vram.h
 create mode 100644 tests/intel/xe_sriov_vram.c

-- 
2.40.0

