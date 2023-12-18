Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307D10E259
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:30:23 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v8 5/6] lib/xe/xe_util: Align obj size before bind/unbind
Date: Mon, 18 Dec 2023 13:14:38 -0800
Message-Id: <95b7638b2596406821f7356f0b67f52c91650277.1702933241.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702933241.git.akshata.jahagirdar@intel.com>
References: <cover.1702933241.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, igt-dev@lists.freedesktop.org,
 matthew.auld@intel.com, akshata.jahagirdar@intel.com, ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For 512 x 512 x 32pp, the ccs size comes to 2048B.
This size of surf-ctrl-copy smaller than page size
isn't properly handled in the blitter library code.
To address this issue, align the size to 4096 before vm bind/unbind operation.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index ba8eece71..6321a5729 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -148,7 +148,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(int xe,
 		ops->flags = flags;
 		ops->obj_offset = 0;
 		ops->addr = obj->offset;
-		ops->range = obj->size;
+		ops->range = ALIGN(obj->size, 4096);
 		ops->prefetch_mem_region_instance = 0;
 		if (obj->pat_index == DEFAULT_PAT_INDEX)
 			ops->pat_index = intel_get_pat_idx_wb(xe);
-- 
2.34.1
