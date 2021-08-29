Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24B989DA6
 for <igt-dev@lists.freedesktop.org>; Sun, 29 Aug 2021 20:22:40 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Mon, 30 Aug 2021 01:45:59 +0530
Message-Id: <20210829201559.656-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_schedule: Resolve
 missing context for independent subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Resolved missing context id in exec buf, and passing created context
to igt spin .
This change would fix test assertion in gem_execbuf for independent
subtest

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_schedule.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 62d616f3..846a863f 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -363,6 +363,7 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 	uint32_t scratch, batch;
 	uint32_t *ptr;
 	int fence;
+	const intel_ctx_t *tmp_ctx;
 	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id), scratch_offset;
 
 	scratch = gem_create(fd, 4096);
@@ -380,22 +381,24 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 		if (!gem_class_can_store_dword(fd, e->class))
 			continue;
 
+		tmp_ctx = intel_ctx_create(fd, &ctx->cfg);
 		if (spin == NULL) {
 			spin = __igt_spin_new(fd,
 					      .ahnd = ahnd,
-					      .ctx = ctx,
+					      .ctx = tmp_ctx,
 					      .engine = e->flags,
 					      .flags = flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 eb = {
 				.buffer_count = 1,
 				.buffers_ptr = to_user_pointer(&spin->obj[IGT_SPIN_BATCH]),
+				.rsvd1 = tmp_ctx->id,
 				.flags = e->flags,
 			};
 			gem_execbuf(fd, &eb);
 		}
 
-		store_dword_fenced(fd, ahnd, ctx, e->flags,
+		store_dword_fenced(fd, ahnd, tmp_ctx, e->flags,
 				   scratch, scratch_offset,
 				   0, e->flags, fence, 0);
 	}
-- 
2.25.1
