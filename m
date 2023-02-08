Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C832610E82B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 18:22:02 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Iago Toral Quiroga <itoral@igalia.com>
Date: Wed,  8 Feb 2023 15:21:21 -0300
Message-Id: <20230208182122.187248-2-mcanal@igalia.com>
In-Reply-To: <20230208182122.187248-1-mcanal@igalia.com>
References: <20230208182122.187248-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/3] lib/v3d: Add a helper to create a
 empty shader
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

In order to submit a compute dispatch job, a BO must contain the
assembly shader that corresponds to the job. Therefore, create a helper
to encapsulate a simple compute dispatch job. This helper sets the
configurations (cfg) needed for the job and has the assembled instructions
necessary to process an empty shader, just like the following one:

    #version 310 es
    layout (local_size_x = 1) in;
    void main (void) {}

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_v3d.h | 20 +++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 41ea32fc..48ec448e 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -355,3 +355,63 @@ void igt_v3d_free_cl_job(int fd, struct v3d_cl_job *job)
 	free(job->submit);
 	free(job);
 }
+
+struct v3d_csd_job *igt_v3d_empty_shader(int fd)
+{
+	struct v3d_csd_job *job;
+	uint32_t *bos;
+
+	/* Reproduce an empty shader */
+	const uint32_t assembly[] = { 0xbb800000, 0x3c203186,
+				      0xbb800000, 0x3c003186,
+				      0xbb800000, 0x3c003186 };
+	const uint32_t group_count_x = 1, group_count_y = 1, group_count_z = 1;
+	const uint32_t num_batches = 1, wgs_per_sg = 1, batches_per_sg = 1, wg_size = 1;
+
+	job = calloc(1, sizeof(*job));
+
+	job->shader_assembly = igt_v3d_create_bo(fd, PAGE_SIZE);
+	job->cl = igt_v3d_create_bo(fd, PAGE_SIZE);
+	job->submit = calloc(1, sizeof(*job->submit));
+
+	igt_v3d_bo_mmap(fd, job->shader_assembly);
+	igt_v3d_bo_mmap(fd, job->cl);
+
+	memset(job->shader_assembly->map, 0, sizeof(*job->shader_assembly->map));
+	memcpy(job->shader_assembly->map, assembly, sizeof(assembly));
+	memset(job->cl->map, 0, sizeof(*job->cl->map));
+
+	job->submit->bo_handle_count = 2;
+	bos = malloc(sizeof(*bos) * job->submit->bo_handle_count);
+	bos[0] = job->shader_assembly->handle;
+	bos[1] = job->cl->handle;
+
+	job->submit->bo_handles = to_user_pointer(bos);
+
+	job->submit->cfg[0] |= group_count_x << V3D_CSD_CFG012_WG_COUNT_SHIFT;
+	job->submit->cfg[1] |= group_count_y << V3D_CSD_CFG012_WG_COUNT_SHIFT;
+	job->submit->cfg[2] |= group_count_z << V3D_CSD_CFG012_WG_COUNT_SHIFT;
+
+	job->submit->cfg[3] |= (wgs_per_sg & 0xf) << V3D_CSD_CFG3_WGS_PER_SG_SHIFT;
+	job->submit->cfg[3] |= (batches_per_sg - 1) << V3D_CSD_CFG3_BATCHES_PER_SG_M1_SHIFT;
+	job->submit->cfg[3] |= (wg_size & 0xff) << V3D_CSD_CFG3_WG_SIZE_SHIFT;
+
+	job->submit->cfg[4] = num_batches - 1;
+
+	job->submit->cfg[5] = job->shader_assembly->offset | V3D_CSD_CFG5_PROPAGATE_NANS;
+	job->submit->cfg[5] |= V3D_CSD_CFG5_SINGLE_SEG;
+	job->submit->cfg[5] |= V3D_CSD_CFG5_THREADING;
+
+	job->submit->cfg[6] = job->cl->offset;
+
+	return job;
+}
+
+void igt_v3d_free_csd_job(int fd, struct v3d_csd_job *job)
+{
+	free(from_user_pointer(job->submit->bo_handles));
+	igt_v3d_free_bo(fd, job->shader_assembly);
+	igt_v3d_free_bo(fd, job->cl);
+	free(job->submit);
+	free(job);
+}
diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index 2cf7fbd8..b96a3b43 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -28,6 +28,17 @@
 
 #define PAGE_SIZE 4096
 
+#define V3D_CSD_CFG012_WG_COUNT_SHIFT 16
+/* Batches per supergroup minus 1.  8 bits. */
+#define V3D_CSD_CFG3_BATCHES_PER_SG_M1_SHIFT 12
+/* Workgroups per supergroup, 0 means 16 */
+#define V3D_CSD_CFG3_WGS_PER_SG_SHIFT 8
+#define V3D_CSD_CFG3_WG_SIZE_SHIFT 0
+
+#define V3D_CSD_CFG5_PROPAGATE_NANS (1 << 2)
+#define V3D_CSD_CFG5_SINGLE_SEG (1 << 1)
+#define V3D_CSD_CFG5_THREADING (1 << 0)
+
 struct v3d_cl;
 
 struct v3d_bo {
@@ -46,6 +57,12 @@ struct v3d_cl_job {
 	struct v3d_bo *tile_state;
 };
 
+struct v3d_csd_job {
+	struct drm_v3d_submit_csd *submit;
+	struct v3d_bo *shader_assembly;
+	struct v3d_bo *cl;
+};
+
 struct v3d_bo *igt_v3d_create_bo(int fd, size_t size);
 void igt_v3d_free_bo(int fd, struct v3d_bo *bo);
 
@@ -67,4 +84,7 @@ void igt_v3d_set_multisync(struct drm_v3d_multi_sync *ms, enum v3d_queue wait_st
 struct v3d_cl_job *igt_v3d_noop_job(int fd);
 void igt_v3d_free_cl_job(int fd, struct v3d_cl_job *job);
 
+struct v3d_csd_job *igt_v3d_empty_shader(int fd);
+void igt_v3d_free_csd_job(int fd, struct v3d_csd_job *job);
+
 #endif /* IGT_V3D_H */
-- 
2.39.1
