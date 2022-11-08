Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D19E10E0E8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 10:07:47 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 12:07:33 +0200
Message-Id: <20221108100733.2378106-6-petri.latvala@intel.com>
In-Reply-To: <20221108100733.2378106-1-petri.latvala@intel.com>
References: <20221108100733.2378106-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] Revert "runner: Disable socket
 communications for now"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

With a couple of fixes, using socket comms is now suitably ready for
prime time.

This reverts commit 372c56225e12578a7a4a6bcc5b79eb40b643fcde.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index c5f03614..2feef2c9 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1679,14 +1679,7 @@ static int execute_next_entry(struct execute_state *state,
 
 		sigprocmask(SIG_UNBLOCK, sigmask, NULL);
 
-		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION") &&
-		    getenv("IGT_RUNNER_ENABLE_SOCKET_COMMUNICATION_FIXME")) {
-			/*
-			 * The variable for enabling socket comms is
-			 * temporary. Do not use unless you really
-			 * know what you're doing. Requiring it will
-			 * go away later.
-			 */
+		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION")) {
 			snprintf(envstring, sizeof(envstring), "%d", socketfd);
 			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
 		}
-- 
2.30.2
