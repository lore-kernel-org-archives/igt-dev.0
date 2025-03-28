Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A11C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 12:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2786D10E9FF;
	Fri, 28 Mar 2025 12:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXmw3wN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DD010E9FF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 12:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743166009; x=1774702009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EyWPWF8vDLeuRdcZiWBfbddP501pRJm3AWw/idB/rdg=;
 b=LXmw3wN9Tc0Xtyv4id48TWIycnT3b7z3fwiagaZN9JmMn/wQOTI+Sf/7
 cYTFcEnMiPLAj6HU0d5yxk+WlmeK0ONKZkc5aCrEZYRk4KWZ2/PILwOh+
 j7rZ//B//XsVbqsd6eRVPZIjhW2IvUbWkbUw02X1XxnpA4VhXfmHK2/ta
 CslUfxtAO0VgysavhPr80y1AyNAty20pMSNZgM8D1WpXU5aA0bq3U5pKL
 QmAcgSgtRdQxXcgbGTXLLY5Q18LcuxlZ6Fm5j8/k3ORDJGD7bGd339cgW
 nEIaWQs6tPtXRSoS8bD91JgaFrM7xErhJFlNGJvK0fMbhEUAcezAhwW4x w==;
X-CSE-ConnectionGUID: MhT6V65qQP2o1aLuEBhc3w==
X-CSE-MsgGUID: 5k60/Ni1RpaGq8x1NzRMZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44419780"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44419780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:46:49 -0700
X-CSE-ConnectionGUID: nrihY158S82AFUGdQOGQHA==
X-CSE-MsgGUID: uEM0ie11QziFtMtexjRFWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125441290"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:46:48 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/xe_eudebug: Implement faultable variations
 of some testcases
Date: Fri, 28 Mar 2025 12:45:54 +0000
Message-Id: <20250328124555.255036-2-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328124555.255036-1-jan.sokolowski@intel.com>
References: <20250328124555.255036-1-jan.sokolowski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Implement fault variation of tests, which are accessing the memory via
debugfd, by creating a vm in FAULT_MODE.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug.c | 84 +++++++++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 76870805c..0b3de23e2 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -64,6 +64,7 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
 #define VM_BIND_UFENCE_RECONNECT	(1 << 9)
 #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
+#define TEST_FAULTABLE			(1 << 30)
 #define TEST_DISCOVERY			(1 << 31)
 
 #define PAGE_SIZE SZ_4K
