Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6416CA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 16:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4FB10E209;
	Tue, 19 Aug 2025 16:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mijnhlqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2018A10E209
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755622315; x=1787158315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gzYy+Y0zaEbQ+4XGzbRYWwb+XgNeMyvfrBgeIz1/72Y=;
 b=mijnhlqgLJyuLgzNRayyW7/GtP/ztTslZBhxhWFNZmyfu5m0n9zQwTez
 jqK17vXxmDnm3XejsVJtzYCGjjHfxETH1QVtkwnglUrw8yyyy3JP4OH8E
 YzX0DSlAYBvXsy/ocWD6PuItsrBW2dpvLqcq9ERh4j/WvtuI4Cq1Kv+Ew
 shDkez6pMjvULR4pey0HvjD+TrnXRMP8PMXLyZTvQjcIP0XMI9Pz8xuiy
 pnF1DNy79BMzb0fIU7VeWxQzgfIN1VHHF9W47zTtQvYUEUP/eIvIwlE15
 qABPnxO1pIvfeZy152kFkbGzwelgL8hTzc2RTJzkFH0keMpOJsshyCQcV g==;
X-CSE-ConnectionGUID: NY4o1u4HSEiiHrHDWI+Gag==
X-CSE-MsgGUID: ULCMaCm4QJ+301KNZg/liw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57732294"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57732294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:51:55 -0700
X-CSE-ConnectionGUID: gmlZqVULQmK4RdJAXBSRFw==
X-CSE-MsgGUID: v9klPFypTt+EfPXC/W1FQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172146362"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.113.129])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:51:52 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 i-g-t 1/3] tests/intel/xe_sriov_scheduling: Keep K
 submissions in flight
Date: Tue, 19 Aug 2025 18:50:43 +0200
Message-Id: <20250819165045.467613-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
References: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
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

Refactor submission to a prefill->wait->refill pipeline so each VF can
keep K jobs in flight. Introduce per-slot resources (addr/bo/spin/
out-fence) and submit per slot.

This patch sets K=1, preserving current behavior; follow-ups will pick
a higher/default K and add CLI control. This improves HW saturation and
is less sensitive to CPU scheduling hiccups, especially for short jobs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 124 +++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 36 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index d69315690..28a2b6e26 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -51,13 +51,16 @@ struct subm {
 	int vf_num;
 	struct subm_work_desc work;
 	uint32_t expected_ticks;
-	uint64_t addr;
 	uint32_t vm;
 	struct drm_xe_engine_class_instance hwe;
 	uint32_t exec_queue_id;
-	uint32_t bo;
+	/* K slots (K BOs / addresses / mapped spinners / done fences) */
+	unsigned int slots;
+	uint64_t *addr;
+	uint32_t *bo;
 	size_t bo_size;
-	struct xe_spin *spin;
+	struct xe_spin **spin;
+	uint32_t *done_fence;
 	struct drm_xe_sync sync[1];
 	struct drm_xe_exec exec;
 };
@@ -78,43 +81,62 @@ struct subm_set {
 };
 
 static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
-		      struct drm_xe_engine_class_instance hwe)
+		      struct drm_xe_engine_class_instance hwe,
+		      unsigned int inflight)
 {
+	uint64_t base, stride;
+
 	memset(s, 0, sizeof(*s));
 	s->fd = fd;
 	s->vf_num = vf_num;
 	s->hwe = hwe;
 	snprintf(s->id, sizeof(s->id), "VF%d %d:%d:%d", vf_num,
 		 hwe.engine_class, hwe.engine_instance, hwe.gt_id);
-	s->addr = addr ? addr : 0x1a0000;
+	s->slots = inflight ? inflight : 1;
 	s->vm = xe_vm_create(s->fd, 0, 0);
 	s->exec_queue_id = xe_exec_queue_create(s->fd, s->vm, &s->hwe, 0);
 	s->bo_size = ALIGN(sizeof(struct xe_spin) + xe_cs_prefetch_size(s->fd),
 			   xe_get_default_alignment(s->fd));
-	s->bo = xe_bo_create(s->fd, s->vm, s->bo_size,
-			     vram_if_possible(fd, s->hwe.gt_id),
-			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	s->spin = xe_bo_map(s->fd, s->bo, s->bo_size);
-	xe_vm_bind_sync(s->fd, s->vm, s->bo, 0, s->addr, s->bo_size);
-	/* out fence */
-	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
-	s->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
-	s->sync[0].handle = syncobj_create(s->fd, 0);
+	s->addr = calloc(s->slots, sizeof(*s->addr));
+	s->bo = calloc(s->slots, sizeof(*s->bo));
+	s->spin = calloc(s->slots, sizeof(*s->spin));
+	s->done_fence = calloc(s->slots, sizeof(*s->done_fence));
+
+	igt_assert(s->addr && s->bo && s->spin && s->done_fence);
+
+	base = addr ? addr : 0x1a0000;
+	stride = ALIGN(s->bo_size, 0x10000);
+	for (unsigned int i = 0; i < s->slots; i++) {
+		s->addr[i] = base + i * stride;
+		s->bo[i] = xe_bo_create(s->fd, s->vm, s->bo_size,
+					vram_if_possible(fd, s->hwe.gt_id),
+					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		s->spin[i] = xe_bo_map(s->fd, s->bo[i], s->bo_size);
+		xe_vm_bind_sync(s->fd, s->vm, s->bo[i], 0, s->addr[i], s->bo_size);
+		s->done_fence[i] = syncobj_create(s->fd, 0);
+	}
+
 	s->exec.num_syncs = 1;
-	s->exec.syncs = to_user_pointer(&s->sync[0]);
 	s->exec.num_batch_buffer = 1;
 	s->exec.exec_queue_id = s->exec_queue_id;
-	s->exec.address = s->addr;
+	/* s->exec.address set per submission */
 }
 
 static void subm_fini(struct subm *s)
 {
-	xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr, s->bo_size);
-	gem_munmap(s->spin, s->bo_size);
-	gem_close(s->fd, s->bo);
+	for (unsigned int i = 0; i < s->slots; i++) {
+		xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr[i], s->bo_size);
+		gem_munmap(s->spin[i], s->bo_size);
+		gem_close(s->fd, s->bo[i]);
+		if (s->done_fence[i])
+			syncobj_destroy(s->fd, s->done_fence[i]);
+	}
 	xe_exec_queue_destroy(s->fd, s->exec_queue_id);
 	xe_vm_destroy(s->fd, s->vm);
-	syncobj_destroy(s->fd, s->sync[0].handle);
+	free(s->addr);
+	free(s->bo);
+	free(s->spin);
+	free(s->done_fence);
 }
 
 static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
