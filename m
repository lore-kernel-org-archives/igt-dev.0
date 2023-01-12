Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6121510E8E2
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 13:16:43 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emma Anholt <emma@anholt.net>,
 Jason Ekstrand <jason.ekstrand@collabora.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Rob Clark <robdclark@chromium.org>
Date: Thu, 12 Jan 2023 10:15:32 -0300
Message-Id: <20230112131534.29777-5-mcanal@igalia.com>
In-Reply-To: <20230112131534.29777-1-mcanal@igalia.com>
References: <20230112131534.29777-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/6] lib/v3d: Add a helper to create a
 noop job
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

A noop job is a minimal job that can be used for tests to make sure that the
scheduler has executed a job and it will make it possible to test V3D
functionalities, such as the multisync extension. To create a noop job, use
the V3D packet header to emit CL commands and create a valid submission
to the GPU.

The IGT's noop job was inspired by Mesa's noop job [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/22.3/src/broadcom/vulkan/v3dvx_queue.c

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c | 165 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_v3d.h |   3 +
 2 files changed, 168 insertions(+)

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 68d11d7f..0aed1af8 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -37,6 +37,9 @@
 #include "igt_v3d.h"
 #include "ioctl_wrappers.h"
 
+#include "v3d/v3d_cl.h"
+#include "v3d/v3d_packet.h"
+
 /**
  * SECTION:igt_v3d
  * @short_description: V3D support library
@@ -159,3 +162,165 @@ void igt_v3d_perfmon_destroy(int fd, uint32_t id)
 
 	do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_DESTROY, &destroy);
 }
+
+static void v3d_cl_init(int fd, struct v3d_cl **cl)
+{
+	struct v3d_bo *bo = igt_v3d_create_bo(fd, PAGE_SIZE);
+
+	*cl = calloc(1, sizeof(**cl));
+
+	igt_v3d_bo_mmap(fd, bo);
+
+	(*cl)->bo = bo;
+	(*cl)->base = bo->map;
+	(*cl)->size = bo->size;
+	(*cl)->next = (*cl)->base;
+}
+
+static void v3d_cl_destroy(int fd, struct v3d_cl *cl)
+{
+	igt_v3d_free_bo(fd, cl->bo);
+	free(cl);
+}
+
+struct v3d_cl_job *igt_v3d_noop_job(int fd)
+{
+	struct v3d_cl_job *job;
+	struct v3d_cl_reloc tile_list_start;
+	uint32_t *bos;
+
+	job = calloc(1, sizeof(*job));
+
+	job->tile_alloc = igt_v3d_create_bo(fd, 131 * PAGE_SIZE);
+	job->tile_state = igt_v3d_create_bo(fd, PAGE_SIZE);
+
+	v3d_cl_init(fd, &job->bcl);
+	v3d_cl_init(fd, &job->rcl);
+	v3d_cl_init(fd, &job->icl);
+
+	cl_emit(job->bcl, NUMBER_OF_LAYERS, config) {
+		config.number_of_layers = 1;
+	}
+
+	cl_emit(job->bcl, TILE_BINNING_MODE_CFG, config) {
+		config.width_in_pixels = 1;
+		config.height_in_pixels = 1;
+		config.number_of_render_targets = 1;
+		config.multisample_mode_4x = false;
+		config.double_buffer_in_non_ms_mode = false;
+		config.maximum_bpp_of_all_render_targets = V3D_INTERNAL_BPP_32;
+	}
+
+	/* There's definitely nothing in the VCD cache we want. */
+	cl_emit(job->bcl, FLUSH_VCD_CACHE, bin);
+
+	/* "Binning mode lists must have a Start Tile Binning item (6) after
+	*  any prefix state data before the binning list proper starts."
+	*/
+	cl_emit(job->bcl, START_TILE_BINNING, bin);
+
+	cl_emit(job->bcl, FLUSH, flush);
+
+	cl_emit(job->rcl, TILE_RENDERING_MODE_CFG_COMMON, config) {
+		config.early_z_disable = true;
+		config.image_width_pixels = 1;
+		config.image_height_pixels = 1;
+		config.number_of_render_targets = 1;
+		config.multisample_mode_4x = false;
+		config.maximum_bpp_of_all_render_targets = V3D_INTERNAL_BPP_32;
+	}
+
+	cl_emit(job->rcl, TILE_RENDERING_MODE_CFG_COLOR, rt) {
+		rt.render_target_0_internal_bpp = V3D_INTERNAL_BPP_32;
+		rt.render_target_0_internal_type = V3D_INTERNAL_TYPE_8;
+		rt.render_target_0_clamp = V3D_RENDER_TARGET_CLAMP_NONE;
+	}
+
+	cl_emit(job->rcl, TILE_RENDERING_MODE_CFG_ZS_CLEAR_VALUES, clear) {
+		clear.z_clear_value = 1.0f;
+		clear.stencil_clear_value = 0;
+	};
+
+	cl_emit(job->rcl, TILE_LIST_INITIAL_BLOCK_SIZE, init) {
+		init.use_auto_chained_tile_lists = true;
+		init.size_of_first_block_in_chained_tile_lists = TILE_ALLOCATION_BLOCK_SIZE_64B;
+	}
+
+	cl_emit(job->rcl, MULTICORE_RENDERING_TILE_LIST_SET_BASE, list) {
+		list.address = v3d_cl_address(job->tile_alloc, 0);
+	}
+
+	cl_emit(job->rcl, MULTICORE_RENDERING_SUPERTILE_CFG, config) {
+		config.number_of_bin_tile_lists = 1;
+		config.total_frame_width_in_tiles = 1;
+		config.total_frame_height_in_tiles = 1;
+		config.supertile_width_in_tiles = 1;
+		config.supertile_height_in_tiles = 1;
+		config.total_frame_width_in_supertiles = 1;
+		config.total_frame_height_in_supertiles = 1;
+	}
+
+	tile_list_start = v3d_cl_get_address(job->icl);
+
+	cl_emit(job->icl, TILE_COORDINATES_IMPLICIT, coords);
+
+	cl_emit(job->icl, END_OF_LOADS, end);
+
+	cl_emit(job->icl, BRANCH_TO_IMPLICIT_TILE_LIST, branch);
+
+	cl_emit(job->icl, STORE_TILE_BUFFER_GENERAL, store) {
+		store.buffer_to_store = NONE;
+	}
+
+	cl_emit(job->icl, END_OF_TILE_MARKER, end);
+
+	cl_emit(job->icl, RETURN_FROM_SUB_LIST, ret);
+
+	cl_emit(job->rcl, START_ADDRESS_OF_GENERIC_TILE_LIST, branch) {
+		branch.start = tile_list_start;
+		branch.end = v3d_cl_get_address(job->icl);
+	}
+
+	cl_emit(job->rcl, SUPERTILE_COORDINATES, coords) {
+		coords.column_number_in_supertiles = 0;
+		coords.row_number_in_supertiles = 0;
+	}
+
+	cl_emit(job->rcl, END_OF_RENDERING, end);
+
+	job->submit = calloc(1, sizeof(*job->submit));
+
+	job->submit->bcl_start = job->bcl->bo->offset;
+	job->submit->bcl_end = job->bcl->bo->offset + v3d_cl_offset(job->bcl);
+	job->submit->rcl_start = job->rcl->bo->offset;
+	job->submit->rcl_end = job->rcl->bo->offset + v3d_cl_offset(job->rcl);
+
+	job->submit->qma = job->tile_alloc->offset;
+	job->submit->qms = job->tile_alloc->size;
+	job->submit->qts = job->tile_state->offset;
+
+	job->submit->bo_handle_count = 5;
+	bos = malloc(sizeof(*bos) * job->submit->bo_handle_count);
+
+	bos[0] = job->bcl->bo->handle;
+	bos[1] = job->tile_alloc->handle;
+	bos[2] = job->tile_state->handle;
+	bos[3] = job->rcl->bo->handle;
+	bos[4] = job->icl->bo->handle;
+
+	job->submit->bo_handles = to_user_pointer(bos);
+
+	return job;
+}
+
+void igt_v3d_free_cl_job(int fd, struct v3d_cl_job *job)
+{
+	free(from_user_pointer(job->submit->bo_handles));
+	igt_v3d_free_bo(fd, job->tile_alloc);
+	igt_v3d_free_bo(fd, job->tile_state);
+	v3d_cl_destroy(fd, job->bcl);
+	v3d_cl_destroy(fd, job->rcl);
+	v3d_cl_destroy(fd, job->icl);
+	free(job->submit);
+	free(job);
+}
diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index 2533d7c4..c3799096 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -60,4 +60,7 @@ uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncounters, uint8_t *counters);
 void igt_v3d_perfmon_get_values(int fd, uint32_t id);
 void igt_v3d_perfmon_destroy(int fd, uint32_t id);
 
+struct v3d_cl_job *igt_v3d_noop_job(int fd);
+void igt_v3d_free_cl_job(int fd, struct v3d_cl_job *job);
+
 #endif /* IGT_V3D_H */
-- 
2.39.0
