Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E514CCD1A3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4541E10E585;
	Wed, 18 Sep 2024 11:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmTzb41u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4410E584
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659093; x=1758195093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EHPVvgV0wpcZebtpqGTTOPuIEW1Df/SwLdnN50l8taI=;
 b=EmTzb41u0eEAEqELzx0I+5wjkgR9KehxyoiFDGNbb1VMeTFv+Nx19dJ+
 WBkIpe6m3aPDb0+daQ97WYOug5D/apkYdDpLP23ixYInLqVYDryuvQMil
 DXW7sqclskgjuht3Oddiso/Lmf/tl717p3BjbGsLOpPpPV76SmK3roHOT
 O/W8JoFdLeuH01eJLdRvN24QsFs6VAlcq1bCBCLdcFJmS6EmOQs7Xyyxz
 bvFKHiDuVQBDaMTOk19HCs0E7EBY0NfzZvhxl5kRi7f51Inb9TqsypVTZ
 dnRwmgCZKwSqf3wiypkwLb2/iL/voiISSH2J22WRw+QkWmscHXMZ2rNOU A==;
X-CSE-ConnectionGUID: 3g1CmNUDSN605H/MPhp4eA==
X-CSE-MsgGUID: /1pM9A1aT1OWqMJNmhGI3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470113"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:32 -0700
X-CSE-ConnectionGUID: QfJdxKAhTfqpAtqoYvjNXA==
X-CSE-MsgGUID: 7yg01qBfScCOjX9nYXPSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972712"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:28 -0700
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
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v7 13/16] lib/intel_batchbuffer: Add support for
 long-running mode execution
Date: Wed, 18 Sep 2024 13:30:14 +0200
Message-Id: <20240918113017.144687-14-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918113017.144687-1-christoph.manszewski@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

To execute in lr (long-running) mode, apart from setting
'DRM_XE_VM_CREATE_FLAG_LR_MODE' flag during vm creation, it is required
to use 'DRM_XE_SYNC_TYPE_USER_FENCE' syncs with vm_bind and xe_exec
ioctls.

Make it possible to execute batch buffers via intel_bb_exec() in lr mode
by setting the 'lr_mode' field with the supplied setter.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 149 ++++++++++++++++++++++++++++++++++++++--
 lib/intel_batchbuffer.h |  17 +++++
 2 files changed, 162 insertions(+), 4 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 299e08926..41b1c4193 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -987,6 +987,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	igt_assert(ibb->batch);
 	ibb->ptr = ibb->batch;
 	ibb->fence = -1;
+	ibb->user_fence_offset = -1;
 
 	/* Cache context configuration */
 	if (cfg) {
@@ -1489,7 +1490,7 @@ int intel_bb_sync(struct intel_bb *ibb)
 {
 	int ret;
 
-	if (ibb->fence < 0 && !ibb->engine_syncobj)
+	if (ibb->fence < 0 && !ibb->engine_syncobj && ibb->user_fence_offset < 0)
 		return 0;
 
 	if (ibb->fence >= 0) {
@@ -1498,10 +1499,28 @@ int intel_bb_sync(struct intel_bb *ibb)
 			close(ibb->fence);
 			ibb->fence = -1;
 		}
-	} else {
-		igt_assert_neq(ibb->engine_syncobj, 0);
+	} else if (ibb->engine_syncobj) {
 		ret = syncobj_wait_err(ibb->fd, &ibb->engine_syncobj,
 				       1, INT64_MAX, 0);
+	} else {
+		int64_t timeout = -1;
+		uint64_t *sync_data;
+		void *map;
+
+		igt_assert(ibb->user_fence_offset >= 0);
+
+		map = xe_bo_map(ibb->fd, ibb->handle, ibb->size);
+		sync_data = (void *)((uint8_t *)map + ibb->user_fence_offset);
+
+		ret = __xe_wait_ufence(ibb->fd, sync_data, ibb->user_fence_value,
+				       ibb->ctx ?: ibb->engine_id, &timeout);
+
+		gem_munmap(map, ibb->size);
+		ibb->user_fence_offset = -1;
+
+		/* Workload finished forcibly, but finished none the less */
+		if (ret == -EIO)
+			ret = 0;
 	}
 
 	return ret;
@@ -2475,6 +2494,125 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	return 0;
 }
 
