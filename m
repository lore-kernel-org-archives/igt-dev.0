Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734B110775E1
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 16:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D37010E177;
	Wed, 18 Mar 2026 16:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDILuLGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373110E378
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773850516; x=1805386516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPAWXVpjOJiXXcaRtJnvnLV9EjgrW2uoIYlqs9yu8vU=;
 b=gDILuLGNQOE5bsHkZHOq+JdwzsgBY0a3kl+kG4GgIqtT/WFIxz3JYV/0
 XS/z4rfKbDyGoRVZuyoNlUaiOoE6Iv31fnjYFcVhx9VW60qQh0SzJuIeP
 pVbDsf+QxqiEzWnaX+Jjszpu0ujM0JWbmBL5PLqPo9Wg1pjMIa9dJMeWJ
 mUWu/nd4z0rBcx8cFq+xS9ebtzGWdSI9WZAqkfU37FnQTj/dYr1QU7B6/
 KwxPUY4gCIBd2G92k19W2rYhUwCnRjoR8WD6dUr+ZPFUsj7RLAIqm36AJ
 Gb8cQ2Uy5NXdE3JWJN656np6NPUz4v2MRf8JiQdA7+JeQ99DQtrE4XqN1 A==;
X-CSE-ConnectionGUID: f8zfP1kKRQWv4XbBeC2pwg==
X-CSE-MsgGUID: qJRtAdbySJeyF2P18Z90lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74798261"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74798261"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:15:16 -0700
X-CSE-ConnectionGUID: 7dB2l3hKQZeRwc43fsdwrw==
X-CSE-MsgGUID: TlcTu6L+Q/yGDR/91RyLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218228892"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.135])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:15:14 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_sriov_vfio: Add region-info subtest
Date: Wed, 18 Mar 2026 17:14:47 +0100
Message-ID: <20260318161447.961840-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
References: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
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
 tests/intel/xe_sriov_vfio.c | 86 +++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
index 6a5cc536b..deb46cc48 100644
--- a/tests/intel/xe_sriov_vfio.c
+++ b/tests/intel/xe_sriov_vfio.c
@@ -34,6 +34,9 @@
  *
  * SUBTEST: open-basic
  * Description: Bind VF to xe-vfio-pci and perform minimal VFIO group open and status ioctl.
+ *
+ * SUBTEST: region-info
+ * Description: Bind VF to xe-vfio-pci, open VFIO device and query VFIO region info (BAR sizes).
  */
 
 IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
@@ -307,6 +310,58 @@ static void vfio_open_basic(const char *pci_slot)
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
 int igt_main()
 {
 	igt_fixture() {
@@ -386,6 +441,37 @@ int igt_main()
 		igt_sriov_disable_vfs(pf_fd);
 	}
 
+	igt_describe("Bind VF to xe-vfio-pci and query VFIO region info (BAR sizes). ");
+	igt_subtest("region-info") {
+		char *slot = NULL;
+		struct vfio_dev_fds fds;
+
+		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
+			      "Failed to load %s\n", XE_VFIO_PCI_MOD);
+		restore_xe_vfio_on_exit = true;
+
+		open_pf();
+
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, 1);
+
+		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+
+		slot = vf_pci_slot_alloc(1);
+
+		vf_unbind_override(1);
+		vf_bind_override(1, XE_VFIO_PCI_DRV);
+
+		vfio_open_device(slot, &fds);
+		vfio_dump_region_info(fds.device_fd);
+		vfio_close_device(&fds);
+
+		vf_unbind_override(1);
+		free(slot);
+		igt_sriov_disable_vfs(pf_fd);
+	}
+
 	igt_fixture() {
 		cleanup_pf();
 		restore_xe_vfio_module();
-- 
2.43.0

