Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86930EFB811
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CB810E0BA;
	Tue, 24 Feb 2026 08:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7YArnPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C1A10E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771921487; x=1803457487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TdrG00SkoWRLf+JRlGI4+Oy/E9MABiGDMntDZDFNewo=;
 b=E7YArnPuW+wL29y+99J2G4FLyIphqX5FrqsAeGccY4fopAlxjM3sStPu
 4G0xTu5jF28NwGILiCxw0QzRPqaZnVEg6VLxvQbRK49kdvT1Q8PlD80nm
 iKoM89EU/gCKRHV8fax+YDfKjcn2/zy4WJUA68+rKg18QAQP/ayQtS3BD
 e+EsO5YB0c8cFAOd2qr66PXxZ7WRpwfFOHjztrJvW6ZwuIXHMlZdc/E12
 +HmCOzcYIhtlwyOttXygOZW/y4abhOnIiWw8Ns71Q552S7gMVOrZzE4Yl
 INcVU2q9F0awWl2q/w9mBVTngtl9IIoJgvfrYl0Pb51iLOCHMHzN7rcnl A==;
X-CSE-ConnectionGUID: w1x/IsMdQXCAi/Vz9o/vig==
X-CSE-MsgGUID: nzJ/I2eyRgiS0ojqXSlY0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76540680"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76540680"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:24:34 -0800
X-CSE-ConnectionGUID: QPYWhBAYS62Gko+vbrZaRQ==
X-CSE-MsgGUID: wqxhSGnpR7imuwEXnHTmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220351982"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:24:33 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 09/10] tools/vmtb: Support max VFs configuration
Date: Tue, 24 Feb 2026 08:50:26 +0100
Message-Id: <20260224075027.2409675-10-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
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

Enable maximum VFs test configuration variant, for both:
auto-provisioning and vGPU profiles.
Max VFs is device-specific value read via sysfs.
For auto-provisioning, max VFs always equals sysfs/sriov_totalvfs,
but the highest supported number of VFs defined by vGPU profiles
may differ from the hardware max value.

Max VFs test config variant can be requested by passing MAX_VFS label
to VmmTestingConfig structure (num_vfs) or convenience tuple, for example:
test_variants = [(MAX_VFS, VfProvisioningMode.AUTO, VfSchedulingMode.INFINITE),
                 (MAX_VFS, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/vmm_flows/conftest.py | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
index ae149d652..02c297f93 100644
--- a/tools/vmtb/vmm_flows/conftest.py
+++ b/tools/vmtb/vmm_flows/conftest.py
@@ -32,6 +32,10 @@ def pytest_addoption(parser):
                      help='Device card index for test execution')
 
 
+# Label indicating Max VFs configurarion variant, intended for pass to VmmTestingConfig.
+MAX_VFS = "Max"
+
+
 @dataclass
 class VmmTestingConfig:
     """Structure represents test configuration used by a setup fixture.
@@ -54,16 +58,23 @@ class VmmTestingConfig:
     auto_poweron_vm: bool = True
     auto_probe_vm_driver: bool = True
     unload_host_drivers_on_teardown: bool = False
+    enable_max_vfs: bool = False
     # Temporary W/A: reduce size of LMEM assigned to VFs to speed up a VF state save-restore process
     wa_reduce_vf_lmem: bool = False
 
+    def __post_init__(self):
+        if self.num_vfs is MAX_VFS:
+            self.enable_max_vfs = True
+            self.num_vfs = 0 # Actual value set in VmmTestingSetup
+
     def __str__(self) -> str:
-        test_config_id = f'{self.num_vfs}VF-(P:{self.provisioning_mode.name} S:{self.scheduling_mode.name})'
+        test_config_id = (f'{self.num_vfs if not self.enable_max_vfs else "Max"}VF'
+                          + f'-(P:{self.provisioning_mode.name} S:{self.scheduling_mode.name})')
         return test_config_id
 
     def __repr__(self) -> str:
         return (f'\nVmmTestingConfig:'
-                f'\nNum VFs = {self.num_vfs} / max num VMs = {self.max_num_vms}'
+                f'\nNum VFs = {self.num_vfs if not self.enable_max_vfs else "Max"} / max num VMs = {self.max_num_vms}'
                 f'\nVF provisioning mode = {self.provisioning_mode.name}'
                 f'\nVF scheduling mode = {self.scheduling_mode.name}'
                 f'\nSetup flags:'
@@ -89,6 +100,7 @@ class VmmTestingSetup:
         self.host.load_drivers()
         self.host.discover_devices()
         self.dut: Device = self.host.get_device(self.dut_index)
+        self.total_vfs: int = self.get_dut().driver.get_totalvfs()
 
         # VF migration requires vendor specific VFIO driver (e.g. xe-vfio-pci)
         vf_migration_support: bool = self.host.is_driver_loaded(f'{self.host.drm_driver_name}-vfio-pci')
@@ -98,11 +110,13 @@ class VmmTestingSetup:
                     "\n\tPCI BDF: %s "
                     "\n\tDevice ID: %s (%s)"
                     "\n\tHost DRM driver: %s"
-                    "\n\tVF migration support: %s",
+                    "\n\tMax VFs supported: %s"
+                    "\n\tVF migration supported: %s",
                     self.dut_index,
                     self.get_dut().pci_info.bdf,
                     self.get_dut().pci_info.devid, self.get_dut().gpu_model,
                     self.get_dut().driver.get_name(),
+                    self.total_vfs,
                     vf_migration_support)
 
         vmtb_root_path = vmtb_config.vmtb_config_file.parent
@@ -115,6 +129,9 @@ class VmmTestingSetup:
             or self.testing_config.scheduling_mode is not VfSchedulingMode.INFINITE):
             self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
 
+        if self.testing_config.provisioning_mode is VfProvisioningMode.AUTO and self.testing_config.enable_max_vfs:
+            self.testing_config.num_vfs = self.total_vfs
+
         # Start maximum requested number of VMs, but not more than VFs supported by the given vGPU profile
         self.vms: typing.List[VirtualMachine] = [
             VirtualMachine(vm_idx, self.guest_os_image,
@@ -125,6 +142,12 @@ class VmmTestingSetup:
 
     def get_vgpu_profile(self) -> VgpuProfile:
         configurator = VgpuProfileConfigurator(self.vgpu_profiles_dir, self.get_dut().gpu_model)
+        if self.testing_config.enable_max_vfs:
+            # Get a vGPU profile with the most VFs (not necessarily equal to sysfs/sriov_totalvfs)
+            self.testing_config.num_vfs = max(configurator.supported_vgpu_profiles.vf_resources,
+                                              key=lambda profile: profile.vf_count).vf_count
+            logger.debug("Max VFs supported by vGPU profiles: %s", self.testing_config.num_vfs)
+
         try:
             vgpu_profile = configurator.get_vgpu_profile(self.testing_config.num_vfs,
                                                          self.testing_config.scheduling_mode)
-- 
2.39.1