@@ -122,25 +144,37 @@ static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
 	s->work = *work;
 	s->expected_ticks = xe_spin_nsec_to_ticks(s->fd, s->hwe.gt_id,
 						  s->work.duration_ms * 1000000);
-	xe_spin_init_opts(s->spin, .addr = s->addr, .preempt = s->work.preempt,
-			  .ctx_ticks = s->expected_ticks);
+	for (unsigned int i = 0; i < s->slots; i++)
+		xe_spin_init_opts(s->spin[i], .addr = s->addr[i],
+				  .preempt = s->work.preempt,
+				  .ctx_ticks = s->expected_ticks);
 }
 
-static void subm_wait(struct subm *s, uint64_t abs_timeout_nsec)
+static void subm_wait_slot(struct subm *s, unsigned int slot, uint64_t abs_timeout_nsec)
 {
-	igt_assert(syncobj_wait(s->fd, &s->sync[0].handle, 1, abs_timeout_nsec,
-				0, NULL));
+	igt_assert(syncobj_wait(s->fd, &s->done_fence[slot], 1,
+				abs_timeout_nsec, 0, NULL));
 }
 
-static void subm_exec(struct subm *s)
+static void subm_exec_slot(struct subm *s, unsigned int slot)
 {
-	syncobj_reset(s->fd, &s->sync[0].handle, 1);
+	int nsync = 0;
+
+	syncobj_reset(s->fd, &s->done_fence[slot], 1);
+	memset(&s->sync[0], 0, sizeof(s->sync));
+	s->sync[nsync].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	s->sync[nsync].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	s->sync[nsync].handle = s->done_fence[slot];
+	nsync++;
+	s->exec.num_syncs = nsync;
+	s->exec.syncs = to_user_pointer(&s->sync[0]);
+	s->exec.address = s->addr[slot];
 	xe_exec(s->fd, &s->exec);
 }
 
-static bool subm_is_work_complete(struct subm *s)
+static bool subm_is_work_complete(struct subm *s, unsigned int slot)
 {
-	return s->expected_ticks <= ~s->spin->ticks_delta;
+	return s->expected_ticks <= ~s->spin[slot]->ticks_delta;
 }
 
 static bool subm_is_exec_queue_banned(struct subm *s)
@@ -157,6 +191,8 @@ static bool subm_is_exec_queue_banned(struct subm *s)
 static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
 			   const struct subm_opts *opts)
 {
+	const unsigned int inflight = s->slots;
+	unsigned int submitted = 0;
 	struct timespec tv;
 	unsigned int i;
 
@@ -165,16 +201,24 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
 		tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
 	igt_debug("[%s] start_timestamp: %f\n", s->id, stats->start_timestamp * 1e-9);
 
-	for (i = 0; i < s->work.repeats; ++i) {
-		igt_gettime(&tv);
+	/* Prefill */
+	if (s->work.repeats) {
+		unsigned int can_prefill = min(inflight, s->work.repeats);
 
-		subm_exec(s);
+		for (i = 0; i < can_prefill; i++)
+			subm_exec_slot(s, i % inflight);
+		submitted = can_prefill;
+	}
 
-		subm_wait(s, INT64_MAX);
+	/* Process completions in order: sample i -> slot (i % inflight) */
+	for (i = 0; i < s->work.repeats; ++i) {
+		unsigned int slot = i % inflight;
 
+		igt_gettime(&tv);
+		subm_wait_slot(s, slot, INT64_MAX);
 		igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
 
-		if (!subm_is_work_complete(s)) {
+		if (!subm_is_work_complete(s, slot)) {
 			stats->num_early_finish++;
 
 			igt_debug("[%s] subm #%d early_finish=%u\n",
@@ -183,6 +227,14 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
 			if (subm_is_exec_queue_banned(s))
 				break;
 		}
+
+		/* Keep the pipeline full */
+		if (submitted < s->work.repeats) {
+			unsigned int next_slot = submitted % inflight;
+
+			subm_exec_slot(s, next_slot);
+			submitted++;
+		}
 	}
 
 	igt_gettime(&tv);
@@ -607,7 +659,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
 		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
-			  xe_engine(vf_fd, 0)->instance);
+			  xe_engine(vf_fd, 0)->instance, 1);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
 					.duration_ms = job_sched_params.duration_ms,
@@ -702,7 +754,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
 		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
-			  xe_engine(vf_fd, 0)->instance);
+			  xe_engine(vf_fd, 0)->instance, 1);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
 					.duration_ms = duration_ms,
-- 
2.31.1

