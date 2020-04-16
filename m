Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFA16EB2E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 09:39:41 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 16 Apr 2020 10:39:18 +0100
Message-Id: <20200416093918.3061840-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: More task debug!
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

In a few cases, we hit a timeout where no process appears to be
deadlocked (i.e. tasks stuck in 'D' with intertwined stacks) but
everything appears to be running happily. Often, they appear to be
fighting over the shrinker, so one naturally presumes we are running low
on memory. But for tests that were designed to run with ample memory to
spare, that is a little disconcerting and I would like to know where the
memory actually went.

sysrq('m'): Will dump current memory info to your console

Sounds like that should do the trick.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index b85cdb448..063902624 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -702,7 +702,8 @@ static void kmsg_log(int severity, const char *msg)
 static const char *show_kernel_task_state(const char *msg)
 {
 	kmsg_log(KMSG_WARN, msg);
-	sysrq('t');
+	sysrq('t'); /* task state, stack traces and cpu run lists */
+	sysrq('m'); /* task memory usage */
 
 	return msg;
 }
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
