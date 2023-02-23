Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBC610E4BE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 10:53:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 11:53:21 +0100
Message-Id: <20230223105321.49048-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230223105321.49048-1-zbigniew.kempczynski@intel.com>
References: <20230223105321.49048-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/i915/gem_create: Use hash helper
 for gem bo pool
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

Remove local 64-bit hash and use common one defined in igt_map.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/i915/gem_create.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/lib/i915/gem_create.c b/lib/i915/gem_create.c
index 1f9b7fcc01..99c839d7db 100644
--- a/lib/i915/gem_create.c
+++ b/lib/i915/gem_create.c
@@ -252,15 +252,6 @@ void gem_pool_dump(void)
 	pthread_mutex_unlock(&pool_mutex);
 }
 
-#define GOLDEN_RATIO_PRIME_64 0x9e37fffffffc0001ULL
-static inline uint32_t hash_pool(const void *val)
-{
-	uint64_t hash = *(uint64_t *) val;
-
-	hash = hash * GOLDEN_RATIO_PRIME_64;
-	return hash >> 32;
-}
-
 static int equal_pool(const void *a, const void *b)
 {
 	struct pool_list *p1 = (struct pool_list *) a;
@@ -356,7 +347,7 @@ void gem_pool_init(void)
 {
 	pthread_mutex_init(&pool_mutex, NULL);
 	__destroy_pool(pool, &pool_mutex);
-	pool = igt_map_create(hash_pool, equal_pool);
+	pool = igt_map_create(igt_map_hash_64, equal_pool);
 }
 
 igt_constructor {
-- 
2.34.1
