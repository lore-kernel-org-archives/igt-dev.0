Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F4DC54E65
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 19:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5521510E727;
	Wed, 21 May 2025 19:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGdreGK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4F010E71C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 19:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747857578; x=1779393578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=urHzyyc2QU/mU/BgQtMuT51AdWvypAUA3/eqn/tJSVs=;
 b=JGdreGK1Z/rqjeRN8RA1ipC8FJw6lydcwa7VoNy/CopnqQg0rx1PflZ4
 WW5JbwtfKDkFK9TvhiH8GXQjnUULUecW6qwdIrliyNkn+GEJl8hZzk/vB
 9wOwYb/Q6f2Q7n37T7nntccdgL207Cnoewla85hTi5/g4OJFw6bkG3rC8
 6IQ3y5Mtb3VuQTB7CZcqJIZ5EmAXaOE1t2W59QIJBxnJu0qQ9Lpeg8N9N
 aStGkL/Q8KfH4CzgZrJLM2DopRNe5aQF83IWF4ktzQ6V+pnrDA3oT9OiY
 XtN772Mg86mjv9praFuBPqz+h1rvLbuYAtIQ6jXdvGSTv2JIWN7Bw18n/ Q==;
X-CSE-ConnectionGUID: /Bu+vNfWR6mLiYKjFWccsQ==
X-CSE-MsgGUID: PZpFat/aQ+qwI8VPD1C2lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50011541"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="50011541"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 12:59:38 -0700
X-CSE-ConnectionGUID: tWcytO/YTKyUd6babrtuoQ==
X-CSE-MsgGUID: Q+uAn4nASgOnkX5oHBmCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="177388936"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 12:59:37 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/2] lib/intel_compute: move user-fence to allow async
 exec call
Date: Wed, 21 May 2025 21:59:24 +0200
Message-ID: <20250521195925.74357-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521195925.74357-1-zbigniew.kempczynski@intel.com>
References: <20250521195925.74357-1-zbigniew.kempczynski@intel.com>
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

User-fence in bo_execenv_exec() limits its usage to synchronous call.
Remove this limitation by migration of user-fence from function level
to execenv structure. This allows to synchronize later what is useful
for parallel submission scenarios.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 77 ++++++++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 070bc0d2d8..5579bec85b 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -89,6 +89,12 @@ struct bo_execenv {
 	uint32_t exec_queue;
 	uint32_t array_size;
 
+	/* Xe user-fence */
+	uint32_t bo;
+	size_t bo_size;
+	struct bo_sync *bo_sync;
+	struct drm_xe_sync sync;
+
 	/* i915 part */
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 *obj;
@@ -266,48 +272,69 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 	}
 }
 
-static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
+static void __bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
 {
 	int fd = execenv->fd;
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
 		uint32_t exec_queue = execenv->exec_queue;
-		struct bo_sync *bo_sync;
-		size_t bo_size = sizeof(*bo_sync);
-		uint32_t bo = 0;
-		struct drm_xe_sync sync = {
-			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
-			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
-			.timeline_value = USER_FENCE_VALUE,
-		};
+		size_t bo_size = ALIGN(sizeof(struct bo_sync),
+				       xe_get_default_alignment(fd));
 
-		bo_size = xe_bb_size(fd, bo_size);
-		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-		bo_sync = xe_bo_map(fd, bo, bo_size);
-		sync.addr = to_user_pointer(&bo_sync->sync);
-		xe_vm_bind_async(fd, execenv->vm, 0, bo, 0, ADDR_SYNC, bo_size, &sync, 1);
-		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, INT64_MAX);
+		execenv->bo_size = bo_size;
+		execenv->bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
+					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		execenv->bo_sync = xe_bo_map(fd, execenv->bo, bo_size);
+		execenv->sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		execenv->sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		execenv->sync.timeline_value = USER_FENCE_VALUE;
+		execenv->sync.addr = to_user_pointer(&execenv->bo_sync->sync);
+		xe_vm_bind_async(fd, execenv->vm, 0, execenv->bo, 0, ADDR_SYNC,
+				 bo_size, &execenv->sync, 1);
+		xe_wait_ufence(fd, &execenv->bo_sync->sync, USER_FENCE_VALUE,
+			       exec_queue, INT64_MAX);
 
-		sync.addr = ADDR_SYNC;
-		bo_sync->sync = 0;
+		execenv->sync.addr = ADDR_SYNC;
+		execenv->bo_sync->sync = 0;
 
-		xe_exec_sync(fd, exec_queue, start_addr, &sync, 1);
-		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, INT64_MAX);
-
-		munmap(bo_sync, bo_size);
-		gem_close(fd, bo);
+		xe_exec_sync(fd, exec_queue, start_addr, &execenv->sync, 1);
 	} else {
 		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
-		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
-		int num_objects = execbuf->buffer_count;
 
 		execbuf->flags = I915_EXEC_RENDER;
 		gem_execbuf(fd, execbuf);
+	}
+}
+
+static void bo_execenv_sync(struct bo_execenv *execenv)
+{
+	int fd = execenv->fd;
+
+	if (execenv->driver == INTEL_DRIVER_XE) {
+		xe_wait_ufence(fd, &execenv->bo_sync->sync,
+			       USER_FENCE_VALUE, execenv->exec_queue, INT64_MAX);
+		munmap(execenv->bo_sync, execenv->bo_size);
+		gem_close(fd, execenv->bo);
+	} else {
+		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
+		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
+		int num_objects = execbuf->buffer_count;
+
 		gem_sync(fd, obj[num_objects - 1].handle); /* batch handle */
 	}
 }
 
+static void bo_execenv_exec_async(struct bo_execenv *execenv, uint64_t start_addr)
+{
+	__bo_execenv_exec(execenv, start_addr);
+}
+
+static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
+{
+	bo_execenv_exec_async(execenv, start_addr);
+	bo_execenv_sync(execenv);
+}
+
 static uint32_t size_thread_group_x(uint32_t work_size)
 {
 	return MAX(1, work_size / (ENQUEUED_LOCAL_SIZE_X *
-- 
2.43.0

