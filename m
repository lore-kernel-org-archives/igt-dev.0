Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899BB6EAD2
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 16:22:03 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  9 Dec 2020 21:36:40 +0530
Message-Id: <20201209160642.6317-5-anshuman.gupta@intel.com>
In-Reply-To: <20201209160642.6317-1-anshuman.gupta@intel.com>
References: <20201209160642.6317-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/6] i915/i915_pm_rpm:
 gem-execbuf-stress-pc8 use powetop
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

We require to auto-tune powertop before checking Package
C state. Invoke "powertop --auto-tune" before checking
PC8 residencies.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 34ec9a6d..d284fa54 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1391,8 +1391,10 @@ static void gem_execbuf_stress_subtest(int rounds, int wait_flags)
 
 	igt_require_gem(drm_fd);
 
-	if (wait_flags & WAIT_PC8_RES)
+	if (wait_flags & WAIT_PC8_RES) {
 		igt_require(has_pc8);
+		igt_require(setup_powertop());
+	}
 
 	i = 0;
 	batch_buf[i++] = MI_NOOP;
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
