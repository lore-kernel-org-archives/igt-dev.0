Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D50F10E194
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:17:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:20 +0530
Message-Id: <20230626051031.2363120-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 13/24] tests/amdgpu: Use drm_close_driver() to
 close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To close the drm file descriptor, use igt helper drm_close_driver()
instead of using close().

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 tests/amdgpu/amd_basic.c       | 2 +-
 tests/amdgpu/amd_cs_nop.c      | 2 +-
 tests/amdgpu/amd_deadlock.c    | 2 +-
 tests/amdgpu/amd_info.c        | 2 +-
 tests/amdgpu/amd_module_load.c | 2 +-
 tests/amdgpu/amd_prime.c       | 6 +++---
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 38525a85e..f7d7f036f 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -696,6 +696,6 @@ igt_main
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index ea3f6aae8..323c1b16a 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -239,6 +239,6 @@ igt_main
 	igt_fixture {
 		amdgpu_cs_ctx_free(context);
 		amdgpu_device_deinitialize(device);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index df650c921..d805b8d18 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -118,6 +118,6 @@ igt_main
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index d6aea827b..c1137ab4d 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -154,6 +154,6 @@ igt_main
 
 	igt_fixture {
 		amdgpu_device_deinitialize(dev);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_load.c
index 77df96d50..cbc9106f6 100644
--- a/tests/amdgpu/amd_module_load.c
+++ b/tests/amdgpu/amd_module_load.c
@@ -54,7 +54,7 @@ static void sanity_check(void)
 		err = -errno;
 
 	igt_set_timeout(0, NULL);
-	close(fd);
+	drm_close_driver(fd);
 
 	igt_assert_eq(err, 0);
 }
diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
index 62924f15b..6916c3173 100644
--- a/tests/amdgpu/amd_prime.c
+++ b/tests/amdgpu/amd_prime.c
@@ -166,7 +166,7 @@ static void amd_plug(amdgpu_device_handle device, struct cork *c)
 static void unplug(struct cork *c)
 {
 	vgem_fence_signal(c->device, c->fence);
-	close(c->device);
+	drm_close_driver(c->device);
 }
 
 static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
@@ -461,7 +461,7 @@ igt_main
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-		close(amd);
-		close(i915);
+		drm_close_driver(amd);
+		drm_close_driver(i915);
 	}
 }
-- 
2.40.0
