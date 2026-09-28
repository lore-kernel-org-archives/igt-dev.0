Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1F7C9833E
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 08:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0231110E6C6;
	Mon, 28 Sep 2026 08:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E72wGp8B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E542F10E6C6
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790582822; x=1822118822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=em8F25FMhMhVyGi1pYVva1fg25VS+4lYA2hzOdk12eI=;
 b=E72wGp8B5bm2y02K7D9k31PjEV7F4SCAeyLPeyIazUu4aepgdEyQjP8O
 MN5p8RF8AVjkzI5xQ42yQ6sZhJW5E9OpLpsn+bPqXDsQMHRoERe18gXzk
 K3s2drzcz2qy7tkzLZ77VSXGfKdCFZT5/sPJSR4A/FjbZtoGXowl+ZYgQ
 EIf8lcU9vJVTslm8ffgC+Cii7GGlRAYvnPyPWJF3tUiDTf9q/BymBH/+w
 S1qqJzgqdXPXEzLgQGzOlEFfzGZD1NIs9sZiU7RD6JNTbg4ipdy6Cl8Iy
 PCYgS6T562elqcT2G8yZiIJ23J385/9gCTnb6y07sJMTZ6Eaz0d5Ybs24 A==;
X-CSE-ConnectionGUID: EinmLqzfTWOCvzAWR2kn2g==
X-CSE-MsgGUID: PNiNdCtrR0SwrizMayFfLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100606691"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="100606691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:07:02 -0700
X-CSE-ConnectionGUID: DKam+VMgRTm92/FVVSCtWw==
X-CSE-MsgGUID: 1Q07iKXxTleW2qQLfxk3jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274497634"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:07:00 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 5/7] tools/vmtb: Add pre-test environment cleanup
Date: Mon, 28 Sep 2026 09:25:58 +0200
Message-Id: <20260928072600.426902-6-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
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

Introduce 'EnvironmentCleaner' to ensure a clean DUT state before each
test by removing leftovers from crashed, failed, or timed-out runs.
The cleaner handles:
- terminating orphaned QEMU processes (SIGTERM, then SIGKILL if needed)
- removing stale QEMU sockets (Guest Agent, QMP monitor)
- optionally removing leftover qcow2 guest images (disabled by default)
Wire EnvironmentCleaner().cleanup() into the VM setup fixtures in
vmm_flows/conftest.py so cleanup runs before every test setup phase.

Consolidate multi-step SR-IOV configuration teardown into a single
reset_sriov_config() function that removes VFs and restores
auto provisioning via debugfs.
Call reset_sriov_config() at test setup when leftover VFs are
detected, guarding against dirty state from crashed runs.

Drop the explicit provisioning attributes clearing
(clear_provisioning_attributes/reset_provisioning) and the unused
cancel_work() teardown step — restore_auto_provisioning is sufficient.
Remove implicit VF removal from create_vf() (handled by the setup check).

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/bench/drivers/driver_interface.py |  1 +
 tools/vmtb/bench/drivers/xe.py               |  1 +
 tools/vmtb/bench/helpers/cleanup.py          | 91 ++++++++++++++++++++
 tools/vmtb/bench/machines/physical/device.py | 39 ++-------
 tools/vmtb/vmm_flows/conftest.py             | 34 ++++++--
 5 files changed, 126 insertions(+), 40 deletions(-)
 create mode 100644 tools/vmtb/bench/helpers/cleanup.py

diff --git a/tools/vmtb/bench/drivers/driver_interface.py b/tools/vmtb/bench/drivers/driver_interface.py
index 9d1e5ab00..498afa9af 100644
--- a/tools/vmtb/bench/drivers/driver_interface.py
+++ b/tools/vmtb/bench/drivers/driver_interface.py
@@ -146,6 +146,7 @@ class PfDriverInterface(DriverInterface, abc.ABC):
     def restore_auto_provisioning(self) -> None:
         raise NotImplementedError
 
+    # Deprecated - not used on xe
     @abc.abstractmethod
     def cancel_work(self) -> None:
         raise NotImplementedError
