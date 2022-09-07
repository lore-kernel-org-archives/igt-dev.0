Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9628C10E4D5
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 09:42:04 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 15:13:23 +0530
Message-Id: <20220907094323.6457-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/testdisplay: Add test description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added test description. Also, removed extra newlines.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/testdisplay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index d45a722bf..ee272dfb2 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -69,6 +69,8 @@
 #include <stdlib.h>
 #include <signal.h>
 
+IGT_TEST_DESCRIPTION("Tests basic display functionality.");
+
 enum {
 	OPT_YB,
 	OPT_YF,
@@ -427,7 +429,6 @@ set_stereo_mode(struct connector *c)
 {
 	int i, n;
 
-
 	if (specified_mode_num != -1)
 		n = 1;
 	else
@@ -515,7 +516,6 @@ int update_display(bool probe)
 			if (test_preferred_mode || force_mode ||
 			    specified_mode_num != -1)
 				crtc_idx_mask &= ~(1 << connector->pipe);
-
 		}
 	}
 
-- 
2.25.1
