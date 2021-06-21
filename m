Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073C96E02B
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 12:57:39 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, 21 Jun 2021 14:57:21 +0200
Message-Id: <20210621125724.1592104-5-boris.brezillon@collabora.com>
In-Reply-To: <20210621125724.1592104-1-boris.brezillon@collabora.com>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 4/7] lib/panfrost: Add a helper to create a NULL
 job
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
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Useful when we just want to make sure the scheduler has executed a
job (way simpler than creating actual jobs).

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 lib/igt_panfrost.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_panfrost.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/lib/igt_panfrost.c b/lib/igt_panfrost.c
index 988cd757c055..60995f4ed18d 100644
--- a/lib/igt_panfrost.c
+++ b/lib/igt_panfrost.c
@@ -173,6 +173,39 @@ struct panfrost_submit *igt_panfrost_job_loop(int fd)
         return submit;
 }
 
+struct panfrost_submit *igt_panfrost_null_job(int fd)
+{
+        struct panfrost_submit *submit;
+        struct mali_job_descriptor_header header = {
+                .job_type = JOB_TYPE_NULL,
+                .job_index = 1,
+                .job_descriptor_size = 1,
+        };
+        uint32_t *bos;
+
+        submit = malloc(sizeof(*submit));
+	memset(submit, 0, sizeof(*submit));
+
+        submit->submit_bo = igt_panfrost_gem_new(fd, sizeof(header));
+        igt_panfrost_bo_mmap(fd, submit->submit_bo);
+
+        memcpy(submit->submit_bo->map, &header, sizeof(header));
+
+        submit->args = malloc(sizeof(*submit->args));
+        memset(submit->args, 0, sizeof(*submit->args));
+        submit->args->jc = submit->submit_bo->offset;
+
+        bos = malloc(sizeof(*bos) * 1);
+        bos[0] = submit->submit_bo->handle;
+
+        submit->args->bo_handles = to_user_pointer(bos);
+        submit->args->bo_handle_count = 1;
+
+        igt_assert_eq(drmSyncobjCreate(fd, DRM_SYNCOBJ_CREATE_SIGNALED, &submit->args->out_sync), 0);
+
+        return submit;
+}
+
 struct panfrost_submit *igt_panfrost_trivial_job(int fd, bool do_crash, int width, int height, uint32_t color)
 {
         struct panfrost_submit *submit;
diff --git a/lib/igt_panfrost.h b/lib/igt_panfrost.h
index 22bf4c7bad9d..953dd4b7dd47 100644
--- a/lib/igt_panfrost.h
+++ b/lib/igt_panfrost.h
@@ -49,6 +49,7 @@ void igt_panfrost_free_bo(int fd, struct panfrost_bo *bo);
 
 struct panfrost_submit *igt_panfrost_trivial_job(int fd, bool do_crash, int width, int height, uint32_t color);
 struct panfrost_submit *igt_panfrost_job_loop(int fd);
+struct panfrost_submit *igt_panfrost_null_job(int fd);
 void igt_panfrost_free_job(int fd, struct panfrost_submit *submit);
 
 /* IOCTL wrappers */
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
