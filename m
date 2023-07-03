Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5A510E025
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jul 2023 19:01:35 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Mon,  3 Jul 2023 16:00:53 -0300
Message-ID: <20230703190052.14865-2-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: Add check for intel device on
 use_enginecopy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tales.aparecida@gmail.com, andrealmeid@riseup.net
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Certain tests (eg: kms_plane) are failing on vkms due to an assert in
intel_get_drm_devid which checks for an intel device.

Add check for intel device before calling intel_get_drm_devid.

Fixes: 422557124731 ("lib/igt_fb: include lib/intel_blt functions to blitter path")

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 lib/igt_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9529d198a..a8988274f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2526,6 +2526,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 
 static bool use_enginecopy(const struct igt_fb *fb)
 {
+	if (!is_intel_device(fb->fd))
+		return false;
+
 	if (!is_xe_device(fb->fd) && blitter_ok(fb))
 		return false;
 
-- 
2.41.0
