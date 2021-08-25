Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD07890F2
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Aug 2021 07:52:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 25 Aug 2021 09:51:49 +0200
Message-Id: <20210825075149.81624-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_exec_params: Fix context within
 which batch is executed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
List-ID: <igt-dev@lists.freedesktop.org>

With new intel_ctx_t we're responsible to set execbuf rsvd1 (context) id
field. As same field exists for exec object there's risk to mechanically
set improper field and compiler won't complain.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index ba79791a1..d247b8a61 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -334,11 +334,11 @@ static void test_larger_than_life_batch(int fd)
 	const intel_ctx_t *ctx = intel_ctx_create_all_physical(fd);
 	struct drm_i915_gem_exec_object2 exec = {
 		.handle = batch_create_size(fd, size),
-		.rsvd1 = ctx->id,
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&exec),
 		.buffer_count = 1,
+		.rsvd1 = ctx->id,
 	};
 
 	/*
-- 
2.26.0
