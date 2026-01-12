Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A70C9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B74310E3CC;
	Mon, 12 Jan 2026 13:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYuC9YIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847BA10E3C8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222861; x=1799758861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nx35cAPKLzANL8tvrfRSX34DHg2gGHGaBxMT859asQ0=;
 b=OYuC9YIZ2VVchohFKVOVLIoQOGVTdaKVEd+FM66jWxvajRSmpJX5HCZn
 lBvnZkA9PFDatnR+e/qWkyQFOnDDZijZTHmzWfzz/C19IJq6gJsVLEB+7
 BBt6ggn4YJQzRDCBgMZqBqjxBqg/uD4havrhRgdfNLjj6doGxqJOzewlu
 SDqsAMecF3ycZGb/if2hNj/Mc6j2tDMjxQRDHO8p6rvboq1S0BY4BAA6N
 X6H4jqF93z7Ma1gehbxqe5pWODSZUk5VF/+6cxeIa0jn6p0wGlLJ78gsi
 NB0vmVR9Hl2V/PV0NQCuG+QjwD3Nj71jR25wsWaAgZf7Wl/UC8SD6Juep A==;
X-CSE-ConnectionGUID: TS0B5PYgR3CAcwX9RQ6j5g==
X-CSE-MsgGUID: q68haJI7TOapZlAE3EUy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545572"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:58 -0800
X-CSE-ConnectionGUID: gOam2G6sSb+gLkr9aMZZFQ==
X-CSE-MsgGUID: xGiFSawBR8ySjzTyrHUIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095032"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:55 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 14/21] lib/xe_eudebug: Remove unused
 xe_eudebug_client_vm_bind wrappers
Date: Mon, 12 Jan 2026 15:00:00 +0200
Message-ID: <20260112130008.1649357-15-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

EU debug no longer relays events for VM_BIND_OP_[MAP|UNMAP] operations.
Remove the old xe_eudebug_client_vm_bind wrappers that were supposed to
track these events in the client (test) side log.

v2: discovery vm bind makes no sense in current form (Mika)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c      | 96 ----------------------------------------
 lib/xe/xe_eudebug.h      | 15 -------
 tests/intel/xe_eudebug.c | 10 -----
 3 files changed, 121 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 7c4ef80e4c..1774e01f6f 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -2227,102 +2227,6 @@ static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 		      0);
 }
 
