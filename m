Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC14D1075262
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 06:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB5F10E860;
	Thu, 19 Mar 2026 06:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FglKolb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504F510E0E6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773901268; x=1805437268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aN4OhGutHeP2lOHGJfxQi9OUoGEKNoYPHHg6twCWHns=;
 b=FglKolb0VJ7lLYimhBMdKBQHYUg6jV+kRoHyui/A0kk8/hOP89KQajzR
 HCHl8lH7S+lnAsgP1XaEfpB/2KyydLUqEpUgSsLofvbNi1PAk9UO4ZELS
 Gig19wP98gTZ0BM3olwlWyiHpxKsjFLTaoj46dvztNdYhhvUeIKsAXhV+
 uLM6TfvdFU5y0obxY40fhnMCoAgK6meZmc+b1CUc8cV3pSRM+gtjpNvEG
 3uwlPvF2FawjMtrUHdz0TE9k9UQlorr+xfttnzfyhE2+GXYdg8QiQv6zs
 ukcPfaNN5NH5sOU0ratkjFMtmHFbWr4oQNWhpFpzwS9Kromktm/np2Omm Q==;
X-CSE-ConnectionGUID: njNfLareQSy4oAbqlimdJw==
X-CSE-MsgGUID: B8OzyxCzT7WHVDrwnSnp2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74941917"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="74941917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:21:07 -0700
X-CSE-ConnectionGUID: 8VGQGcFlTM+9NABzbpG2pA==
X-CSE-MsgGUID: IJstrbA4TMyB44tPA8YxBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="247217634"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 23:21:05 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pat: Add negetive test to validate pat
 index
Date: Thu, 19 Mar 2026 11:51:04 +0530
Message-Id: <20260319062104.1582999-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Adding negetive test to validate pat index restrictions, extending tests in
userptr_coh_none and prime_export for index 18 and adding new svm test
to validate for diff indexes , index 19 will pass in all cases , 18
will fail with EINVAL

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_pat.c | 74 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index e91b037a5..306796307 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -34,6 +34,11 @@
 #define XE_COH_NONE          1
 #define XE_COH_AT_LEAST_1WAY 2
 
+/*
+ * PAT index 18: XA (eXclusive Access) + UC (Uncached).
+ */
+#define XE_PAT_IDX_XA_UC     18
+
 static bool do_slow_check;
 static char bus_addr[NAME_MAX];
 static struct pci_device *pci_dev;
@@ -82,6 +87,10 @@ static void userptr_coh_none(int fd)
 				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
 				   intel_get_pat_idx_wt(fd), 0),
 		      -EINVAL);
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
+				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
+				   XE_PAT_IDX_XA_UC, 0),
+		      -EINVAL);
 
 	munmap(data, size);
 	xe_vm_destroy(fd, vm);
@@ -755,6 +764,61 @@ static void pat_index_dw(struct xe_pat_param *p)
 	xe_vm_destroy(fd, vm);
 }
 
+static bool is_l2_flush_optimized(int fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(fd);
+
+	return intel_graphics_ver(dev_id) >= IP_VER(35, 0) && !xe_has_vram(fd);
+}
+
+/**
+ * SUBTEST: l2-flush-opt-svm-pat-restrict
+ * Test category: negative test
+ * Description: Validate that on L2 flush optimized platforms, SVM
+ *		(CPU_ADDR_MIRROR) mappings only accept pat_index 19
+ *		(XA+2WAY) and reject all other pat indices with -EINVAL.
+ */
+static void l2_flush_opt_svm_pat_restrict(int fd)
+{
+	struct drm_xe_query_config *config = xe_config(fd);
+	uint32_t vm;
+	void *buffer;
+	size_t alloc_size = xe_get_default_alignment(fd);
+	struct xe_device *xe_dev = xe_device_get(fd);
+	uint64_t svm_size;
+	size_t size = xe_get_default_alignment(fd);
+
+	svm_size = 1ull << xe_dev->va_bits;
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	xe_vm_bind_lr_sync(fd, vm, 0, 0, 0, svm_size,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+	buffer = aligned_alloc(alloc_size, SZ_2M);
+
+	igt_require(config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		    DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR);
+
+	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
+					0, DRM_XE_MEM_RANGE_ATTR_PAT,
+					intel_get_pat_idx_wb(fd), 0, 0), 0);
+
+	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
+					0, DRM_XE_MEM_RANGE_ATTR_PAT,
+					intel_get_pat_idx_uc(fd), 0, 0), -EINVAL);
+
+	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
+					0, DRM_XE_MEM_RANGE_ATTR_PAT,
+					intel_get_pat_idx_wt(fd), 0, 0), -EINVAL);
+
+	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
+					0, DRM_XE_MEM_RANGE_ATTR_PAT,
+					XE_PAT_IDX_XA_UC, 0, 0), -EINVAL);
+
+	free(buffer);
+	xe_vm_unbind_lr_sync(fd, vm, 0, 0, svm_size);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: prime-self-import-coh
  * Test category: functionality test
@@ -890,6 +954,11 @@ static void prime_external_import_coh(void)
 		      0);
 	xe_vm_unbind_sync(fd2, vm, 0, 0x40000, size);
 
+	igt_assert_eq(__xe_vm_bind(fd2, vm, 0, handle_import, 0, 0x40000,
+				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+				   XE_PAT_IDX_XA_UC, 0),
+		      -EINVAL);
+
 	xe_vm_destroy(fd2, vm);
 
 	/*
@@ -1771,6 +1840,11 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest("l2-flush-opt-svm-pat-restrict") {
+		igt_require(is_l2_flush_optimized(fd));
+		l2_flush_opt_svm_pat_restrict(fd);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.34.1

