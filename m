Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505F310E30E
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Sep 2022 22:27:38 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id r125so12583611oia.8
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Sep 2022 15:27:38 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 18 Sep 2022 17:26:51 -0500
Message-Id: <20220918222651.3279816-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] Replaced setpgrp() with setpgid() for
 standardization in BSD systems
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 lib/igt_aux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index d7e2714f..ba2d52e8 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -325,10 +325,10 @@ void igt_fork_signal_helper(void)
 	 * and we send the signal at exactly the wrong time).
 	 */
 	signal(SIGCONT, sig_handler);
-	setpgrp(); /* define a new process group for the tests */
+	setpgid(0, 0); /* define a new process group for the tests */
 
 	igt_fork_helper(&signal_helper) {
-		setpgrp(); /* Escape from the test process group */
+		setpgid(0, 0); /* Escape from the test process group */
 
 		/* Pass along the test process group identifier,
 		 * negative pid => send signal to everyone in the group.
-- 
2.37.3
