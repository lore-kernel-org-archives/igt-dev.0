Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A27C36018
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD88210E525;
	Tue,  1 Apr 2025 09:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYgCxDSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174E10E525
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743498468; x=1775034468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ssivpP046xuFy/KJWY7/bn0j4Fl0kjpWwxSTxLVH0hA=;
 b=AYgCxDSb+yV+kAy11+IBtM58+WN6iuq9W/t5uBmoq0au6OZbTgCEgJsu
 gE/jw+i3MMBwGbFnP0a88/t/816ZC7zDmomLgsBrwvn4lcKbWLnc0F639
 R2P7li2XTHB0ea33Vae7+TMuOeFLqDT8DY1lUHYQqAU2ocuEHSGKPeQYa
 r860KUOapYbYcKdj5o08JmdtFOz/MD8EkEjrxdnPCrUkVfTeh03wudvdw
 s7+kbifSIL8Fo4cLbEqt79Vk6COjBSrbzjtFn0rghiHY4iGL14xIn1ZgQ
 Qt5WQr64eN/2zQZFrq/kCvBMH2FAM1G6xuIYg3bZF2csWnXm3GHQDAdHC Q==;
X-CSE-ConnectionGUID: LdFGrj+sSIyJMr9k5MYFzw==
X-CSE-MsgGUID: wlYfo0x8SIKAeWsxasEfSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62345868"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62345868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:07:47 -0700
X-CSE-ConnectionGUID: mtGFCo4NRHWuSPpfe7BCyw==
X-CSE-MsgGUID: zilUpEJ4R8ikghBo6S+5jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="131539958"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:07:46 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/xe_eudebug: Implement faultable variations
 of some testcases
Date: Tue,  1 Apr 2025 09:06:50 +0000
Message-Id: <20250401090651.298768-2-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401090651.298768-1-jan.sokolowski@intel.com>
References: <20250401090651.298768-1-jan.sokolowski@intel.com>
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
 tests/intel/xe_eudebug.c | 96 ++++++++++++++++++++++++++++++++--------
 1 file changed, 77 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 76870805c..d61ab373f 100644
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
@@ -1567,17 +1571,31 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
  *      vm fd, concerning many different offsets inside the vm,
  *      and many virtual addresses of the vm_bound object.
  *
+ * SUBTEST: basic-vm-access-faultable
+ * Sub-category: EUdebug framework
+ * Functionality: VM access with FAULTABLE_VM
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
+ * Sub-category: EUdebug framework
+ * Functionality: VM access with FAULTABLE_VM
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
@@ -1717,15 +1735,29 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with bo backing storage.
  *
+ * SUBTEST: basic-vm-access-parameters-faultable
+ * Sub-category: EUdebug framework
+ * Functionality: VM access with FAULTABLE_VM
+ * Description:
+ *	Fault variation of test basic-vm-access-parameters.
+ *
  * SUBTEST: basic-vm-access-parameters-userptr
  * Description:
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with userptr backing storage.
+ *
+ * SUBTEST: basic-vm-access-parameters-userptr-faultable
+ * Sub-category: EUdebug framework
+ * Functionality: VM access with FAULTABLE_VM
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
@@ -2185,7 +2217,8 @@ static void *vm_bind_clear_thread(void *data)
 	struct vm_bind_clear_thread_priv *priv = data;
 	int fd = xe_eudebug_client_open_driver(priv->c);
 	uint32_t gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
-	uint32_t vm = xe_eudebug_client_vm_create(priv->c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	uint32_t vm_flags = (priv->c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
+	uint32_t vm = xe_eudebug_client_vm_create(priv->c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | vm_flags, 0);
 	size_t bo_size = xe_bb_size(fd, batch_size);
 	unsigned long count = 0;
 	uint64_t *fence_data;
@@ -2397,14 +2430,22 @@ static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
  * SUBTEST: vm-bind-clear
  * Description:
  *      Check that fresh buffers we vm_bind into the ppGTT are always clear.
+ *
+ * SUBTEST: vm-bind-clear-faultable
+ * Sub-category: EUdebug framework
+ * Functionality: memory access with FAULTABLE_VM
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
@@ -2433,7 +2474,8 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
 	const unsigned int n = UFENCE_EVENT_COUNT_EXPECTED;
 	int fd = xe_eudebug_client_open_driver(c);
 	struct ufence_bind *binds = create_binds_with_ufence(fd, n);
-	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	uint32_t vm_flags = (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
+	uint32_t vm = xe_eudebug_client_vm_create(c, fd, vm_flags | DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	size_t bo_size = xe_get_default_alignment(fd);
 	uint64_t items = bo_size / sizeof(uint32_t);
 	uint32_t bo[UFENCE_EVENT_COUNT_EXPECTED];
@@ -2613,12 +2655,20 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
  * Description:
  *      Intercept vm bind after receiving ufence event, then access target vm and write to it.
  *      Then check on client side if the write was successful.
+ *
+ * SUBTEST: vma-ufence-faultable
+ * Sub-category: EUdebug framework
+ * Functionality: check ufence blocking with FAULTABLE_VM
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
 
@@ -2742,17 +2792,31 @@ igt_main
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
@@ -2781,12 +2845,6 @@ igt_main
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

