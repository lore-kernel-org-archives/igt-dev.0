Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E0B89FCE
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2020 08:34:17 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 18 Nov 2020 13:44:47 +0530
Message-Id: <20201118081449.10523-2-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20201118081449.10523-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20201118081449.10523-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/kms: Add fb damage clip plane
 property
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
To: gwan-gyeong.mun@intel.com, igt-dev@lists.freedesktop.org, jose.souza@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

FB_DAMAGE_CLIPS property is been in DRM for a while but was never
added to IGT.
Add support for FB_DAMAGE_CLIPS property so that kms tests can us it.

Reviewed-by: Jose Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 lib/igt_kms.c | 3 +++
 lib/igt_kms.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e5d8e82c9..cf3b9355b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -396,6 +396,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_PIXEL_BLEND_MODE] = "pixel blend mode",
 	[IGT_PLANE_ALPHA] = "alpha",
 	[IGT_PLANE_ZPOS] = "zpos",
+	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -1775,6 +1776,8 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xffff);
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_FB_DAMAGE_CLIPS))
+		igt_plane_set_prop_value(plane, IGT_PLANE_FB_DAMAGE_CLIPS, 0);
 
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1fcae2436..09b10b3e0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -281,6 +281,7 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_PIXEL_BLEND_MODE,
        IGT_PLANE_ALPHA,
        IGT_PLANE_ZPOS,
+       IGT_PLANE_FB_DAMAGE_CLIPS,
        IGT_NUM_PLANE_PROPS
 };
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
