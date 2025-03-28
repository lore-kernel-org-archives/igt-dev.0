Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAA8C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 10:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3523E10E9E2;
	Fri, 28 Mar 2025 10:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv7+Nell";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A24F10E9E2
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743159590; x=1774695590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qx+tiTBuZgFbCq3ub0Sx1k3DJqPKqDX7v8OQdh3cKzg=;
 b=cv7+NellYl7Rhymuu4fk6xKdKSSjEiMglm2LXrsVHspeZX4sOHIvr+8V
 ydqnoOrs0hZfiBfYk3ygXXd/WxDkoW378Zux+wapd5mEvmJbynZeTko+3
 J+ldX16XPZ/LSeRMkjad1LYRo5z0codSZGRSyIFrg7OIEnuuphraehzAz
 I1dXQObcI/DfhW9K47YzzInLATMmJtvpV4TZLQWwgKfx1hyct+mZqdn9p
 Wmct2hOx/wmGnCFLAxS4tcnAw+To1uJWJNuXSWolLwq+/o7MN5sE1/0xK
 2s5W6rrqsxhADkI2pMqe/iDcDAj/EW3KEflIKRWdOc86VZ5UGvoWUDe0x A==;
X-CSE-ConnectionGUID: RUB3rOhyQR2Zt+Rvjj0utw==
X-CSE-MsgGUID: P8et7l9yRRmyuMofLmakXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55886303"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55886303"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:59:50 -0700
X-CSE-ConnectionGUID: wfddwvfeSKaSLpeIZx//3Q==
X-CSE-MsgGUID: NwEdzKXhTAeR/dtL86hEcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130271406"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 28 Mar 2025 03:59:48 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 2/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Date: Fri, 28 Mar 2025 16:45:31 +0530
Message-Id: <20250328111532.16620-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
References: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
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

All xe_init() kind of functions are called just once during driver probe,
so it is sufficient to fail first/all calls to them. Driver communicates
with the GuC multiple times, and the real failure can happen at different
call, hence the need to inject failure in GuC communication functions,
like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
all calls, but we need to be able to select specific iteration to fail.

To address this problem, the environmental variable IGT_FAULT_INJECT_ITERATION
is used. If the IGT_FAULT_INJECT_ITERATION is not exported, an error will
be injected in every possible function call starting from first up to the
max number of iteration defined by INJECT_ITERATIONS, currently hardcoded
as 100. Also, using IGT_FAULT_INJECT_ITERATION, an error can be injected at
specific function call.

Error can be injected using:
igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_fault_injection.c | 61 ++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 1325a1716..a49070b4d 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -26,6 +26,7 @@
 #define INJECT_ERRNO	-ENOMEM
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
+#define INJECT_ITERATIONS	100
 
 enum injection_list_action {
 	INJECTION_LIST_ADD,
@@ -43,6 +44,24 @@ struct fault_injection_params {
 	uint32_t space;
 };
 
+/**
+ *  Introduce a new environmental variable IGT_FAULT_INJECT_ITERATION
+ *  using which an error can be injected at specific function call.
+ *  When unset test will run for INJECT_ITERATIONS iterations.
+ *  When set to <=0 or malformed - same as unset.
+ *  When set to >0 it will run single n-th iteration only.
+ */
+static int get_fault_inject_iter(void)
+{
+	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
+
+	/* Return 0 if not exported / -ve value */
+	if (!env || atoi(env) <= 0)
+		return 0;
+
+	return atoi(env);
+}
+
 static int fail_function_open(void)
 {
 	int debugfs_fail_function_dir_fd;
@@ -228,6 +247,34 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
 }
 
+/**
+ * SUBTEST: probe-fail-guc-%s
+ * Description: inject an error in the injectable function %arg[1] then reprobe driver
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_send_recv
+ * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_send_recv
+ */
+static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
+               struct fault_injection_params *fault_params)
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
+		igt_kmod_unbind("xe", pci_slot);
+	}
+}
+
 /**
  * SUBTEST: exec-queue-create-fail-%s
  * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
@@ -406,6 +453,7 @@ igt_main
 {
 	int fd, sysfs;
 	struct drm_xe_engine_class_instance *hwe;
+	struct fault_injection_params fault_params;
 	static uint32_t devid;
 	char pci_slot[NAME_MAX];
 	const struct section {
@@ -463,6 +511,12 @@ igt_main
 		{ }
 	};
 
+	const struct section guc_fail_functions[] = {
+		{ "xe_guc_mmio_send_recv" },
+		{ "xe_guc_ct_send_recv" },
+		{ }
+	};
+
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -505,6 +559,13 @@ igt_main
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
 			inject_fault_probe(fd, pci_slot, s->name);
 
+   for (const struct section *s = guc_fail_functions; s->name; s++)
+       igt_subtest_f("probe-fail-guc-%s", s->name) {
+           memcpy(&fault_params, &default_fault_params,
+                   sizeof(struct fault_injection_params));
+           probe_fail_guc(fd, pci_slot, s->name, &fault_params);
+       }
+
 	igt_fixture {
 		close(sysfs);
 		drm_close_driver(fd);
-- 
2.35.3

