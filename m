Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFB76E489
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 13:17:38 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 24 Mar 2020 18:36:29 +0530
Message-Id: <20200324130630.9388-5-anshuman.gupta@intel.com>
In-Reply-To: <20200324130630.9388-1-anshuman.gupta@intel.com>
References: <20200324130630.9388-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 4/5] tests/i915_pm_lpsp: screens-disabled
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

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index b38465d0..b1d3cc5e 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -89,7 +89,8 @@ static void screens_disabled_subtest(data_t *data)
 	}
 
 	igt_require_f(valid_output, "No connected output found\n");
-	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
+	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
+		     "%s: lpsp is not enabled\n%s:\n%s\n",
 		     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
 		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
