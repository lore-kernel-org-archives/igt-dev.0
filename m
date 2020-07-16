Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB70A6EC67
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 14:27:30 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu, 16 Jul 2020 19:45:57 +0530
Message-Id: <20200716141557.15909-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915_pm_lpsp: Add igt_wait to test
 lpsp
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
List-ID: <igt-dev@lists.freedesktop.org>

Sometimes LPSP test may fail due to HOTPLUG events,
which initiates AUX transaction in order to detect a Connector
status, these ongoing AUX transaction may fail the LPSP igt test.
Adding a igt_wait will avoid such failures.
Some eDP panel may have power_cycle_delay of 600ms,
therefore 1sec delay is safer.

Cc: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 12670f22..e9a59307 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -163,7 +163,8 @@ static void test_lpsp(data_t *data)
 		    data->mode->vdisplay <= 2160);
 
 	setup_lpsp_output(data);
-	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
+	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
+		     "%s: lpsp is not enabled\n%s:\n%s\n",
 		     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
 		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
