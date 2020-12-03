Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B256E093
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Dec 2020 06:09:01 +0000 (UTC)
From: nidhi1.gupta@intel.com
Date: Thu,  3 Dec 2020 11:47:33 +0530
Message-Id: <20201203061733.8058-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC,
 i-g-t] tests/kms_atomic_transition:reduce execution time
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

test kms_atomic_transition@plane-toggle-modeset-transition
taking long time to execute on CI, with latest execution
single subtest is taking around 69.68s

Particular subtest is using for_each_pipe_with_valid_output
function which will execute on all the possible
combination of pipe and output

To reduce the execution time replaced the function with
for_each_pipe_with_single_output this will loop over all
the pipes but at most once

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a71bbe10..9e3cfe27 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1021,7 +1021,7 @@ igt_main
 	}
 
 	igt_subtest("plane-toggle-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output)
+		for_each_pipe_with_single_output(&display, pipe, output)
 			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 
 	for (i = 1; i <= IGT_MAX_PIPES; i++) {
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
