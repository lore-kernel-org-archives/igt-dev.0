Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7C589E08
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Aug 2021 20:05:54 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Tue, 31 Aug 2021 01:29:10 +0530
Message-Id: <20210830195910.11675-1-arjun.melkaveri@intel.com>
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

v2: Passing original ctx id to gem_execbuf

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_schedule.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 62d616f3..e694482f 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -390,12 +390,13 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 			struct drm_i915_gem_execbuffer2 eb = {
 				.buffer_count = 1,
 				.buffers_ptr = to_user_pointer(&spin->obj[IGT_SPIN_BATCH]),
+				.rsvd1 = ctx->id,
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
