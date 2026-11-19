Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD4606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i/yplBbu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D376311207E;
	Thu, 19 Nov 2026 08:10:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ED411203E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795075672; x=1826611672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oJ4DvKI8hxvxgHzhjGLHX6bQ+9vz51O8jOVLOkoX9SI=;
 b=i/yplBbuB5OeFM9yH/CSbgrxwGFprECNcitq5mGD3R3wZdakM6BGhExS
 v29gZz05nGH+a1acs6FuJ9obqJ2NliuEKOUDTmxHtuxJ2exOkkGutiAUl
 soFdU3L6tbQo2wovqo1aAiAuc6+CTpDgtSjZ/Dwq7wWpx2Dq5mqqrPayP
 ANw6deijRtIvReWhWzcDjSTr57LSqeBc9W8E8eYsSyE0eJ9E1vTKKsKkP
 ggsJdQSscNuvOvUyemGTswfXWTpqqZz7ZQaPbzQ5LSxKUasYuZtXw1FrE
 EFagqiFwYG6TYcgvhe7hZcB/j9wYDYNMKtcjzdC3bBjETlEDsM5xKE8ia w==;
X-CSE-ConnectionGUID: VRaf7pquSjWX2mF1KgZqWQ==
X-CSE-MsgGUID: dV9MMicQQB6C4Ub4axuIoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3766956"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3766956"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 00:07:52 -0800
X-CSE-ConnectionGUID: 6M36jV4tTT+kgcA6qn8Wog==
X-CSE-MsgGUID: 5rJ0DRCzRzCc8IcfmNrKIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10616910"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2026 00:07:51 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_exec_atomic: Wait for the bind
 before the exec
Date: Thu, 19 Nov 2026 00:07:09 -0800
Message-ID: <20261119080722.525281-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119080722.525281-4-shuicheng.lin@intel.com>
References: <20261119080722.525281-4-shuicheng.lin@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The bind and the exec share a single syncobj, and both only signal it.
The "sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL" before the exec is a no-op,
so the exec never waits for the bind. Since the bind runs on a separate
bind exec queue, the exec may run before the BO is mapped at the batch
address and fault.

Use two syncobjs: the bind signals sync[0], the exec waits on sync[0]
and signals sync[1], and the CPU waits on sync[1] before checking the
result.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_atomic.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index f138a510e..0aa44740b 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -58,27 +58,26 @@ static void atomic_batch(struct data *data, uint64_t addr, int ops)
 static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci,
 		       uint32_t placement)
 {
-	struct drm_xe_sync sync = {
-		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
-		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
-		.num_syncs = 1,
-		.syncs = to_user_pointer(&sync),
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
 	};
 	struct data *data;
 	uint32_t vm;
 	uint32_t exec_queue;
 	uint32_t bind_engine;
-	uint32_t syncobj;
 	size_t bo_size;
 	int value = 0x123456, match;
 	uint64_t addr = 0x100000;
 	uint32_t bo = 0;
 
-	syncobj = syncobj_create(fd, 0);
-	sync.handle = syncobj;
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[1].handle = syncobj_create(fd, 0);
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data);
@@ -89,7 +88,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
-	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
+	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, sync, 1);
 	data = xe_bo_mmap_ext(fd, bo, bo_size, PROT_READ|PROT_WRITE);
 	data->data = value;
 
@@ -97,16 +96,18 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 	exec.exec_queue_id = exec_queue;
 	exec.address = data->addr;
-	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	/* Wait on the bind in sync[0], signal the exec completion in sync[1] */
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_exec(fd, &exec);
 
-	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
 	munmap(data, bo_size);
 	data = xe_bo_mmap_ext(fd, bo, bo_size, PROT_READ|PROT_WRITE);
 	match = (inst_type == MI_ATOMIC_INC) ? ++value : --value;
 	igt_assert_eq(data->data, match);
 
-	syncobj_destroy(fd, syncobj);
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, sync[1].handle);
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 
-- 
2.43.0

