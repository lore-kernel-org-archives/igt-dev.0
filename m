Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D628CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 16:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C869910E21E;
	Tue, 23 Sep 2025 16:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGSbpeXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CC910E323
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758646173; x=1790182173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:reply-to:mime-version: content-transfer-encoding;
 bh=unCaIQoybZEiBI3v71ZzgqoerhMkQtmzGjjDbTTEY9Q=;
 b=BGSbpeXp1zpx6xssfvTISLMj2up8KHE8sqvXdK8+NotcB2gk3GKouW/O
 aY80Kcmb5r0dv3tEKuwcIx51GW00bF2BehGWTV3eie5AzqHeBjjxR0sNk
 V0SHOMNfVvEwn7Zeg/vyeBVCqZWTJU2E2xLD+nlWpd2hyAn/7jnFcKyd2
 Z3JVpSN5ZCtbRwUrGkACXrgfcPtvlEIMPBcmNkaRCZAH3GnFYA8gE9Elh
 4RtqLgttToXWwm/5NypWcHN0xcqEVExtWm7rDhc4REa0XnbjAXD+UvisV
 9mg8nK/42k77HOrG9DGQeeE4W0wbKxiG0bJgvolYYgD9J1vK1ZldS7mq+ g==;
X-CSE-ConnectionGUID: 8+IQUxobQV+oe8sVLMB9rw==
X-CSE-MsgGUID: iQ2haczQTQSxqQSfMnbIog==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60149115"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="60149115"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 09:49:32 -0700
X-CSE-ConnectionGUID: 9gtlCiZAT9mj+IcT/Lf4xg==
X-CSE-MsgGUID: NKiecCAUTGKvBfHIUxFZRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="200510940"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 09:49:32 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [i-g-t, 2/2] tests/intel/xe_fault_injection: Add test for
 xe_pxp_exec_queue_add
Date: Tue, 23 Sep 2025 09:48:59 -0700
Message-ID: <20250819005622.2970399-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923164912.763020-2-julia.filipchuk@intel.com>
References: <20250923164912.763020-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Patchwork-Id: 669222
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
Reply-To: 20250819005622.2970399-3-daniele.ceraolospurio@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <20250923164859.9xpwnUcoU1bECPfCE0b9OLlO4elBQ8LDazcotKFqFsI@z>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

This test will make sure that the error path in the exec_queue creation
code works correctly if there is a PXP error.

Since this is the first queue creation case that requires an extension,
the code has been updated to add support for that

This patch requires the matching kernel code [1] to be merged first.

[1] https://patchwork.freedesktop.org/series/153095/
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/intel/xe_fault_injection.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 00d045cd8..778148766 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -339,25 +339,43 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
  * @xe_hw_engine_group_add_exec_queue:    xe_hw_engine_group_add_exec_queue
  * @xe_vm_add_compute_exec_queue:         xe_vm_add_compute_exec_queue
  * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
+ * @xe_pxp_exec_queue_add:                xe_pxp_exec_queue_add
  */
+
+#define EXEC_QUEUE_LR	BIT(0)
+#define EXEC_QUEUE_PXP	BIT(1)
 static void
 exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
 		       const char pci_slot[], const char function_name[],
 		       unsigned int flags)
 {
 	uint32_t exec_queue_id;
-	uint32_t vm = xe_vm_create(fd, flags, 0);
+	struct drm_xe_ext_set_property ext = { 0 };
+	uint64_t ext_ptr = 0;
+	uint32_t vm;
+
+	if (flags & EXEC_QUEUE_PXP) {
+		igt_require(xe_wait_for_pxp_init(fd) == 0);
+
+		ext.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		ext.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
+		ext.value = DRM_XE_PXP_TYPE_HWDRM;
+		ext_ptr = to_user_pointer(&ext);
+	}
+
+	vm = xe_vm_create(fd, flags & EXEC_QUEUE_LR ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
+
 	/* sanity check */
-	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id), 0);
 	xe_exec_queue_destroy(fd, exec_queue_id);
 
 	ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
-	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
+	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id) != 0);
 	injection_list_remove(function_name);
 
-	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id), 0);
 	xe_exec_queue_destroy(fd, exec_queue_id);
 }
 
@@ -585,7 +603,8 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	const struct section exec_queue_create_fail_functions[] = {
 		{ "xe_exec_queue_create", 0 },
 		{ "xe_hw_engine_group_add_exec_queue", 0 },
-		{ "xe_vm_add_compute_exec_queue", DRM_XE_VM_CREATE_FLAG_LR_MODE },
+		{ "xe_vm_add_compute_exec_queue", EXEC_QUEUE_LR },
+		{ "xe_pxp_exec_queue_add", EXEC_QUEUE_PXP },
 		{ }
 	};
 
