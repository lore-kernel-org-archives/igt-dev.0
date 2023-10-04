Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8811D10E3B1
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 17:21:27 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-578b4981526so15737a12.0
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Oct 2023 10:21:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 10:21:19 -0700
Message-ID: <20231004172119.289318-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5] core_getversion: Test for desired device
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
IGT_FORCE_DRIVER environment variable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Tested-by: Helen Koike <helen.koike@collabora.com>
---
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
