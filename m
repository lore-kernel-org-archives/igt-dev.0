Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3184610E5CA
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:15:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:17 +0200
Message-Id: <20230712171231.290555-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 07/21] lib/intel_allocator: Remove
 extensive debugging
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

Debugging map keys comparison leads to produce extensive logging what
in turn obscures analysis. Remove it to get clearer logs.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/intel_allocator.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 09f665fbb9..cf964ccc41 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -1330,9 +1330,6 @@ static int equal_handles(const void *key1, const void *key2)
 {
 	const struct handle_entry *h1 = key1, *h2 = key2;
 
-	alloc_debug("h1: %llx, h2: %llx\n",
-		   (long long) h1->handle, (long long) h2->handle);
-
 	return h1->handle == h2->handle;
 }
 
@@ -1340,9 +1337,6 @@ static int equal_ctx(const void *key1, const void *key2)
 {
 	const struct allocator *a1 = key1, *a2 = key2;
 
-	alloc_debug("a1: <fd: %d, ctx: %u>, a2 <fd: %d, ctx: %u>\n",
-		   a1->fd, a1->ctx, a2->fd, a2->ctx);
-
 	return a1->fd == a2->fd && a1->ctx == a2->ctx;
 }
 
@@ -1350,9 +1344,6 @@ static int equal_vm(const void *key1, const void *key2)
 {
 	const struct allocator *a1 = key1, *a2 = key2;
 
-	alloc_debug("a1: <fd: %d, vm: %u>, a2 <fd: %d, vm: %u>\n",
-		   a1->fd, a1->vm, a2->fd, a2->vm);
-
 	return a1->fd == a2->fd && a1->vm == a2->vm;
 }
 
-- 
2.34.1
