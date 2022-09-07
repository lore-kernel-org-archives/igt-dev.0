Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CCB10E459
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 08:48:30 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 14:19:49 +0530
Message-Id: <20220907084949.5018-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/testdisplay: Remove extra newline
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

Extra newlines in the test are removed.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/testdisplay.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index d45a722bf..568dd2f55 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -427,7 +427,6 @@ set_stereo_mode(struct connector *c)
 {
 	int i, n;
 
-
 	if (specified_mode_num != -1)
 		n = 1;
 	else
@@ -515,7 +514,6 @@ int update_display(bool probe)
 			if (test_preferred_mode || force_mode ||
 			    specified_mode_num != -1)
 				crtc_idx_mask &= ~(1 << connector->pipe);
-
 		}
 	}
 
-- 
2.25.1
