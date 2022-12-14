Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D4C10E05F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 10:51:53 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 11:51:42 +0100
Message-Id: <20221214105142.249666-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_ccs: Fix memory leak in
 destroy_object
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

Free the copy object itself after gem_close

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/gem_ccs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index 4ecb3e36..00f08eea 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -141,6 +141,7 @@ static void destroy_object(int i915, struct blt_copy_object *obj)
 		munmap(obj->ptr, obj->size);
 
 	gem_close(i915, obj->handle);
+	free(obj);
 }
 
 static void set_blt_object(struct blt_copy_object *obj,
-- 
2.25.1
