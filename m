Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1C710ED67E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 14:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F7E10EDA3;
	Fri, 27 Mar 2026 14:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIL2uImL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1D910E050
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774620416; x=1806156416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YVdlPmyE6nFS+vH3kxiGkvTcMaVcbENOr5UHkP//ak0=;
 b=dIL2uImLlbwwe+HU0sSB6ODLigQ+d77WNBJcWIMKGMBNd88rsXwR6iYN
 5B0yn2MA9sAjPQ6OFIa95x/SUb3G1mKPtYFI5UYR4a/eT0tLJGmIfiaUS
 LxbcyebPJib/eOUIHGGRgdyhTQJmCEyDJqEzULlk1tyGypJnMRDv1f1Ky
 zaLw7YToOc7n+qhUVi9lBI6AKTO1SYM7tDGoIZxuypB06Hp+MDN0rwRAk
 s25ErK8tsNqu3RG/aBVOoiS5crC40V20FV8lWuI5ZZeHi4Fqq+Y0nm1XE
 9AkwdqTqHp67+eatQRaJLs1Ul/WULEnVmMEb9wt7Lv4Oeklw1jdi5aQ6R Q==;
X-CSE-ConnectionGUID: fSFmnMQ5TN+ZstHBonnI7A==
X-CSE-MsgGUID: fBQs4+rxSuCZLdAitL9E7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98309538"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="98309538"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:06:56 -0700
X-CSE-ConnectionGUID: g6haNbfnQYibt2P7kziY9A==
X-CSE-MsgGUID: LrVqNxhiQZC0/hCENLktSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="263267968"
Received: from lvasutx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.16.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:06:55 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 4/4] tests/intel/xe_sriov_vfio: Add region-info
 subtest
Date: Fri, 27 Mar 2026 15:06:27 +0100
Message-ID: <20260327140627.64574-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
References: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
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

Bind a VF to xe-vfio-pci, open the VFIO device, and query VFIO region
information. This provides basic coverage for VFIO BAR exposure and
device region enumeration.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2:
- Introduce vf_num variable for clarity (Lukasz)
- Remove unnecessary unbind (Lukasz)
---
 tests/intel/xe_sriov_vfio.c | 85 +++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
index 6a86b3780..f42deaea6 100644
--- a/tests/intel/xe_sriov_vfio.c
+++ b/tests/intel/xe_sriov_vfio.c
@@ -28,6 +28,9 @@
  *
  * SUBTEST: open-basic
  * Description: Bind VF to xe-vfio-pci and perform minimal VFIO group open and status ioctl.
+ *
+ * SUBTEST: region-info
+ * Description: Bind VF to xe-vfio-pci, open VFIO device and query VFIO region info (BAR sizes).
  */
 
 IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
@@ -218,6 +221,58 @@ static void vfio_open_basic(const char *pci_slot)
 	vfio_close_device(&fds);
 }
 
+static void vfio_open_device(const char *pci_slot, struct vfio_dev_fds *out)
+{
+	struct vfio_group_status group_status;
+	int ret;
+
+	vfio_open_group(pci_slot, out, &group_status);
+
+	igt_require_f(group_status.flags & VFIO_GROUP_FLAGS_VIABLE,
+		      "VFIO group %s is not viable (flags=0x%x)\n",
+		      out->group_id, group_status.flags);
+
+	ret = ioctl(out->group_fd, VFIO_GROUP_SET_CONTAINER, &out->container_fd);
+	igt_require_f(ret == 0, "VFIO_GROUP_SET_CONTAINER failed (%d)\n", -errno);
+
+	ret = ioctl(out->container_fd, VFIO_SET_IOMMU, VFIO_TYPE1_IOMMU);
+	igt_require_f(ret == 0, "VFIO_SET_IOMMU(VFIO_TYPE1_IOMMU) failed (%d)\n", -errno);
+
+	out->device_fd = ioctl(out->group_fd, VFIO_GROUP_GET_DEVICE_FD, (char *)pci_slot);
+	igt_assert_f(out->device_fd >= 0, "VFIO_GROUP_GET_DEVICE_FD(%s) failed (%d)\n",
+		     pci_slot, -errno);
+}
+
+static void vfio_dump_region_info(int device_fd)
+{
+	struct vfio_device_info dinfo = { .argsz = sizeof(dinfo) };
+	int ret;
+
+	ret = ioctl(device_fd, VFIO_DEVICE_GET_INFO, &dinfo);
+	igt_assert_f(ret == 0, "VFIO_DEVICE_GET_INFO failed (%d)\n", -errno);
+
+	igt_info("VFIO device: flags=0x%x num_regions=%u num_irqs=%u\n",
+		 dinfo.flags, dinfo.num_regions, dinfo.num_irqs);
+
+	for (uint32_t i = 0; i < dinfo.num_regions; i++) {
+		struct vfio_region_info rinfo = {
+			.argsz = sizeof(rinfo),
+			.index = i,
+		};
+
+		ret = ioctl(device_fd, VFIO_DEVICE_GET_REGION_INFO, &rinfo);
+		igt_assert_f(ret == 0, "VFIO_DEVICE_GET_REGION_INFO(index=%u) failed (%d)\n",
+			     i, -errno);
+
+		igt_info("region[%u]: size=%llu offset=%llu flags=0x%x caps=%u\n",
+			 i,
+			 (unsigned long long)rinfo.size,
+			 (unsigned long long)rinfo.offset,
+			 rinfo.flags,
+			 rinfo.cap_offset);
+	}
+}
+
 static void open_pf(void)
 {
 	int fd;
@@ -343,6 +398,36 @@ int igt_main()
 		igt_sriov_disable_vfs(pf_fd);
 	}
 
+	igt_describe("Bind VF to xe-vfio-pci and query VFIO region info (BAR sizes). ");
+	igt_subtest("region-info") {
+		unsigned int vf_num = 1;
+		struct vfio_dev_fds fds;
+		char *slot = NULL;
+
+		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
+			      "Failed to load %s\n", XE_VFIO_PCI_MOD);
+
+		open_pf();
+
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, vf_num);
+
+		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+
+		slot = vf_pci_slot_alloc(vf_num);
+
+		vf_bind_override(vf_num, XE_VFIO_PCI_DRV);
+
+		vfio_open_device(slot, &fds);
+		vfio_dump_region_info(fds.device_fd);
+		vfio_close_device(&fds);
+
+		vf_unbind_override(vf_num);
+		free(slot);
+		igt_sriov_disable_vfs(pf_fd);
+	}
+
 	igt_fixture() {
 		cleanup_pf();
 		restore_xe_vfio_module();
-- 
2.43.0

