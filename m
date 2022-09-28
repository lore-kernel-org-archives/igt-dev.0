Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28F010E9A0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 19:35:57 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y141so10995944iof.5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 12:35:57 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 petri.latvala@intel.com
Date: Wed, 28 Sep 2022 14:35:52 -0500
Message-Id: <20220928193552.523357-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Replaced setpgrp() with setpgid() for
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

The BSD and GNU versions of setpgrp() differ in their parameter
conventions. To avoid this convolution, setpgrp() can be safely
replaced with setpgid() which is standard in both BSD and GNU
libc.

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
