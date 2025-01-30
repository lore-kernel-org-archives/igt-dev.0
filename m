Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAE6C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 10:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CF010E921;
	Thu, 30 Jan 2025 10:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvjOYQxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E8410E921
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738231466; x=1769767466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TMk9kaZ17AJ/Da7gr57bfMfNzOS/vkNKwOqN1513kLk=;
 b=YvjOYQxVc0BsMJ6mMu+augseTpRmFIjb3xq1OgqsWTBmWpPCyFikyVYD
 cMGBhp7Hc3or50sP599/11NsTVmBRrnWx8cdJjM7n4SoZg2tJVt/SuTrl
 DSxcYHgX2n6Ge3OU7Xl8Sg88aTGwnn4jFHNOGzqWzxg0OlwUF/sEekRvS
 jwtpQ3zgzBVMDPYl5JtV36vWGchma8eQk12Yd3+8frjNrMavV9T9N4fTb
 BvzricK2fxIu9QChLCYuyg0nYqPFNqYrZW7xGpNEFio953lSGb71i//g5
 1w/U+qzCjeGfQ/yhc4xt7nynIzbaQJgkg9QA/VngYCLIvR1gyU6n+tGxh Q==;
X-CSE-ConnectionGUID: Rt3x5E/uRZ+7EFed3ymwBg==
X-CSE-MsgGUID: +oFq5uAIQu6hxC6FPA7m0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38473527"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38473527"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:04:25 -0800
X-CSE-ConnectionGUID: ZVoSYVV/TlKv1ObVJyxtFw==
X-CSE-MsgGUID: coLiPLDzTq29WHkY2TQH4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109423162"
Received: from pravalika-nuc8i7beh.iind.intel.com ([10.145.169.177])
 by fmviesa008.fm.intel.com with ESMTP; 30 Jan 2025 02:04:23 -0800
From: pravalika gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	francois.dugast@intel.com
Cc: pravalika gurram <pravalika.gurram@intel.com>
Subject: [PATCH] tests/intel/xe_fault_injection: Inject errors during exec
 queue create IOCTL
Date: Thu, 30 Jan 2025 15:15:14 +0530
Message-Id: <20250130094514.3282423-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.37.1
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

Signed-off-by: pravalika gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_fault_injection.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 7ae941367..37aca6d8c 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -185,6 +185,38 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
 }
 
+/**
+ * SUBTEST: exec-queue-create-fail-%s
+ * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_exec_queue_create_bind:	xe_exec_queue_create_bind
+ */
+static void
+exec_queue_create_fail(int fd, const char function_name[])
+{
+	struct drm_xe_engine_class_instance instance = {
+		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+	};
+	uint32_t exec_queue_id;
+	uint32_t vm = xe_vm_create(fd, 0, 0);
+
+	/* sanity check */
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec_queue_id), 0);
+	xe_exec_queue_destroy(fd, exec_queue_id);
+
+	ignore_faults_in_dmesg(function_name);
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec_queue_id) != 0);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec_queue_id), 0);
+	xe_exec_queue_destroy(fd, exec_queue_id);
+	xe_vm_destroy(fd, vm);
+}
+
 static int
 simple_vm_create(int fd, unsigned int flags)
 {
@@ -318,6 +350,11 @@ igt_main
 		{ }
 	};
 
+	const struct section exec_queue_create_fail_functions[] = {
+		{ "xe_exec_queue_create_bind" },
+		{ }
+	};
+
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -333,6 +370,10 @@ igt_main
 		igt_subtest_f("vm-bind-fail-%s", s->name)
 			vm_bind_fail(fd, s->name);
 
+	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
+		igt_subtest_f("exec-queue-create-fail-%s", s->name)
+			exec_queue_create_fail(fd, s->name);
+
 	igt_fixture {
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
 	}
-- 
2.37.1

