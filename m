Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6510E191
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:17:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:19 +0530
Message-Id: <20230626051031.2363120-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 12/24] tests: Use drm_close_driver() to close
 the drm fd
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/core_auth.c              | 10 +++++-----
 tests/core_getclient.c         |  2 +-
 tests/core_getstats.c          |  2 +-
 tests/core_getversion.c        |  2 +-
 tests/core_setmaster.c         |  6 +++---
 tests/core_setmaster_vs_auth.c |  6 +++---
 tests/debugfs_test.c           |  2 +-
 tests/dumb_buffer.c            |  2 +-
 tests/eviction_common.c        |  2 +-
 tests/fbdev.c                  |  2 +-
 tests/prime_busy.c             |  2 +-
 tests/prime_mmap.c             |  2 +-
 tests/prime_mmap_coherency.c   |  4 ++--
 tests/prime_mmap_kms.c         |  2 +-
 tests/prime_self_import.c      | 26 +++++++++++++-------------
 tests/prime_vgem.c             |  4 ++--
 tests/syncobj_basic.c          |  2 +-
 tests/syncobj_timeline.c       |  2 +-
 tests/syncobj_wait.c           |  2 +-
 tests/template.c               |  2 +-
 tests/vgem_basic.c             |  6 +++---
 tests/vgem_slow.c              |  2 +-
 22 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index ed736e1ae..bc1b3b8d5 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -214,7 +214,7 @@ static void test_basic_auth(int master)
 	igt_assert(drmGetMagic(slave, &magic) == 0);
 	igt_assert_eq(magic, old_magic);
 
-	close(slave);
+	drm_close_driver(slave);
 }
 
 igt_main
@@ -226,7 +226,7 @@ igt_main
 
 		igt_assert(check_auth(fd) == true);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Use 2 clients, check second is authenticated even when first dropped.");
@@ -236,11 +236,11 @@ igt_main
 
 		igt_assert(check_auth(fd2) == true);
 
-		close(fd);
+		drm_close_driver(fd);
 
 		igt_assert(check_auth(fd2) == true);
 
-		close(fd2);
+		drm_close_driver(fd2);
 	}
 
 	/* above tests require that no drm fd is open */
@@ -249,7 +249,7 @@ igt_main
 
 		igt_fixture
 			master = drm_open_driver_master(DRIVER_ANY);
-	
+
 		igt_describe("Test magic numbers for master and slave.");
 		igt_subtest("basic-auth")
 			test_basic_auth(master);
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 993801ead..839fae36a 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -70,5 +70,5 @@ igt_simple_main
 	ret = ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
 	igt_assert(ret == -1 && errno == EINVAL);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index fef122583..8b5655053 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -64,5 +64,5 @@ igt_simple_main
 	ret = ioctl(fd, DRM_IOCTL_GET_STATS, &stats);
 	igt_assert(ret == 0);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 36ba01b86..32cb976e4 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -58,5 +58,5 @@ igt_simple_main
 		igt_assert_lte(1, v->version_major);
 
 	drmFree(v);
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 621bc2469..04ee6b8b5 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -104,7 +104,7 @@ static void check_drop_set(void)
 	igt_assert_eq(drmDropMaster(master), 0);
 	igt_assert_eq(drmSetMaster(master), 0);
 
-	close(master);
+	drm_close_driver(master);
 }
 
 static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
@@ -225,10 +225,10 @@ igt_main
 			igt_assert_eq(drmSetMaster(master), -1);
 			igt_assert_eq(errno, EACCES);
 
-			close(master);
+			drm_close_driver(master);
 		}
 		igt_waitchildren();
 
-		close(master);
+		drm_close_driver(master);
 	}
 }
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index adca1c111..b80ed3879 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -78,7 +78,7 @@ igt_simple_main
 	igt_assert_neq(drmAuthMagic(master2, magic), 0);
 	igt_assert_eq(errno, EINVAL);
 
-	close(client);
-	close(master2);
-	close(master1);
+	drm_close_driver(client);
+	drm_close_driver(master2);
+	drm_close_driver(master1);
 }
diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index 5ee615aba..b67bfabac 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -255,6 +255,6 @@ igt_main
 	igt_fixture {
 		close(sysfs);
 		close(debugfs);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 9495d28ff..9db857f9f 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -416,6 +416,6 @@ igt_main
 		always_clear(fd, 30);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/eviction_common.c b/tests/eviction_common.c
index 95af106c1..5948fbc64 100644
--- a/tests/eviction_common.c
+++ b/tests/eviction_common.c
@@ -300,7 +300,7 @@ static int forking_evictions(int fd, struct igt_eviction_test_ops *ops,
 
 		/* drmfd closing will take care of additional bo refs */
 		if (flags & FORKING_EVICTIONS_DUP_DRMFD)
-			close(realfd);
+			drm_close_driver(realfd);
 	}
 
 	igt_waitchildren();
diff --git a/tests/fbdev.c b/tests/fbdev.c
index 794882a6a..154e78b0f 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -443,6 +443,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/prime_busy.c b/tests/prime_busy.c
index 6b0d7310b..90d79864f 100644
--- a/tests/prime_busy.c
+++ b/tests/prime_busy.c
@@ -184,6 +184,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index efd4deff9..25b2939e9 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -590,6 +590,6 @@ igt_main
 		free(query_info);
 		igt_collection_destroy(set);
 		igt_collection_destroy(dma_buf_set);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
index e5f7c92b2..01eb2002d 100644
--- a/tests/prime_mmap_coherency.c
+++ b/tests/prime_mmap_coherency.c
@@ -267,7 +267,7 @@ static void blit_and_cmp(void)
 
 	intel_bb_destroy(local_batch);
 	buf_ops_destroy(local_bops);
-	close(local_fd);
+	drm_close_driver(local_fd);
 }
 
 /*
@@ -364,6 +364,6 @@ igt_main
 	igt_fixture {
 		buf_ops_destroy(bops);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/prime_mmap_kms.c b/tests/prime_mmap_kms.c
index 8b127a13c..1a63be38f 100644
--- a/tests/prime_mmap_kms.c
+++ b/tests/prime_mmap_kms.c
@@ -263,6 +263,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&gpu.display);
-		close(gpu.drm_fd);
+		drm_close_driver(gpu.drm_fd);
 	}
 }
diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
index 30f2bf013..2dbf4e20f 100644
--- a/tests/prime_self_import.c
+++ b/tests/prime_self_import.c
@@ -147,8 +147,8 @@ static void test_with_fd_dup(void)
 	close(dma_buf_fd2);
 	check_bo(fd2, handle_import, fd2, handle_import);
 
-	close(fd1);
-	close(fd2);
+	drm_close_driver(fd1);
+	drm_close_driver(fd2);
 }
 
 static void test_with_two_bos(void)
@@ -180,8 +180,8 @@ static void test_with_two_bos(void)
 
 	check_bo(fd2, handle_import, fd2, handle_import);
 
-	close(fd1);
-	close(fd2);
+	drm_close_driver(fd1);
+	drm_close_driver(fd2);
 }
 
 static void test_with_one_bo_two_files(void)
@@ -205,8 +205,8 @@ static void test_with_one_bo_two_files(void)
 	/* dma-buf self importing an flink bo should give the same handle */
 	igt_assert_eq_u32(handle_import, handle_open);
 
-	close(fd1);
-	close(fd2);
+	drm_close_driver(fd1);
+	drm_close_driver(fd2);
 	close(dma_buf_fd1);
 	close(dma_buf_fd2);
 }
@@ -252,7 +252,7 @@ static void test_with_one_bo(void)
 	check_bo(fd1, handle, fd2, handle_import1);
 
 	/* Completely rip out exporting fd. */
-	close(fd1);
+	drm_close_driver(fd1);
 	check_bo(fd2, handle_import1, fd2, handle_import1);
 }
 
@@ -316,14 +316,14 @@ static void test_reimport_close_race(void)
 		igt_assert(status == 0);
 	}
 
-	close(fds[0]);
+	drm_close_driver(fds[0]);
 	close(fds[1]);
 
 	obj_count = igt_get_stable_obj_count(fake) - obj_count;
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
@@ -398,13 +398,13 @@ static void test_export_close_race(void)
 		igt_assert(status == 0);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 
 	obj_count = igt_get_stable_obj_count(fake) - obj_count;
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
@@ -433,7 +433,7 @@ static void test_llseek_size(void)
 		close(dma_buf_fd);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_llseek_bad(void)
@@ -462,7 +462,7 @@ static void test_llseek_bad(void)
 
 	close(dma_buf_fd);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 85b9cf880..876e04ed0 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1326,7 +1326,7 @@ igt_main
 
 
 	igt_fixture {
-		close(i915);
-		close(vgem);
+		drm_close_driver(i915);
+		drm_close_driver(vgem);
 	}
 }
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index 3252dbd69..f079baf09 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -266,7 +266,7 @@ igt_main
 		test_valid_cycle(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 }
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 134a60995..b4e1d093a 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -1936,6 +1936,6 @@ igt_main
 		test_32bits_limit(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index 2583ef72e..e0ff69b79 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -1062,6 +1062,6 @@ igt_main
 		test_wait_interrupted(fd, WAIT_ALL);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/template.c b/tests/template.c
index e23814fb7..ae2681c01 100644
--- a/tests/template.c
+++ b/tests/template.c
@@ -76,6 +76,6 @@ igt_main
 	 */
 
 	igt_fixture {
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index f2255a619..63c5c0971 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -162,8 +162,8 @@ static void test_setversion(int fd)
 
 static void test_client(int fd)
 {
-	close(drm_open_driver(DRIVER_VGEM));
-	close(drm_open_driver_render(DRIVER_VGEM));
+	drm_close_driver(drm_open_driver(DRIVER_VGEM));
+	drm_close_driver(drm_open_driver_render(DRIVER_VGEM));
 }
 
 static void test_create(int fd)
@@ -635,6 +635,6 @@ igt_main
 		test_debugfs_read(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 0c91cdb9d..cb9436628 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -97,6 +97,6 @@ igt_main
 		test_nohang(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
-- 
2.40.0
