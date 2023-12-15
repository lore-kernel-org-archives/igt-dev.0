Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D9E10E32A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 09:10:06 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v7 5/6] lib/xe/xe_util: Align obj size before bind/unbind
Date: Fri, 15 Dec 2023 13:09:46 -0800
Message-Id: <bc8dbf562ddfacda2deb52dfd68be6ce675656aa.1702674322.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702674322.git.akshata.jahagirdar@intel.com>
References: <cover.1702674322.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>, akshata.jahagirdar@intel.co,
 ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Alter the range to default_alignment before vm bind/unbind operation to
align the buffer object size with page size.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
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
