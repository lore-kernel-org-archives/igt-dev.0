Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780C16E192
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 08:29:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g1so1802065wmh.4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 00:29:37 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Tue, 18 Feb 2020 09:29:04 +0100
Message-Id: <20200218082904.12327-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: Avoid hitting assertion on
 non-intel HW
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
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Recently a call to intel_get_drm_devid was added in a code path that
gets run on all hardware.

Restore the previous behavior by bailing out before we reach the assert.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Fixes: 8b90eefce9b4 ("lib/igt_fb: Use render copy/blit on platforms w/o HW detiling")
---
 lib/igt_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 49a032f65c06..0c4fdc5d4889 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1992,6 +1992,9 @@ static bool fast_blit_ok(const struct igt_fb *fb)
 
 static bool blitter_ok(const struct igt_fb *fb)
 {
+	if (!is_i915_device(fb->fd))
+		return false;
+
 	if (is_ccs_modifier(fb->modifier))
 		return false;
 
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
