Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7B189FF7
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 10:59:48 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Mon, 20 Sep 2021 16:17:47 +0530
Message-Id: <20210920104747.27916-1-vidya.srinivas@intel.com>
In-Reply-To: <20210920092455.19691-1-vidya.srinivas@intel.com>
References: <20210920092455.19691-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] lib/intel_bufops: Fix regression on 5.4 kernel
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
Cc: Bhanuprakash.Modem@intel.com, markyacoub@google.com, zbigniew.kempczynski@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Starting commit 8759c4a3020ce4 "Add intel_buf_init_in_region"
__intel_buf_init uses gem_create_in_memory_regions instead of
gem_create. Older kernels like 5.4 still dont have support for
I915_GEM_CREATE_EXT_MEMORY_REGIONS (i915_gem_create_ext_ioctl)
from kernel commit (https://patchwork.freedesktop.org/patch/431581/?series=89648&rev=1)
Due to this, the flip-vs-fences tests are failing on kernel 5.4
Patch adds fall back to gem_create when __gem_create_in_memory_region_list fails.

v2 - Addressed review comments from Zbigniew and Mark
Added the fall back in __intel_buf_init

v3 - Fixed space issue - review comment from Zbigniew

v4 - Addressed review comments from Bhanu

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/intel_bufops.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index f5f67eddabd7..d1395c1605d2 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -818,8 +818,12 @@ static void __intel_buf_init(struct buf_ops *bops,
 
 	if (handle)
 		buf->handle = handle;
-	else
-		buf->handle = gem_create_in_memory_regions(bops->fd, size, region);
+	else {
+		if (!__gem_create_in_memory_regions(bops->fd, &handle, size, region))
+			buf->handle = handle;
+		else
+			buf->handle = gem_create(bops->fd, size);
+	}
 
 	set_hw_tiled(bops, buf);
 }
-- 
2.32.0
