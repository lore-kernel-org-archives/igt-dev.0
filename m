Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34546EC1A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 May 2021 07:36:34 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed, 26 May 2021 12:50:38 +0530
Message-Id: <20210526072040.2286-4-anshuman.gupta@intel.com>
In-Reply-To: <20210526072040.2286-1-anshuman.gupta@intel.com>
References: <20210526072040.2286-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 3/5] i915/i915_pm_rpm: gem-execbuf-stress
 PC8 timeout
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

Use a optimum PC8 timeout value for gem-execbuf-stress-pc8
igt test.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 7a4c9291..2d6cdf05 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1402,7 +1402,7 @@ static void gem_execbuf_stress_subtest(int rounds, int wait_flags)
 			igt_assert(wait_for_suspended());
 		}
 		if (wait_flags & WAIT_PC8_RES)
-			igt_assert(pc8_plus_residency_changed(30));
+			igt_assert(pc8_plus_residency_changed(PC8_TIMEOUT));
 		if (wait_flags & WAIT_EXTRA)
 			sleep(5);
 	}
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
