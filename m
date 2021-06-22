Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFAC6E44D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 09:02:30 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 22 Jun 2021 11:02:21 +0200
Message-Id: <20210622090221.1741111-9-boris.brezillon@collabora.com>
In-Reply-To: <20210622090221.1741111-1-boris.brezillon@collabora.com>
References: <20210622090221.1741111-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 8/8] tests/panfrost: Test FD-close while jobs
 are still in-flight
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

We had use-after-free faults in the past because the MMU context
while released while jobs were still in flight, and the job cleanup
path assumed the context was still present. Add a test to make sure this
won't happen again.

v2:
* Add R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
---
 tests/panfrost_submit.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/panfrost_submit.c b/tests/panfrost_submit.c
index 6c47d1f2d3e9..070d78625ebf 100644
--- a/tests/panfrost_submit.c
+++ b/tests/panfrost_submit.c
@@ -157,6 +157,17 @@ igt_main
                 close(tmpfd);
         }
 
+        igt_subtest("pan-submit-and-close") {
+                /* We need our own FD because we close it right after the job submission */
+                int tmpfd = drm_open_driver(DRIVER_PANFROST);
+                struct panfrost_submit *submit;
+
+                submit = igt_panfrost_job_loop(tmpfd);
+                do_ioctl(tmpfd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
+                igt_panfrost_free_job(tmpfd, submit);
+                close(tmpfd);
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
