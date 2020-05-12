Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087786E89B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2020 10:44:41 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 12 May 2020 16:04:13 +0530
Message-Id: <20200512103415.28968-5-anshuman.gupta@intel.com>
In-Reply-To: <20200512103415.28968-1-anshuman.gupta@intel.com>
References: <20200512103415.28968-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 4/6] tests/i915_pm_lpsp: screens-disabled
 subtest use igt_wait
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

When all screens are disabled, it takes some time to release
eDP/DP AUX IO power domain ref count. Also, delayed audio codec
disabling takes time to release AUDIO power domain ref-count,
using igt_wait to check lpsp after disabling all screens.

v2:
- Added a code comment for delay of igt_wait. [Animesh]

Reviewed-by: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 0e9452fd..12670f22 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -94,7 +94,9 @@ static void screens_disabled_subtest(data_t *data)
 	}
 
 	igt_require_f(valid_output, "No connected output found\n");
-	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
+	/* eDP panel may have power_cycle_delay of 600ms, 1sec delay is safer */
+	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
+		     "lpsp is not enabled\n%s:\n%s\n",
 		     PWR_DOMAIN_INFO, data->pwr_dmn_info =
 		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
