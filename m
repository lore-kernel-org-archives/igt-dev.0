Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6A310E4E3
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:01:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:14 +0530
Message-Id: <20230622065422.2235134-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 15/23] tests/v3d: Use drm_close_driver() to
 close the drm fd
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

Cc: Melissa Wen <mwen@igalia.com>
Cc: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/v3d/v3d_create_bo.c      | 4 ++--
 tests/v3d/v3d_get_bo_offset.c  | 2 +-
 tests/v3d/v3d_get_param.c      | 2 +-
 tests/v3d/v3d_job_submission.c | 2 +-
 tests/v3d/v3d_mmap.c           | 2 +-
 tests/v3d/v3d_perfmon.c        | 2 +-
 tests/v3d/v3d_submit_cl.c      | 2 +-
 tests/v3d/v3d_submit_csd.c     | 2 +-
 tests/v3d/v3d_wait_bo.c        | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/v3d/v3d_create_bo.c b/tests/v3d/v3d_create_bo.c
index 4142fb5f6..07d237e96 100644
--- a/tests/v3d/v3d_create_bo.c
+++ b/tests/v3d/v3d_create_bo.c
@@ -63,9 +63,9 @@ igt_main
 			igt_assert_eq_u32(((uint32_t *)bo->map)[i], 0x0);
 		igt_v3d_free_bo(fd2, bo);
 
-		close(fd2);
+		drm_close_driver(fd2);
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
index 5c208f940..533488420 100644
--- a/tests/v3d/v3d_get_bo_offset.c
+++ b/tests/v3d/v3d_get_bo_offset.c
@@ -67,5 +67,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_get_param.c b/tests/v3d/v3d_get_param.c
index 0ca330eb5..0d8fbf3d6 100644
--- a/tests/v3d/v3d_get_param.c
+++ b/tests/v3d/v3d_get_param.c
@@ -69,5 +69,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_job_submission.c b/tests/v3d/v3d_job_submission.c
index d6e415bb2..e4ca7e89d 100644
--- a/tests/v3d/v3d_job_submission.c
+++ b/tests/v3d/v3d_job_submission.c
@@ -219,5 +219,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_mmap.c b/tests/v3d/v3d_mmap.c
index 567940a80..642c55c65 100644
--- a/tests/v3d/v3d_mmap.c
+++ b/tests/v3d/v3d_mmap.c
@@ -75,5 +75,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index 3f55ddb1d..4d6ea465f 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -142,5 +142,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
index 725bc1dff..293b146e2 100644
--- a/tests/v3d/v3d_submit_cl.c
+++ b/tests/v3d/v3d_submit_cl.c
@@ -376,5 +376,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
index 3ec0ee49f..0e19913c6 100644
--- a/tests/v3d/v3d_submit_csd.c
+++ b/tests/v3d/v3d_submit_csd.c
@@ -360,5 +360,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/v3d/v3d_wait_bo.c b/tests/v3d/v3d_wait_bo.c
index 9e51b6a05..6ed999426 100644
--- a/tests/v3d/v3d_wait_bo.c
+++ b/tests/v3d/v3d_wait_bo.c
@@ -122,6 +122,6 @@ igt_main
 
 	igt_fixture {
 		igt_v3d_free_bo(fd, bo);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
-- 
2.40.0
