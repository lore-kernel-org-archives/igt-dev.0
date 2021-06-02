Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B186EE57
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jun 2021 19:54:17 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed,  2 Jun 2021 12:54:00 -0700
Message-Id: <20210602195400.11982-2-ashutosh.dixit@intel.com>
In-Reply-To: <20210602195400.11982-1-ashutosh.dixit@intel.com>
References: <20210602195400.11982-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Use fast WC reads for gem_pread
 fallback
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Replacing pread with an uncached read is abysmmally slow. Replacing
pread with a streaming read is still slow, but at least faster than not.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/ioctl_wrappers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 0c1b5e3230..619d288a8a 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -55,6 +55,7 @@
 #include "intel_io.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
+#include "igt_x86.h"
 #include "config.h"
 #include "i915/gem_mman.h"
 
@@ -385,7 +386,7 @@ static void mmap_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint6
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_WC, 0);
 	}
 
-	memcpy(buf, map + offset, length);
+	igt_memcpy_from_wc(buf, map + offset, length);
 	munmap(map, offset + length);
 }
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
