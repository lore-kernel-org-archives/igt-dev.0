Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7DB10E602
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 19:59:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e23c620e8so102652e87.1
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 11:59:55 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] lib/igt_fb: With Intel blitter path ignore legacy
 rules on Xe
Date: Wed, 20 Dec 2023 21:59:39 +0200
Message-Id: <20231220195940.3778662-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231220195940.3778662-1-juhapekka.heikkila@gmail.com>
References: <20231220195940.3778662-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

If running with Xe device there's no need to care about legacy
size limitations, just say blitter is ok before checking for
legacy blitter size limits.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 683eb176b..06374efa0 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2513,6 +2513,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 	     is_gen12_mc_ccs_modifier(fb->modifier))
 		return false;
 
+	if (is_xe_device(fb->fd))
+		return true;
+
 	for (int i = 0; i < fb->num_planes; i++) {
 		int width = fb->plane_width[i];
 
-- 
2.25.1
