Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7853110E351
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 16:56:45 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 janga.rahul.kumar@intel.com
Date: Tue, 16 May 2023 22:20:52 +0530
Message-Id: <20230516165058.4047595-15-bhanuprakash.modem@intel.com>
In-Reply-To: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 14/20] tests/vmwgfx: Use drm_close_driver() to
 close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Martin Krastev <krastevm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To close the drm file descriptor, use igt helper drm_close_driver()
instead of using close().

Cc: Zack Rusin <zackr@vmware.com>
Cc: Maaz Mombasawala <mombasawalam@vmware.com>
Cc: Martin Krastev <krastevm@vmware.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_vmwgfx.c                    | 2 +-
 tests/vmwgfx/vmw_execution_buffer.c | 2 +-
 tests/vmwgfx/vmw_ref_count.c        | 4 ++--
 tests/vmwgfx/vmw_surface_copy.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
index 8fb6e553c..12b07b4a8 100644
--- a/lib/igt_vmwgfx.c
+++ b/lib/igt_vmwgfx.c
@@ -135,7 +135,7 @@ void vmw_svga_device_fini(struct vmw_svga_device *device)
 	vmw_bitvector_free(device->rt_view_bv);
 	vmw_bitvector_free(device->ds_view_bv);
 	vmw_bitvector_free(device->shader_bv);
-	close(device->drm_fd);
+	drm_close_driver(device->drm_fd);
 }
 
 bool vmw_save_data_as_png(struct vmw_surface *surface, void *data,
diff --git a/tests/vmwgfx/vmw_execution_buffer.c b/tests/vmwgfx/vmw_execution_buffer.c
index 42322514e..b89770b30 100644
--- a/tests/vmwgfx/vmw_execution_buffer.c
+++ b/tests/vmwgfx/vmw_execution_buffer.c
@@ -308,6 +308,6 @@ igt_main_args("st:", long_options, NULL, parse_options, NULL)
 	igt_fixture
 	{
 		vmw_ioctl_context_destroy(fd, cid);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index 013214ff0..da4b41f89 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -314,7 +314,7 @@ igt_main
 
 	igt_fixture
 	{
-		close(fd1);
-		close(fd2);
+		drm_close_driver(fd1);
+		drm_close_driver(fd2);
 	}
 }
diff --git a/tests/vmwgfx/vmw_surface_copy.c b/tests/vmwgfx/vmw_surface_copy.c
index d7c2711a8..57e90334f 100644
--- a/tests/vmwgfx/vmw_surface_copy.c
+++ b/tests/vmwgfx/vmw_surface_copy.c
@@ -336,6 +336,6 @@ igt_main
 	igt_fixture
 	{
 		vmw_ioctl_context_destroy(fd, cid);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
-- 
2.40.0
