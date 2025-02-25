Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D21C021B8
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 07:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7814B10E173;
	Tue, 25 Feb 2025 07:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lt0nYB1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B47110E173
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740468273; x=1772004273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V2f7CcljzB5svabBOh/vGl84b7u4mhMtnk139TKAjf4=;
 b=Lt0nYB1iwS0FU73hDRJiYdvQuTHXSHRsz0lG3IW8IG5rz2+/nMDqnmdF
 e8LFGZsFCFJAjmXTwZIMPrPy8Yw1YQ4cf2rKrcwOxq+LnU/NlQ7piCl1n
 4u4b7WVLI2y2EBwuGETcAjPiko+35o+SZ4d12nzkQCpxkqcPYSrSyk8Mv
 chT5K8zJo9dqYna5EG4Ls2czDuGff4GxQHnCSahxJPqrBzcHmazHyygh7
 Laoko0xrCt1DR9khcRkqOoqLyoL/oiChMzXkTKKU0sRjiF37cx6TL9vEg
 xcreEHRzt5raGUyU7mkTbYCM4fBlQ7ItZwVuMpvN9z0SxGJgNFUZW8D63 Q==;
X-CSE-ConnectionGUID: 8taR7SUrSlO1/+yGRj/l7w==
X-CSE-MsgGUID: VZAUr/KrSZKJftjw02RR7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52257950"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="52257950"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 23:24:32 -0800
X-CSE-ConnectionGUID: iBtFSVOnTeeCUHr/Aeo4SQ==
X-CSE-MsgGUID: gRf4iJnRTPWMmNFs4RjFNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116792975"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by orviesa007.jf.intel.com with ESMTP; 24 Feb 2025 23:24:31 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	francois.dugast@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during exec
 queue create IOCTL
Date: Tue, 25 Feb 2025 13:04:04 +0530
Message-Id: <20250225073404.252344-1-pravalika.gurram@intel.com>
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

Use the fault injection infrastructure to make targeted internal KMD
functions fail when executing xe_exec_queue_create_ioctl()
so that more code paths are tested, such as error handling and unwinding.
include xe_exec_queue_create_bind only for VM_BIND engine class.
xe_exec_queue_destroy_ioctl() and
xe_exec_queue_get_property_ioctl() are not considered as there is
no unwinding code to test with fault injection.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_fault_injection.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 7ae941367..f25ad9b27 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -185,6 +185,37 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
 }
 
+/**
+ * SUBTEST: exec-queue-create-fail-%s
+ * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_exec_queue_create:                 xe_exec_queue_create
+ * @xe_hw_engine_group_add_exec_queue:    xe_hw_engine_group_add_exec_queue
+ * @xe_vm_add_compute_exec_queue:         xe_vm_add_compute_exec_queue
+ * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
+ */
+static void
+exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
+		const char function_name[], unsigned int flags)
+{
+	uint32_t exec_queue_id;
+	uint32_t vm = xe_vm_create(fd, flags, 0);
+	/* sanity check */
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
+	xe_exec_queue_destroy(fd, exec_queue_id);
+
+	ignore_faults_in_dmesg(function_name);
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
+	xe_exec_queue_destroy(fd, exec_queue_id);
+}
+
 static int
 simple_vm_create(int fd, unsigned int flags)
 {
@@ -283,6 +314,7 @@ vm_bind_fail(int fd, const char function_name[])
 igt_main
 {
 	int fd;
+	struct drm_xe_engine_class_instance *hwe;
 	char pci_slot[NAME_MAX];
 	const struct section {
 		const char *name;
@@ -318,6 +350,14 @@ igt_main
 		{ }
 	};
 
+	const struct section exec_queue_create_fail_functions[] = {
+		{ "xe_exec_queue_create", 0 },
+		{ "xe_hw_engine_group_add_exec_queue", 0 },
+		{ "xe_vm_add_compute_exec_queue", DRM_XE_VM_CREATE_FLAG_LR_MODE },
+		{ "xe_exec_queue_create_bind", 0 },
+		{ }
+	};
+
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -333,6 +373,16 @@ igt_main
 		igt_subtest_f("vm-bind-fail-%s", s->name)
 			vm_bind_fail(fd, s->name);
 
+	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
+		igt_subtest_f("exec-queue-create-fail-%s", s->name)
+			xe_for_each_engine(fd, hwe) {
+				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND &&
+						strcmp(s->name, "xe_exec_queue_create_bind"))
+					exec_queue_create_fail(fd, hwe, s[3].name, s[3].flags);
+				else if (strcmp(s->name, "xe_exec_queue_create_bind"))
+					exec_queue_create_fail(fd, hwe, s->name, s->flags);
+			}
+
 	igt_fixture {
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
 	}
-- 
2.34.1