@@ -1445,16 +1446,19 @@ static void test_basic_sessions_th(int fd, unsigned int flags, int num_clients,
 static void vm_access_client(struct xe_eudebug_client *c)
 {
 	struct drm_xe_engine_class_instance *hwe = c->ptr;
+	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
 	uint32_t bo_placement;
 	struct bind_list *bl;
 	uint32_t vm;
 	int fd, i, j;
 
+
 	igt_debug("Using %s\n", xe_engine_class_string(hwe->engine_class));
 
 	fd = xe_eudebug_client_open_driver(c);
 
-	vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	vm_flags |= (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
+	vm = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
 
 	if (c->flags & VM_BIND_OP_MAP_USERPTR)
 		bo_placement = 0;
@@ -1567,17 +1571,27 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
  *      vm fd, concerning many different offsets inside the vm,
  *      and many virtual addresses of the vm_bound object.
  *
+ * SUBTEST: basic-vm-access-faultable
+ * Description:
+ *      Fault variation of test basic-vm-access.
+ *
  * SUBTEST: basic-vm-access-userptr
  * Description:
  *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
  *      vm fd, concerning many different offsets inside the vm,
  *      and many virtual addresses of the vm_bound object, but backed
  *      by userptr.
+ *
+ * SUBTEST: basic-vm-access-userptr-faultable
+ * Description:
+ *      Fault variation of test basic-vm-access-userptr.
  */
 static void test_vm_access(int fd, unsigned int flags, int num_clients)
 {
 	struct drm_xe_engine_class_instance *hwe;
 
+	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
+
 	xe_eudebug_for_each_engine(fd, hwe)
 		test_client_with_trigger(fd, flags, num_clients,
 					 vm_access_client,
@@ -1717,15 +1731,25 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with bo backing storage.
  *
+ * SUBTEST: basic-vm-access-parameters-faultable
+ * Description:
+ *	Fault variation of test basic-vm-access-parameters.
+ *
  * SUBTEST: basic-vm-access-parameters-userptr
  * Description:
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with userptr backing storage.
+ *
+ * SUBTEST: basic-vm-access-parameters-userptr-faultable
+ * Description:
+ *      Fault variation of test basic-vm-access-parameters-userptr.
  */
 static void test_vm_access_parameters(int fd, unsigned int flags, int num_clients)
 {
 	struct drm_xe_engine_class_instance *hwe;
 
+	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
+
 	xe_eudebug_for_each_engine(fd, hwe)
 		test_client_with_trigger(fd, flags, num_clients,
 					 vm_access_client,
@@ -2185,7 +2209,8 @@ static void *vm_bind_clear_thread(void *data)
 	struct vm_bind_clear_thread_priv *priv = data;
 	int fd = xe_eudebug_client_open_driver(priv->c);
 	uint32_t gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
-	uint32_t vm = xe_eudebug_client_vm_create(priv->c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	uint32_t vm_flags = (priv->c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
+	uint32_t vm = xe_eudebug_client_vm_create(priv->c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | vm_flags, 0);
 	size_t bo_size = xe_bb_size(fd, batch_size);
 	unsigned long count = 0;
 	uint64_t *fence_data;
@@ -2397,14 +2422,20 @@ static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
  * SUBTEST: vm-bind-clear
  * Description:
  *      Check that fresh buffers we vm_bind into the ppGTT are always clear.
+ *
+ * SUBTEST: vm-bind-clear-faultable
+ * Description:
+ *      Fault variation of test vm-bind-clear.
  */
-static void test_vm_bind_clear(int fd)
+static void test_vm_bind_clear(int fd, uint32_t flags)
 {
 	struct vm_bind_clear_priv *priv;
 	struct xe_eudebug_session *s;
 
+	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
+
 	priv = vm_bind_clear_priv_create();
-	s = xe_eudebug_session_create(fd, vm_bind_clear_client, 0, priv);
+	s = xe_eudebug_session_create(fd, vm_bind_clear_client, flags, priv);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
 					vm_bind_clear_test_trigger);
@@ -2433,7 +2464,8 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
 	const unsigned int n = UFENCE_EVENT_COUNT_EXPECTED;
 	int fd = xe_eudebug_client_open_driver(c);
 	struct ufence_bind *binds = create_binds_with_ufence(fd, n);
-	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	uint32_t vm_flags = (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
+	uint32_t vm = xe_eudebug_client_vm_create(c, fd, vm_flags | DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	size_t bo_size = xe_get_default_alignment(fd);
 	uint64_t items = bo_size / sizeof(uint32_t);
 	uint32_t bo[UFENCE_EVENT_COUNT_EXPECTED];
@@ -2613,12 +2645,18 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
  * Description:
  *      Intercept vm bind after receiving ufence event, then access target vm and write to it.
  *      Then check on client side if the write was successful.
+ *
+ * SUBTEST: vma-ufence-faultable
+ * Description:
+ *      Fault variation of test vma-ufence.
  */
 static void test_vma_ufence(int fd, unsigned int flags)
 {
 	struct xe_eudebug_session *s;
 	struct ufence_priv *priv;
 
+	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
+
 	priv = ufence_priv_create();
 	s = xe_eudebug_session_create(fd, vma_ufence_client, flags, priv);
 
@@ -2742,17 +2780,31 @@ igt_main
 	igt_subtest("basic-client-th")
 		test_basic_sessions_th(fd, 0, 1, true);
 
-	igt_subtest("basic-vm-access")
-		test_vm_access(fd, 0, 1);
 
-	igt_subtest("basic-vm-access-userptr")
-		test_vm_access(fd, VM_BIND_OP_MAP_USERPTR, 1);
+	igt_subtest_group {
+		uint32_t flags[] = {0, TEST_FAULTABLE};
+		const char *suffix[] = {"", "-faultable"};
+
+		for (int i = 0; i < ARRAY_SIZE(flags); i++) {
+			igt_subtest_f("basic-vm-access%s", suffix[i])
+				test_vm_access(fd, flags[i], 1);
+
+			igt_subtest_f("basic-vm-access-userptr%s", suffix[i])
+				test_vm_access(fd, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
+
+			igt_subtest_f("basic-vm-access-parameters%s", suffix[i])
+				test_vm_access_parameters(fd, flags[i], 1);
 
-	igt_subtest("basic-vm-access-parameters")
-		test_vm_access_parameters(fd, 0, 1);
+			igt_subtest_f("basic-vm-access-parameters-userptr%s", suffix[i])
+				test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
 
-	igt_subtest("basic-vm-access-parameters-userptr")
-		test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR, 1);
+			igt_subtest_f("vma-ufence%s", suffix[i])
+				test_vma_ufence(fd, flags[i]);
+
+			igt_subtest_f("vm-bind-clear%s", suffix[i])
+				test_vm_bind_clear(fd, flags[i]);
+		}
+	}
 
 	igt_subtest("multiple-sessions")
 		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
@@ -2781,12 +2833,6 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence-sigint-client")
 		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
 
-	igt_subtest("vma-ufence")
-		test_vma_ufence(fd, 0);
-
-	igt_subtest("vm-bind-clear")
-		test_vm_bind_clear(fd);
-
 	igt_subtest("basic-vm-bind-discovery")
 		test_basic_discovery(fd, VM_BIND, true);
 
-- 
2.34.1

