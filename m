Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C994010EB9A
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 22:55:02 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id z14so2541245pgh.0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 15:55:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jun 2022 15:55:10 -0700
Message-Id: <20220616225510.3305267-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt] tests/kms_getfb: Fix on non-i915 devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

intel_get_drm_devid() will assert that it is i915.. so we need to
require that first in order for getfb-reject-ccs to skip instead of
crash.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_getfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index b3a8d265..2e4552a0 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -265,6 +265,7 @@ static void test_duplicate_handles(int fd)
 		struct drm_mode_fb_cmd2 add_ccs = { };
 		struct drm_mode_fb_cmd get = { };
 
+		igt_require(is_i915_device(fd));
 		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
 			      "skip because flat ccs has only one buffer.\n");
 
-- 
2.36.1
