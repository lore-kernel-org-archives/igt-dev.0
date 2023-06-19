Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574B910E1F0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:42 +0530
Message-Id: <20230619115858.2013195-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 02/18] lib/igt_fb: Intel bops & ibb is mandatory
 for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As XE supports rendercopy only, make sure bops & ibb is created
to use the rendercopy function.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 579f25597..0e23e23a9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2847,7 +2847,8 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 	struct igt_fb *fb = blit->fb;
 	struct fb_blit_linear *linear = &blit->linear;
 
-	if (!igt_vc4_is_tiled(fb->modifier) && use_enginecopy(fb)) {
+	if (is_xe_device(fd) ||
+	    (!igt_vc4_is_tiled(fb->modifier) && use_enginecopy(fb))) {
 		blit->bops = buf_ops_create(fd);
 		blit->ibb = intel_bb_create(fd, 4096);
 	}
-- 
2.40.0
