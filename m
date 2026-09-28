Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66223C9832F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 08:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFA210E28D;
	Mon, 28 Sep 2026 08:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpDR+C5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AA710E28D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790582754; x=1822118754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4o4TDih04CbjAzlhKHqpbiCcpY0dgWOTWlg1NfR79oI=;
 b=EpDR+C5NwEgQzp3BTit/N/dB+t9vF9quiVPAw0vtgcKztiC+X+8gAZfo
 tP4OSu/R4G99KB3+JKh0CObriBqzKOTv6PKQ0lyGtccLAzRjMDQfFUwLI
 omyMSqEqr76VKG0oPvCDdXk3v3V1hCXiyrGx0IrLl03jj1/Gc5lzLqMhh
 oy5+rkTBSkEhQus33r183ndyrEcEyMa4jia6Kxe83BT35YyZ8kKCV7/R/
 xx9trin9qVQ3+nj6yb/tS6QiCOvsB5DA5l3G3/kO4ph3ArWsNqFYr1CrW
 /huBE+fjMvEk6uoVWumgtlKxNOwc/Ol8JLqQr0XWjyz4g2E2xmP6CiJ86 g==;
X-CSE-ConnectionGUID: oPvF/RFmTO2R9SjBOpZj7w==
X-CSE-MsgGUID: OzbLZCK8T26TmEarEfecuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101932244"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="101932244"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:05:53 -0700
X-CSE-ConnectionGUID: vwd3IbvGSFi4IQjGcjAb9w==
X-CSE-MsgGUID: 8S+rrrXVQrOQGnno8Ac3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="304458135"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:05:53 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 3/7] tools/vmtb: Align driver/device layer with current
 xe SR-IOV interfaces
Date: Mon, 28 Sep 2026 09:25:56 +0200
Message-Id: <20260928072600.426902-4-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
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

Move VF VRAM quota provisioning from the obsolete debugfs lmem_quota
attribute to the sysfs SRIOV admin tree
(/sys/bus/pci/drivers/xe/[BDF]/sriov_admin/vf[N]/profile/vram_quota)
and update the driver abstraction and provisioning helpers.

Fix physical Device bind()/unbind() calls that still passed a PCI BDF
to DriverInterface, breaking unload_drivers() with a TypeError.

Add DeviceInterface.reset() that triggers an FLR via
/sys/bus/pci/devices/[BDF]/reset - PF FLR on the host for physical
devices and VF FLR in the guest for virtual devices.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/bench/drivers/driver_interface.py  |  8 ++--
 tools/vmtb/bench/drivers/xe.py                | 39 ++++++++++---------
 tools/vmtb/bench/machines/device_interface.py |  7 ++++
 tools/vmtb/bench/machines/physical/device.py  | 12 ++++--
 tools/vmtb/bench/machines/virtual/device.py   |  4 ++
 5 files changed, 44 insertions(+), 26 deletions(-)

diff --git a/tools/vmtb/bench/drivers/driver_interface.py b/tools/vmtb/bench/drivers/driver_interface.py
index 0b0bd5abb..9d1e5ab00 100644
--- a/tools/vmtb/bench/drivers/driver_interface.py
+++ b/tools/vmtb/bench/drivers/driver_interface.py
@@ -201,19 +201,19 @@ class PfDriverInterface(DriverInterface, abc.ABC):
 
     # VF provisioning
     @abc.abstractmethod
-    def get_ggtt_quota(self, vf_num: int, gt_num: int) -> int:
+    def get_vram_quota(self, vf_num: int) -> int:
         raise NotImplementedError
 
     @abc.abstractmethod
-    def set_ggtt_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+    def set_vram_quota(self, vf_num: int, val: int) -> None:
         raise NotImplementedError
 
     @abc.abstractmethod
-    def get_lmem_quota(self, vf_num: int, gt_num: int) -> int:
+    def get_ggtt_quota(self, vf_num: int, gt_num: int) -> int:
         raise NotImplementedError
 
     @abc.abstractmethod
-    def set_lmem_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+    def set_ggtt_quota(self, vf_num: int, gt_num: int, val: int) -> None:
         raise NotImplementedError
 
     @abc.abstractmethod
diff --git a/tools/vmtb/bench/drivers/xe.py b/tools/vmtb/bench/drivers/xe.py
index 26e4e0a08..479c1dd87 100644
--- a/tools/vmtb/bench/drivers/xe.py
+++ b/tools/vmtb/bench/drivers/xe.py
@@ -140,7 +140,27 @@ class XeDriver(PfDriverInterface):
         path = self.__helper_create_debugfs_path(0, gt_num, '', 'sample_period_ms')
         self.write_debugfs(path, str(val))
 
