Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401B9C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054A310E50E;
	Tue, 30 Jul 2024 11:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khBb7qTJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA1010E50E
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340077; x=1753876077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DMy1ZVQCFqo7wTWIDPzw+JECubOO89+rnNbEWK2+6Zw=;
 b=khBb7qTJeI3sAvHgDTtmNPhOIrg1pzTO8Tkcqsk60peUXXU0EhIvZ/fZ
 OheKfxuCXb5Hyk6fFbqi6hfQaa9YPAq/kCeGfZ6fa6DI6yY98ZT9ywKrr
 7mTb0veZlUABRyc6fn+Gj+ggXvNrxUj1BWDTdFminwPFFkhNvzz9XXlpA
 eHllTEQYhv7XjpZktDlJ6kz3pSD8Pk9xGebWIE4sG6hJLRDsb5y4WKS79
 62W8pTLfRRrrR33UcmPxnqxATempxZtbfYDgV+zFC0BFtqcYgkP2WpeBh
 XbeLWKHFjyH/x8EX2ueshneueHVtW4myjvRF29dDeD0L/N9mr/lFcRrvZ A==;
X-CSE-ConnectionGUID: Xlv4/qHvSgCCA7z5Www+7A==
X-CSE-MsgGUID: grINEysqQpy9vXJ/Dz+sZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937314"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937314"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:57 -0700
X-CSE-ConnectionGUID: +8+eNiT3TUeDAOav6SiRUg==
X-CSE-MsgGUID: N2FYPRQPTnC9YLeNk4ydPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216818"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:54 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 25/66] tests/xe_eudebug: Add
 basic-vm-bind-metadata-discovery
Date: Tue, 30 Jul 2024 13:44:42 +0200
Message-Id: <20240730114523.334156-26-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Maciej Patelczyk <maciej.patelczyk@intel.com>

Added VM BIND Discovery type test that shall detect attached metadata.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 89 +++++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 25 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 3edb2bc99..d4036ba05 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -55,18 +55,67 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND_VM_DESTROY (1 << 3)
 #define VM_BIND_EXTENDED (1 << 4)
 #define VM_METADATA (1 << 5)
+#define VM_BIND_METADATA (1 << 6)
 #define TEST_DISCOVERY (1 << 31)
 
+#define PAGE_SIZE 4096
+static struct drm_xe_vm_bind_op_ext_attach_debug *
+basic_vm_bind_metadata_ext_prepare(int fd, struct xe_eudebug_client *c,
+				   uint8_t **data, uint32_t data_size)
+{
+	struct drm_xe_vm_bind_op_ext_attach_debug *ext;
+	int i;
+
+	*data = calloc(data_size, sizeof(*data));
+	igt_assert(*data);
+
+	for (i = 0; i < data_size; i++)
+		(*data)[i] = 0xff & (i + (i > PAGE_SIZE));
+
+
+	ext = calloc(WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM, sizeof(*ext));
+	igt_assert(ext);
+
+	for (i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM; i++) {
+		ext[i].base.name = XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG;
+		ext[i].metadata_id = xe_eudebug_client_metadata_create(c, fd, i,
+								       (i + 1) * PAGE_SIZE, *data);
+		ext[i].cookie = i;
+
+		if (i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM - 1)
+			ext[i].base.next_extension = to_user_pointer(&ext[i+1]);
+	}
+	return ext;
+}
+
+static void basic_vm_bind_metadata_ext_del(int fd, struct xe_eudebug_client *c,
+					   struct drm_xe_vm_bind_op_ext_attach_debug *ext,
+					   uint8_t *data)
+{
+	for (int i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM; i++)
+		xe_eudebug_client_metadata_destroy(c, fd, ext[i].metadata_id,
+							   i, (i + 1) * PAGE_SIZE);
+	free(ext);
+	free(data);
+}
+
 static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
 {
+	struct drm_xe_vm_bind_op_ext_attach_debug *ext = NULL;
 	uint32_t vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
 	size_t bo_size = xe_get_default_alignment(fd);
 	bool test_discovery = c->flags & TEST_DISCOVERY;
+	bool test_metadata = c->flags & VM_BIND_METADATA;
 	uint32_t bo = xe_bo_create(fd, 0, bo_size,
 				   system_memory(fd), 0);
 	uint64_t addr = 0x1a0000;
+	uint8_t *data = NULL;
+
+	if (test_metadata)
+		ext = basic_vm_bind_metadata_ext_prepare(fd, c, &data, PAGE_SIZE);
 
-	xe_eudebug_client_vm_bind(c, fd, vm, bo, 0, addr, bo_size);
+	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, 0, addr,
+					bo_size, 0, NULL, 0, to_user_pointer(ext));
 
 	if (test_discovery) {
 		xe_eudebug_client_signal_stage(c, STAGE_PRE_DEBUG_RESOURCES_DONE);
@@ -75,6 +124,9 @@ static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
 
 	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr, bo_size);
 
