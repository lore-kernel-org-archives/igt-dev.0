Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Aug 2020 19:26:38 +0100
Message-Id: <20200820182640.65842-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200820182640.65842-1-chris@chris-wilson.co.uk>
References: <20200820182640.65842-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] i915/gem_exec_fence: Cleanup 32bit
 printfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Use PRI[ux]64 for printing 64bit values in a 32bit build.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_fence.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index b240c30bf..0b8ab1400 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2408,7 +2408,7 @@ static void build_wait_bb(struct inter_engine_context *context,
 	uint64_t wait_value =
 		0xffffffffffffffff - (delay * timestamp_frequency) / NSEC_PER_SEC;
 
-	igt_debug("wait_value=0x%lx\n", wait_value);
+	igt_debug("wait_value=0x%"PRIx64"\n", wait_value);
 
 	*bb++ = MI_LOAD_REGISTER_IMM;
 	*bb++ = 0x2000 + HSW_CS_GPR(0);
@@ -2680,7 +2680,7 @@ static void setup_timeline_chain_engines(struct inter_engine_context *context, i
 	}
 
 	for (uint32_t i = 0; i < 10; i++)
-		igt_debug("%u = %lu\n", i, fib(i));
+		igt_debug("%u = %"PRIu64"\n", i, fib(i));
 
 	/* Bootstrap the fibonacci sequence */
 	{
@@ -2759,7 +2759,7 @@ static void test_syncobj_timeline_chain_engines(int fd, struct intel_engine_data
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
 	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
-		igt_debug("engine %i (%s)\t= %016lx\n", i,
+		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
 			  ctx.engines->engines[i].name, counter_output[i]);
 
 	/*
@@ -2825,7 +2825,7 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd, struct intel_
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
 	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
-		igt_debug("engine %i (%s)\t= %016lx\n", i,
+		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
 			  ctx.engines->engines[i].name, counter_output[i]);
 	igt_assert_eq(counter_output[engines->nengines - 1],
 		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
@@ -2886,7 +2886,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, struct intel_en
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
 	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
-		igt_debug("engine %i (%s)\t= %016lx\n", i,
+		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
 			  ctx.engines->engines[i].name, counter_output[i]);
 	igt_assert_eq(counter_output[engines->nengines - 1],
 		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
