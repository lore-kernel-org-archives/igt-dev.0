Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AB46E44D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 09:02:28 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 22 Jun 2021 11:02:18 +0200
Message-Id: <20210622090221.1741111-6-boris.brezillon@collabora.com>
In-Reply-To: <20210622090221.1741111-1-boris.brezillon@collabora.com>
References: <20210622090221.1741111-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 5/8] tests/panfrost: Simplify submit tests
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

Use NULL jobs and WRITE_VALUE job loops to test job submission. This
way we get tests that pass on both Midgard and Bifrost without pulling
the pan_pack() infrastructure from mesa. Note that we'll have to do that
at some point if we want to add complex tests, but we're not there yet.

v2:
* Move of the pan-reset changes out of this commit

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 tests/panfrost_submit.c | 71 ++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 47 deletions(-)

diff --git a/tests/panfrost_submit.c b/tests/panfrost_submit.c
index 13ce85b73d9e..abc274921f2b 100644
--- a/tests/panfrost_submit.c
+++ b/tests/panfrost_submit.c
@@ -57,30 +57,9 @@ abs_timeout(uint64_t duration)
         return (uint64_t)current.tv_sec * NSECS_PER_SEC + current.tv_nsec + duration;
 }
 
-static void check_error(int fd, struct panfrost_submit *submit)
+static void check_done(struct mali_job_descriptor_header *header)
 {
-	struct mali_job_descriptor_header *header;
-
-        header = submit->submit_bo->map;
-        igt_assert_eq_u64(header->fault_pointer, 0);
-}
-
-static void check_fb(int fd, struct panfrost_bo *bo)
-{
-        int gpu_prod_id = igt_panfrost_get_param(fd, DRM_PANFROST_PARAM_GPU_PROD_ID);
-        __uint32_t *fbo;
-        int i;
-
-        fbo = bo->map;
-
-        if (gpu_prod_id >= 0x0750) {
-                for (i = 0; i < ALIGN(WIDTH, 16) * HEIGHT; i++)
-                        igt_assert_eq_u32(fbo[i], CLEAR_COLOR);
-        } else {
-                // Mask the alpha away because on <=T720 we don't know how to have it
-                for (i = 0; i < ALIGN(WIDTH, 16) * HEIGHT; i++)
-                        igt_assert_eq_u32(fbo[i], CLEAR_COLOR & 0x00ffffff);
-        }
+        igt_assert(header->exception_status == 1 && header->fault_pointer == 0);
 }
 
 igt_main
@@ -94,15 +73,12 @@ igt_main
         igt_subtest("pan-submit") {
                 struct panfrost_submit *submit;
 
-                submit = igt_panfrost_trivial_job(fd, false, WIDTH, HEIGHT,
-                                                  CLEAR_COLOR);
+                submit = igt_panfrost_null_job(fd);
 
-                igt_panfrost_bo_mmap(fd, submit->fbo);
                 do_ioctl(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
                 igt_assert(syncobj_wait(fd, &submit->args->out_sync, 1,
                                         abs_timeout(SHORT_TIME_NSEC), 0, NULL));
-                check_error(fd, submit);
-                check_fb(fd, submit->fbo);
+                check_done(submit->submit_bo->map);
                 igt_panfrost_free_job(fd, submit);
         }
 
@@ -114,64 +90,65 @@ igt_main
         igt_subtest("pan-submit-error-bad-in-syncs") {
                 struct panfrost_submit *submit;
 
-                submit = igt_panfrost_trivial_job(fd, false, WIDTH, HEIGHT,
-                                                  CLEAR_COLOR);
+                submit = igt_panfrost_null_job(fd);
                 submit->args->in_syncs = 0ULL;
                 submit->args->in_sync_count = 1;
 
                 do_ioctl_err(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args, EFAULT);
+                igt_panfrost_free_job(fd, submit);
         }
 
         igt_subtest("pan-submit-error-bad-bo-handles") {
                 struct panfrost_submit *submit;
 
-                submit = igt_panfrost_trivial_job(fd, false, WIDTH, HEIGHT,
-                                                  CLEAR_COLOR);
+                submit = igt_panfrost_null_job(fd);
                 submit->args->bo_handles = 0ULL;
                 submit->args->bo_handle_count = 1;
 
                 do_ioctl_err(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args, EFAULT);
+                igt_panfrost_free_job(fd, submit);
         }
 
         igt_subtest("pan-submit-error-bad-requirements") {
                 struct panfrost_submit *submit;
 
-                submit = igt_panfrost_trivial_job(fd, false, WIDTH, HEIGHT,
-                                                  CLEAR_COLOR);
+                submit = igt_panfrost_null_job(fd);
                 submit->args->requirements = 2;
 
                 do_ioctl_err(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args, EINVAL);
+                igt_panfrost_free_job(fd, submit);
         }
 
         igt_subtest("pan-submit-error-bad-out-sync") {
                 struct panfrost_submit *submit;
 
-                submit = igt_panfrost_trivial_job(fd, false, WIDTH, HEIGHT,
-                                                  CLEAR_COLOR);
+                submit = igt_panfrost_null_job(fd);
                 submit->args->out_sync = -1;
 
                 do_ioctl_err(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args, ENODEV);
+                igt_panfrost_free_job(fd, submit);
         }
 
         igt_subtest("pan-reset") {
                 struct panfrost_submit *submit;
+                struct mali_job_descriptor_header *headers[2];
 
-                submit = igt_panfrost_trivial_job(fd, true, WIDTH, HEIGHT,
-                                                  CLEAR_COLOR);
+                submit = igt_panfrost_job_loop(fd);
+                headers[0] = igt_panfrost_job_loop_get_job_header(submit, 0);
+                headers[1] = igt_panfrost_job_loop_get_job_header(submit, 1);
                 do_ioctl(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
-                /* Expect for this job to timeout */
+
+                /* The job should stay active for BAD_JOB_TIME_NSEC until the
+                 * scheduler consider it as a GPU hang and reset the GPU.
+                 * After the reset, the job fence is signaled.
+                 */
                 igt_assert(!syncobj_wait(fd, &submit->args->out_sync, 1,
                                          abs_timeout(SHORT_TIME_NSEC), 0, NULL));
-                igt_panfrost_free_job(fd, submit);
-
-                submit = igt_panfrost_trivial_job(fd, false, WIDTH, HEIGHT,
-                                                  CLEAR_COLOR);
-                igt_panfrost_bo_mmap(fd, submit->fbo);
-                do_ioctl(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
-                /* This one should work */
                 igt_assert(syncobj_wait(fd, &submit->args->out_sync, 1,
                                         abs_timeout(BAD_JOB_TIME_NSEC), 0, NULL));
-                check_fb(fd, submit->fbo);
+
+                /* At least one job header of the job loop should have its exception status set to 0 */
+                igt_assert(headers[0]->exception_status != 1 || headers[1]->exception_status != 1);
                 igt_panfrost_free_job(fd, submit);
         }
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
