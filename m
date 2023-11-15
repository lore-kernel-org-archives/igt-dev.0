Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEEE10E059
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 13:49:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 19:09:23 +0530
Message-Id: <20231115133923.1539402-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] lib/igt_draw: Check for Rendercopy support
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

igt_draw_supports_method() is initially designed to identify
that the given driver (i915/xe) supports the slected draw
method.

Even though Rendercopy support in IGT is not present for few
latest platforms, this api assums that Rendercopy is present.
Add a check if Rendercopy supports on given platform or not.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_draw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 9a7664a37..498c69a56 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -950,5 +950,8 @@ bool igt_draw_supports_method(int fd, enum igt_draw_method method)
 	if (method == IGT_DRAW_MMAP_CPU || method == IGT_DRAW_PWRITE)
 		return is_i915_device(fd);
 
+	if (method == IGT_DRAW_RENDER)
+		return !!igt_get_render_copyfunc(intel_get_drm_devid(fd));
+
 	return true;
 }
-- 
2.40.0
