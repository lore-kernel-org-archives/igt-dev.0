Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129D56E0E7
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2020 10:59:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed,  5 Aug 2020 13:59:00 +0300
Message-Id: <20200805105900.29444-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Only claim the test was killed if
 it was killed
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

If we don't have --abort=taint active and there is a kernel taint,
test exiting normally caused the runner to inject a "this test was
killed" message to the test's output. Make sure we only inject that if
we really did kill the test, and journal the test exit correctly as
well.

Same goes for the message for exceeding disk usage limits.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
---
 runner/executor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 0377195d..1688ae41 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1071,7 +1071,7 @@ static int monitor_output(pid_t child,
 				 * the result an incomplete we avoid
 				 * journaling a timeout here.
 				 */
-				if (is_tainted(taints)) {
+				if (killed && is_tainted(taints)) {
 					exitline = EXECUTOR_EXIT;
 
 					/*
@@ -1096,7 +1096,7 @@ static int monitor_output(pid_t child,
 				 * Same goes for stopping because we
 				 * exceeded the disk usage limit.
 				 */
-				if (disk_usage_limit_exceeded(settings, disk_usage)) {
+				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
 					exitline = EXECUTOR_EXIT;
 					dprintf(outputs[_F_OUT],
 						"\nrunner: This test was killed due to exceeding disk usage limit. "
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
