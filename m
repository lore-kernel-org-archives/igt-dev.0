Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF534892F0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 18:04:08 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  9 Nov 2020 18:03:59 +0000
Message-Id: <20201109180359.444001-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Ignore runner's SIGQUIT from fork
 helpers
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

We would rather not confuse our debug our without simultaneous delivery
of SIGQUIT to the helper processes, leaving the parent to handle SIGQUIT
and kill the children. (If the parent is unable to quit, then it and the
children will be killed by the runner.)

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 8f9d925bd..a9c392d0d 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2191,6 +2191,7 @@ bool __igt_fork_helper(struct igt_helper_process *proc)
 		exit_handler_count = tmp_count;
 		igt_assert(0);
 	case 0:
+		signal(SIGQUIT, SIG_IGN);
 		reset_helper_process_list();
 		oom_adjust_for_doom();
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
