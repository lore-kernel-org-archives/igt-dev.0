Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219CEFB811
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF55210E4D9;
	Tue, 24 Feb 2026 08:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdPJxPzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED4B10E4D9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771921387; x=1803457387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7aICE0cLt/o9FLvNxemHp3NFBMlUlV/IxXJfjZARkko=;
 b=ZdPJxPzwHN9qO8wW1B0H6xY2m4HTThe85q+yWYG4PRqc7Vc7b3tkzHmH
 UmPjPiDUv1LGs/0RFaRkvWIRSNBrd1DCa4S5v5h1oWp5A8kfVzLJTgvEu
 bwX+cgWPD+5MdNpd/JXJsCWS9P2e4x5J5F940olZ7HKK+Q3t2cYdJYfPZ
 HmL9fUc1lUMrH02XYW/xzb0CZ/8M8Rsux4UuZ3sSCrazFazgT+PsxLbto
 QbR63QDhkpawg7zzze6ObbeR5QbuNx8qPkXxFrz+ZLt1lqyE1eTSblr4F
 LWOxTHN46Vgs2dkoesTLZmrtrCNH9zcO8T1Ij56vYBIQCKhGGkQrrqJ3n g==;
X-CSE-ConnectionGUID: 3X5HND8pTtaOR3ghUspP+A==
X-CSE-MsgGUID: Czqs1dJwRRadKFYA/DbYYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72806297"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72806297"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:23:07 -0800
X-CSE-ConnectionGUID: N3IHxWhdR4eNkVYF46IAcQ==
X-CSE-MsgGUID: z8ayP2B3RO6cAnp3RpiGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215687152"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:23:07 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 01/10] tools/vmtb: Update QEMU parameters
Date: Tue, 24 Feb 2026 08:50:18 +0100
Message-Id: <20260224075027.2409675-2-adam.miszczak@linux.intel.com>
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

1. Enable SSH access to VM/Guest OS

Add QEMU options to open guest SSH connection:
- enable default emulated NIC
- redirect host's TCP port 10000+N connections to
  guest's SSH server on port 22
  (where N is booted VM number, starting from 0)

For example, login to VM0 (from host) as:
$ ssh -p 10000 gta@localhost

2. Enable migration based on VFIO driver

Set 'enable-migration' option introducing QEMU VF migration support.

VF migration is supported by a vendor specific VFIO driver (xe-vfio-pci).
In case of regular 'vfio-pci', QEMU command option 'enable-migration'
should not be explicitly enabled to prevent VM start failure:
'vfio 0000:00:02.1: VFIO migration is not supported in kernel'

3. Disable QEMU emulated VGA card

Disable standard emulated VGA on QEMU VMs to avoid issues
emerging from a bochs DRM driver.
Standard VGA is enumerated as PCI device BDF 00:02.0
on minor 0 (drm/card0) - this causes troubles with VirtualMachine class
reserving card0 for passed VF.
Also, bochs driver obscures guest dmesg with verbose debug logs.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/bench/machines/virtual/vm.py | 14 ++++++++++----
 tools/vmtb/vmm_flows/conftest.py        | 25 +++++++++++++++----------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
index e75de590d..9f4ca1de7 100644
--- a/tools/vmtb/bench/machines/virtual/vm.py
+++ b/tools/vmtb/bench/machines/virtual/vm.py
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: MIT
-# Copyright © 2024 Intel Corporation
+# Copyright © 2024-2026 Intel Corporation
 
 import base64
 import json
@@ -58,7 +58,8 @@ class VirtualMachine(MachineInterface):
 
             return timeout_wrapper
 
-    def __init__(self, vm_number: int, backing_image: str, driver: str, igt_config: VmtbIgtConfig) -> None:
+    def __init__(self, vm_number: int, backing_image: str, driver: str,
+                 igt_config: VmtbIgtConfig, vf_migration_support: bool) -> None:
         self.vf_bdf: typing.Optional[str] = None
         self.process: typing.Optional[subprocess.Popen] = None
         self.vmnum: int = vm_number
@@ -68,6 +69,7 @@ class VirtualMachine(MachineInterface):
         self.qmp_sockpath = posixpath.join('/tmp', f'mon{self.vmnum}.sock')
         self.drm_driver_name: str = driver
         self.igt_config: VmtbIgtConfig = igt_config
