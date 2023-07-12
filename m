Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771F510E5C0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:15:43 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:11 +0200
Message-Id: <20230712171231.290555-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 01/21] lib/intel_blt: Add
 blt_ctrl_surf_object() helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In the series we start using this more time so it's worth to add
it as common code.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 11 +++++++++++
 lib/intel_blt.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index bc28f15e8d..a3d67f5136 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1390,6 +1390,17 @@ void blt_set_copy_object(struct blt_copy_object *obj,
 	memcpy(obj, orig, sizeof(*obj));
 }
 
+void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
+			      uint32_t handle, uint32_t region, uint64_t size,
+			      uint8_t mocs, enum blt_access_type access_type)
+{
+	obj->handle = handle;
+	obj->region = region;
+	obj->size = size;
+	obj->mocs = mocs;
+	obj->access_type = access_type;
+}
+
 /**
  * blt_surface_fill_rect:
  * @fd: drm fd
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 9c4ddc7a89..2aa1259ae8 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -248,6 +248,9 @@ void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
 			enum blt_surface_type surface_type);
 void blt_set_copy_object(struct blt_copy_object *obj,
 			 const struct blt_copy_object *orig);
+void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
+			      uint32_t handle, uint32_t region, uint64_t size,
+			      uint8_t mocs, enum blt_access_type access_type);
 
 void blt_surface_info(const char *info,
 		      const struct blt_copy_object *obj);
-- 
2.34.1
