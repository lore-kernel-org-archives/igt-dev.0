Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD3AC0219C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 07:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6478A10EA36;
	Fri,  7 Feb 2025 07:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGlPQl+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE7410E261
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738912429; x=1770448429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Idw5SCwpckptNDf4GwZwA/s1u9BeEZQ0q33WcFyxGEA=;
 b=fGlPQl+eXQGVtX1u3El+/2ek7DjGYJbECVFjhVGMJYAHEqCk9pBvIit2
 bU3ObSV9tWjakYlQGPfiuZPnUneM4ClVM9kjK3jBpqMrXp/+ripRh+2ij
 GoJRyS4afSGn6lrm68QBrNe93hEvKOfUb05svYQNaGv736YO0+1IHUjYb
 KrGr+cQz5cMj9/AFKGYq+8dRP5JNELAuMh2jvmGCKNdwD9CUQTRWumkMt
 GAUJ6Ms2W2voZOEykjzP18xJLj45FQIzJRqjN/zSU/VxbaF4gsQB8J6Eq
 7AZLTyBX/odOsVIddnN8kDLCCiFPD6nMvbAzMv7uU+742UsKV8dbMXJOf A==;
X-CSE-ConnectionGUID: wIe25P1VQ/mZPIQtLG1aWg==
X-CSE-MsgGUID: PYndy9wFTxq+BV2aX94pxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50530068"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50530068"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 23:13:49 -0800
X-CSE-ConnectionGUID: GTsXFr6nSTau4pRWpDvmXg==
X-CSE-MsgGUID: uh5ILgVrTUGJclBJ9FCaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111374002"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2025 23:13:47 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Date: Fri,  7 Feb 2025 12:59:02 +0530
Message-Id: <20250207072902.12582-5-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use the kernel fault injection infrastructure to test error handling
of xe during driver probe when executing xe_guc_ct_send_recv() /
xe_guc_mmio_send_recv() so that more code paths are tested, such as
error handling and unwinding.

Error can be injected using:
igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 9432828c2..288a5c384 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -231,6 +231,34 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);
 }
 
+/**
+ * SUBTEST: probe-fail-guc-%s
+ * Description: inject an error in the injectable function %arg[1] then reprobe driver
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_guc_mmio_send_recv:	Inject an error when calling xe_guc_mmio_send_recv
+ * @xe_guc_ct_send_recv:	Inject an error when calling xe_guc_ct_send_recv
+ */
+
+static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
+		struct fault_injection_params *fault_params)
+{
+	int iter_start = 0, iter_end = 0, iter = 0;
+
+	igt_assert(fault_params);
+
+	/* Get the iteration count from environment */
+	iter = get_fault_inject_iter();
+	iter_start = iter ? : 0;
+	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
+	for (int i = iter_start; i < iter_end; i++) {
+		fault_params->space = i;
+		setup_injection_fault(fault_params);
+		inject_fault_probe(fd, pci_slot, function_name);
+	}
+}
+
 static int
 simple_vm_create(int fd, unsigned int flags)
 {
@@ -330,6 +358,7 @@ igt_main
 {
 	int fd;
 	char pci_slot[NAME_MAX];
+	struct fault_injection_params fault_params;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -363,6 +392,11 @@ igt_main
 		{ "xe_vma_ops_alloc" },
 		{ }
 	};
+	const struct section guc_fail_functions[] = {
+		{ "xe_guc_mmio_send_recv" },
+		{ "xe_guc_ct_send_recv" },
+		{ }
+	};
 
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
@@ -387,6 +421,13 @@ igt_main
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
 			inject_fault_probe(fd, pci_slot, s->name);
 
+	for (const struct section *s = guc_fail_functions; s->name; s++)
+		igt_subtest_f("probe-fail-guc-%s", s->name) {
+			memcpy(&fault_params, &default_fault_params,
+					sizeof(struct fault_injection_params));
+			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
+		}
+
 	igt_fixture {
 		drm_close_driver(fd);
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
-- 
2.35.3

