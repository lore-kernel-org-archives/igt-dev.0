Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed,  4 Mar 2020 10:58:40 +0100
Message-Id: <20200304095841.8781-3-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200304095841.8781-1-janusz.krzysztofik@linux.intel.com>
References: <20200304095841.8781-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/gem_userptr_blits: More exact
 detection of lockdep loop prevention
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

If mmap-offset over userptr fails, skip with respective message about
lockdep loop preventive failure occurrence only if ENODEV, fail
otherwise.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_userptr_blits.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 8148d7d76..95e90c40a 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -818,7 +818,10 @@ static void test_mmap_offset_invalidate(int fd, const struct mmap_offset *t)
 	/* set up mmap-offset mapping on top of the object, skip if refused */
 	map = __gem_mmap_offset(fd, handle, 0, PAGE_SIZE,
 				PROT_READ | PROT_WRITE, t->type);
-	igt_require_f(map, "mmap-offset banned, lockdep loop prevention\n");
+	igt_skip_on_f(!map && errno == ENODEV,
+		      "mmap-offset(%s) banned, lockdep loop prevention\n",
+		      t->name);
+	igt_assert(map);
 
 	/* set object pages in order to activate MMU notifier for it */
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
