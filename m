Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F871C54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 05:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8E810E08C;
	Fri, 15 Mar 2024 05:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRQEVWwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3997C10E08C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 05:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710479187; x=1742015187;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1PNVYa3ui3BjL7wv+HF7b02t2v134U5q3G/usAuFx54=;
 b=SRQEVWwIKFilkg3baRkXNpDUpckD4HP1QNQLVm0oop9mpl1Am4PCLUD/
 dVU8iZwLlL9R1H0djMQz2fWm3/wjZGKvV7cTGiLPx18ucnKiEE0mlynup
 zXy1SEfZ87i1QowmiKJ7jIh8Z1Rx7EC7AuDOR7WDWDiNzriKvDxiknyiH
 tE6e/iMXLIKi2udkxajMIsYje8qmGO1ALn/Hqqh+s9KCeXTv2nwaE/D4P
 6EbO53aZtbc0+WqGYVs/abLTCxShJgwUlEGN7TqAcbi8KlNszkI5V/2ve
 9VSlhmaOlZ7vtdGA5bxevErGXg/ge44QlYAWsMnVCir95ZnRZmOxY/eyp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16788382"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="16788382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 22:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12582872"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa009.jf.intel.com with ESMTP; 14 Mar 2024 22:06:26 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pm: Test to validate vm unbind all
 flag with suspend and resume
Date: Fri, 15 Mar 2024 10:35:36 +0530
Message-Id: <20240315050536.21319-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
References: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test to validate vm unbind all operation with suspend and resume.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index ac402e757..f46120662 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -605,6 +605,40 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	close(fw_handle);
 }
 
+/**
+ * SUBTEST: unbind-all
+ * Description: Validate vm unbind functionality with suspend and resume
+ *
+ * Functionality: pm - s3
+ * Run type: FULL
+ */
+static void unbind_all(device_t device, int n_vmas)
+{
+	uint32_t bo, bo_size = xe_get_default_alignment(device.fd_xe);
+	uint64_t addr = 0x1a0000;
+	uint32_t vm;
+	int i;
+
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+
+	vm = xe_vm_create(device.fd_xe, 0, 0);
+	bo = xe_bo_create(device.fd_xe, vm, bo_size, vram_if_possible(device.fd_xe, 0), 0);
+
+	for (i = 0; i < n_vmas; ++i)
+		xe_vm_bind_async(device.fd_xe, vm, 0, bo, 0, addr + i * bo_size, bo_size, NULL, 0);
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	sync[0].handle = syncobj_create(device.fd_xe, 0);
+	xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
+
+	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(device.fd_xe, sync[0].handle);
+
+	gem_close(device.fd_xe, bo);
+	xe_vm_destroy(device.fd_xe, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -768,6 +802,9 @@ igt_main
 		}
 	}
 
+	igt_subtest("unbind-all")
+		unbind_all(device, 2);
+
 	igt_fixture {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
-- 
2.39.1

