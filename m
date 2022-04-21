Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09DA10F40F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 06:10:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 08:09:54 +0200
Message-Id: <20220421060955.21016-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220421060955.21016-1-zbigniew.kempczynski@intel.com>
References: <20220421060955.21016-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/i915/gem_exec_schedule: Don't use
 default context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Config created on top of all physical devices may provide more devices
than default context contains. Using engine id from such "richer"
context is wrong when default context will be chosen for this engine.
Add dedicated context to handle all engines covered by context cfg.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/5444 (timeslicing)
---
 tests/i915/gem_exec_schedule.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index caeac255de..dfcff849c8 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -568,7 +568,7 @@ static void timeslice(int i915, const intel_ctx_cfg_t *cfg,
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 	};
-	const intel_ctx_t *ctx;
+	const intel_ctx_t *ctx[2];
 	uint32_t *result;
 	int out;
 
@@ -582,22 +582,25 @@ static void timeslice(int i915, const intel_ctx_cfg_t *cfg,
 	igt_require(gem_scheduler_has_timeslicing(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
+	ctx[0] = intel_ctx_create(i915, cfg);
 	obj.handle = timeslicing_batches(i915, &offset);
 	result = gem_mmap__device_coherent(i915, obj.handle, 0, 4096, PROT_READ);
 
 	execbuf.flags = engine | I915_EXEC_FENCE_OUT;
 	execbuf.batch_start_offset = 0;
+	execbuf.rsvd1 = ctx[0]->id;
 	gem_execbuf_wr(i915, &execbuf);
+	intel_ctx_destroy(i915, ctx[0]);
 
 	/* No coupling between requests; free to timeslice */
 
-	ctx = intel_ctx_create(i915, cfg);
-	execbuf.rsvd1 = ctx->id;
+	ctx[1] = intel_ctx_create(i915, cfg);
+	execbuf.rsvd1 = ctx[1]->id;
 	execbuf.rsvd2 >>= 32;
 	execbuf.flags = engine | I915_EXEC_FENCE_OUT;
 	execbuf.batch_start_offset = offset;
 	gem_execbuf_wr(i915, &execbuf);
-	intel_ctx_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx[1]);
 
 	gem_sync(i915, obj.handle);
 	gem_close(i915, obj.handle);
-- 
2.32.0
