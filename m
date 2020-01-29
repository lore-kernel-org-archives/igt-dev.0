Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00786F616
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 18:16:17 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 29 Jan 2020 20:15:58 +0200
Message-Id: <20200129181601.15918-6-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-1-imre.deak@intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/9] lib/igt_fb: Fall back from gtt map to
 coherent map on platforms w/o aperture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Use a device coherent map instead of GGTT map on platforms w/o an
aperture.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa294a38..cb594634 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2376,18 +2376,23 @@ static void destroy_cairo_surface__gtt(void *arg)
 
 static void *map_bo(int fd, struct igt_fb *fb)
 {
+	bool is_i915 = is_i915_device(fd);
 	void *ptr;
 
-	if (is_i915_device(fd))
+	if (is_i915)
 		gem_set_domain(fd, fb->gem_handle,
 			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	if (fb->is_dumb)
 		ptr = kmstest_dumb_map_buffer(fd, fb->gem_handle, fb->size,
 					      PROT_READ | PROT_WRITE);
-	else if (is_i915_device(fd))
+	else if (is_i915 && gem_has_mappable_ggtt(fd))
 		ptr = gem_mmap__gtt(fd, fb->gem_handle, fb->size,
 				    PROT_READ | PROT_WRITE);
+	else if (is_i915)
+		ptr = gem_mmap__device_coherent(fd, fb->gem_handle, 0,
+						fb->size,
+						PROT_READ | PROT_WRITE);
 	else if (is_vc4_device(fd))
 		ptr = igt_vc4_mmap_bo(fd, fb->gem_handle, fb->size,
 				      PROT_READ | PROT_WRITE);
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
