Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBFD89F2D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Sep 2021 19:36:31 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id u8so4202950vsp.1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Sep 2021 12:36:31 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 22 Sep 2021 19:36:23 +0000
Message-Id: <20210922193623.3891030-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/template: Use DRIVER_ANY in for
 drm_open_driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: seanpaul@chromium.org, petri.latvala@intel.com, ihf@chromium.org, Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
Make it run on all drivers.

[How]
open any driver instead of intel only.

Tested-on: ChromeOS Zork(amdgpu)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/template.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/template.c b/tests/template.c
index 5fbd3104..eed81dbf 100644
--- a/tests/template.c
+++ b/tests/template.c
@@ -61,7 +61,7 @@ int drm_fd;
 igt_main
 {
 	igt_fixture {
-		drm_fd = drm_open_driver(DRIVER_INTEL);
+		drm_fd = drm_open_driver(DRIVER_ANY);
 		igt_require(drm_fd >= 0);
 
 		/* Set up other interesting stuff shared by all tests. */
-- 
2.33.0.685.g46640cef36-goog
