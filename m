Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808BB6E8C2
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 12:00:18 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 19 Aug 2021 13:59:42 +0200
Message-Id: <20210819115942.23920-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
References: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/igt_fb: Support fbs backed by local
 memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: apoorva1.singh@intel.com, zbigniew.kempczynski@intel.com, Ramalingam C <ramalingam.c@intel.com>, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Dominik Grzegorzek <dominik.grzegorzek@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

When local memory is supported, buffer object, backing the framebuffer
should be allocated from local memory.

Dumb buffer allocation takes care of this requirement from kernel
itself. So when we allocate BO through gem_create we make sure that
BO is from local memory.

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 lib/igt_fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 2e53d922..618842df 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -49,6 +49,7 @@
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
 #include "intel_bufops.h"
+#include "i915/intel_memory_region.h"
 
 /**
  * SECTION:igt_fb
@@ -1102,9 +1103,10 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 		fb->is_dumb = false;
 
 		if (is_i915_device(fd)) {
+			uint32_t region = gem_has_lmem(fd) ? REGION_LMEM(0) : REGION_SMEM;
 			int err;
 
-			fb->gem_handle = gem_create(fd, fb->size);
+			fb->gem_handle = gem_create_in_memory_regions(fd, fb->size, region);
 			err = __gem_set_tiling(fd, fb->gem_handle,
 					       igt_fb_mod_to_tiling(fb->modifier),
 					       fb->strides[0]);
-- 
2.31.1
