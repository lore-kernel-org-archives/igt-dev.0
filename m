Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290F2892B6
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 08:51:27 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Mon,  5 Jul 2021 10:51:08 +0200
Message-Id: <20210705085108.5476-3-andrzej.turko@linux.intel.com>
In-Reply-To: <20210705085108.5476-1-andrzej.turko@linux.intel.com>
References: <20210705085108.5476-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_softpin: Test eviction
 on a fixed address
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
List-ID: <igt-dev@lists.freedesktop.org>

Check if the error -28 still occurs on execbuf
when submitting batches with a fixed address.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
---
 tests/i915/gem_softpin.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index 0af1c4476..1c2bdf26c 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -913,11 +913,8 @@ static void submit(int fd, int gen,
 	j = 0;
 	for (unsigned i = 0; i < count; i++) {
 		obj.handle = batches[i].handle;
-		obj.offset = __intel_allocator_alloc(ahnd, obj.handle,
-						     BATCH_SIZE,
-						     BATCH_ALIGNMENT,
-						     ALLOC_STRATEGY_HIGH_TO_LOW);
-		for (; obj.offset == -1; j = (j+1) % count) {
+		obj.offset = 0;
+		for (; obj.offset == ALLOC_INVALID_ADDRESS; j = (j+1) % count) {
 			if (i != j)
 				intel_allocator_free(ahnd, batches[j].handle);
 			obj.offset = __intel_allocator_alloc(ahnd, obj.handle,
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
