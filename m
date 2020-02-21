Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB78897EF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 12:08:14 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n18so1928850ljo.7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 04:08:14 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 21 Feb 2020 14:08:07 +0200
Message-Id: <1582286887-23159-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: increase timeout
 for nonblocking flip wait
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

When run on more than one monitor there may be modeset in queue
which will block flip. Kernel will timeout with modeset at
ten seconds so lets wait in test also that same ten seconds at
maximum.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index f41f68d..f2f1c09 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -251,7 +251,7 @@ static void flip_nonblocking(igt_display_t *display, enum pipe pipe_id, bool ato
 	igt_plane_t *primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	int ret;
 
-	igt_set_timeout(1, "Scheduling page flip\n");
+	igt_set_timeout(10, "Scheduling page flip\n");
 	if (!atomic) {
 		/* Schedule a nonblocking flip for the next vblank */
 		do {
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