+static int
+__xe_lr_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
+{
+	uint32_t engine = flags & (I915_EXEC_BSD_MASK | I915_EXEC_RING_MASK);
+	uint32_t engine_id;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	/*
+	 * LR mode vm_bind requires to use DRM_XE_SYNC_TYPE_USER_FENCE type sync
+	 * LR mode xe_exec requires to use DRM_XE_SYNC_TYPE_USER_FENCE type sync
+	 */
+	struct drm_xe_sync syncs[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE
+		},
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE
+		},
+	};
+	struct drm_xe_vm_bind_op *bind_ops;
+	struct {
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+	} *sync_data;
+	uint32_t sync_offset;
+	uint64_t ibb_addr, vm_sync_addr, exec_sync_addr;
+	void *map;
+
+	igt_assert_eq(ibb->num_relocs, 0);
+	igt_assert_eq(ibb->xe_bound, false);
+
+	if (ibb->ctx) {
+		engine_id = ibb->ctx;
+	} else if (ibb->last_engine != engine) {
+		struct drm_xe_engine_class_instance inst = { };
+
+		inst.engine_instance =
+			(flags & I915_EXEC_BSD_MASK) >> I915_EXEC_BSD_SHIFT;
+
+		switch (flags & I915_EXEC_RING_MASK) {
+		case I915_EXEC_DEFAULT:
+		case I915_EXEC_BLT:
+			inst.engine_class = DRM_XE_ENGINE_CLASS_COPY;
+			break;
+		case I915_EXEC_BSD:
+			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+			break;
+		case I915_EXEC_RENDER:
+			if (xe_has_engine_class(ibb->fd, DRM_XE_ENGINE_CLASS_RENDER))
+				inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
+			else
+				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
+			break;
+		case I915_EXEC_VEBOX:
+			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+			break;
+		default:
+			igt_assert_f(false, "Unknown engine: %x", (uint32_t)flags);
+		}
+		igt_debug("Run on %s\n", xe_engine_class_string(inst.engine_class));
+
+		if (ibb->engine_id)
+			xe_exec_queue_destroy(ibb->fd, ibb->engine_id);
+
+		ibb->engine_id = engine_id =
+			xe_exec_queue_create(ibb->fd, ibb->vm_id, &inst, 0);
+	} else {
+		engine_id = ibb->engine_id;
+	}
+	ibb->last_engine = engine;
+
+	/* User fence add for sync: sync.addr has a quadword align limitation */
+	intel_bb_ptr_align(ibb, 8);
+	sync_offset = intel_bb_offset(ibb);
+	intel_bb_ptr_add(ibb, sizeof(*sync_data));
+
+	map = xe_bo_map(ibb->fd, ibb->handle, ibb->size);
+	memcpy(map, ibb->batch, ibb->size);
+
+	sync_data = (void *)((uint8_t *)map + sync_offset);
+	/* vm_sync userfence userspace address. */
+	vm_sync_addr = to_user_pointer(&sync_data->vm_sync);
+	ibb_addr = ibb->batch_offset;
+	/* exec_sync userfence ppgtt address. */
+	exec_sync_addr = ibb_addr + sync_offset + sizeof(uint64_t);
+	syncs[0].addr = vm_sync_addr;
+	syncs[1].addr = exec_sync_addr;
+
+	if (ibb->num_objects > 1) {
+		bind_ops = xe_alloc_bind_ops(ibb, DRM_XE_VM_BIND_OP_MAP, 0, 0);
+		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
+				 ibb->num_objects, syncs, 1);
+		free(bind_ops);
+	} else {
+		igt_debug("bind: MAP\n");
+		igt_debug("  handle: %u, offset: %llx, size: %llx\n",
+			  ibb->handle, (long long)ibb->batch_offset,
+			  (long long)ibb->size);
+		xe_vm_bind_async(ibb->fd, ibb->vm_id, 0, ibb->handle, 0,
+				 ibb->batch_offset, ibb->size, syncs, 1);
+	}
+
+	/* use default vm_bind_exec_queue */
+	xe_wait_ufence(ibb->fd, &sync_data->vm_sync, USER_FENCE_VALUE, 0, -1);
+	gem_munmap(map, ibb->size);
+
+	ibb->xe_bound = true;
+	ibb->user_fence_value = USER_FENCE_VALUE;
+	ibb->user_fence_offset = sync_offset + sizeof(uint64_t);
+
+	xe_exec_sync(ibb->fd, engine_id, ibb->batch_offset, &syncs[1], 1);
+
+	if (sync)
+		intel_bb_sync(ibb);
+
+	return 0;
+}
+
 /*
  * __intel_bb_exec:
  * @ibb: pointer to intel_bb
@@ -2576,7 +2714,10 @@ void intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
 	if (ibb->driver == INTEL_DRIVER_I915)
 		igt_assert_eq(__intel_bb_exec(ibb, end_offset, flags, sync), 0);
 	else
-		igt_assert_eq(__xe_bb_exec(ibb, flags, sync), 0);
+		if (intel_bb_get_lr_mode(ibb))
+			igt_assert_eq(__xe_lr_bb_exec(ibb, flags, sync), 0);
+		else
+			igt_assert_eq(__xe_bb_exec(ibb, flags, sync), 0);
 }
 
 /**
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 08345d34e..178aaa9d8 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -303,6 +303,11 @@ struct intel_bb {
 	 * is not thread-safe.
 	 */
 	int32_t refcount;
+
+	/* long running mode */
+	bool lr_mode;
+	int64_t user_fence_offset;
+	uint64_t user_fence_value;
 };
 
 struct intel_bb *
@@ -426,6 +431,18 @@ static inline uint32_t intel_bb_pxp_appid(struct intel_bb *ibb)
 	return ibb->pxp.appid;
 }
 
+static inline void intel_bb_set_lr_mode(struct intel_bb *ibb, bool lr_mode)
+{
+	igt_assert(ibb);
+	ibb->lr_mode = lr_mode;
+}
+
+static inline bool intel_bb_get_lr_mode(struct intel_bb *ibb)
+{
+	igt_assert(ibb);
+	return ibb->lr_mode;
+}
+
 struct drm_i915_gem_exec_object2 *
 intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 		    uint64_t offset, uint64_t alignment, bool write);
-- 
2.34.1

