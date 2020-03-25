Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604B46E14B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 13:19:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 25 Mar 2020 15:19:43 +0200
Message-Id: <20200325131943.27797-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Remember to sync journal.txt for
 all writes
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

One missing fdatasync() for starting a subtest.

Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/81
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/executor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index c4b99115..d2ced797 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -868,6 +868,9 @@ static int monitor_output(pid_t child,
 				    !memcmp(outbuf, STARTING_SUBTEST, strlen(STARTING_SUBTEST))) {
 					write(outputs[_F_JOURNAL], outbuf + strlen(STARTING_SUBTEST),
 					      linelen - strlen(STARTING_SUBTEST));
+					if (settings->sync) {
+						fdatasync(outputs[_F_JOURNAL]);
+					}
 					memcpy(current_subtest, outbuf + strlen(STARTING_SUBTEST),
 					       linelen - strlen(STARTING_SUBTEST));
 					current_subtest[linelen - strlen(STARTING_SUBTEST)] = '\0';
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
