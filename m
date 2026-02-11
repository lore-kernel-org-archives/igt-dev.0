Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB3AE9E2E4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 11:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8166010E3A4;
	Wed, 11 Feb 2026 11:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpacH/Ch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E3E10E3A4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 11:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770808757; x=1802344757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k1h1VSOkWN7mq7cxmIO6xDbFr9bro0/XxHzKIkQKyHo=;
 b=HpacH/Chc9AwZnpCCvV6PULiBllJYHJHhzFrurGlr899z9HIG5/nH6iq
 ftXRPRd7Wr8UmnDjigTC5yZaVEimo4I5+zTuxlRBke9KQeUEqBeNwdrFP
 ZwxtD7T5Bww/ag1vNS8QNAyZzxy396fFUX5GIonzzfz8Y8ErgDEIcx+8b
 Idwkmc39nrpaC3055N9zh98RI2Ajc5m19f13qmvZTXeISMpYXlNPfWbR/
 /GsaCHZmdwvBzL6P9aMnT+eS6Pis9YUJMq5+KSwvkosbgsYV1XtDy5UBC
 MQ8kYBhY3Wd9RUIrgGNVSBFwkx5VOdvrVd9D6jkHVPafQhdsdPOFg3Hz1 A==;
X-CSE-ConnectionGUID: awxCezplR7+6aqSzLcAgrw==
X-CSE-MsgGUID: xk39W9o/RAW6CyzVpCZUDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82275676"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82275676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:19:17 -0800
X-CSE-ConnectionGUID: 6DPVDY7eQLS0/owmVX3njw==
X-CSE-MsgGUID: I4diqsi+R/Ct7s36YvQfnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212053481"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.85])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:19:15 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v4 i-g-t 1/6] lib/igt_sriov_device: Add helper to get VF PCI
 slot address
Date: Wed, 11 Feb 2026 12:18:25 +0100
Message-ID: <20260211111834.1140287-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211111834.1140287-1-marcin.bernatowicz@linux.intel.com>
References: <20260211111834.1140287-1-marcin.bernatowicz@linux.intel.com>
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
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
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

