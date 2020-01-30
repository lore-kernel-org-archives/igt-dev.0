Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA7C6E8D3
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 18:31:19 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Thu, 30 Jan 2020 20:31:01 +0200
Message-Id: <20200130183101.20930-7-imre.deak@intel.com>
In-Reply-To: <20200130183101.20930-1-imre.deak@intel.com>
References: <20200130183101.20930-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 7/7] lib/igt_fb: Speed up format conversion for
 local memory
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

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 2be03380..af3291a2 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3430,6 +3430,10 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
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
