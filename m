Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed,  4 Mar 2020 10:58:39 +0100
Message-Id: <20200304095841.8781-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200304095841.8781-1-janusz.krzysztofik@linux.intel.com>
References: <20200304095841.8781-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/gem_userptr_blits: More
 effectively set pages before invalidation
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

It has been observed that mmap-offset-invalidate@wb subtest has never
triggered a lockdep loop complain.  To fix it, don't use the ->domain
field of a mapping type being examined, always set read and write
domains to I915_GEM_DOMAIN_GTT instead.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_userptr_blits.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index cd1a3af27..8148d7d76 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -821,7 +821,7 @@ static void test_mmap_offset_invalidate(int fd, const struct mmap_offset *t)
 	igt_require_f(map, "mmap-offset banned, lockdep loop prevention\n");
 
 	/* set object pages in order to activate MMU notifier for it */
-	gem_set_domain(fd, handle, t->domain, t->domain);
+	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	/* trigger the notifier */
 	munmap(ptr, PAGE_SIZE);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
