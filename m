Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA386E942
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jul 2021 15:17:31 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 22 Jul 2021 20:36:59 +0530
Message-Id: <20210722150700.18435-2-vidya.srinivas@intel.com>
In-Reply-To: <20210722150700.18435-1-vidya.srinivas@intel.com>
References: <20210722150700.18435-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] Revert "tests/kms_plane_alpha_blend:
 Fix a check in is_6bpc function"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit 7b4fdeca7cc4bc5786d9ee06be71779b28f29b59.

Subtest coverage-premultiplied-constant was failing due to
buffer alignment issue. It was not due to 6bpc. Hence this
patch needs to be reverted.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index d649a09f52b4..57bbda5d975a 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -454,7 +454,7 @@ static bool is_6bpc(igt_display_t *display, enum pipe pipe) {
 		return false;
 
 	c = output->config.connector;
-	if (c->connector_type != DRM_MODE_CONNECTOR_eDP &&
+	if (c->connector_type != DRM_MODE_CONNECTOR_eDP ||
 		c->connector_type != DRM_MODE_CONNECTOR_DSI)
 		return false;
 
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
