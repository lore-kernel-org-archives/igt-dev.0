Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4681DEFB801
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94D110E4DB;
	Tue, 24 Feb 2026 08:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExN7uJbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ADD10E4DB
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771921391; x=1803457391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HoeEGMkEgQr5SrOU3IE4TP/tH5pa+rB2vTAVJoahDZI=;
 b=ExN7uJbKDrxca5+u4WF3HvUdFOcYHbK1mQ9sMHeYrYIKdtUzUzUzgfFH
 dB6Rdus+5Xmet3bdaV9lXxGk0Jbetitx1W/DGU/eTcPYqs82NtZ24k0yt
 0SHe30BwQRsFCl8lYgetJ5b8Ttr+bEjQGTFlnTSEd6Su6cA3L5NREcoDd
 G5uTtr15gjBzQjIPOuMT6BXkAYaCv3xFKn9dYxA6JrOjoo5+UvP5oe0Bi
 E42DPUPf8R2eYsCq83kh7/nEWyXpl+iNE4mbNfydiR1qiXst5cACYyjSz
 1zLofj16MVgAd8cuA8lAt/P7tEH5XERMatsM/bG6CgmTgaqPjrg7RVXZT w==;
X-CSE-ConnectionGUID: +mLu8OWmTs+dqt/H3U8Y5A==
X-CSE-MsgGUID: bK8qemcXRqCTlvDCw+56JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76540551"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76540551"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:23:11 -0800
X-CSE-ConnectionGUID: noqUfAZPQoa+/RTEFwDtnw==
X-CSE-MsgGUID: d7cCD6jPQ8aDr1e6XFgL4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220351653"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:23:09 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 02/10] tools/vmtb: Fix DUT selection based on card index
Date: Tue, 24 Feb 2026 08:50:19 +0100
Message-Id: <20260224075027.2409675-3-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
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

A GPU devices list need to be searched by requested card index
(device minor number) - not list index.
Implement Host.get_device() function to return Device
with a given minor number from the detected devices list,
bound to a requested DRM driver (e.g. xe).
DUT reference is now kept by the VmmTestingSetup,
not embedded within Host class.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/bench/machines/host.py            | 12 +++++++-----
 tools/vmtb/bench/machines/physical/device.py |  5 ++++-
 tools/vmtb/vmm_flows/conftest.py             | 15 ++++++++-------
 tools/vmtb/vmm_flows/test_basic.py           |  4 ++--
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/tools/vmtb/bench/machines/host.py b/tools/vmtb/bench/machines/host.py
index 666f35c26..aecc7709a 100644
--- a/tools/vmtb/bench/machines/host.py
+++ b/tools/vmtb/bench/machines/host.py
@@ -1,8 +1,7 @@
 # SPDX-License-Identifier: MIT
-# Copyright © 2024 Intel Corporation
+# Copyright © 2024-2026 Intel Corporation
 
 import logging
-import re
 import shlex
 import signal
 import subprocess
@@ -24,13 +23,12 @@ class Host(MachineInterface):
     def __init__(self) -> None:
         self.running_procs: typing.Dict[int, subprocess.Popen] = {}
         self.gpu_devices: typing.List[Device] = []
-        self.dut_index: int = 0
         # Initialize in conftest/VmmTestingSetup:
         self.drm_driver_name: str
         self.igt_config: VmtbIgtConfig
 
     def __str__(self) -> str:
-        return f'Host-{self.gpu_devices[self.dut_index].pci_info.bdf}'
+        return 'Host'
 
     @LogDecorators.parse_kmsg
     def execute(self, command: str) -> int:
@@ -181,9 +179,13 @@ class Host(MachineInterface):
 
         logger.debug("Detected GPU PCI device(s):")
         for dev in self.gpu_devices:
