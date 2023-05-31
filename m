Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E11510E50E
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 19:31:16 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 21:30:42 +0200
Message-Id: <20230531193043.558461-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230531193043.558461-1-zbigniew.kempczynski@intel.com>
References: <20230531193043.558461-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] xe/xe_ioctl: Return remaining timeout
 of user fence wait
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

When user fence is signalled we may want to be aware how long did it
take. Return remaining timeout after fence was successfully signalled.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_ioctl.c | 4 +++-
 lib/xe/xe_ioctl.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index fe61b70a83..82340c6a97 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -400,7 +400,7 @@ void xe_exec_wait(int fd, uint32_t engine, uint64_t addr)
 	syncobj_destroy(fd, sync.handle);
 }
 
-void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
+long xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		    struct drm_xe_engine_class_instance *eci,
 		    int64_t timeout)
 {
@@ -416,6 +416,8 @@ void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
+
+	return wait.timeout;
 }
 
 long xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 9b44892fe9..860de9af58 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -79,7 +79,7 @@ void xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec_sync(int fd, uint32_t engine, uint64_t addr,
 		  struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_exec_wait(int fd, uint32_t engine, uint64_t addr);
-void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
+long xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		    struct drm_xe_engine_class_instance *eci,
 		    int64_t timeout);
 long xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
-- 
2.34.1
