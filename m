Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FAA6E111
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jun 2021 14:01:28 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 25 Jun 2021 16:01:14 +0200
Message-Id: <20210625140118.2600731-7-boris.brezillon@collabora.com>
In-Reply-To: <20210625140118.2600731-1-boris.brezillon@collabora.com>
References: <20210625140118.2600731-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 06/10] tests/panfrost: Extend the pan-reset test
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Alyssa Rosenzweig <alyssa@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

Extend the pan-reset test to make sure jobs from other context get
resumed after a reset.

v2:
* New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
---
 tests/panfrost_submit.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/tests/panfrost_submit.c b/tests/panfrost_submit.c
index abc274921f2b..6c47d1f2d3e9 100644
--- a/tests/panfrost_submit.c
+++ b/tests/panfrost_submit.c
@@ -130,26 +130,31 @@ igt_main
         }
 
         igt_subtest("pan-reset") {
-                struct panfrost_submit *submit;
-                struct mali_job_descriptor_header *headers[2];
+                int tmpfd = drm_open_driver(DRIVER_PANFROST);
+                struct panfrost_submit *submit[2];
+                struct mali_job_descriptor_header *headers[3];
 
-                submit = igt_panfrost_job_loop(fd);
-                headers[0] = igt_panfrost_job_loop_get_job_header(submit, 0);
-                headers[1] = igt_panfrost_job_loop_get_job_header(submit, 1);
-                do_ioctl(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
-
-                /* The job should stay active for BAD_JOB_TIME_NSEC until the
-                 * scheduler consider it as a GPU hang and reset the GPU.
-                 * After the reset, the job fence is signaled.
-                 */
-                igt_assert(!syncobj_wait(fd, &submit->args->out_sync, 1,
+                submit[0] = igt_panfrost_job_loop(fd);
+                submit[1] = igt_panfrost_null_job(tmpfd);
+                headers[0] = igt_panfrost_job_loop_get_job_header(submit[0], 0);
+                headers[1] = igt_panfrost_job_loop_get_job_header(submit[0], 1);
+                headers[2] = submit[1]->submit_bo->map;
+                do_ioctl(fd, DRM_IOCTL_PANFROST_SUBMIT, submit[0]->args);
+                do_ioctl(tmpfd, DRM_IOCTL_PANFROST_SUBMIT, submit[1]->args);
+                /* First job should timeout, second job should complete right after the timeout */
+                igt_assert(!syncobj_wait(fd, &submit[0]->args->out_sync, 1,
                                          abs_timeout(SHORT_TIME_NSEC), 0, NULL));
-                igt_assert(syncobj_wait(fd, &submit->args->out_sync, 1,
+                igt_assert(syncobj_wait(fd, &submit[0]->args->out_sync, 1,
                                         abs_timeout(BAD_JOB_TIME_NSEC), 0, NULL));
+                igt_assert(syncobj_wait(tmpfd, &submit[1]->args->out_sync, 1,
+                                        abs_timeout(SHORT_TIME_NSEC), 0, NULL));
 
                 /* At least one job header of the job loop should have its exception status set to 0 */
                 igt_assert(headers[0]->exception_status != 1 || headers[1]->exception_status != 1);
-                igt_panfrost_free_job(fd, submit);
+                check_done(headers[2]);
+                igt_panfrost_free_job(fd, submit[0]);
+                igt_panfrost_free_job(tmpfd, submit[1]);
+                close(tmpfd);
         }
 
         igt_fixture {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
