Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EB810E5D7
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:15:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:18 +0200
Message-Id: <20230712171231.290555-9-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 08/21] lib/xe_ioctl: Export non-assert
 xe_exec function
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

Export __xe_exec() helper to allow caller to handle the error
individually.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/xe/xe_ioctl.c | 2 +-
 lib/xe/xe_ioctl.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 9ead7307c4..0b5c7a4fce 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -357,7 +357,7 @@ void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
 	return __xe_bo_map(fd, bo, size, prot);
 }
 
-static int __xe_exec(int fd, struct drm_xe_exec *exec)
+int __xe_exec(int fd, struct drm_xe_exec *exec)
 {
 	int err = 0;
 
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index e014ad66c9..320e0f9f68 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -75,6 +75,7 @@ void xe_engine_destroy(int fd, uint32_t engine);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
 void *xe_bo_map(int fd, uint32_t bo, size_t size);
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
+int __xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec_sync(int fd, uint32_t engine, uint64_t addr,
 		  struct drm_xe_sync *sync, uint32_t num_syncs);
-- 
2.34.1
