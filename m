Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EF16E111
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jun 2021 14:01:30 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 25 Jun 2021 16:01:18 +0200
Message-Id: <20210625140118.2600731-11-boris.brezillon@collabora.com>
In-Reply-To: <20210625140118.2600731-1-boris.brezillon@collabora.com>
References: <20210625140118.2600731-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 10/10] tests/panfrost: Add a test to validate
 unhandled pagefault handling
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

We want to make sure jobs that trigger unhandled page fault get killed
immediately, and jobs queued to the same context after the pagefault
occured get executed properly.

v3:
* New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 tests/panfrost_submit.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/panfrost_submit.c b/tests/panfrost_submit.c
index 070d78625ebf..4747d295724e 100644
--- a/tests/panfrost_submit.c
+++ b/tests/panfrost_submit.c
@@ -168,6 +168,34 @@ igt_main
                 close(tmpfd);
         }
 
+        igt_subtest("pan-unhandled-pagefault") {
+                struct mali_job_descriptor_header *header;
+                struct panfrost_submit *submit;
+
+                submit = igt_panfrost_write_value_job(fd, true);
+                do_ioctl(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
+                header = submit->submit_bo->map;
+                igt_assert(syncobj_wait(fd, &submit->args->out_sync, 1,
+                                        abs_timeout(SHORT_TIME_NSEC), 0, NULL));
+
+                /* The job should get a JOB_BUS_FAULT, but it's not reflected
+                 * in the job header because the MMU mapping is disabled (to kill
+                 * the job immediately) before the job manager has a chance to
+                 * update the exception status.
+                 */
+                igt_assert(header->exception_status != 1);
+                igt_panfrost_free_job(fd, submit);
+
+                /* Now make sure new jobs on this context get executed properly */
+                submit = igt_panfrost_write_value_job(fd, false);
+                do_ioctl(fd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
+                header = submit->submit_bo->map;
+                igt_assert(syncobj_wait(fd, &submit->args->out_sync, 1,
+                                        abs_timeout(SHORT_TIME_NSEC), 0, NULL));
+                check_done(header);
+                igt_panfrost_free_job(fd, submit);
+        }
+
         igt_fixture {
                 close(fd);
         }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
