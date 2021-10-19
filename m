Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411776EB73
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 09:48:17 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue, 19 Oct 2021 11:40:29 +0200
Message-Id: <20211019094030.553874-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: create i915 bo in lmem,
 if available
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

create_bo_for_fb() should call gem_buffer_create_fb_obj, as this is the
function used to create an object in lmem. This will fix the
kms_frontbuffer_tracking tests failing on DG1.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 lib/igt_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 63f3c86e75f0..216b1d5c4aff 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1092,7 +1092,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 		if (is_i915_device(fd)) {
 			int err;
 
-			fb->gem_handle = gem_create(fd, fb->size);
+			fb->gem_handle = gem_buffer_create_fb_obj(fd, fb->size);
 			err = __gem_set_tiling(fd, fb->gem_handle,
 					       igt_fb_mod_to_tiling(fb->modifier),
 					       fb->strides[0]);
-- 
2.33.0
