Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2536E20B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 11:56:40 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon,  8 Nov 2021 13:55:24 +0200
Message-Id: <20211108115524.17531-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner: Correctly handle abort before first
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Don't leave the execution in a "please resume me" state if bootup
causes an abort condition. Especially handle the case of abort on
bootup when resuming correctly, so that it doesn't attempt to run a
test on a tainted kernel if we've explicitly configured the runner to
not execute when there's a taint.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 runner/executor.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 9b582179..5007ed75 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1766,7 +1766,7 @@ bool execute(struct execute_state *state,
 	close(unamefd);
 
 	/* Check if we're already in abort-state at bootup */
-	if (!state->resuming) {
+	{
 		char *reason;
 
 		if ((reason = need_to_abort(settings)) != NULL) {
@@ -1775,7 +1775,13 @@ bool execute(struct execute_state *state,
 			free(reason);
 			free(nexttest);
 
-			status = false;
+			/*
+			 * If bootup causes an abort condition, assume
+			 * that it would happen on every boot.  Thus,
+			 * the correct state of this execution is "all
+			 * finished".
+			 */
+			status = true;
 
 			goto end;
 		}
-- 
2.29.2
