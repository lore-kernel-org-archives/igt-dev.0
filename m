Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923006E415
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 08:08:24 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Mon, 20 Sep 2021 13:26:23 +0530
Message-Id: <20210920075623.31580-1-vidya.srinivas@intel.com>
In-Reply-To: <20210916141227.17554-1-vidya.srinivas@intel.com>
References: <20210916141227.17554-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_bufops: Fix regression on 5.4
 kernel
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
Cc: Bhanuprakash.Modem@intel.com, markyacoub@google.com, zbigniew.kempczynski@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>
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

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 lib/intel_bufops.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index f5f67eddabd7..1caebdf2962a 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -818,8 +818,10 @@ static void __intel_buf_init(struct buf_ops *bops,
 
 	if (handle)
 		buf->handle = handle;
-	else
-		buf->handle = gem_create_in_memory_regions(bops->fd, size, region);
+	else {
+		if( __gem_create_in_memory_regions(bops->fd, &handle, size, region) != 0)
+			buf->handle = gem_create(bops->fd, size);
+	}
 
 	set_hw_tiled(bops, buf);
 }
-- 
2.33.0