diff --git a/tools/vmtb/bench/drivers/xe.py b/tools/vmtb/bench/drivers/xe.py
index 479c1dd87..45182aad5 100644
--- a/tools/vmtb/bench/drivers/xe.py
+++ b/tools/vmtb/bench/drivers/xe.py
@@ -62,6 +62,7 @@ class XeDriver(PfDriverInterface):
         path = self.debugfs_path / 'sriov' / 'restore_auto_provisioning'
         self.write_debugfs(str(path), str(1))
 
+    # Deprecated - not used on xe
     def cancel_work(self) -> None:
         # Function to cancel all remaing work on GPU (for test cleanup).
         # Forcing reset (debugfs/gtM/force_reset_sync) shouldn't be used to idle GPU.
diff --git a/tools/vmtb/bench/helpers/cleanup.py b/tools/vmtb/bench/helpers/cleanup.py
new file mode 100644
index 000000000..f1d3e3f76
--- /dev/null
+++ b/tools/vmtb/bench/helpers/cleanup.py
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2026 Intel Corporation
+
+import logging
+import subprocess
+import time
+from pathlib import Path
+
+logger = logging.getLogger('Cleanup')
+
+
+class EnvironmentCleaner:
+    """Pre-test environment cleanup utilities.
+
+    Ensures that leftovers from crashed, failed, or timed-out tests
+    are removed before the next test setup phase begins.
+    """
+
+    QEMU_PROCESS_NAME = 'qemu-system-x86_64'
+    SOCKET_PATTERNS = ['qga*.sock', 'mon*.sock']
+    QEMU_IMAGE_PATTERN = 'vm*_*_image.qcow2'
+
+    def __init__(self, work_dir: str = '.', remove_qemu_images: bool = False) -> None:
+        self.work_dir = Path(work_dir)
+        self.remove_qemu_images = remove_qemu_images
+
+    def cleanup(self) -> None:
+        """Perform full pre-test environment cleanup.
+        Handles:
+        - Terminating orphaned QEMU processes
+        - Removing stale QEMU sockets (Guest Agent, QMP monitor)
+        - Removing leftover QEMU qcow2 images (optionally)
+        """
+        logger.debug("Pre-test environment cleanup")
+        self.terminate_orphaned_qemu_processes()
+        self.remove_stale_sockets()
+        if self.remove_qemu_images:
+            self.remove_leftover_qemu_images()
+
+    def terminate_orphaned_qemu_processes(self) -> None:
+        """Find and terminate any leftover QEMU processes from previous test runs.
+           Try SIGTERM first, then SIGKILL if necessary."""
+        for signal in ('TERM', 'KILL'):
+            pids = self._find_qemu_pids()
+            if not pids:
+                return
+            for pid_str in pids:
+                logger.debug("Terminating (SIG%s) orphaned QEMU process (PID: %s)", signal, pid_str)
+                try:
+                    subprocess.run(['kill', f'-{signal}', pid_str], check=False)
+                except Exception as exc:
+                    logger.warning("Failed to %s QEMU PID %s: %s", signal, pid_str, exc)
+            time.sleep(1)  # Give the processes a moment to terminate
+
+    def _find_qemu_pids(self) -> list[str] | None:
+        """Return list of QEMU PIDs, or None if none found or pgrep unavailable."""
+        try:
+            result = subprocess.run(
+                ['pgrep', '-f', self.QEMU_PROCESS_NAME],
+                capture_output=True, text=True, check=False)
+        except FileNotFoundError:
+            logger.warning("pgrep not available, skipping orphan QEMU check")
+            return None
+
+        if result.returncode != 0:
+            return None
+
+        return [pid for pid in result.stdout.strip().split('\n') if pid] or None
+
+    def remove_stale_sockets(self) -> None:
+        """Remove leftover QEMU Guest Agent and QMP monitor sockets."""
+        for pattern in self.SOCKET_PATTERNS:
+            for sock_path in Path('/tmp').glob(pattern):
+                try:
+                    if not sock_path.is_socket():
+                        continue
+                    logger.debug("Removing stale VMTB/QEMU socket: %s", sock_path)
+                    sock_path.unlink()
+                except OSError as exc:
+                    logger.warning("Failed to remove stale socket %s: %s", sock_path, exc)
+
+    def remove_leftover_qemu_images(self) -> None:
+        """Remove leftover QEMU qcow2 images from previous test runs."""
+        for image_path in self.work_dir.glob(self.QEMU_IMAGE_PATTERN):
+            try:
+                if not image_path.is_file():
+                    continue
+                logger.debug("Removing leftover VMTB/QEMU guest image: %s", image_path)
+                image_path.unlink()
+            except OSError as exc:
+                logger.warning("Failed to remove leftover image %s: %s", image_path, exc)
diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
index b4eebc245..7cbbee277 100644
--- a/tools/vmtb/bench/machines/physical/device.py
+++ b/tools/vmtb/bench/machines/physical/device.py
@@ -91,9 +91,6 @@ class Device(DeviceInterface):
         Disable SRIOV drivers autoprobe to allow VFIO driver override for VFs.
         """
         logger.info("[%s] Enable %s VFs", self.pci_info.bdf, num)
-        if self.get_current_vfs() != 0:
-            self.remove_vfs()
-
         self.numvf = num
 
         # Disable driver autoprobe to avoid driver load on VF (override to vfio is required)
@@ -233,36 +230,6 @@ class Device(DeviceInterface):
             self.driver.set_contexts_quota(fn_num, gt_num, resources_config.vfContexts)
             self.driver.set_doorbells_quota(fn_num, gt_num, resources_config.vfDoorbells)
 
-    def clear_provisioning_attributes(self, num_vfs: int) -> None:
-        """Clear provisioning attributes for a requested number of VFs."""
-        # Provisioning config are likely wiped out by (xe) debugfs/restore_auto_provisioning,
-        # but explicit clear shouldn't harm.
-        self.driver.set_bulk_sched_priority(SchedulingPriority.LOW)
-        self.driver.set_bulk_exec_quantum_ms(0)
-        self.driver.set_bulk_preempt_timeout_us(0)
-
-        for gt_num in range(self.get_num_gts()):
-            self.driver.set_pf_policy_reset_engine(gt_num, 0)
-            self.driver.set_doorbells_quota(0, gt_num, 0)
-            # PF contexts cannot be set from sysfs
-
-            for vf_num in range(1, num_vfs + 1):
-                self.driver.set_contexts_quota(vf_num, gt_num, 0)
-                self.driver.set_doorbells_quota(vf_num, gt_num, 0)
-                if not self.is_gt_media_type(gt_num):
-                    self.driver.set_vram_quota(vf_num, 0)
-                    self.driver.set_ggtt_quota(vf_num, gt_num, 0)
-
-    def reset_provisioning(self, num_vfs: int) -> None:
-        """Clear provisioning config for a given number of VFs and restore auto provisioning mode."""
-        logger.info("[%s] Reset %sxVF provisioning configuration", self.pci_info.bdf, num_vfs)
-        self.clear_provisioning_attributes(num_vfs)
-        self.driver.restore_auto_provisioning()
-
-    def cancel_work(self) -> None:
-        """Drop and reset remaining GPU execution at exit."""
-        self.driver.cancel_work()
-
     def get_scheduling_priority(self, fn_num: int) -> SchedulingPriority:
         """Get scheduling priority for a given VF or PF."""
         return self.driver.get_sched_priority(fn_num)
@@ -274,3 +241,9 @@ class Device(DeviceInterface):
     def set_pf_scheduling_priority(self, val: SchedulingPriority) -> None:
         """Set scheduling priority for PF only. High prioritizes PF execution over VFs."""
         self.driver.set_pf_sched_priority(val)
+
+    def reset_sriov_config(self) -> None:
+        """Clear setup - remove enabled VFs and restore auto provisioning mode."""
+        logger.info("[%s] Reset VFs configuration", self.pci_info.bdf)
+        self.remove_vfs()
+        self.driver.restore_auto_provisioning()
diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
index ba6487c84..df395794c 100644
--- a/tools/vmtb/vmm_flows/conftest.py
+++ b/tools/vmtb/vmm_flows/conftest.py
@@ -16,6 +16,7 @@ from bench.configurators.vgpu_profile_config import (VfProvisioningMode,
                                                      VfSchedulingMode,
                                                      VgpuProfileConfigurator)
 from bench.configurators.vmtb_config import VmtbConfigurator
+from bench.helpers.cleanup import EnvironmentCleaner
 from bench.helpers.log import HOST_DMESG_FILE
 from bench.machines.host import Device, Host
 from bench.machines.virtual.vm import VirtualMachine
@@ -203,10 +204,7 @@ class VmmTestingSetup:
         except Exception as exc:
             logger.error("Error on test teardown (%s)", exc)
         finally:
-            num_vfs = self.get_dut().get_current_vfs()
-            self.get_dut().remove_vfs()
-            self.get_dut().reset_provisioning(num_vfs)
-            self.get_dut().cancel_work()
+            self.get_dut().reset_sriov_config()
 
             if self.testing_config.unload_host_drivers_on_teardown:
                 self.host.unload_drivers()
@@ -256,6 +254,9 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
     tc: VmmTestingConfig = request.param
     logger.debug(repr(tc))
 
+    # Pre-test cleanup: remove leftovers from crashed/failed/timed-out tests
+    EnvironmentCleaner().cleanup()
+
     host: Host = get_host
     ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, host, tc)
 
@@ -263,6 +264,10 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
     num_vfs = ts.testing_config.num_vfs
     num_vms = ts.get_num_vms()
 
+    if device.get_current_vfs() != 0:
+        logger.debug("Test environment is not clean - remove VFs remains")
+        device.reset_sriov_config()
+
     logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
 
     if ts.testing_config.provisioning_mode is VfProvisioningMode.VGPU_PROFILE:
@@ -283,9 +288,6 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
         if tc.wa_reduce_vf_lmem and device.has_lmem():
             ts.vgpu_profile.resources.vfLmem = org_vgpu_profile_vfLmem
 
-    else:
-        device.driver.restore_auto_provisioning()
-
     assert num_vfs <= ts.total_vfs, f'Requested number of VFs ({num_vfs}) exceeds total VFs ({ts.total_vfs})'
     device.create_vf(num_vfs)
 
@@ -320,9 +322,18 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
 @pytest.fixture(scope='function')
 def create_1host_1vm(get_vmtb_config, get_cmdline_config, get_host):
     num_vfs, num_vms = 1, 1
+
+    # Pre-test cleanup: remove leftovers from crashed/failed/timed-out tests
+    EnvironmentCleaner().cleanup()
+
     ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, get_host,
                                           VmmTestingConfig(num_vfs, num_vms))
 
+    device: Device = ts.get_dut()
+    if device.get_current_vfs() != 0:
+        logger.debug("Test environment is not clean - remove VFs remains")
+        device.reset_sriov_config()
+
     logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
     logger.debug(repr(ts.testing_config))
 
@@ -336,9 +347,18 @@ def create_1host_1vm(get_vmtb_config, get_cmdline_config, get_host):
 @pytest.fixture(scope='function')
 def create_1host_2vm(get_vmtb_config, get_cmdline_config, get_host):
     num_vfs, num_vms = 2, 2
+
+    # Pre-test cleanup: remove leftovers from crashed/failed/timed-out tests
+    EnvironmentCleaner().cleanup()
+
     ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, get_host,
                                           VmmTestingConfig(num_vfs, num_vms))
 
+    device: Device = ts.get_dut()
+    if device.get_current_vfs() != 0:
+        logger.debug("Test environment is not clean - remove VFs remains")
+        device.reset_sriov_config()
+
     logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
     logger.debug(repr(ts.testing_config))
 
-- 
2.39.1

