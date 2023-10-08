Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C33910E07A
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Oct 2023 22:23:53 +0000 (UTC)
From: Helen Koike <helen.koike@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  8 Oct 2023 19:23:06 -0300
Message-Id: <20231008222306.145122-2-helen.koike@collabora.com>
In-Reply-To: <20231008222306.145122-1-helen.koike@collabora.com>
References: <20231008222306.145122-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] core_getversion: drop unused assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, emma@anholt.net,
 Helen Koike <helen.koike@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If IGT_FORCE_DRIVER is used, open_device() already checks if the name
matches, so igt_assert_fd(fd) is already enough.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 tests/core_getversion.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 8c8e0c9a3..9945c3855 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -48,7 +48,6 @@ igt_simple_main
 {
 	int fd;
 	drmVersionPtr v;
-	const char *name = getenv("IGT_FORCE_DRIVER");
 
 	fd = __drm_open_driver(DRIVER_ANY);
 	igt_assert_fd(fd);
@@ -58,11 +57,6 @@ igt_simple_main
 	igt_assert_neq(strlen(v->desc), 0);
 	if (is_i915_device(fd))
 		igt_assert_lte(1, v->version_major);
-	if (name) {
-		igt_assert_f(!strcmp(name, v->name),
-			     "Expected driver \"%s\" but got \"%s\"\n",
-			     name, v->name);
-	}
 
 	drmFree(v);
 	drm_close_driver(fd);
-- 
2.34.1
