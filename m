Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322BCC021AB
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 07:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE23510E477;
	Wed, 19 Feb 2025 07:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqamgzVr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0DA10E476
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739949572; x=1771485572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zg++0cvIvcKPOlCj8xrxTypafc15rPr2HAl9TRZE6TI=;
 b=cqamgzVrxSoXKV4tjv3jjWRQZ6ffPprryciuOwBBDqEc8NbwijJ/glyz
 QrgHVmVXP6pJ3p8fbrYHOss//bA6bcn2PjIhoc2e0BppjmZ5RJxqOi267
 YsfcawSc6gI8Kc2pOvz2AJTrfn4U7QZWtjXyYgV3wrMGzrHzv/jMvGOee
 kvdm10qdpb1hi0Afpqrj6w5u+709c/7Qg5Xkyw+zUuomITXaqMePGitNw
 1LzcV5i714VoX6pHiBQ9TnmhBS1LXliN6+qBlu2846deeMHJmNWReCVny
 0fgyP9lhu2a/cd0XYc8mVK4P4vuyrQpmYBeA8na42AmijKd5VySvEJyPi A==;
X-CSE-ConnectionGUID: awIRjOKCRZKga5f7jXgOjg==
X-CSE-MsgGUID: +ZhrWSALRPOIYdSXVcknIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40885372"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40885372"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 23:19:32 -0800
X-CSE-ConnectionGUID: ZMjZ573lR2+hqOCtsh10EQ==
X-CSE-MsgGUID: Qrlk2Pr6QdSPrHzTcjZWGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114611845"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2025 23:19:31 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 4/5] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Date: Wed, 19 Feb 2025 13:04:44 +0530
Message-Id: <20250219073445.31423-5-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
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
index 32733fec5..cf0337733 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -231,6 +231,34 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
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

