Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87A810E086
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 18:07:50 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 20:07:45 +0200
Message-Id: <20230605180745.40121-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner: Dump GPU state on timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

As well as the task and cpu state we show, include the GPU state now
availavle via sysrq upon a runner abort (typically a timeout for an
unresponsive driver).

Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runner/executor.c b/runner/executor.c
index 597cd7f58..d3e6296dd 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -748,6 +748,7 @@ static void kmsg_log(int severity, const char *msg)
 static const char *show_kernel_task_state(const char *msg)
 {
 	kmsg_log(KMSG_WARN, msg);
+	sysrq('G'); /* GPU state */
 	sysrq('t'); /* task state, stack traces and cpu run lists */
 	sysrq('m'); /* task memory usage */
 
-- 
2.39.2
