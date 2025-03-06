Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C0C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5870910E930;
	Thu,  6 Mar 2025 09:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0duc+rP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195C510E930
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254915; x=1772790915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ie9LYpKIRtnpXh8Ur45j1Jn6gCYeeCg44TZk4L7zhlQ=;
 b=c0duc+rPZEpuf7S8WrsegQNy9cb5IbnBYf4N/3i8PRHHc3JzqGhSb+8+
 O4Wrg1jzT9qi7L9uhobdHcOF7G04gRaiYfdERdgJ4AxyxCMbP54LANXIQ
 TWDBP6nlrGrsrrXAaRtFn60JkwiR3P1o5arKVcgmmjObf9uHlnd/Wjq+3
 kNMYXxhmHQtLH0FBHhhVO5L0EU4Ml5IYikZIYvF6TBjvds5mVfvNHu2rD
 /Wf5yaaMY/SCExT5iDO4GMge+Qr5LYdw2+Z2++t+B08ie+m3JjIFow043
 Hnb/V9KZAVgBje4Ow/tc2Sw7ePkXIKRyiryTGTx/07sWNVm42DTNn9d1E g==;
X-CSE-ConnectionGUID: pzJqMFIxQOehmkCejfxEKQ==
X-CSE-MsgGUID: j9oIW1rMTVytZPEVkdgAmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29839194"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="29839194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:55:15 -0800
X-CSE-ConnectionGUID: s88RK5BARCyJuTgcac0UuA==
X-CSE-MsgGUID: /6vlE9k1RhalnUHfjWlidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119160943"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 01:55:13 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 4/6] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Date: Thu,  6 Mar 2025 15:40:39 +0530
Message-Id: <20250306101041.26827-5-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
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
as 100.

Error can be injected using:
igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 1bf8ef1d8..de9ae02f1 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -25,6 +25,7 @@
 #define INJECT_ERRNO	-ENOMEM
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
+#define INJECT_ITERATIONS	100
 
 enum injection_list_action {
 	INJECTION_LIST_ADD,
@@ -45,6 +46,9 @@ struct fault_injection_params {
 /**
  *  Introduce a new environmental variable IGT_FAULT_INJECT_ITERATION
  *  using which an error can be injected at specific function call.
+ *  When unset test will run for INJECT_ITERATIONS iterations.
+ *  When set to <=0 or malformed - same as unset.
+ *  When set to >0 it will run single n-th iteration only.
  */
 static int get_fault_inject_iter(void)
 {
@@ -228,6 +232,33 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
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
+	}
+}
+
 static int
 simple_vm_create(int fd, unsigned int flags)
 {
@@ -329,6 +360,7 @@ igt_main
 {
 	int fd;
 	char pci_slot[NAME_MAX];
+	struct fault_injection_params fault_params;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -363,6 +395,11 @@ igt_main
 		{ "xe_sync_entry_parse" },
 		{ }
 	};
+	const struct section guc_fail_functions[] = {
+		{ "xe_guc_mmio_send_recv" },
+		{ "xe_guc_ct_send_recv" },
+		{ }
+	};
 
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
@@ -386,6 +423,13 @@ igt_main
 	for (const struct section *s = probe_fail_functions; s->name; s++)
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
 			inject_fault_probe(fd, pci_slot, s->name);
+	
+	for (const struct section *s = guc_fail_functions; s->name; s++)
+		igt_subtest_f("probe-fail-guc-%s", s->name) {
+			memcpy(&fault_params, &default_fault_params,
+					sizeof(struct fault_injection_params));
+			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
+		}
 
 	igt_fixture {
 		drm_close_driver(fd);
-- 
2.35.3

