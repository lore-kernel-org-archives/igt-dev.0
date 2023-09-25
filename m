Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B424F8914B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 16:22:19 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bdf4752c3cso45527245ad.2
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 09:22:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 25 Sep 2023 09:22:12 -0700
Message-ID: <20230925162212.125997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] core_getversion: Test for desired device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We discovered in drm/ci that if the drm device fails to probe, all the
tests come back as "Skip" and the job is considered successful. Fix
the getversion test to fail if there is no drm device or if the drm
device does not match the expected device as specified by the optional
IGT_REQUIRED_DRIVER environment variable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/core_getversion.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 32cb976e4923..a13cc9c5c288 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -48,14 +48,21 @@ igt_simple_main
 {
 	int fd;
 	drmVersionPtr v;
+	const char *name = getenv("IGT_REQUIRED_DRIVER");
 
-	fd = drm_open_driver(DRIVER_ANY);
+	fd = __drm_open_driver(DRIVER_ANY);
+	igt_assert_fd(fd);
 	v = drmGetVersion(fd);
 	igt_assert_neq(strlen(v->name), 0);
 	igt_assert_neq(strlen(v->date), 0);
 	igt_assert_neq(strlen(v->desc), 0);
 	if (is_i915_device(fd))
 		igt_assert_lte(1, v->version_major);
+	if (name) {
+		igt_assert_f(!strcmp(name, v->name),
+			     "Expected driver \"%s\" but got \"%s\"\n",
+			     name, v->name);
+	}
 
 	drmFree(v);
 	drm_close_driver(fd);
-- 
2.41.0
