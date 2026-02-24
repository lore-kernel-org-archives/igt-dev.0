Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6A8EFB801
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C9910E116;
	Tue, 24 Feb 2026 08:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdRHSt1H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A5D10E116
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771921384; x=1803457384;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pdvGCw4t9ZqUfNTwCvRh3K7ZZ4/6z4c2cDOps6oKks0=;
 b=EdRHSt1H7hkIimEdFzQ2U/4noqqGySZhCEGhVoyw7+Zib4afL/bRZI7X
 xQKvbjfQMEevBce5naL4ChKftqb+n2buGJ3Mk4TTuimLFkrDgtcE+bFI4
 JkQN62nfx+AI1tX/oXG31VcLGZkAkJLg/Fd08q68TFNO612k+nFUbn1qw
 Vp/gZSeQ6saQdV+nTND5MhFd2AQB8fHEwzz4LxWmYRsL8m3bjqA/A1j0X
 CvvshfZfCYAa9L3TjiQZBacLvSgW8dII/947usVyDly0rKG1JtEv8tTTv
 VehTYgBR89tNZw/jKBXZ9dSS83gpSvI28oHPB+TFAOpCinGiZJ/TjX97x A==;
X-CSE-ConnectionGUID: mgTx7rbrS8S+QUii8WFApA==
X-CSE-MsgGUID: 5aO2iL+hTLqWCYOJYYjanQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72806291"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72806291"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:23:04 -0800
X-CSE-ConnectionGUID: /I4MTimSR6+KRSQNJYWZJg==
X-CSE-MsgGUID: 1ghSw9xuQQKDTz3LqLLSBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215687149"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:23:03 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 00/10] vmtb: Modernize SR-IOV VM Test Bench core
Date: Tue, 24 Feb 2026 08:50:17 +0100
Message-Id: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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

Update and refactor VMTB core implementation, align with the current Xe KMD
SR-IOV state and prepare for a broader test coverage.

Introduced changes:
- refactor driver abstractions into common Driver/PF/VF interfaces,
  including updated sysfs/debugfs interfaces
- split VM-side abstractions into VirtualMachine, VirtualDevice and
  VfDriver with clearer responsibilities
- add auto/fair provisioning mode next to vGPU profile mode and align
  scheduling/resources handling
- support maximum VFs test config
- extend IGT/gem_wsim abstractions (object-oriented result checks,
  repeated execution support, resource-based wsim workload descriptors)
- adjust QEMU launch parameters (SSH forwarding, migration capability
  handling, disable emulated VGA)
- enable support for Panther Lake (PTL) and Battlemage (BMG) platforms with
  PCI Device IDs and vGPU profile resources

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Adam Miszczak (10):
  tools/vmtb: Update QEMU parameters
  tools/vmtb: Fix DUT selection based on card index
  tools/vmtb: Fix VM snapshot query handling
  tools/vmtb: Extend IGT and WSIM abstractions
  tools/vmtb: VF auto/fair provisioning support
  tools/vmtb: Refactor driver interfaces
  tools/vmtb: Introduce VirtualDevice class
  tools/vmtb: Redesign VirtualMachine class
  tools/vmtb: Support max VFs configuration
  tools/vmtb: Platform enabling: PTL and BMG support

 tools/vmtb/bench/configurators/pci.py         |  43 ++-
 .../vmtb/bench/configurators/vgpu_profile.py  |  37 ++-
 .../configurators/vgpu_profile_config.py      |   7 +-
 tools/vmtb/bench/configurators/vmtb_config.py |   4 +-
 tools/vmtb/bench/drivers/driver_interface.py  | 179 +++++++++---
 tools/vmtb/bench/drivers/xe.py                | 213 +++++++-------
 tools/vmtb/bench/executors/gem_wsim.py        |  45 ++-
 tools/vmtb/bench/executors/igt.py             |  36 ++-
 tools/vmtb/bench/machines/device_interface.py |  14 +-
 tools/vmtb/bench/machines/host.py             |  17 +-
 .../vmtb/bench/machines/machine_interface.py  |   6 +-
 tools/vmtb/bench/machines/physical/device.py  | 145 ++++++----
 .../machines/virtual/backends/qmp_monitor.py  |  25 +-
 tools/vmtb/bench/machines/virtual/device.py   | 179 ++++++++++++
 tools/vmtb/bench/machines/virtual/vm.py       | 263 +++++++++---------
 tools/vmtb/vmm_flows/conftest.py              | 167 ++++++++---
 .../{Flex170.json => Bmg_g21_12.json}         |  58 ++--
 .../resources/vgpu_profiles/Ptl.json          |  97 +++++++
 tools/vmtb/vmm_flows/test_basic.py            |  25 +-
 tools/vmtb/vmtb_config.json                   |   1 +
 20 files changed, 1066 insertions(+), 495 deletions(-)
 create mode 100644 tools/vmtb/bench/machines/virtual/device.py
 rename tools/vmtb/vmm_flows/resources/vgpu_profiles/{Flex170.json => Bmg_g21_12.json} (73%)
 create mode 100644 tools/vmtb/vmm_flows/resources/vgpu_profiles/Ptl.json

-- 
2.39.1

