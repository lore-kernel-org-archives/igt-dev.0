Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBD08FB11
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 09:35:18 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Jul 2022 15:08:40 +0530
Message-Id: <20220718093840.14908-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/kms_frontbuffer_tracking:
 Increase the poll timeout for simulation platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently the poll timeout value is 1000ms which is very less for
simulation, hence increased it to 10000ms.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 814ddb46..248ff36b 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -36,6 +36,8 @@
 #include "igt_sysfs.h"
 #include "igt_psr.h"
 
+#define TIME SLOW_QUICK(1000, 10000)
+
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
 		     "its related features: FBC, PSR and DRRS");
 
@@ -2306,7 +2308,7 @@ static void wait_flip_event(void)
 	pfd.events = POLLIN;
 	pfd.revents = 0;
 
-	rc = poll(&pfd, 1, 1000);
+	rc = poll(&pfd, 1, TIME);
 	switch (rc) {
 	case 0:
 		igt_assert_f(false, "Poll timeout\n");
-- 
2.26.2
