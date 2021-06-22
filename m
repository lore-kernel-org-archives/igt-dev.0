Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9A56E44D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 09:02:27 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 22 Jun 2021 11:02:16 +0200
Message-Id: <20210622090221.1741111-4-boris.brezillon@collabora.com>
In-Reply-To: <20210622090221.1741111-1-boris.brezillon@collabora.com>
References: <20210622090221.1741111-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 3/8] lib/panfrost: Add a helper to create a job
 loop
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

Useful to trigger job timeouts and test the kernel driver timeout
handling logic.

v2:
* Add comments explaining how the job loop is formed
* Add a helper to retrieve job headers

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 lib/igt_panfrost.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_panfrost.h |  4 +++
 2 files changed, 81 insertions(+)

diff --git a/lib/igt_panfrost.c b/lib/igt_panfrost.c
index 4bbb5ddf4076..5b65537b7ced 100644
--- a/lib/igt_panfrost.c
+++ b/lib/igt_panfrost.c
@@ -130,6 +130,83 @@ void igt_panfrost_bo_mmap(int fd, struct panfrost_bo *bo)
         igt_assert(bo->map);
 }
 
+struct mali_job_descriptor_header *
+igt_panfrost_job_loop_get_job_header(struct panfrost_submit *submit,
+                                     unsigned job_idx)
+{
+        unsigned job_offset = ALIGN(sizeof(struct mali_job_descriptor_header) +
+                                    sizeof(struct mali_payload_set_value),
+                                    64) *
+                              job_idx;
+
+        igt_assert(job_idx <= 1);
+
+        return submit->submit_bo->map + job_offset;
+}
+
+struct panfrost_submit *igt_panfrost_job_loop(int fd)
+{
+        /* We create 2 WRITE_VALUE jobs pointing to each other to form a loop.
+         * Each WRITE_VALUE job resets the ->exception_status field of the
+         * other job to allow re-execution (if we don't do that we end up with
+         * an INVALID_DATA fault on the second execution).
+         */
+        struct panfrost_submit *submit;
+        struct mali_job_descriptor_header header = {
+                .job_type = JOB_TYPE_SET_VALUE,
+                .job_barrier = 1,
+                .unknown_flags = 5,
+                .job_index = 1,
+                .job_descriptor_size = 1,
+        };
+
+        /* .unknow = 3 means write 0 at the address specified in .out */
+        struct mali_payload_set_value payload = {
+                .unknown = 3,
+        };
+        uint32_t *bos;
+        unsigned job1_offset = ALIGN(sizeof(header) + sizeof(payload), 64);
+        unsigned job0_offset = 0;
+
+        submit = malloc(sizeof(*submit));
+	memset(submit, 0, sizeof(*submit));
+
+        submit->submit_bo = igt_panfrost_gem_new(fd, ALIGN(sizeof(header) + sizeof(payload), 64) * 2);
+        igt_panfrost_bo_mmap(fd, submit->submit_bo);
+
+        /* Job 0 points to job 1 and has its WRITE_VALUE pointer pointing to
+         * job 1 execption_status field.
+         */
+        header.next_job_64 = submit->submit_bo->offset + job1_offset;
+        payload.out = submit->submit_bo->offset + job1_offset +
+                      offsetof(struct mali_job_descriptor_header, exception_status);
+        memcpy(submit->submit_bo->map + job0_offset, &header, sizeof(header));
+        memcpy(submit->submit_bo->map + job0_offset + sizeof(header), &payload, sizeof(payload));
+
+        /* Job 1 points to job 0 and has its WRITE_VALUE pointer pointing to
+         * job 0 execption_status field.
+         */
+        header.next_job_64 = submit->submit_bo->offset + job0_offset;
+        payload.out = submit->submit_bo->offset + job0_offset +
+                      offsetof(struct mali_job_descriptor_header, exception_status);
+        memcpy(submit->submit_bo->map + job1_offset, &header, sizeof(header));
+        memcpy(submit->submit_bo->map + job1_offset + sizeof(header), &payload, sizeof(payload));
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
index cc7998dcb4bf..3ab4baf892f3 100644
--- a/lib/igt_panfrost.h
+++ b/lib/igt_panfrost.h
@@ -47,7 +47,11 @@ struct panfrost_submit {
 struct panfrost_bo *igt_panfrost_gem_new(int fd, size_t size);
 void igt_panfrost_free_bo(int fd, struct panfrost_bo *bo);
 
+struct mali_job_descriptor_header *
+igt_panfrost_job_loop_get_job_header(struct panfrost_submit *submit,
+                                     unsigned job_idx);
 struct panfrost_submit *igt_panfrost_trivial_job(int fd, bool do_crash, int width, int height, uint32_t color);
+struct panfrost_submit *igt_panfrost_job_loop(int fd);
 void igt_panfrost_free_job(int fd, struct panfrost_submit *submit);
 
 /* IOCTL wrappers */
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
