Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926E1E9D40F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D09E10E6AB;
	Wed,  4 Feb 2026 16:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XK1Njm6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBDD10E6B5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770222753; x=1801758753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tonCq927lZRnGYB3Fr+OUEZGXXDPR8LEL0A77bh04cA=;
 b=XK1Njm6KD+LC5vv1gsNy6Oac3Of0LMB3HroEtugluYVwckwLOSSqwOvD
 lHB7y5lyUi1WvLjH86yjGI01cbfpPXkbA6eEjoCVFe/IdHZiroFL0FIGh
 KgKFWkTgwUz0xIkB33MOO4DAZvM+qzK4A/pmPxHNurWxuZcqgUmwb+7dK
 ipwP+cPsHua6/mKUzdOIe8kVguwo3wAqM1Yg2gUC4XL8awCyyzObJaTrz
 ZnG+XryoYakKVPshawxPCZB8Z91T2e0dTkMaB3wwMtxDBUJNSrm7in8vP
 bQ4sq9OSrxlfk95oxXjbFyYLb25ekrQc5XRs7anA72hH9wcCAkUMxKb4a g==;
X-CSE-ConnectionGUID: M2Pl5cEcR4aS+TxmL6Z7RQ==
X-CSE-MsgGUID: 5A6V5meMRxe9M9T8aFvomg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71472366"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71472366"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:33 -0800
X-CSE-ConnectionGUID: iY/6+gnWTSGn11vmEE07FQ==
X-CSE-MsgGUID: jxVBC2l+QpGtiKzlS+fz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209315356"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:31 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v3 i-g-t 1/7] lib/igt_sriov_device: Add helper to get VF PCI
 slot address
Date: Wed,  4 Feb 2026 17:32:04 +0100
Message-ID: <20260204163217.121305-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
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

Add igt_sriov_get_vf_pci_slot_alloc() to resolve the PCI slot address
of a VF by following the device/virtfnX symlink in the PF sysfs
directory, returning a newly allocated string or NULL on failure.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.c | 25 +++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 788ffbfa1..1f4c3ac04 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -354,6 +354,31 @@ static char *__igt_sriov_get_vf_pci_slot_alloc(int pf_sysfs, unsigned int vf_num
 	return pci_slot_addr ? strdup(pci_slot_addr) : NULL;
 }
 
+/**
+ * igt_sriov_get_vf_pci_slot_alloc:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based); 0 means PF
+ *
+ * Resolves the symlink under the PF sysfs directory (device/virtfnX) to obtain
+ * the PCI slot address of the VF (or PF if @vf_num is 0).
+ *
+ * Returns: newly allocated PCI slot address string (e.g. "0000:3b:00.4"),
+ * or NULL on failure. Caller must free().
+ */
+char *igt_sriov_get_vf_pci_slot_alloc(int pf, unsigned int vf_num)
+{
+	char *pci_slot;
+	int sysfs;
+
+	sysfs = igt_sysfs_open(pf);
+	igt_assert_fd(sysfs);
+
+	pci_slot = __igt_sriov_get_vf_pci_slot_alloc(sysfs, vf_num);
+	close(sysfs);
+
+	return pci_slot;
+}
+
 static bool __igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num, bool bind)
 {
 	char *pci_slot;
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 84d29b1bb..a417b30d8 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -28,6 +28,7 @@ void igt_sriov_enable_driver_autoprobe(int pf);
 void igt_sriov_disable_driver_autoprobe(int pf);
 int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
 bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
+char *igt_sriov_get_vf_pci_slot_alloc(int pf, unsigned int vf_num);
 void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
 void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
 int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
-- 
2.43.0

