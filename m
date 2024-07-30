Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A613FC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B8010E510;
	Tue, 30 Jul 2024 11:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9wf9+H8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091E10E510
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340110; x=1753876110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkzEYVhvjTtdg9RVfVWmV1vTgRJGCRHaUR9aR2wFbUw=;
 b=c9wf9+H8m67hUz/NrJNKQpbniIkNJN/hLaOtb1Jw84PRHqze2t+c0rPS
 2OIvWKWWX+Oboe7blTGWZU4LQaXpQAPeDCOUyhLZRGCO8kmq1gE43OFeg
 UBPznraqkx0ZiL5HHRc7WbLG+jQ7HqQnHIDLgaDEg++o7O/sk78Qyt2xf
 YLMuGDHQ6d472t/MgQZotUF/Bn1EF6f1fdJV+GUmqkJmk6TsHw1KtHV6X
 3E0dgRDIxojLlgK0vfJnHlRSrxr8lHgiD726k0MbAEvNG9SVb0h/pdLbv
 4DHxU7HPJ0X5Ye5Mb0JbQI2avEARNpU4pYMnlVvHxD/19a/RzsTdh4ehS A==;
X-CSE-ConnectionGUID: mhowvXRfQHKt5JtzqkfgLQ==
X-CSE-MsgGUID: gnjrsAo1QCGMl4TivC1POg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937361"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:30 -0700
X-CSE-ConnectionGUID: 55PuYVoDQXG5alWd+e8pFg==
X-CSE-MsgGUID: Uywl6c3rRp+SzdNSn4nlPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217085"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:26 -0700
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
Subject: [PATCH i-g-t v2 36/66] tests/xe_eudebug: Test multiple bo sizes
Date: Tue, 30 Jul 2024 13:44:53 +0200
Message-Id: <20240730114523.334156-37-christoph.manszewski@intel.com>
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

Extend the basic vm access tests to allow for specifying the target bo
size per bo in the bind list. The size still has to be at least the
minimum, but can be overwritten to be larger.

Make sure that the vm is unbound during bind list destroy, to avoid
overlapping vmas.

Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 45 ++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 928dcdce4..db6d96a92 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -249,12 +249,13 @@ static union buf_id *vm_create_objects(int fd, uint32_t bo_placement, uint32_t v
 }
 
 static struct bind_list *create_bind_list(int fd, uint32_t bo_placement,
-					  uint32_t vm, unsigned int n)
+					  uint32_t vm, unsigned int n,
+					  unsigned int target_size)
 {
-	const unsigned int bo_size = max_t(bo_size, xe_get_default_alignment(fd), MIN_BO_SIZE);
+	unsigned int i = target_size ?: MIN_BO_SIZE;
+	const unsigned int bo_size = max_t(bo_size, xe_get_default_alignment(fd), i);
 	bool is_userptr = !bo_placement;
 	struct bind_list *bl;
-	unsigned int i;
 
 	bl = malloc(sizeof(*bl));
 	bl->fd = fd;
@@ -317,7 +318,7 @@ static void do_bind_list(struct xe_eudebug_client *c,
 		igt_assert(syncobj_wait(bl->fd, &sync->handle, 1, INT64_MAX, 0, NULL));
 }
 
-static void free_bind_list(struct bind_list *bl)
+static void free_bind_list(struct xe_eudebug_client *c, struct bind_list *bl)
 {
 	unsigned int i;
 
@@ -327,6 +328,9 @@ static void free_bind_list(struct bind_list *bl)
 		bo_check(bl->fd, &bl->bind_ops[i]);
 		if (bl->bind_ops[i].op == DRM_XE_VM_BIND_OP_MAP_USERPTR)
 			free(bl->bo[i].userptr);
+		xe_eudebug_client_vm_unbind(c, bl->fd, bl->vm, 0,
+					    bl->bind_ops[i].addr,
+					    bl->bind_ops[i].range);
 	}
 
 	free(bl->bind_ops);
@@ -359,7 +363,7 @@ static void vm_bind_client(int fd, struct xe_eudebug_client *c)
 
 		xe_vm_bind_async(fd, vm, 0, bo[1], rebind_bo_offset, addr[1], size, NULL, 0);
 
-		bl = create_bind_list(fd, system_memory(fd), vm, 4);
+		bl = create_bind_list(fd, system_memory(fd), vm, 4, 0);
 		xe_vm_bind_array(bl->fd, bl->vm, 0, bl->bind_ops, bl->n, NULL, 0);
 
 		xe_vm_unbind_all_async(fd, vm, 0, bo[0], NULL, 0);
@@ -387,7 +391,7 @@ static void vm_bind_client(int fd, struct xe_eudebug_client *c)
 		xe_eudebug_client_vm_bind(c, fd, vm, bo[1], 0, addr[1], bo_size);
 		xe_eudebug_client_vm_bind(c, fd, vm, bo[1], rebind_bo_offset, addr[1], size);
 
-		bl = create_bind_list(fd, system_memory(fd), vm, 4);
+		bl = create_bind_list(fd, system_memory(fd), vm, 4, 0);
 		do_bind_list(c, bl, NULL);
 	}
 
