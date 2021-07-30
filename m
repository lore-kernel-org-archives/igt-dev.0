Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 30 Jul 2021 09:53:42 +0100
Message-Id: <20210730085348.2326899-5-matthew.auld@intel.com>
In-Reply-To: <20210730085348.2326899-1-matthew.auld@intel.com>
References: <20210730085348.2326899-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 05/11] lib/i915/gem_mman: update
 mmap_offset_types with FIXED
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

We need to also iterate the fixed mode in the tests which rely on this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/i915/gem_mman.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index c134e973..c69dc6f5 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -621,6 +621,7 @@ const struct mmap_offset mmap_offset_types[] = {
 	{ "wb", I915_MMAP_OFFSET_WB, I915_GEM_DOMAIN_CPU },
 	{ "wc", I915_MMAP_OFFSET_WC, I915_GEM_DOMAIN_WC },
 	{ "uc", I915_MMAP_OFFSET_UC, I915_GEM_DOMAIN_WC },
+	{ "fixed", I915_MMAP_OFFSET_FIXED, 0},
 	{},
 };
 
-- 
2.26.3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
