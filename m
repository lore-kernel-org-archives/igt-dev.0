Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CAF6E588
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Feb 2021 12:43:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon,  1 Feb 2021 13:36:54 +0100
Message-Id: <20210201123654.1536642-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/prime_vgem: Skip userptr test on !llc.
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

It's bad form to change caching on userptr; it's always assumed
to be cached memory. Soon userptr will be fixed to disallow
this, so change this test to continue working when llc is available.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/prime_vgem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 07ff69a2455d..1b55b9e6d928 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -311,6 +311,7 @@ static void test_userptr(int vgem, int i915)
 	uint32_t *ptr;
 
 	igt_require(has_userptr(i915));
+	igt_require(gem_has_llc(i915));
 
 	scratch.width = 1024;
 	scratch.height = 1024;
@@ -323,7 +324,6 @@ static void test_userptr(int vgem, int i915)
 	*ptr = MI_BATCH_BUFFER_END;
 
 	gem_userptr(i915, ptr, scratch.size, 0, 0, &obj.handle);
-	gem_set_caching(i915, obj.handle, I915_CACHING_NONE); /* for !llc exec */
 
 	gem_execbuf(i915, &execbuf);
 	gem_close(i915, obj.handle);
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
