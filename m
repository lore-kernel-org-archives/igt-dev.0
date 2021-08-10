Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D16089DEA
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:27:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:10 +0200
Message-Id: <20210810052711.7866-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 04/65] lib/intel_batchbuffer: Ensure
 relocation code will be called
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
List-ID: <igt-dev@lists.freedesktop.org>

Currently we're not sure relocations code will be called (presumed_offset
== offset == 0) so enforce them. Passing presumed_offset and offset to
auxiliary functions will prepare code to switch to no-reloc mode.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_batchbuffer.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 2b8b903e2..3747019a5 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -679,24 +679,27 @@ static uint32_t fast_copy_dword1(unsigned int src_tiling,
 
 static void
 fill_relocation(struct drm_i915_gem_relocation_entry *reloc,
-		uint32_t gem_handle, uint32_t delta, /* in bytes */
+		uint32_t gem_handle, uint64_t presumed_offset,
+		uint32_t delta, /* in bytes */
 		uint32_t offset, /* in dwords */
 		uint32_t read_domains, uint32_t write_domains)
 {
 	reloc->target_handle = gem_handle;
 	reloc->delta = delta;
 	reloc->offset = offset * sizeof(uint32_t);
-	reloc->presumed_offset = 0;
+	reloc->presumed_offset = presumed_offset;
 	reloc->read_domains = read_domains;
 	reloc->write_domain = write_domains;
 }
 
 static void
-fill_object(struct drm_i915_gem_exec_object2 *obj, uint32_t gem_handle,
+fill_object(struct drm_i915_gem_exec_object2 *obj,
+	    uint32_t gem_handle, uint64_t gem_offset,
 	    struct drm_i915_gem_relocation_entry *relocs, uint32_t count)
 {
 	memset(obj, 0, sizeof(*obj));
 	obj->handle = gem_handle;
+	obj->offset = gem_offset;
 	obj->relocation_count = count;
 	obj->relocs_ptr = to_user_pointer(relocs);
 }
@@ -881,14 +884,14 @@ void igt_blitter_src_copy(int fd,
 	batch_handle = gem_create(fd, 4096);
 	gem_write(fd, batch_handle, 0, batch, sizeof(batch));
 
-	fill_relocation(&relocs[0], dst_handle, dst_delta, dst_reloc_offset,
+	fill_relocation(&relocs[0], dst_handle, -1, dst_delta, dst_reloc_offset,
 			I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER);
-	fill_relocation(&relocs[1], src_handle, src_delta, src_reloc_offset,
+	fill_relocation(&relocs[1], src_handle, -1, src_delta, src_reloc_offset,
 			I915_GEM_DOMAIN_RENDER, 0);
 
-	fill_object(&objs[0], dst_handle, NULL, 0);
-	fill_object(&objs[1], src_handle, NULL, 0);
-	fill_object(&objs[2], batch_handle, relocs, 2);
+	fill_object(&objs[0], dst_handle, 0, NULL, 0);
+	fill_object(&objs[1], src_handle, 0, NULL, 0);
+	fill_object(&objs[2], batch_handle, 0, relocs, 2);
 
 	objs[0].flags |= EXEC_OBJECT_NEEDS_FENCE;
 	objs[1].flags |= EXEC_OBJECT_NEEDS_FENCE;
@@ -978,13 +981,14 @@ void igt_blitter_fast_copy__raw(int fd,
 	batch_handle = gem_create(fd, 4096);
 	gem_write(fd, batch_handle, 0, batch, sizeof(batch));
 
-	fill_relocation(&relocs[0], dst_handle, dst_delta, 4,
+	fill_relocation(&relocs[0], dst_handle, -1, dst_delta, 4,
 			I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER);
-	fill_relocation(&relocs[1], src_handle, src_delta, 8, I915_GEM_DOMAIN_RENDER, 0);
+	fill_relocation(&relocs[1], src_handle, -1, src_delta, 8,
+			I915_GEM_DOMAIN_RENDER, 0);
 
-	fill_object(&objs[0], dst_handle, NULL, 0);
-	fill_object(&objs[1], src_handle, NULL, 0);
-	fill_object(&objs[2], batch_handle, relocs, 2);
+	fill_object(&objs[0], dst_handle, 0, NULL, 0);
+	fill_object(&objs[1], src_handle, 0, NULL, 0);
+	fill_object(&objs[2], batch_handle, 0, relocs, 2);
 
 	exec_blit(fd, objs, 3, intel_gen(intel_get_drm_devid(fd)));
 
-- 
2.26.0
