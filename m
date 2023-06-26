Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64E010E1A0
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:17:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:22 +0530
Message-Id: <20230626051031.2363120-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 15/24] tests/panfrost: Use drm_close_driver()
 to close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To close the drm file descriptor, use igt helper drm_close_driver()
instead of using close().

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/panfrost_gem_new.c   | 4 ++--
 tests/panfrost_get_param.c | 2 +-
 tests/panfrost_prime.c     | 4 ++--
 tests/panfrost_submit.c    | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/panfrost_gem_new.c b/tests/panfrost_gem_new.c
index 940525ff1..4f27e029d 100644
--- a/tests/panfrost_gem_new.c
+++ b/tests/panfrost_gem_new.c
@@ -82,9 +82,9 @@ igt_main
 		munmap(map, size);
 		igt_panfrost_free_bo(fd2, bo);
 
-		close(fd2);
+		drm_close_driver(fd2);
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/panfrost_get_param.c b/tests/panfrost_get_param.c
index 11c2632b8..7d1ebecb4 100644
--- a/tests/panfrost_get_param.c
+++ b/tests/panfrost_get_param.c
@@ -69,5 +69,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/panfrost_prime.c b/tests/panfrost_prime.c
index 40ba036b2..dbc1cb46b 100644
--- a/tests/panfrost_prime.c
+++ b/tests/panfrost_prime.c
@@ -96,7 +96,7 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
-		close(kms_fd);
+		drm_close_driver(fd);
+		drm_close_driver(kms_fd);
 	}
 }
diff --git a/tests/panfrost_submit.c b/tests/panfrost_submit.c
index 4747d2957..70af55e0b 100644
--- a/tests/panfrost_submit.c
+++ b/tests/panfrost_submit.c
@@ -154,7 +154,7 @@ igt_main
                 check_done(headers[2]);
                 igt_panfrost_free_job(fd, submit[0]);
                 igt_panfrost_free_job(tmpfd, submit[1]);
-                close(tmpfd);
+                drm_close_driver(tmpfd);
         }
 
         igt_subtest("pan-submit-and-close") {
@@ -165,7 +165,7 @@ igt_main
                 submit = igt_panfrost_job_loop(tmpfd);
                 do_ioctl(tmpfd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
                 igt_panfrost_free_job(tmpfd, submit);
-                close(tmpfd);
+                drm_close_driver(tmpfd);
         }
 
         igt_subtest("pan-unhandled-pagefault") {
@@ -197,6 +197,6 @@ igt_main
         }
 
         igt_fixture {
-                close(fd);
+                drm_close_driver(fd);
         }
 }
-- 
2.40.0
