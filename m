Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CA6CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 18:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CA810E3A1;
	Tue,  6 Oct 2026 18:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpHrlXon";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953FE10E3A1
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791310681; x=1822846681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oJ4DvKI8hxvxgHzhjGLHX6bQ+9vz51O8jOVLOkoX9SI=;
 b=jpHrlXonFblrtXNaubJJgtPVhdRyC7SRiodoXaLpO3ezuW/btr98nRMz
 hVIsHwPSCG/fPIh+6ObKvzevLsdq2dZF1A/XFiw/FL3qaTsWQij8ThOk0
 Ojsk4eaqZPOfLwcNSVS69OlSX6XOQ9pVun4N7peeqMbB4lCE4m9ZIMPzJ
 IduDXhiZdxsJ5MUWZUcFRft1VzpnPbJUdubXxC33dY6gJWCD3ZFMsI5O7
 E/g7rFdrBarg0U7voUrtgsYoN/w7QsBRdD4LFWsbEx7Isb7yWjIl4iBp+
 m+cL+31GFv4O36PwJTw09X8PONNXikiJbihN5Jwe0r0pDqBCj5aM0B7OB w==;
X-CSE-ConnectionGUID: vF3YL3F2QBqXx+cSoyOUbA==
X-CSE-MsgGUID: YgwM8AiHSESg0bZFa62xgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="95828442"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="95828442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 11:17:58 -0700
X-CSE-ConnectionGUID: ObFlwaNsRuq17aFBGyMgVA==
X-CSE-MsgGUID: zqwCXcjzSuq8tjhrTshhFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="305176367"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 11:17:58 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_exec_atomic: Wait for the bind before the
 exec
Date: Tue,  6 Oct 2026 18:17:32 +0000
Message-Id: <20261006181733.1291713-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006181733.1291713-1-shuicheng.lin@intel.com>
References: <20261006181733.1291713-1-shuicheng.lin@intel.com>
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

