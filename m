Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F836E8D8
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 18:31:17 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Thu, 30 Jan 2020 20:30:59 +0200
Message-Id: <20200130183101.20930-5-imre.deak@intel.com>
In-Reply-To: <20200130183101.20930-1-imre.deak@intel.com>
References: <20200130183101.20930-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 5/7] lib/igt_fb: Fall back from gtt map to
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
index f8ed8622..613a9706 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2379,18 +2379,23 @@ static void destroy_cairo_surface__gtt(void *arg)
 
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
