Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481A210E59B
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 09:13:58 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Mar 2022 12:13:29 +0300
Message-Id: <20220328091329.16009-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner: Fix handling of per-test-timeout
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

Instead of stopping execution on resume-init success, stop on
resume-init failure like intended.

Fixes: 4b88a9253443 ("runner: check if it has root permissions")
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/executor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index b4efc4fd..6e6ca9cc 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -2043,7 +2043,7 @@ bool execute(struct execute_state *state,
 			}
 			close(sigfd);
 			close(testdirfd);
-			if (initialize_execute_state_from_resume(resdirfd, state, settings, job_list))
+			if (!initialize_execute_state_from_resume(resdirfd, state, settings, job_list))
 				return false;
 			state->time_left = time_left;
 			return execute(state, settings, job_list);
-- 
2.30.2
