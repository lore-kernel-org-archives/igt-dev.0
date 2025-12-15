Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EEAD5B878
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 23:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661BA10E3B6;
	Mon, 15 Dec 2025 23:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9vL8+Y4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB49110E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 23:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765840147; x=1797376147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uhX/Lh2mFXQuAuCEpC9AE8/zMudCVZrP1As7ZDlCvhE=;
 b=T9vL8+Y43W+XCk8sAdcdeER/p7+E/zP+ptNPrQRctVs5H10I12FZbkS/
 GljcpgL0vIbUquPcfQBvu+qC2WSdOnu0bu2LbPeRzi1PUbmIRxHXtIJW4
 fUTVzzdCE54hJJjwhgaJDcaPoUQT3GelP6l8DfgZqQlyD3XJrutzsj2Jc
 F07iNi4hcA+ETFiowYhS6KGad+5CFH3UfQVWb+DPNSP79qMMVZJuv8RWC
 GoIzuckF6ROi5NT4oCzja2aJjqPsTahHQXqk//s/o3cPikCRMy2+nhsO2
 J9DXyGaV49sktWwUUzTjOEsDBEmgjFfhb+VzErYpr4/uRJ6YAE4PZ3qgZ Q==;
X-CSE-ConnectionGUID: xkHyGzCaQAqWvE9v4U2wXA==
X-CSE-MsgGUID: +iCq1DldTCCvmGZA0u6e1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66939537"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="66939537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:07 -0800
X-CSE-ConnectionGUID: huvTJ2OuQzWaBigOWxh0Sg==
X-CSE-MsgGUID: QJnj7WrgRmiL3W/A0Se9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="202259585"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:07 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 ivan.briano@intel.com, nishit.sharma@intel.com
Subject: [PATCH v6 3/4] tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_PROPERTY
 validation tests
Date: Mon, 15 Dec 2025 23:09:09 +0000
Message-ID: <20251215230905.164341-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215230905.164341-6-jonathan.cavitt@intel.com>
References: <20251215230905.164341-6-jonathan.cavitt@intel.com>
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

Add tests to xe_vm that exercise the new DRM_IOCTL_XE_VM_GET_PROPERTY
ioctl.  Specifically, add input validation tests that exercise the
return values for improperly formatted ioctl structures.

v2:
- Make vm creation consistent between patches (jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 81 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ccff8f8046..778d9ac86d 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2450,6 +2450,71 @@ static void test_oom(int fd)
 	}
 }
 
+/**
+ * SUBTEST: vm-get-property-invalid-reserved
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid reserved returns expected error code
+ *
+ * SUBTEST: vm-get-property-invalid-vm-id
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid vm_id returns expected error code
+ *
+ * SUBTEST: vm-get-property-invalid-size
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid size return expected error code
+ *
+ * SUBTEST: vm-get-property-invalid-property
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid property returns expected error code
+ */
+static void get_property_invalid_reserved(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_property query = {
+		.reserved[0] = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
+}
+
+static void get_property_invalid_vm_id(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_property query = {
+		.vm_id = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, ENOENT);
+}
+
+static void get_property_invalid_size(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_property query = {
+		.vm_id = vm,
+		.property = DRM_XE_VM_GET_PROPERTY_FAULTS,
+		.size = -1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
+}
+
+static void get_property_invalid_property(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_property query = {
+		.vm_id = vm,
+		.property = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
+}
+
+static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
+{
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, 0, 0);
+	func(fd, vm);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2562,6 +2627,17 @@ int igt_main()
                 { }
         };
 
+	const struct vm_get_property {
+		const char *name;
+		void (*test)(int fd, uint32_t vm);
+	} xe_vm_get_property_tests[] = {
+		{ "invalid-reserved", get_property_invalid_reserved },
+		{ "invalid-vm-id", get_property_invalid_vm_id },
+		{ "invalid-size", get_property_invalid_size },
+		{ "invalid-property", get_property_invalid_property },
+		{ }
+	};
+
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 
@@ -2850,6 +2926,11 @@ int igt_main()
 		test_oom(fd);
 	}
 
+	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
+		igt_subtest_f("vm-get-property-%s", f->name)
+			test_get_property(fd, f->test);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