-    # VF and PF provisioning parameters
+    # VF provisioning parameters
+    # Sysfs location: [SRIOV sysfs base path]/sriov_admin/[vfN]/profile
+    # @vf_num: VF number (1-based) or 0 for PF
+    def get_vram_quota(self, vf_num: int) -> int:
+        if vf_num == 0:
+            logger.warning("PF vram_quota not available")
+            return 0
+
+        sriov_admin_path = self.__helper_create_sriov_admin_path(vf_num, 'vram_quota')
+        return int(self.read_sysfs(self.sysfs_device_path / sriov_admin_path)) if self.has_lmem() else 0
+
+    def set_vram_quota(self, vf_num: int, val: int) -> None:
+        if vf_num == 0:
+            logger.warning("PF vram_quota not available")
+            return
+
+        sriov_admin_path = self.__helper_create_sriov_admin_path(vf_num, 'vram_quota')
+        if self.has_lmem():
+            self.write_sysfs(self.sysfs_device_path / sriov_admin_path, str(val))
+
+    # VF provisioning parameters (debugfs)
     # Debugfs location: [SRIOV debugfs base path]/gtM/[pf|vfN]
     # @vf_num: VF number (1-based) or 0 for PF
     def get_ggtt_quota(self, vf_num: int, gt_num: int) -> int:
@@ -159,23 +179,6 @@ class XeDriver(PfDriverInterface):
         path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'ggtt_quota')
         self.write_debugfs(path, str(val))
 
-    def get_lmem_quota(self, vf_num: int, gt_num: int) -> int:
-        if vf_num == 0:
-            logger.warning("PF lmem_quota not available")
-            return 0
-
-        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'lmem_quota')
-        return int(self.read_debugfs(path)) if self.has_lmem() else 0
-
-    def set_lmem_quota(self, vf_num: int, gt_num: int, val: int) -> None:
-        if vf_num == 0:
-            logger.warning("PF lmem_quota not available")
-            return
-
-        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'lmem_quota')
-        if self.has_lmem():
-            self.write_debugfs(path, str(val))
-
     def get_contexts_quota(self, vf_num: int, gt_num: int) -> int:
         if vf_num == 0:
             logger.warning("PF contexts_quota not available")
diff --git a/tools/vmtb/bench/machines/device_interface.py b/tools/vmtb/bench/machines/device_interface.py
index 0eff493f0..76b47de03 100644
--- a/tools/vmtb/bench/machines/device_interface.py
+++ b/tools/vmtb/bench/machines/device_interface.py
@@ -10,8 +10,15 @@ class DeviceInterface(abc.ABC):
     """
     @abc.abstractmethod
     def bind_driver(self) -> None:
+        """Bind driver to device."""
         raise NotImplementedError
 
     @abc.abstractmethod
     def unbind_driver(self) -> None:
+        """Unbind driver from device."""
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def reset(self) -> None:
+        """Reset device (trigger FLR)."""
         raise NotImplementedError
diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
index 6c0dc4ff9..b4eebc245 100644
--- a/tools/vmtb/bench/machines/physical/device.py
+++ b/tools/vmtb/bench/machines/physical/device.py
@@ -125,10 +125,14 @@ class Device(DeviceInterface):
         return ret
 
     def bind_driver(self) -> None:
-        self.driver.bind(self.pci_info.bdf)
+        self.driver.bind()
 
     def unbind_driver(self) -> None:
-        self.driver.unbind(self.pci_info.bdf)
+        self.driver.unbind()
+
+    def reset(self) -> None:
+        logger.debug("[%s] Trigger reset (PF FLR)", self.pci_info.bdf)
+        self.driver.flr()
 
     def override_vf_driver(self, vf_num: int) -> str:
         """Set VFIO as VF driver."""
@@ -224,8 +228,8 @@ class Device(DeviceInterface):
             self.driver.set_pf_doorbells_spare(gt_num, resources_config.pfDoorbells)
         else:
             if not self.is_gt_media_type(gt_num):
+                self.driver.set_vram_quota(fn_num, resources_config.vfLmem)
                 self.driver.set_ggtt_quota(fn_num, gt_num, resources_config.vfGgtt)
-                self.driver.set_lmem_quota(fn_num, gt_num, resources_config.vfLmem)
             self.driver.set_contexts_quota(fn_num, gt_num, resources_config.vfContexts)
             self.driver.set_doorbells_quota(fn_num, gt_num, resources_config.vfDoorbells)
 
@@ -246,8 +250,8 @@ class Device(DeviceInterface):
                 self.driver.set_contexts_quota(vf_num, gt_num, 0)
                 self.driver.set_doorbells_quota(vf_num, gt_num, 0)
                 if not self.is_gt_media_type(gt_num):
+                    self.driver.set_vram_quota(vf_num, 0)
                     self.driver.set_ggtt_quota(vf_num, gt_num, 0)
-                    self.driver.set_lmem_quota(vf_num, gt_num, 0)
 
     def reset_provisioning(self, num_vfs: int) -> None:
         """Clear provisioning config for a given number of VFs and restore auto provisioning mode."""
diff --git a/tools/vmtb/bench/machines/virtual/device.py b/tools/vmtb/bench/machines/virtual/device.py
index c838db59d..b36dbba58 100644
--- a/tools/vmtb/bench/machines/virtual/device.py
+++ b/tools/vmtb/bench/machines/virtual/device.py
@@ -68,6 +68,10 @@ class VirtualDevice(DeviceInterface):
                      self.vm.get_drm_driver_name(), self.pci_info.bdf)
         self.driver.unbind()
 
+    def reset(self) -> None:
+        logger.debug("[%s] Trigger reset (VF FLR)", self.pci_info.bdf)
+        self.driver.flr() # VF FLR from guest's sysfs
+
     @property
     def lmem_size(self) -> typing.Optional[int]:
         if self._lmem_size is None:
-- 
2.39.1

