Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2596A10E7DC
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 18:12:24 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jan 2023 19:12:04 +0100
Message-Id: <20230111181205.55997-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230111181205.55997-1-zbigniew.kempczynski@intel.com>
References: <20230111181205.55997-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_dummyload: Don't assume
 dependency object size
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

Most of the tests use page size for dependency object so spinner
had this value hardcoded as a default. But there're exceptions
where dependency object is bigger and for softpin path we need to
allow pass this size to properly acquire offsets from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_dummyload.c | 4 +++-
 lib/igt_dummyload.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 17ae21f567..5f3c6b10c7 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -186,10 +186,12 @@ emit_recursive_batch(igt_spin_t *spin,
 	addr += BATCH_SIZE;
 
 	if (opts->dependency) {
+		uint64_t dep_size = opts->dependency_size ?: BATCH_SIZE;
+
 		igt_assert(!(opts->flags & IGT_SPIN_POLL_RUN));
 		if (ahnd)
 			addr_scratch = intel_allocator_alloc_with_strategy(ahnd, opts->dependency,
-									   BATCH_SIZE, 0,
+									   dep_size, 0,
 									   ALLOC_STRATEGY_LOW_TO_HIGH);
 		else
 			addr_scratch = addr;
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index b33507971b..b247ab02b2 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -49,6 +49,7 @@ typedef struct igt_spin_factory {
 	uint32_t ctx_id;
 	const intel_ctx_t *ctx;
 	uint32_t dependency;
+	uint64_t dependency_size;
 	unsigned int engine;
 	unsigned int flags;
 	int fence;
-- 
2.34.1
