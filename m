Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214096F619
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 18:16:20 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 29 Jan 2020 20:16:00 +0200
Message-Id: <20200129181601.15918-8-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-1-imre.deak@intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 8/9] lib/igt_fb: Speed up format conversion
 for local memory
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

To speed up the conversion that needs to read from a dGFX local memory
use the same trick as what's used for GTT apertures and make a copy
first into system memory.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 30f3bfba..ef3fa2ed 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3427,6 +3427,10 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
 	if (use_enginecopy(fb) || use_blitter(fb) ||
 	    igt_vc4_is_tiled(fb->modifier)) {
 		setup_linear_mapping(&blit->base);
+
+		/* speed things up by working from a copy in system memory */
+		cvt.src.slow_reads =
+			is_i915_device(fd) && !gem_has_mappable_ggtt(fd);
 	} else {
 		blit->base.linear.fb = *fb;
 		blit->base.linear.fb.gem_handle = 0;
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
