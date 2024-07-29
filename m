Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412C8C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0038210E42A;
	Mon, 29 Jul 2024 16:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJHShzdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EAF10E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269056; x=1753805056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkzEYVhvjTtdg9RVfVWmV1vTgRJGCRHaUR9aR2wFbUw=;
 b=eJHShzdxuIspDD0LSSMA3AlbMwtFG3ybK0XzSd6AR0+o85h+zx9Pmxcl
 OzuaD0+BKOsHMRnd0273X2RI7v/ax+9Mo0+v+UXhGxTapF/7hnsW+1fp7
 HGhlIxbWnXXxfEHowb23uDqXx2FYAfsqLKxg2ITVZy6XwQLXl2Yn0sSU4
 j6r25XIjf23k6TUjMjIb1U1S+gd3ybJCgVhNOP789Nnr/mXmXVfYiMhjg
 6yttmhOixTLNyY9fPCpfB6z2CZMdGfg/xzdo75fgLcRGCCbUM3CLq+/F1
 0EVVZXPRSUFrkfFUxj0xggkr3PhiNFXkbrcVx52UDe+/WCYCBPQ19t6Hp w==;
X-CSE-ConnectionGUID: GVZUwteqTrGpaepHOz+fMg==
X-CSE-MsgGUID: 33zHvF3PRkG7X2c7svhGgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427220"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427220"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:15 -0700
X-CSE-ConnectionGUID: et0lgqnTTAet70YtT890Dg==
X-CSE-MsgGUID: /JCDb/dySY2TO0DH1h7UBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738580"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:12 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 36/66] tests/xe_eudebug: Test multiple bo sizes
Date: Mon, 29 Jul 2024 18:01:29 +0200
Message-Id: <20240729160159.37036-37-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

