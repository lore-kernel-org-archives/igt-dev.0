Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BE3D44C42
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 13:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C2B10E752;
	Thu, 15 Jan 2026 13:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMAyL4Kv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D506110E752
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768483108; x=1800019108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9w8imK4CPO0cLxul7soEV2FZpb/Au0Q4q20XubLjB/4=;
 b=IMAyL4KvLMg36zcX1zG92+qW+akVrHmZwV0Af7K9M0mJEUEbYdo/aK7B
 wqZ3ZLyZsAPSD7r6kPCkywHplIp5iI1htSu4ejtc0EsyllwQhShRJEqcn
 LS5XcFjmRVGRqRaYb7LMvIL1cp/o7jJ9ZclpZcj1htvl7vO9Sy9yhNS59
 oI7YaMkBPlOLwV50p7XBGVjRl8cZ1q9t55ehmTZSuvCs8IDV3etma29SS
 h4pl3GyUE/+EhfnN6Qnlzht+mdhUAMwMJYfJ3RrT9z/aI+tB4WCxUadj/
 Q0odAPkfKPcLfqINkhzznzf3J9xP4vDMgiy7ip1MbRi2lGNsO2dmDJ2Hk g==;
X-CSE-ConnectionGUID: MNEUXyOmQn+vrNebr01rCw==
X-CSE-MsgGUID: 5lbvyR2VTGyA+83yW2ydUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="95264242"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="95264242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:27 -0800
X-CSE-ConnectionGUID: 91T623b0Tc6ahY0ahIcHEg==
X-CSE-MsgGUID: y569mwV2QUKiyDjtntBZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204572842"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.143])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:25 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.winiarski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_sriov_device: Add helper to get VF PCI slot
 address
Date: Thu, 15 Jan 2026 14:18:06 +0100
Message-ID: <20260115131812.256678-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
References: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
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
---
 lib/igt_sriov_device.c | 25 +++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index ffa996d6b..712d3b8ad 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -335,6 +335,31 @@ static char *__igt_sriov_get_vf_pci_slot_alloc(int pf_sysfs, unsigned int vf_num
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
index 930e97982..38bfd7560 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -34,6 +34,7 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 bool intel_is_vf_device(int device);
+char *igt_sriov_get_vf_pci_slot_alloc(int pf, unsigned int vf_num);
 
 /**
  * __is_valid_range - Helper to check VF range is valid
-- 
2.43.0

