Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 15 Nov 2021 16:30:41 -0800
Message-Id: <20211116003042.439107-4-robdclark@gmail.com>
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt v3 3/4] msm: Add helper for cmdstream building
 and submission
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
Cc: Rob Clark <robdclark@chromium.org>, Petri Latvala <petri.latvala@intel.com>, linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A pretty minimal subset compared to what a full gallium driver would
need, but OTOH for igt tests we should only need to emit fairly basic
command stream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_msm.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h |  48 ++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/lib/igt_msm.c b/lib/igt_msm.c
index b9534164..e9cf588f 100644
--- a/lib/igt_msm.c
+++ b/lib/igt_msm.c
@@ -91,6 +91,19 @@ igt_msm_dev_close(struct msm_device *dev)
 	free(dev);
 }
 
+static uint64_t
+get_iova(struct msm_bo *bo)
+{
+	struct drm_msm_gem_info req = {
+			.handle = bo->handle,
+			.info = MSM_INFO_GET_IOVA,
+	};
+
+	do_ioctl(bo->dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+
+	return req.value;
+}
+
 /**
  * igt_msm_bo_new:
  * @dev: the device to allocate the BO from
@@ -115,6 +128,7 @@ igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags)
 	do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
 
 	bo->handle = req.handle;
+	bo->iova = get_iova(bo);
 
 	return bo;
 }
@@ -209,3 +223,91 @@ igt_msm_pipe_close(struct msm_pipe *pipe)
 	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe->submitqueue_id);
 	free(pipe);
 }
+
+/**
+ * igt_msm_cmd_new:
+ * @pipe: the submitqueue to submit cmdstream against
+ * @size: the size of requested cmdstream buffer
+ */
+struct msm_cmd *
+igt_msm_cmd_new(struct msm_pipe *pipe, size_t size)
+{
+	struct msm_cmd *cmd = calloc(1, sizeof(*cmd));
+
+	cmd->pipe = pipe;
+	cmd->cmdstream_bo = igt_msm_bo_new(pipe->dev, size, MSM_BO_WC);
+	cmd->cur = igt_msm_bo_map(cmd->cmdstream_bo);
+
+	__igt_msm_append_bo(cmd, cmd->cmdstream_bo);
+
+	return cmd;
+}
+
+static uint32_t
+cmdstream_size(struct msm_cmd *cmd)
+{
+	uint8_t *start = igt_msm_bo_map(cmd->cmdstream_bo);
+	return (uint8_t *)cmd->cur - start;
+}
+
+/**
+ * igt_msm_cmd_submit:
+ * @cmd: the command stream object to submit
+ *
+ * Returns dma-fence fd
+ */
+int
+igt_msm_cmd_submit(struct msm_cmd *cmd)
+{
+	struct drm_msm_gem_submit_bo bos[cmd->nr_bos];
+	struct drm_msm_gem_submit_cmd cmds[] = {
+		[0] = {
+			.type       = MSM_SUBMIT_CMD_BUF,
+			.submit_idx = 0,
+			.size       = cmdstream_size(cmd),
+		},
+	};
+	struct drm_msm_gem_submit req = {
+			.flags   = cmd->pipe->pipe | MSM_SUBMIT_FENCE_FD_OUT,
+			.queueid = cmd->pipe->submitqueue_id,
+			.nr_cmds = ARRAY_SIZE(cmds),
+			.cmds    = VOID2U64(cmds),
+			.nr_bos  = ARRAY_SIZE(bos),
+			.bos     = VOID2U64(bos),
+	};
+
+	for (unsigned i = 0; i < cmd->nr_bos; i++) {
+		bos[i] = (struct drm_msm_gem_submit_bo) {
+			.handle  = cmd->bos[i]->handle,
+			.flags   = MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE,
+		};
+	}
+
+	do_ioctl(cmd->pipe->dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+
+	return req.fence_fd;
+}
+
+void
+__igt_msm_append_bo(struct msm_cmd *cmd, struct msm_bo *bo)
+{
+	for (unsigned i = 0; i < cmd->nr_bos; i++)
+		if (cmd->bos[i] == bo)
+			return;
+
+	assert((cmd->nr_bos + 1) < ARRAY_SIZE(cmd->bos));
+	cmd->bos[cmd->nr_bos++] = bo;
+}
+
+/**
+ * igt_msm_cmd_free:
+ * @cmd: the command stream object to free
+ *
+ * Free a command stream object
+ */
+void
+igt_msm_cmd_free(struct msm_cmd *cmd)
+{
+	igt_msm_bo_free(cmd->cmdstream_bo);
+	free(cmd);
+}
diff --git a/lib/igt_msm.h b/lib/igt_msm.h
index 99a099c1..1a66c806 100644
--- a/lib/igt_msm.h
+++ b/lib/igt_msm.h
@@ -24,6 +24,8 @@
 #ifndef IGT_MSM_H
 #define IGT_MSM_H
 
+#include "ioctl_wrappers.h"
+
 #include "msm_drm.h"
 
 /**
@@ -47,6 +49,7 @@ void igt_msm_dev_close(struct msm_device *dev);
  * @handle: the BO's GEM handle
  * @size: the BO's size
  * @map: the BO's memory mapping (if mapped)
+ * @iova: the BO's GPU address
  *
  * Helper wrapper for a GEM buffer object.
  */
@@ -55,6 +58,7 @@ struct msm_bo {
 	int handle;
 	uint32_t size;
 	void *map;
+	uint64_t iova;
 };
 
 struct msm_bo *igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags);
@@ -136,6 +140,50 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
 			((pm4_odd_parity_bit(opcode) << 23));
 }
 
+/**
+ * msm_cmd:
+ * @pipe: the submitqueue to submit cmdstream against
+ * @cmdstream_bo: the backing cmdstream buffer object
+ * @cur: pointer to current position in cmdstream
+ *
+ * Helper for building cmdstream and cmdstream submission
+ */
+struct msm_cmd {
+	struct msm_pipe *pipe;
+	struct msm_bo *cmdstream_bo;
+	uint32_t *cur;
+	uint32_t nr_bos;
+	struct msm_bo *bos[8];
+};
+
+struct msm_cmd *igt_msm_cmd_new(struct msm_pipe *pipe, size_t size);
+int igt_msm_cmd_submit(struct msm_cmd *cmd);
+void igt_msm_cmd_free(struct msm_cmd *cmd);
+
+static inline void
+msm_cmd_emit(struct msm_cmd *cmd, uint32_t dword)
+{
+	*(cmd->cur++) = dword;
+}
+
+static inline void
+msm_cmd_pkt7(struct msm_cmd *cmd, uint8_t opcode, uint16_t cnt)
+{
+	msm_cmd_emit(cmd, pm4_pkt7_hdr(opcode, cnt));
+}
+
+void __igt_msm_append_bo(struct msm_cmd *cmd, struct msm_bo *bo);
+
+static inline void
+msm_cmd_bo(struct msm_cmd *cmd, struct msm_bo *bo, uint32_t offset)
+{
+	uint64_t addr = bo->iova + offset;
+
+	__igt_msm_append_bo(cmd, bo);
+	msm_cmd_emit(cmd, lower_32_bits(addr));
+	msm_cmd_emit(cmd, upper_32_bits(addr));
+}
+
 #define U642VOID(x) ((void *)(uintptr_t)(x))
 #define VOID2U64(x) ((uint64_t)(uintptr_t)(x))
 
-- 
2.33.1
