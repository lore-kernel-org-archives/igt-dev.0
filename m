Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D86E6E1B2
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2020 09:13:07 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 21 Jul 2020 12:12:54 +0300
Message-Id: <20200721091254.30072-2-petri.latvala@intel.com>
In-Reply-To: <20200721091254.30072-1-petri.latvala@intel.com>
References: <20200721091254.30072-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] runner: Print a message when aborting
 due to IGT_EXIT_ABORT
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

Previously, when a test exited with IGT_EXIT_ABORT, we did abort but
did it silently. Print a message so runner logs tell a clear message
why we didn't execute the rest of the tests.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/executor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 25e37bff..77818987 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1113,8 +1113,10 @@ static int monitor_output(pid_t child,
 					fdatasync(outputs[_F_JOURNAL]);
 				}
 
-				if (status == IGT_EXIT_ABORT)
+				if (status == IGT_EXIT_ABORT) {
+					errf("Test exited with IGT_EXIT_ABORT, aborting.\n");
 					aborting = true;
+				}
 
 				if (time_spent)
 					*time_spent = time;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
