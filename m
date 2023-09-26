Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA6510E42C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 18:47:59 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6910ea9cca1so7268737b3a.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 11:47:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 11:47:47 -0700
Message-ID: <20230926184748.199187-3-robdclark@gmail.com>
In-Reply-To: <20230926184748.199187-1-robdclark@gmail.com>
References: <20230926184748.199187-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 3/3] core_getversion: Test for desired device
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
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 tests/core_getversion.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 32cb976e4923..b298a6890ef9 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -48,14 +48,25 @@ igt_simple_main
 {
 	int fd;
 	drmVersionPtr v;
+	const char *name = getenv("IGT_REQUIRED_DRIVER");
+	int chipset = DRIVER_ANY;
 
-	fd = drm_open_driver(DRIVER_ANY);
+	if (name)
+		chipset = drm_find_chipset(name);
+
+	fd = __drm_open_driver(chipset);
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
