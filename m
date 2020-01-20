Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1DD6EB3D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2020 22:03:28 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 21 Jan 2020 00:03:19 +0200
Message-Id: <20200120220320.17092-2-imre.deak@intel.com>
In-Reply-To: <20200120220320.17092-1-imre.deak@intel.com>
References: <20200120220320.17092-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_fb: Use render copy/blit for
 tiled formats on platforms w/o HW detiling
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

On platforms without HW detiling use render copy or blitting to convert
between a tiled and a linear framebuffer.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index c81b9de8..b5b1750e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1975,17 +1975,27 @@ static bool blitter_ok(const struct igt_fb *fb)
 	return true;
 }
 
+static bool hw_can_detile(const struct igt_fb *fb)
+{
+	if (fb->modifier == DRM_FORMAT_MOD_NONE)
+		return true;
+
+	if (!gem_has_legacy_hw_tiling(fb->fd))
+		return false;
+
+	return fb->modifier != I915_FORMAT_MOD_Yf_TILED;
+}
+
 static bool use_enginecopy(const struct igt_fb *fb)
 {
 	return is_ccs_modifier(fb->modifier) ||
-		(fb->modifier == I915_FORMAT_MOD_Yf_TILED &&
-		 !blitter_ok(fb));
+		(!hw_can_detile(fb) && !blitter_ok(fb));
 }
 
 static bool use_blitter(const struct igt_fb *fb)
 {
 	return (fb->modifier == I915_FORMAT_MOD_Y_TILED ||
-		fb->modifier == I915_FORMAT_MOD_Yf_TILED) &&
+		!hw_can_detile(fb)) &&
 		blitter_ok(fb);
 }
 
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
