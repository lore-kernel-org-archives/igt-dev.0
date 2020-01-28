Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDFA6EDD8
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 11:26:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so2078421wmj.5
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 03:26:09 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 28 Jan 2020 12:25:48 +0100
Message-Id: <20200128112549.172135-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
References: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_fbcon_fbt: User interactive
 debug helper
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Instead of hand-rolling our own which can only be enabled by recompiling.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/kms_fbcon_fbt.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
index 506848cfcf47..236e09ea1ebd 100644
--- a/tests/kms_fbcon_fbt.c
+++ b/tests/kms_fbcon_fbt.c
@@ -37,8 +37,6 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
 
 #define MAX_CONNECTORS 32
 
-static bool do_wait_user = false;
-
 struct drm_info {
 	int fd;
 	int debugfs_fd;
@@ -48,12 +46,8 @@ struct drm_info {
 
 static void wait_user(const char *msg)
 {
-	if (!do_wait_user)
-		return;
-
-	igt_info("%s Press enter...\n", msg);
-	while (getchar() != '\n')
-		;
+	igt_info("%s\n", msg);
+	igt_debug_wait_for_keypress("fbt");
 }
 
 static void setup_drm(struct drm_info *drm)
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
