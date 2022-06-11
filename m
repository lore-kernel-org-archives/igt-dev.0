Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8748310E208
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jun 2022 20:38:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id q15so1074905wmj.2
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jun 2022 13:38:50 -0700 (PDT)
Received: from jheikkil-mobl.home (77-105-100-22.lpok.fi. [77.105.100.22])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a056000100a00b0020d106c0386sm3444017wrx.89.2022.06.11.13.38.46
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 13:38:48 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 11 Jun 2022 23:38:45 +0300
Message-Id: <20220611203845.15118-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: Allow XY_FAST_COPY_BLT on DG2
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

From: Imre Deak <imre.deak@intel.com>

Allow XY_FAST_COPY_BLT on DG2. This fixes x-tiled blits on DG2.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5450
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5409
---
 lib/igt_fb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa31c43c..1b9131f2 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2430,7 +2430,8 @@ struct fb_blit_upload {
 
 static bool fast_blit_ok(const struct igt_fb *fb)
 {
-	int ver = intel_display_ver(intel_get_drm_devid(fb->fd));
+	int dev_id = intel_get_drm_devid(fb->fd);
+	int ver = intel_display_ver(dev_id);
 
 	if (ver < 9)
 		return false;
@@ -2438,6 +2439,9 @@ static bool fast_blit_ok(const struct igt_fb *fb)
 	if (ver < 12)
 		return true;
 
+	if (ver >= 13 && !IS_ALDERLAKE_P(dev_id))
+		return true;
+
 	return fb->modifier != I915_FORMAT_MOD_X_TILED;
 }
 
-- 
2.25.1