+	if (test_metadata)
+		basic_vm_bind_metadata_ext_del(fd, c, ext, data);
+
 	gem_close(fd, bo);
 	xe_eudebug_client_vm_destroy(c, fd, vm);
 }
@@ -367,7 +419,7 @@ static void run_basic_client(struct xe_eudebug_client *c)
 		xe_eudebug_client_vm_destroy(c, fd,  vm);
 	}
 
-	if (c->flags & VM_BIND)
+	if (c->flags & VM_BIND || c->flags & VM_BIND_METADATA)
 		basic_vm_bind_client(fd, c);
 
 	if (c->flags & VM_BIND_EXTENDED)
@@ -646,6 +698,11 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
  *	Attach the debugger to a process that performs vm-bind before attaching
  *	and check if the discovery process reports it.
  *
+ * SUBTEST: basic-vm-bind-metadata-discovery
+ * Description:
+ *	Attach the debugger to a process that performs vm-bind with metadata attached
+ *	before attaching and check if the discovery process reports it.
+ *
  * SUBTEST: basic-vm-bind-vm-destroy-discovery
  * Description:
  *	Attach the debugger to a process that performs vm bind, and destroys
@@ -1129,24 +1186,7 @@ static void metadata_access_client(struct xe_eudebug_client *c)
 	vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
 	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
 
-	data = calloc(MDATA_SIZE, sizeof(*data));
-	igt_assert(data);
-
-	for (i = 0; i < MDATA_SIZE; i++)
-		data[i] = 0xff & (i + (i > PAGE_SIZE));
-
-	ext = calloc(WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA + 1, sizeof(*ext));
-	igt_assert(ext);
-
-	for (i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA + 1; i++) {
-		ext[i].base.name = XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG;
-		ext[i].metadata_id = xe_eudebug_client_metadata_create(c, fd, i,
-								       (i + 1) * PAGE_SIZE, data);
-		ext[i].cookie = i;
-
-		if (i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA)
-			ext[i].base.next_extension = to_user_pointer(&ext[i+1]);
-	}
+	ext = basic_vm_bind_metadata_ext_prepare(fd, c, &data, MDATA_SIZE);
 
 	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, 0, addr,
 					bo_size, 0, NULL, 0, to_user_pointer(ext));
@@ -1156,17 +1196,13 @@ static void metadata_access_client(struct xe_eudebug_client *c)
 
 	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr, bo_size);
 
-	for (i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA + 1; i++)
-		xe_eudebug_client_metadata_destroy(c, fd, ext[i].metadata_id, i, (i + 1) * PAGE_SIZE);
+	basic_vm_bind_metadata_ext_del(fd, c, ext, data);
 
 	close(bo);
 	xe_eudebug_client_vm_destroy(c, fd, vm);
 
 	xe_device_put(fd);
 	xe_eudebug_client_close_driver(c, fd);
-
-	free(data);
-	free(ext);
 }
 
 static void debugger_test_metadata(struct xe_eudebug_debugger *d,
@@ -1311,6 +1347,9 @@ igt_main
 	igt_subtest("basic-vm-bind-discovery")
 		test_basic_discovery(fd, VM_BIND, true);
 
+	igt_subtest("basic-vm-bind-metadata-discovery")
+		test_basic_discovery(fd, VM_BIND_METADATA, true);
+
 	igt_subtest("basic-vm-bind-vm-destroy")
 		test_basic_sessions(fd, VM_BIND_VM_DESTROY, 1, false);
 
-- 
2.34.1

