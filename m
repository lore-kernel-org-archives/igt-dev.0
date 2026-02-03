Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC00E8783F
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 15:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADF910E28A;
	Tue,  3 Feb 2026 15:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXxe7l55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A278510E6BF
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770132863; x=1801668863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tonCq927lZRnGYB3Fr+OUEZGXXDPR8LEL0A77bh04cA=;
 b=mXxe7l551CJjr3Py2bs1olvvXsoM1sR41n1oQ0/2X+OIxUkI2KEsTfY9
 60r5MyiM8EyMBbdtuL8Z90rYFKuooGRRsAqSvANC3bGpQ0QnkOCqZh5h2
 +u4vqhLkom02sZAOxCqaUOlIP34GHcQd8AF8MelVEpM9bKWYuajI1InDJ
 r0ZPX3z+Rdyu5nUOl84yDyfegfiEm4jfNJnOdIHgp36xuqI4HAaIG4rRi
 1VaT5ewlrlmwqYN8fSuUsR41Vzzwtc2p2a5rBiN1RrutNQ1Z52Ntg+eXN
 k8vLWHxjnUpY5X+B3UHHzA2HCtyT+/22zQtxKVy5QgczkCvxdC/Ggr/xJ Q==;
X-CSE-ConnectionGUID: YdI/x75TQ7CZ13G4+ifshg==
X-CSE-MsgGUID: 9RAxafOrSa2wSiaK+dCo1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71204286"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71204286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 07:34:23 -0800
X-CSE-ConnectionGUID: /2Um8bg9Rd+f1MXB2SLVQg==
X-CSE-MsgGUID: StRXfOaCS+WAHQeeGRijaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247479413"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 07:34:22 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.winiarski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/4] lib/igt_sriov_device: Add helper to get VF PCI
 slot address
Date: Tue,  3 Feb 2026 16:33:42 +0100
Message-ID: <20260203153349.128551-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153349.128551-1-marcin.bernatowicz@linux.intel.com>
References: <20260203153349.128551-1-marcin.bernatowicz@linux.intel.com>
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

