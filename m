Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43C810E8F4
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 14:01:27 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Thu, 12 Jan 2023 11:00:52 -0300
Message-Id: <20230112140054.36590-2-mcanal@igalia.com>
In-Reply-To: <20230112140054.36590-1-mcanal@igalia.com>
References: <20230112140054.36590-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/3] lib/igt_v3d: Rework
 igt_v3d_get_param()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Instead of assuming that igt_v3d_get_param() will succeed, allow the
ioctl to fail and return 0. This way, it will be possible to check if the
kernel has the capabilities needed by the test by checking if the return
of the igt_v3d_get_param() function is different than zero.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 68d11d7f..28d1ab6b 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -89,11 +89,14 @@ igt_v3d_get_bo_offset(int fd, uint32_t handle)
 uint32_t
 igt_v3d_get_param(int fd, enum drm_v3d_param param)
 {
+	int ret;
 	struct drm_v3d_get_param get = {
 		.param = param,
 	};
 
-	do_ioctl(fd, DRM_IOCTL_V3D_GET_PARAM, &get);
+	ret = igt_ioctl(fd, DRM_IOCTL_V3D_GET_PARAM, &get);
+	if (ret)
+		return 0;
 
 	return get.value;
 }
-- 
2.39.0