@@ -1378,7 +1382,7 @@ static void vm_access_client(struct xe_eudebug_client *c)
 	uint32_t bo_placement;
 	struct bind_list *bl;
 	uint32_t vm;
-	int fd, i;
+	int fd, i, j;
 
 	igt_debug("Using %s\n", xe_engine_class_string(hwe->engine_class));
 
@@ -1391,16 +1395,20 @@ static void vm_access_client(struct xe_eudebug_client *c)
 		bo_placement = 0;
 	else
 		bo_placement = vram_if_possible(fd, hwe->gt_id);
-	bl = create_bind_list(fd, bo_placement, vm, 4);
-	sync.handle = syncobj_create(bl->fd, 0);
-	do_bind_list(c, bl, &sync);
-	syncobj_destroy(bl->fd, sync.handle);
 
-	for (i = 0; i < bl->n; i++)
-		xe_eudebug_client_wait_stage(c, bl->bind_ops[i].addr);
+	for (j = 0; j < 5; j++) {
+		unsigned int target_size = MIN_BO_SIZE * (1 << j);
 
-	free_bind_list(bl);
+		bl = create_bind_list(fd, bo_placement, vm, 4, target_size);
+		sync.handle = syncobj_create(bl->fd, 0);
+		do_bind_list(c, bl, &sync);
+		syncobj_destroy(bl->fd, sync.handle);
 
+		for (i = 0; i < bl->n; i++)
+			xe_eudebug_client_wait_stage(c, bl->bind_ops[i].addr);
+
+		free_bind_list(c, bl);
+	}
 	xe_eudebug_client_vm_destroy(c, fd, vm);
 
 	xe_device_put(fd);
@@ -1482,11 +1490,16 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
 /**
  * SUBTEST: basic-vm-access
  * Description:
- *      Exercise XE_EUDEBG_VM_OPEN with pread and pwrite into the vm fd
+ *      Exercise XE_EUDEBG_VM_OPEN with pread and pwrite into the
+ *      vm fd, concerning many different offsets inside the vm,
+ *      and many virtual addresses of the vm_bound object.
  *
  * SUBTEST: basic-vm-access-userptr
  * Description:
- *      Exercise XE_EUDEBG_VM_OPEN with pread and pwrite into the vm fd, but backed by userptr
+ *      Exercise XE_EUDEBG_VM_OPEN with pread and pwrite into the
+ *      vm fd, concerning many different offsets inside the vm,
+ *      and many virtual addresses of the vm_bound object, but backed
+ *      by userptr.
  */
 static void test_vm_access(int fd, unsigned int flags, int num_clients)
 {
-- 
2.34.1