-            logger.debug("[%s] PCI BDF: %s / DevID: %s (%s)",
+            logger.debug("[card%s] PCI BDF: %s / DevID: %s (%s)",
                           dev.pci_info.minor_number, dev.pci_info.bdf, dev.pci_info.devid, dev.gpu_model)
 
+    def get_device(self, dev_minor: int) -> typing.Optional[Device]:
+        """Find device with a given minor number within detected GPU devices list."""
+        return next((dev for dev in self.gpu_devices if dev.pci_info.minor_number == dev_minor), None)
+
     def suspend(self, mode: SuspendMode = SuspendMode.ACPI_S3) -> None:
         """Perform host suspend cycle (ACPI S3) via rtcwake tool."""
         wakeup_delay = 10 # wakeup timer in seconds
diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
index 12a5d5f7d..887f607e4 100644
--- a/tools/vmtb/bench/machines/physical/device.py
+++ b/tools/vmtb/bench/machines/physical/device.py
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: MIT
-# Copyright © 2024 Intel Corporation
+# Copyright © 2024-2026 Intel Corporation
 
 import importlib
 import logging
@@ -48,6 +48,9 @@ class Device(DeviceInterface):
         self.gpu_model: str = pci.get_gpu_model(self.pci_info.devid)
         self.driver: DriverInterface = self.instantiate_driver(driver, self.pci_info.minor_number)
 
+    def __str__(self) -> str:
+        return f'Dev-{self.pci_info.bdf}'
+
     def instantiate_driver(self, driver_name: str, card_index: int) -> Any:
         module_name = f'bench.drivers.{driver_name}'
         class_name = f'{driver_name.capitalize()}Driver'
diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
index 675312253..3bfac01c4 100644
--- a/tools/vmtb/vmm_flows/conftest.py
+++ b/tools/vmtb/vmm_flows/conftest.py
@@ -81,12 +81,12 @@ class VmmTestingSetup:
 
         self.vgpu_profiles_dir = vmtb_config.vmtb_config_file.parent / vmtb_config.config.vgpu_profiles_path
 
-        self.host.dut_index = self.dut_index
         self.host.drm_driver_name = vmtb_config.get_host_config().driver
         self.host.igt_config = vmtb_config.get_host_config().igt_config
 
         self.host.load_drivers()
         self.host.discover_devices()
+        self.dut: Device = self.host.get_device(self.dut_index)
 
         # VF migration requires vendor specific VFIO driver (e.g. xe-vfio-pci)
         vf_migration_support: bool = self.host.is_driver_loaded(f'{self.host.drm_driver_name}-vfio-pci')
@@ -97,7 +97,7 @@ class VmmTestingSetup:
                     "\n\tDevice ID: %s (%s)"
                     "\n\tHost DRM driver: %s"
                     "\n\tVF migration support: %s",
-                    self.host.dut_index,
+                    self.dut_index,
                     self.get_dut().pci_info.bdf,
                     self.get_dut().pci_info.devid, self.get_dut().gpu_model,
                     self.get_dut().driver.get_name(),
@@ -127,11 +127,12 @@ class VmmTestingSetup:
         return vgpu_profile
 
     def get_dut(self) -> Device:
-        try:
-            return self.host.gpu_devices[self.dut_index]
-        except IndexError as exc:
-            logger.error("Invalid VMTB config - device card index = %s not available", self.dut_index)
-            raise exceptions.VmtbConfigError(f'Device card index = {self.dut_index} not available') from exc
+        if self.dut is None:
+            logger.error("Invalid VMTB config - DRM card%s is not bound to %s driver",
+                         self.dut_index, self.host.drm_driver_name)
+            raise exceptions.VmtbConfigError(f'Invalid VMTB config - DRM card{self.dut_index} device not supported')
+
+        return self.dut
 
     @property
     def get_vm(self):
diff --git a/tools/vmtb/vmm_flows/test_basic.py b/tools/vmtb/vmm_flows/test_basic.py
index 100be7652..1d3a68b36 100644
--- a/tools/vmtb/vmm_flows/test_basic.py
+++ b/tools/vmtb/vmm_flows/test_basic.py
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: MIT
-# Copyright © 2024 Intel Corporation
+# Copyright © 2024-2026 Intel Corporation
 
 import logging
 import time
@@ -82,7 +82,7 @@ class TestVmWorkload:
             logger.info("[%s] Verify result of basic WL", igt.target)
             assert igt_check(igt)
 
-        logger.info("[%s] Verify result of basic WL", ts.host)
+        logger.info("[Host %s] Verify result of basic WL", ts.get_dut())
         igt_run_check(ts.host, IgtType.EXEC_STORE)
 
     def test_wsim(self, setup_vms):
-- 
2.39.1

