Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2486FBE1
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 11:15:42 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 Jan 2020 13:15:36 +0200
Message-Id: <20200123111536.28216-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Don't check for taints when not
 configured for it
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

If someone wants to execute tests without aborting when tainted, they
get all their tests just straight up killed on the first taint without
actually aborting execution. Obey their wishes and keep running.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 runner/executor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 71483b74..0927d1fd 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -759,7 +759,7 @@ static int monitor_output(pid_t child,
 			return -1;
 		}
 
-		if (tainted(&taints)) /* cancel children after a kernel OOPS */
+		if (settings->abort_mask & ABORT_TAINT && tainted(&taints)) /* cancel children after a kernel OOPS */
 			n = 0, intervals_left = 1;
 
 		if (n == 0) {
@@ -768,6 +768,7 @@ static int monitor_output(pid_t child,
 
 			switch (killed) {
 			case 0:
+				/* If abort_mask doesn't have taint set, taints is still 0 here */
 				if (!is_tainted(taints)) {
 					show_kernel_task_state();
 					if (settings->log_level >= LOG_LEVEL_NORMAL) {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
