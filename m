Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3DD10E6AE
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 21:05:33 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-278eaffd81dso4283165a91.0
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 14:05:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 14:05:27 -0700
Message-ID: <20230928210527.268270-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4] core_getversion: Test for desired device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Helen Koike <helen.koike@collabora.com>
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
Acked-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
I dropped the previous two lib/drmtest patches, as they are no longer
strictly required.  I think they are still nice-to-have, but they are
unchanged since the previous version so it didn't seem useful to re-
send them.

 tests/core_getversion.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 32cb976e4923..8c8e0c9a3e5e 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -48,14 +48,21 @@ igt_simple_main
 {
 	int fd;
 	drmVersionPtr v;
+	const char *name = getenv("IGT_FORCE_DRIVER");
 
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
