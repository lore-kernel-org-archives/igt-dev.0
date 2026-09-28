Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51609C9832F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 08:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A1B10E28D;
	Mon, 28 Sep 2026 08:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNp7NdRe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5D410E28D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790582743; x=1822118743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O1QPg42BjN/rrYWAyBUTbk4CkXMRshTd0Mu6tWhd0d4=;
 b=LNp7NdRefrZ4rhbsibqXlGnW5Ay33lkn5KK9xqgSS0QIYzhEG7jn1Rqf
 pqh1VCBuJ28awQMdxTOt2KiLALb3cZThOylMF4fB/jWgWFMBCdphcSwXi
 LC1TuVeVjbUD9vuK5/491bJ5AkyaHB/TRdhqDr4iCe8z4bFYji1/T68XZ
 8LQhnZc4bu3h/8/ySi8bkkH+cHYxCBCqOYxpz+ycnGRRNlhr0F64H3dUk
 StzcACa3+r7tbpIQ+VjqZz83lIehVedHrDg4tpx/Pii3xfxGiZ9j1d3as
 94aRWu4DRWrXQLxx7IQ1arRp9++Z+2ALuutkplBRLIyPLlYeGxnw0aQhy w==;
X-CSE-ConnectionGUID: dO5y96IfR4ykaVCRikDLUg==
X-CSE-MsgGUID: n9Wxz7JOTpW/Qyq630beSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101932221"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="101932221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:05:43 -0700
X-CSE-ConnectionGUID: /r9hWE2RRM6nuYc1hk4gZA==
X-CSE-MsgGUID: ZE/m3MJLRcS6NQsPMBTiRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="304458100"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:05:42 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 0/7] tools/vmtb: Sync VM Test Bench core with current xe
 SR-IOV
Date: Mon, 28 Sep 2026 09:25:53 +0200
Message-Id: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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

This series brings the VM Test Bench (VMTB) core in line with the
current xe SR-IOV driver interfaces and fixes a number of robustness
issues found while running the vmm_flows test suite on recent kernels.
It also adds a few framework features required by upcoming tests.

New framework features:
- asynchronous VM snapshot save/load, enabling parallel migration of
  multiple VMs (patch 1)
- VirtualMachine.wait_for_dmesg() to block on a guest serial console
  pattern (patch 6)
- IgtExecutor 'env_vars' support, cached GemWsim results and a common
  clear_results() for both executors (patch 7)

Driver/device alignment:
- move VF VRAM quota provisioning from the obsolete debugfs lmem_quota
  to the sysfs sriov_admin profile tree and add DeviceInterface.reset()
  for PF/VF FLR (patch 3)
- align default VF scheduling with the xe KMD (16ms EQ/PT), rename
  VfSchedulingMode.INFINITE to AUTO and fix scheduler-only manual
  provisioning (patch 2)

Robustness fixes:
- consume QMP command acknowledgments and tighten query_status()/
  query_jobs() handling so the bench never acts on partial QMP
  responses (patch 1)
- fix guest timeout resolution, PCI BDF matching and physical Device
  bind()/unbind() calls (patches 3, 4)
- add EnvironmentCleaner to remove leftovers (orphaned QEMU processes,
  stale sockets, dirty SR-IOV state) from crashed or timed-out runs
  before each test setup (patch 5)

Existing vmm_flows tests (test_basic, test_migration) are updated to
follow the API changes.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Adam Miszczak (7):
  tools/vmtb: Introduce asynchronous VM state save/load functions
  tools/vmtb: Rework VF scheduler provisioning
  tools/vmtb: Align driver/device layer with current xe SR-IOV
    interfaces
  tools/vmtb: Fix guest timeout handling and PCI BDF matching
  tools/vmtb: Add pre-test environment cleanup
  tools/vmtb: Add VM dmesg wait support
  tools/vmtb: Extend IGT and WSIM executors

 .../configurators/vgpu_profile_config.py      |  20 ++-
 tools/vmtb/bench/drivers/driver_interface.py  |   9 +-
 tools/vmtb/bench/drivers/xe.py                |  40 +++--
 tools/vmtb/bench/exceptions.py                |  14 +-
 tools/vmtb/bench/executors/gem_wsim.py        |  38 ++++-
 tools/vmtb/bench/executors/igt.py             |  10 +-
 tools/vmtb/bench/helpers/cleanup.py           |  91 ++++++++++
 tools/vmtb/bench/machines/device_interface.py |   7 +
 tools/vmtb/bench/machines/physical/device.py  |  58 +++----
 .../machines/virtual/backends/qmp_monitor.py  |  55 +++---
 tools/vmtb/bench/machines/virtual/device.py   |   4 +
 tools/vmtb/bench/machines/virtual/vm.py       | 160 ++++++++++++++----
 tools/vmtb/vmm_flows/conftest.py              |  80 ++++++---
 tools/vmtb/vmm_flows/test_basic.py            |   2 +-
 tools/vmtb/vmm_flows/test_migration.py        |  22 ++-
 15 files changed, 445 insertions(+), 165 deletions(-)
 create mode 100644 tools/vmtb/bench/helpers/cleanup.py

-- 
2.39.1