+        self.vf_migration: bool = vf_migration_support
 
         if not posixpath.exists(backing_image):
             logger.error('No image for VM%s', self.vmnum)
@@ -153,6 +155,9 @@ class VirtualMachine(MachineInterface):
                    '-vnc', f':{self.vmnum}',
                    '-serial', 'stdio',
                    '-m', '4096',
+                   '-vga', 'none',
+                   '-net', 'nic',
+                   '-net', f'user,hostfwd=tcp::{10000 + self.vmnum}-:22',
                    '-drive', f'file={self.image if not self.migrate_destination_vm else self.migrate_source_image}',
                    '-chardev', f'socket,path={self.questagent_sockpath},server=on,wait=off,id=qga{self.vmnum}',
                    '-device', 'virtio-serial',
@@ -161,8 +166,9 @@ class VirtualMachine(MachineInterface):
                    '-mon', f'chardev=mon{self.vmnum},mode=control']
 
         if self.vf_bdf:
-            command.extend(['-enable-kvm', '-cpu', 'host'])
-            command.extend(['-device', f'vfio-pci,host={self.vf_bdf},enable-migration=on'])
+            command.extend(['-enable-kvm', '-cpu', 'host', '-device', f'vfio-pci,host={self.vf_bdf}'])
+            if self.vf_migration:
+                command[-1] += ',enable-migration=on'
 
         if self.migrate_destination_vm:
             # If VM is migration destination - run in stopped/prelaunch state (explicit resume required)
diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
index 7b6eacd51..675312253 100644
--- a/tools/vmtb/vmm_flows/conftest.py
+++ b/tools/vmtb/vmm_flows/conftest.py
@@ -1,26 +1,25 @@
 # SPDX-License-Identifier: MIT
-# Copyright © 2024 Intel Corporation
+# Copyright © 2024-2026 Intel Corporation
 
 import json
 import logging
 import re
 import typing
-
 from dataclasses import dataclass
 from pathlib import Path
 
 import pytest
 
 from bench import exceptions
-from bench.helpers.helpers import (modprobe_driver, modprobe_driver_check)
-from bench.helpers.log import HOST_DMESG_FILE
-from bench.configurators.vgpu_profile_config import VgpuProfileConfigurator, VfSchedulingMode
 from bench.configurators.vgpu_profile import VgpuProfile
+from bench.configurators.vgpu_profile_config import (VfSchedulingMode,
+                                                     VgpuProfileConfigurator)
 from bench.configurators.vmtb_config import VmtbConfigurator
-from bench.machines.host import Host, Device
+from bench.helpers.helpers import modprobe_driver, modprobe_driver_check
+from bench.helpers.log import HOST_DMESG_FILE
+from bench.machines.host import Device, Host
 from bench.machines.virtual.vm import VirtualMachine
 
-
 logger = logging.getLogger('Conftest')
 
 
@@ -89,15 +88,20 @@ class VmmTestingSetup:
         self.host.load_drivers()
         self.host.discover_devices()
 
+        # VF migration requires vendor specific VFIO driver (e.g. xe-vfio-pci)
+        vf_migration_support: bool = self.host.is_driver_loaded(f'{self.host.drm_driver_name}-vfio-pci')
+
         logger.info("\nDUT info:"
                     "\n\tCard index: %s"
                     "\n\tPCI BDF: %s "
                     "\n\tDevice ID: %s (%s)"
-                    "\n\tHost DRM driver: %s",
+                    "\n\tHost DRM driver: %s"
+                    "\n\tVF migration support: %s",
                     self.host.dut_index,
                     self.get_dut().pci_info.bdf,
                     self.get_dut().pci_info.devid, self.get_dut().gpu_model,
-                    self.get_dut().driver.get_name())
+                    self.get_dut().driver.get_name(),
+                    vf_migration_support)
 
         self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
 
@@ -105,7 +109,8 @@ class VmmTestingSetup:
         self.vms: typing.List[VirtualMachine] = [
             VirtualMachine(vm_idx, self.guest_os_image,
                            vmtb_config.get_guest_config().driver,
-                           vmtb_config.get_guest_config().igt_config)
+                           vmtb_config.get_guest_config().igt_config,
+                           vf_migration_support)
             for vm_idx in range(min(self.vgpu_profile.num_vfs, self.testing_config.max_num_vms))]
 
     def get_vgpu_profile(self) -> VgpuProfile:
-- 
2.39.1

