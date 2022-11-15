Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17FE10E3B4
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 10:21:59 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 12:22:06 +0200
Message-Id: <20221115102206.2493050-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915_pm_freq_mult: Compare scale factors as
 floats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_assert_eq converts parameters to ints. The checked values are
floats, so use igt_assert_eq_double instead.

Fixes: d47beef9b015 ("tests/i915_pm_freq_mult: New test for media freq factor")
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/i915_pm_freq_mult.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/i915/i915_pm_freq_mult.c
index 70cd7ffc..894ae294 100644
--- a/tests/i915/i915_pm_freq_mult.c
+++ b/tests/i915/i915_pm_freq_mult.c
@@ -102,7 +102,7 @@ static void media_freq(int gt, int dir)
 	igt_require(igt_sysfs_has_attr(dir, "media_freq_factor"));
 
 	igt_sysfs_scanf(dir, "media_freq_factor.scale", "%g", &scale);
-	igt_assert_eq(scale, FREQ_SCALE_FACTOR);
+	igt_assert_eq_double(scale, FREQ_SCALE_FACTOR);
 
 	setup_freq(gt, dir);
 
-- 
2.30.2
