Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E42D58CD1
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 05:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8884510E097;
	Mon, 23 Mar 2026 05:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKN0c8k9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082C410E3C8
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 05:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774243296; x=1805779296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XyxHXAyJm5RSw2i411OQBvkcRsjUl3GxY55fCmhpFok=;
 b=JKN0c8k9QzBxpfmrQiI7vdkliMN0Y08Z7up5JpQlAvf4U8Tu5cO7vzVk
 lMupH3KMueG+2uGfYofIHbqhiQKy19VMo18OvjM0nHa73jdUojQhTOz3h
 PNn2pILUAmS1laKGxA90T54bow9zrw/LPqZBN5KfzXlizJnj+ILkYottA
 enJvpGrglIqJbbDTPMn13XaizYDDxrj3WSbWbfDwfqyNqVnJHdxuiaUdz
 uy+bXgcqziinaGWU4UC7TSyclcXBexPlsx8ivWjyy64t26w6cDEwbPi21
 xw5VQcimipAIUJVa3TcM442IyR7ojLsOnKvgTFQ+WHSw6q7dQ+Hg7dYvU g==;
X-CSE-ConnectionGUID: HBhQKN36Qli2Nr79dDmuvw==
X-CSE-MsgGUID: cQ6+PHBgQ920AGJUFkthbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75304094"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75304094"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 22:21:34 -0700
X-CSE-ConnectionGUID: kssSUZdaSC+Sdjz4P3uYXw==
X-CSE-MsgGUID: x4ihQehERUW3VzS5PgUZ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="220670724"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by fmviesa007.fm.intel.com with ESMTP; 22 Mar 2026 22:21:32 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pat: Add negative subtest for PAT index
Date: Mon, 23 Mar 2026 10:51:30 +0530
Message-Id: <20260323052130.1627555-2-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323052130.1627555-1-nakshtra.goyal@intel.com>
References: <20260323052130.1627555-1-nakshtra.goyal@intel.com>
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

Adding negative test to validate pat index restrictions, extending tests in
userptr_coh_none and prime_export for  (XA + UC) and adding new svm test
to validate for diff indexes ,  (XA + UC + 1WAY) will pass in all cases ,
(XA + UC) will fail with EINVAL

v2: Adding validation checks directly inside subtest call instead
    of different functions   (Priyanka)

v3 : Correcting subject as per requirement and addressing nits (kamil)

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_pat.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index e91b037a5..a550c7e6a 100644
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
@@ -755,6 +764,54 @@ static void pat_index_dw(struct xe_pat_param *p)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: l2-flush-opt-svm-pat-restrict
+ * Test category: negative test
+ * Description: Validate that on L2 flush optimized platforms, SVM
+ *		(CPU_ADDR_MIRROR) mappings only accept pat_index 19
+ *		(XA+UC+1WAY) and reject all other pat indices with -EINVAL.
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
@@ -890,6 +947,11 @@ static void prime_external_import_coh(void)
 		      0);
 	xe_vm_unbind_sync(fd2, vm, 0, 0x40000, size);
 
+	igt_assert_eq(__xe_vm_bind(fd2, vm, 0, handle_import, 0, 0x40000,
+				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+				   XE_PAT_IDX_XA_UC, 0),
+		      -EINVAL);
+
 	xe_vm_destroy(fd2, vm);
 
 	/*
@@ -1771,6 +1833,11 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest("l2-flush-opt-svm-pat-restrict") {
+		igt_require(intel_graphics_ver(dev_id) == IP_VER(35, 10));
+		l2_flush_opt_svm_pat_restrict(fd);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.34.1

