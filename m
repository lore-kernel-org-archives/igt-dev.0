Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299256E7D0
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 08:31:46 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  7 Apr 2020 09:31:05 +0100
Message-Id: <20200407083105.1692124-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Show why we dump the task state
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

Include the reason why we are dumping the task state (test timeout) in
the kmsg log prior to the task state. Hopefully this helps when reading
the dump.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 1b69f9c57..25e3187a3 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -678,9 +678,20 @@ static bool sysrq(char cmd)
 	return success;
 }
 
-static void show_kernel_task_state(void)
+static const char *show_kernel_task_state(const char *msg)
 {
+	int fd;
+
+	fd = open("/dev/kmsg", O_WRONlY);
+	if (fd != -1) {
+		write(fd, "<4>[IGT] ", 7);
+		write(fd, msg, strlen(msg));
+		close(fd);
+	}
+
 	sysrq('t');
+
+	return msg;
 }
 
 static const char *need_to_timeout(struct settings *settings,
@@ -725,16 +736,12 @@ static const char *need_to_timeout(struct settings *settings,
 		return "Killing the test because the kernel is tainted.\n";
 
 	if (settings->per_test_timeout != 0 &&
-	    time_since_subtest > settings->per_test_timeout) {
-		show_kernel_task_state();
-		return "Per-test timeout exceeded. Killing the current test with SIGQUIT.\n";
-	}
+	    time_since_subtest > settings->per_test_timeout)
+		return show_kernel_task_state("Per-test timeout exceeded. Killing the current test with SIGQUIT.\n");
 
 	if (settings->inactivity_timeout != 0 &&
-	    time_since_activity > settings->inactivity_timeout) {
-		show_kernel_task_state();
-		return "Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n";
-	}
+	    time_since_activity > settings->inactivity_timeout)
+		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
 
 	return NULL;
 }
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
