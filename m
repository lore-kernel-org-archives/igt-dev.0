Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907B86E111
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jun 2021 14:01:29 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 25 Jun 2021 16:01:17 +0200
Message-Id: <20210625140118.2600731-10-boris.brezillon@collabora.com>
In-Reply-To: <20210625140118.2600731-1-boris.brezillon@collabora.com>
References: <20210625140118.2600731-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 09/10] lib/panfrost: Add a helper to create
 dummy write value jobs
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

v3:
* New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 lib/igt_panfrost.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_panfrost.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/lib/igt_panfrost.c b/lib/igt_panfrost.c
index 7651f0f6c8a3..f63611b9be3c 100644
--- a/lib/igt_panfrost.c
+++ b/lib/igt_panfrost.c
@@ -240,6 +240,52 @@ struct panfrost_submit *igt_panfrost_null_job(int fd)
         return submit;
 }
 
+struct panfrost_submit *
+igt_panfrost_write_value_job(int fd, bool trigger_page_fault)
+{
+        struct panfrost_submit *submit;
+        struct mali_job_descriptor_header header = {
+                .job_type = JOB_TYPE_SET_VALUE,
+                .job_index = 1,
+                .job_descriptor_size = 1,
+        };
+
+        /* .unknow = 3 means write 0 at the address specified in .out */
+        struct mali_payload_set_value payload = {
+                .unknown = 3,
+        };
+        uint32_t *bos;
+        unsigned write_ptr_offset = sizeof(header) + sizeof(payload);
+
+        submit = malloc(sizeof(*submit));
+        memset(submit, 0, sizeof(*submit));
+
+        submit->submit_bo = igt_panfrost_gem_new(fd, sizeof(header) + sizeof(payload) + sizeof(uint64_t));
+        igt_panfrost_bo_mmap(fd, submit->submit_bo);
+
+        payload.out = trigger_page_fault ?
+                      0x0000deadbeef0000 :
+                      submit->submit_bo->offset + write_ptr_offset;
+
+        memcpy(submit->submit_bo->map, &header, sizeof(header));
+        memcpy(submit->submit_bo->map + sizeof(header), &payload, sizeof(payload));
+        memset(submit->submit_bo->map + write_ptr_offset, 0xff, sizeof(uint32_t));
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
 void igt_panfrost_free_job(int fd, struct panfrost_submit *submit)
 {
         free(from_user_pointer(submit->args->bo_handles));
diff --git a/lib/igt_panfrost.h b/lib/igt_panfrost.h
index d2ddca392d4b..d67947572e25 100644
--- a/lib/igt_panfrost.h
+++ b/lib/igt_panfrost.h
@@ -52,6 +52,7 @@ igt_panfrost_job_loop_get_job_header(struct panfrost_submit *submit,
                                      unsigned job_idx);
 struct panfrost_submit *igt_panfrost_job_loop(int fd);
 struct panfrost_submit *igt_panfrost_null_job(int fd);
+struct panfrost_submit *igt_panfrost_write_value_job(int fd, bool trigger_page_fault);
 void igt_panfrost_free_job(int fd, struct panfrost_submit *submit);
 
 /* IOCTL wrappers */
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
