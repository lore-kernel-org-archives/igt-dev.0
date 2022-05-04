Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 May 2022 16:08:45 +0100
Message-Id: <20220504150845.158789-2-matthew.auld@intel.com>
In-Reply-To: <20220504150845.158789-1-matthew.auld@intel.com>
References: <20220504150845.158789-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_workarounds: handle
 discrete
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

On discrete the object should already be using I915_CACHING_CACHED, by
default, for system memory objects, although we can no longer explicitly
control the PTE caching bits.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/4873
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 tests/i915/gem_workarounds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 3d185127..70967b3f 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -107,7 +107,8 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(i915, result_sz);
-	gem_set_caching(i915, obj[0].handle, I915_CACHING_CACHED);
+	if (!gem_has_lmem(i915))
+		gem_set_caching(i915, obj[0].handle, I915_CACHING_CACHED);
 	obj[1].handle = gem_create(i915, batch_sz);
 	obj[1].relocs_ptr = to_user_pointer(reloc);
 	obj[1].relocation_count = !ahnd ? num_wa_regs : 0;
-- 
2.34.1
