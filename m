Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C853C6EA1B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 07:32:10 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Thu,  8 Apr 2021 13:12:14 +0530
Message-Id: <20210408074214.29412-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rmfb : Added test description.
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

Added test description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_rmfb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 2d49be8e..879ea574 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -168,9 +168,13 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("RMFB is supposed to free the framebuffers from any and all "
+		     "planes so test this and make sure it works.");
 	igt_subtest_f("rmfb-ioctl")
 		run_rmfb_test(&data, false);
 
+	igt_describe("RMFB is supposed to free the framebuffers from any and all planes "
+		     "so test this and make sure it works with fd close and reopen.");
 	igt_subtest_f("close-fd")
 		run_rmfb_test(&data, true);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