-/**
- * xe_eudebug_client_vm_bind_flags
- * @c: pointer to xe_eudebug_client structure
- * @vm: vm handle
- * @bo: buffer object handle
- * @offset: offset within buffer object
- * @addr: ppgtt address
- * @size: size of the binding
- * @flags: vm_bind flags
- * @sync: sync objects
- * @num_syncs: number of sync objects
- * @op_ext: BIND_OP extensions
- *
- * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
- */
-void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, uint32_t vm,
-				     uint32_t bo, uint64_t offset,
-				     uint64_t addr, uint64_t size, uint32_t flags,
-				     struct drm_xe_sync *sync, uint32_t num_syncs,
-				     uint64_t op_ext)
-{
-	igt_assert(c);
-	_xe_eudebug_client_vm_bind(c, vm, bo, offset, addr, size,
-				   DRM_XE_VM_BIND_OP_MAP, flags,
-				   sync, num_syncs, op_ext);
-}
-
-/**
- * xe_eudebug_client_vm_bind
- * @c: pointer to xe_eudebug_client structure
- * @vm: vm handle
- * @bo: buffer object handle
- * @offset: offset within buffer object
- * @addr: ppgtt address
- * @size: size of the binding
- *
- * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
- */
-void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, uint32_t vm,
-			       uint32_t bo, uint64_t offset,
-			       uint64_t addr, uint64_t size)
-{
-	const uint32_t flags = 0;
-	struct drm_xe_sync *sync = NULL;
-	const uint32_t num_syncs = 0;
-	const uint64_t op_ext = 0;
-
-	xe_eudebug_client_vm_bind_flags(c, vm, bo, offset, addr, size, flags, sync, num_syncs,
-					op_ext);
-}
-
-/**
- * xe_eudebug_client_vm_unbind_flags
- * @c: pointer to xe_eudebug_client structure
- * @vm: vm handle
- * @offset: offset
- * @addr: ppgtt address
- * @size: size of the binding
- * @flags: vm_bind flags
- * @sync: sync objects
- * @num_syncs: number of sync objects
- *
- * Calls xe vm_unbind ioctl and logs the corresponding event in client's event log.
- */
-void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c,
-				       uint32_t vm, uint64_t offset,
-				       uint64_t addr, uint64_t size, uint32_t flags,
-				       struct drm_xe_sync *sync, uint32_t num_syncs)
-{
-	igt_assert(c);
-	_xe_eudebug_client_vm_bind(c, vm, 0, offset, addr, size,
-				   DRM_XE_VM_BIND_OP_UNMAP, flags,
-				   sync, num_syncs, 0);
-}
-
-/**
- * xe_eudebug_client_vm_unbind
- * @c: pointer to xe_eudebug_client structure
- * @vm: vm handle
- * @offset: offset
- * @addr: ppgtt address
- * @size: size of the binding
- *
- * Calls xe vm_unbind ioctl and logs the corresponding event in client's event log.
- */
-void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, uint32_t vm,
-				 uint64_t offset, uint64_t addr, uint64_t size)
-{
-	const uint32_t flags = 0;
-	struct drm_xe_sync *sync = NULL;
-	const uint32_t num_syncs = 0;
-
-	xe_eudebug_client_vm_unbind_flags(c, vm, offset, addr, size,
-					  flags, sync, num_syncs);
-}
-
 /**
  * xe_eudebug_client_vm_bind_debug_data_add
  * @c: pointer to xe_eudebug_client structure
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index a53bd99dc0..d191f8be8d 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -240,21 +240,6 @@ void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_
 void xe_eudebug_ack_ufence(int debugfd,
 			   const struct drm_xe_eudebug_event_vm_bind_ufence *f);
 
-void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, uint32_t vm,
-				     uint32_t bo, uint64_t offset,
-				     uint64_t addr, uint64_t size, uint32_t flags,
-				     struct drm_xe_sync *sync, uint32_t num_syncs,
-				     uint64_t op_ext);
-void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, uint32_t vm,
-			       uint32_t bo, uint64_t offset,
-			       uint64_t addr, uint64_t size);
-void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c,
-				       uint32_t vm, uint64_t offset,
-				       uint64_t addr, uint64_t size, uint32_t flags,
-				       struct drm_xe_sync *sync, uint32_t num_syncs);
-void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, uint32_t vm,
-				 uint64_t offset, uint64_t addr, uint64_t size);
-
 void xe_eudebug_client_vm_bind_debug_data_add(struct xe_eudebug_client *c, uint32_t vm,
 					      uint32_t offset, uint64_t addr, uint64_t range,
 					      uint64_t pseudopath, char *path,
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 3cd1f61f7b..bdd1996f38 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -951,13 +951,11 @@ static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite
 #define PRIMARY_THREAD			(1 << 0)
 #define DISCOVERY_CLOSE_CLIENT		(1 << 1)
 #define DISCOVERY_DESTROY_RESOURCES	(1 << 2)
-#define DISCOVERY_VM_BIND		(1 << 3)
 #define DISCOVERY_SIGINT		(1 << 4)
 static void run_discovery_client(struct xe_eudebug_client *c)
 {
 	int fd[RESOURCE_COUNT], i;
 	bool skip_sleep = c->flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT);
-	uint64_t addr = 0x1a0000;
 
 	srand(getpid());
 
@@ -999,11 +997,6 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 
 			xe_eudebug_client_exec_queue_create(c, &create);
 
-			if (c->flags & DISCOVERY_VM_BIND) {
-				xe_eudebug_client_vm_bind(c, vm, bo, 0, addr, bo_size);
-				addr += bo_size;
-			}
-
 			if (c->flags & DISCOVERY_DESTROY_RESOURCES) {
 				xe_eudebug_client_exec_queue_destroy(c, &create);
 				xe_eudebug_client_vm_destroy(c, create.vm_id);
@@ -2622,9 +2615,6 @@ int igt_main()
 	igt_subtest("discovery-race")
 		test_race_discovery(fd, 0, 4);
 
-	igt_subtest("discovery-race-vmbind")
-		test_race_discovery(fd, DISCOVERY_VM_BIND, 4);
-
 	igt_subtest("discovery-race-sigint")
 		test_race_discovery(fd, DISCOVERY_SIGINT, 1);
 
-- 
2.43.0

