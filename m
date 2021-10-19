Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4621D6EB79
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 09:48:17 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue, 19 Oct 2021 11:40:30 +0200
Message-Id: <20211019094030.553874-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211019094030.553874-1-maarten.lankhorst@linux.intel.com>
References: <20211019094030.553874-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_draw: Use device coherent and
 cpu coherent mappings for draw methods.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This will allow kms_frontbuffer_tracking to draw buffers for frontbuffer tracking on dg1.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 lib/igt_draw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index da1d39fcba95..62ca4761a9f2 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -341,8 +341,8 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
 	if (tiling != I915_TILING_NONE)
 		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
 
-	ptr = gem_mmap__cpu(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
-			    PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__cpu_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
+				     PROT_READ | PROT_WRITE);
 
 	switch (tiling) {
 	case I915_TILING_NONE:
@@ -391,8 +391,8 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
 	if (tiling != I915_TILING_NONE)
 		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
 
-	ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
-			   PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
+					PROT_READ | PROT_WRITE);
 
 	switch (tiling) {
 	case I915_TILING_NONE:
-- 
2.33.0
