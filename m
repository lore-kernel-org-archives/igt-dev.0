Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 19 Feb 2020 12:13:12 +0000
Message-Id: <20200219121312.1428041-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_vm_create: Call set-domain manually
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Since we are secretly using execbuf to write into an object's location,
then read back from the object we must manually handle the domain
changes.

Closes: https://gitlab.freedesktop.org/drm/intel/issues/314
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_vm_create.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
index cbd273d9d..e14b07b5f 100644
--- a/tests/i915/gem_vm_create.c
+++ b/tests/i915/gem_vm_create.c
@@ -324,11 +324,15 @@ static void isolation(int i915)
 	gem_execbuf(i915, &eb); /* bind object into vm[0] */
 
 	/* Verify the trick with the assumed target address works */
+	gem_set_domain(i915, obj[0].handle,
+		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	write_to_address(i915, ctx[0], obj[0].offset, 1);
 	gem_read(i915, obj[0].handle, 0, &result, sizeof(result));
 	igt_assert_eq(result, 1);
 
 	/* Now check that we can't write to vm[0] from second fd/vm */
+	gem_set_domain(i915, obj[0].handle,
+		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	write_to_address(other, ctx[1], obj[0].offset, 2);
 	gem_read(i915, obj[0].handle, 0, &result, sizeof(result));
 	igt_assert_eq(result, 1);
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
