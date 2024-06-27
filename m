Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ED8C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 14:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F3210E066;
	Thu, 27 Jun 2024 14:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lARWc3wu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367B410E066
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719499884; x=1751035884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lVKbNkFPK0yedb9PxEnIuiSKqkBroj2KIr/s0AtWvyw=;
 b=lARWc3wucR9e2fTpYroVTjfpIlw/hGVF7gxEc3XPypabefA9Cg3NIx58
 PxKfFZMoxfTrghpeiiC8oXlyGea4yb5Y+qG3wDUQH+8mTnLTTYFG4xeqF
 ImI2IQOwBuvQkYcrfTcUTr49GnrwxU8TAq+z+BcmFFgYprQdH2F+AZVfr
 Vhhn6wPVwr06T6MX9C5qS8/8uUwvWz1nVrN7pxOBXLrKKC2e+Cj5coiJP
 c7UvdpG0WLSwQ7RAK+gFNohj7nHQjXLfpFuW/AuGvNut56+OTK+aNE6LC
 JzzcDW2cKcIXrNlkTYL5UVffCle1UCM4xaRAkWGJa/1y5xh5/3RDBx9JO Q==;
X-CSE-ConnectionGUID: /a3qn49eRAOvbO8Pwg1jew==
X-CSE-MsgGUID: rG/4ilAHThG8/czyieIu4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16370004"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="16370004"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 07:51:24 -0700
X-CSE-ConnectionGUID: bZKJPF36QB6l02CH7mu1fw==
X-CSE-MsgGUID: WFEKX7LfTyWO3iVJ4doY4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="44816666"
Received: from mbernato-z370.igk.intel.com (HELO localhost) ([10.91.214.41])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 07:51:23 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t] lib/igt_sriov_device: Replace libpciaccess with direct
 sysfs interaction
Date: Thu, 27 Jun 2024 14:51:18 +0000
Message-ID: <20240627145118.719988-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Previously, libpciaccess was used to fetch PCI device information for
VFs in SR-IOV, which does not refresh the PCI bus state after the initial
scan. This can lead to outdated PCI information in dynamic SR-IOV
environments where VFs are dynamically managed.

The new implementation directly interacts with sysfs to resolve the PCI
slot address of a VF, ensuring access to the most current state of the
PCI bus. This change removes the dependency on libpciaccess and uses
__igt_sriov_get_vf_pci_slot_alloc to fetch the PCI slot addresses
directly from sysfs based on VF numbers.

Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Closes: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-9/igt@sriov_basic@bind-unbind-vf@vf-2.html
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.c | 46 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index a0ef05d5c..416d8f4aa 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -297,26 +297,58 @@ bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num)
 	return ret;
 }
 
+/*
+ * __igt_sriov_get_vf_pci_slot_alloc:
+ * @pf_sysfs: sysfs directory file descriptor
+ * @vf_num: VF number (1-based)
+ *
+ * Resolve symbolic link from virtfnX to obtain the PCI slot address.
+ * Returns a dynamically allocated string containing the PCI slot address,
+ * or NULL if the link cannot be resolved.
+ * The caller is responsible for freeing the returned memory.
+ */
+static char *__igt_sriov_get_vf_pci_slot_alloc(int pf_sysfs, unsigned int vf_num)
+{
+	char dir_path[PATH_MAX];
+	char path[PATH_MAX];
+	char *pci_slot_addr;
+	int len;
+
+	/* Adjust for 0-based index as vf_num is 1-based */
+	if (vf_num)
+		snprintf(dir_path, sizeof(dir_path), "device/virtfn%u",
+			 vf_num - 1);
+	else
+		snprintf(dir_path, sizeof(dir_path), "device");
+
+	len = readlinkat(pf_sysfs, dir_path, path, sizeof(path));
+	if (len <= 0)
+		return NULL;
+
+	path[len] = '\0';
+	pci_slot_addr = strrchr(path, '/') + 1;
+
+	return pci_slot_addr ? strdup(pci_slot_addr) : NULL;
+}
+
 static bool __igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num, bool bind)
 {
-	struct pci_device *pci_dev;
-	char pci_slot[14];
+	char *pci_slot;
 	int sysfs;
 	bool ret;
 
 	igt_assert(vf_num > 0);
 
-	pci_dev = __igt_device_get_pci_device(pf, vf_num);
-	igt_assert_f(pci_dev, "No PCI device for given VF number: %d\n", vf_num);
-	sprintf(pci_slot, "%04x:%02x:%02x.%x",
-		pci_dev->domain_16, pci_dev->bus, pci_dev->dev, pci_dev->func);
-
 	sysfs = igt_sysfs_open(pf);
 	igt_assert_fd(sysfs);
 
+	pci_slot = __igt_sriov_get_vf_pci_slot_alloc(sysfs, vf_num);
+	igt_assert(pci_slot);
+
 	igt_debug("vf_num: %u, pci_slot: %s\n", vf_num, pci_slot);
 	ret = igt_sysfs_set(sysfs, bind ? "device/driver/bind" : "device/driver/unbind", pci_slot);
 
+	free(pci_slot);
 	close(sysfs);
 
 	return ret;
-- 
2.31.1

