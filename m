Return-Path: <dri-devel-bounces@lists.freedesktop.org>
From: Neil Roberts <nroberts@igalia.com>
Subject: [PATCH i-g-t 1/2] lib/panfrost: Add a utility to madvise a buffer
Date: Fri,  5 Mar 2021 12:12:45 +0100
Message-Id: <20210305111246.1381965-2-nroberts@igalia.com>
In-Reply-To: <20210305111246.1381965-1-nroberts@igalia.com>
References: <20210305111246.1381965-1-nroberts@igalia.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Neil Roberts <nroberts@igalia.com>
---
 lib/igt_panfrost.c | 12 ++++++++++++
 lib/igt_panfrost.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/lib/igt_panfrost.c b/lib/igt_panfrost.c
index 8b0c2b77..ffce66a2 100644
--- a/lib/igt_panfrost.c
+++ b/lib/igt_panfrost.c
@@ -127,6 +127,18 @@ void igt_panfrost_bo_mmap(int fd, struct panfrost_bo *bo)
         igt_assert(bo->map);
 }
 
+bool igt_panfrost_bo_madvise(int fd, struct panfrost_bo *bo, uint32_t madv)
+{
+        struct drm_panfrost_madvise madvise = {
+                .handle = bo->handle,
+                .madv = madv,
+        };
+
+        do_ioctl(fd, DRM_IOCTL_PANFROST_MADVISE, &madvise);
+
+        return madvise.retained;
+}
+
 struct panfrost_submit *igt_panfrost_trivial_job(int fd, bool do_crash, int width, int height, uint32_t color)
 {
         struct panfrost_submit *submit;
diff --git a/lib/igt_panfrost.h b/lib/igt_panfrost.h
index cc7998dc..df326a6c 100644
--- a/lib/igt_panfrost.h
+++ b/lib/igt_panfrost.h
@@ -56,5 +56,6 @@ uint32_t igt_panfrost_get_param(int fd, int param);
 void *igt_panfrost_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
 
 void igt_panfrost_bo_mmap(int fd, struct panfrost_bo *bo);
+bool igt_panfrost_bo_madvise(int fd, struct panfrost_bo *bo, uint32_t madv);
 
 #endif /* IGT_PANFROST_H */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
