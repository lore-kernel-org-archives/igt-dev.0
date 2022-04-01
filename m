Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Apr 2022 12:09:02 +0100
Message-Id: <20220401110902.446305-2-matthew.auld@intel.com>
In-Reply-To: <20220401110902.446305-1-matthew.auld@intel.com>
References: <20220401110902.446305-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/gem_ctx_engines: handle missing
 set_caching
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Not supported on discrete. Here the object will already have the GTT
caching bits enabled, and the mapping will be WB, which looks inline
with what the test is expecting here.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4926
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 tests/i915/gem_ctx_engines.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index de4b822c..19cf9b05 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -492,7 +492,8 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
 	param.ctx_id = gem_context_create(i915);
 	gem_context_set_param(i915, &param);
 
-	gem_set_caching(i915, results.handle, I915_CACHING_CACHED);
+	if (!gem_has_lmem(i915))
+		gem_set_caching(i915, results.handle, I915_CACHING_CACHED);
 	map = gem_mmap__cpu(i915, results.handle, 0, 4096, PROT_READ);
 	gem_set_domain(i915, results.handle,
 		       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
-- 
2.34.1
