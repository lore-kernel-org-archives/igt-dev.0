Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1666410E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 10:24:57 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 12:24:34 +0200
Message-Id: <20221031102434.2250160-7-petri.latvala@intel.com>
In-Reply-To: <20221031102434.2250160-1-petri.latvala@intel.com>
References: <20221031102434.2250160-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 7/7] runner: Disable socket
 communications for now
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

Currently, having i915 CI systems test the socket communications when
testing is impossible. If a test hangs completely, the incomplete set
of results are processed into results.json with an older IGT version
from a previous post-merge build, which is unable to parse socket
communications. Disable them for now.

This commit will get reverted after suitable testing has been possible
to execute.

v2: Rename the enable var, explain its presence further in a comment
    (Kamil)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 669e8524..a79a34e0 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1659,7 +1659,14 @@ static int execute_next_entry(struct execute_state *state,
 
 		sigprocmask(SIG_UNBLOCK, sigmask, NULL);
 
-		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION")) {
+		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION") &&
+		    getenv("IGT_RUNNER_ENABLE_SOCKET_COMMUNICATION_FIXME")) {
+			/*
+			 * The variable for enabling socket comms is
+			 * temporary. Do not use unless you really
+			 * know what you're doing. Requiring it will
+			 * go away later.
+			 */
 			snprintf(envstring, sizeof(envstring), "%d", socketfd);
 			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
 		}
-- 
2.30.2
