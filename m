Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C088C71131
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 14:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2836B10E571;
	Tue, 10 Jun 2025 14:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcZS7xQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2BF10E571
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749566371; x=1781102371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jHEchitOOx2F1gSLv+9FT7EB5g3tAG2z/wFy5bc0TQ4=;
 b=TcZS7xQlBZEjrDdRRJtSLYzLBAM4BpSeQR16DEsUPk4FIs+l+J4B8oj+
 pYkgRzs8JOoheV3Eo/XDA9U5AewLcRtVrqw2d8TXWoP/VZ3TvG/vfD3ey
 pPUOGTB2JGkJ/38e0htyxA/xScT2YS0XZ/Cwz9oSpi1LKs6qqSwhF75U8
 Ck0TSw1BnRw9P7C0xGhgq28bznUWhHfRa/HPAp+EHAYvdSHOxc8UdpO45
 jNvSo/Q/wSLfK5fY81lUBhlAlLBWgViN0jx+YZAOYFwRDOyN5uN50QiTw
 odMW3IBTFFRSFdwr0LHjpL1M3mfOd1LuJ8KZ90vU83rw2Zlla2GWBqb/d Q==;
X-CSE-ConnectionGUID: gHyVRTXZTF+Z/EyfJjB+5g==
X-CSE-MsgGUID: dsHOVXg8Rx2bQuVIog8yIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51765562"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51765562"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:39:30 -0700
X-CSE-ConnectionGUID: H58Y0SvNQgeSihfcvBMcVQ==
X-CSE-MsgGUID: 8Fzj9+OCS+mzRAHX2xlUOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="150704996"
Received: from dut4036ptlh.fm.intel.com ([10.105.8.99])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:39:30 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v5 0/2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Date: Tue, 10 Jun 2025 14:39:28 +0000
Message-ID: <20250610143930.14742-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently, numerous fault messages have been included in the dmesg
ignore list, and this list continues to expand.  Each time a new fault
injection point is introduced or a new feature is activated, additional
fault messages appear, making it cumbersome to manage the dmesg ignore
list.

However, we can safely assert that all dmesg reports that contain
*ERROR* in their message can be ignored, so add them to the dmesg ignore
list.  This unfortunately does not include the device probe error
itself, so that must be added separately.

While we're here, we should also assert that any errors we see are only
coming from the target PCI device.  We can do this by passing the
pci_slot name to the dmesg ignore list, which is generated during test
initialization.  In order to pass this information, all test functions
need to take the pci_slot name as a parameter.

Some functions already take the pci_slot name as a parameter but should
be modified to make the pci_slot parameter a const variable.

v2:
- Only ignore error-level dmesg reports (or, at least, reports with
  *ERROR* in them), and device probe failues
- Add PCI data to regex (Michal)

v3: (Michal)
- Revert name change
- Add change log
- Remove fixes tag from commit
- Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
  move to lib/igt_core.c
- Minor code fixes

v4:
- Return ignore_faults_in_dmesg to tests/intel/xe_fault_injection.c, but
  keep it renamed to ignore_dmesg_errors_from_dut (Kamil)

v5:
- Pass preexisting pci name instead of attempting to regenerate it on
  each run of ignore_dmesg_errors_from_dut (Daniele)
- Make pci_slot a const parameter (John)

v6:
- Minor wording fixups (Daniele, Kamil)

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Jonathan Cavitt (1):
  tests/intel/xe_fault_injection: Make pci_slot const

Satyanarayana K V P (1):
  tests/intel/xe_fault_injection: Ignore all errors while injecting
    fault

 tests/intel/xe_fault_injection.c | 64 +++++++++++++++-----------------
 1 file changed, 29 insertions(+), 35 deletions(-)

-- 
2.43.0

