Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFD114A53A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 08:52:36 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Jul 2022 14:22:14 +0530
Message-Id: <20220711085214.359128-2-riana.tauro@intel.com>
In-Reply-To: <20220711085214.359128-1-riana.tauro@intel.com>
References: <20220711085214.359128-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/i915/i915_pm_rc6_residency: Use
 correct type for power in rc6-fence
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use the correct type in rc6-fence for power to prevent truncating
value to 0.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index 67d25918..cf7a92b9 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -509,7 +509,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 		igt_debug("%s: slept=%lu perf=%"PRIu64", rc6=%"PRIu64"\n",
 			  e->name, slept, ts[1] - ts[0], rc6);
 		if (rapl_read(&rapl, &sample[1]))  {
-			uint64_t power = power_J(&rapl, &sample[0], &sample[1]);
+			double power = power_J(&rapl, &sample[0], &sample[1]);
 			igt_info("Total energy used for %s: %.1fmJ (%.1fmW)\n",
 				 e->name,
 				 power * 1e3,
-- 
2.25.1
