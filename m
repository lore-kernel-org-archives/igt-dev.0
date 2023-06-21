Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9883C10E052
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 08:20:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Wed, 21 Jun 2023 13:44:05 +0530
Message-Id: <20230621081405.2168956-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] lib/igt_fb: Stop using rendercopy for linear
 buffers on XE
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

Stop using rendercopy for linear buffers on XE driver, instead
use the mmap.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_fb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9be312a28..402fadf41 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2511,7 +2511,6 @@ static bool use_enginecopy(const struct igt_fb *fb)
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	       is_ccs_modifier(fb->modifier) ||
-	       (is_xe_device(fb->fd) && fb->modifier == DRM_FORMAT_MOD_LINEAR) ||
 	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
 }
 
-- 
2.40.0
