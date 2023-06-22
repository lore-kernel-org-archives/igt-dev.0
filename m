Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAA610E4DD
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:01:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:15 +0530
Message-Id: <20230622065422.2235134-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 16/23] tests/vc4: Use drm_close_driver() to
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
 tests/vc4/vc4_create_bo.c    | 4 ++--
 tests/vc4/vc4_dmabuf_poll.c  | 2 +-
 tests/vc4/vc4_label_bo.c     | 2 +-
 tests/vc4/vc4_lookup_fail.c  | 2 +-
 tests/vc4/vc4_mmap.c         | 2 +-
 tests/vc4/vc4_perfmon.c      | 2 +-
 tests/vc4/vc4_purgeable_bo.c | 2 +-
 tests/vc4/vc4_tiling.c       | 2 +-
 tests/vc4/vc4_wait_bo.c      | 2 +-
 tests/vc4/vc4_wait_seqno.c   | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index c17f25b04..ba7db1985 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -72,9 +72,9 @@ igt_main
 		munmap(map, size);
 		gem_close(fd2, handle);
 
-		close(fd2);
+		drm_close_driver(fd2);
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
index c76d4950e..56f60b202 100644
--- a/tests/vc4/vc4_dmabuf_poll.c
+++ b/tests/vc4/vc4_dmabuf_poll.c
@@ -73,5 +73,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index 252bd1ed8..5d626a92d 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -82,5 +82,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
index 5e709a7d3..9f179a3fd 100644
--- a/tests/vc4/vc4_lookup_fail.c
+++ b/tests/vc4/vc4_lookup_fail.c
@@ -67,5 +67,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_mmap.c b/tests/vc4/vc4_mmap.c
index 8094f4a2d..fef25f334 100644
--- a/tests/vc4/vc4_mmap.c
+++ b/tests/vc4/vc4_mmap.c
@@ -49,5 +49,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
index 664633a3f..b25e92096 100644
--- a/tests/vc4/vc4_perfmon.c
+++ b/tests/vc4/vc4_perfmon.c
@@ -135,5 +135,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
index 9d6a3b438..7e9ac1718 100644
--- a/tests/vc4/vc4_purgeable_bo.c
+++ b/tests/vc4/vc4_purgeable_bo.c
@@ -249,5 +249,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index f5bf31f56..e9d3ebfb3 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -124,5 +124,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index c88a4ac46..d309acc95 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -111,5 +111,5 @@ igt_main
 		test_used_bo(fd, ~0ull);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
index 78984fa32..e029a613e 100644
--- a/tests/vc4/vc4_wait_seqno.c
+++ b/tests/vc4/vc4_wait_seqno.c
@@ -55,5 +55,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
-- 
2.40.0
