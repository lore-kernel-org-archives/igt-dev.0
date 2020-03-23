Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CF989D9B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 06:45:00 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 23 Mar 2020 12:02:47 +0530
Message-Id: <20200323063248.5261-5-anshuman.gupta@intel.com>
In-Reply-To: <20200323063248.5261-1-anshuman.gupta@intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 4/5] tests/i915_pm_lpsp: screens-disabled
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

Some times delayed audio codec disabling causes failure
of test, using igt_wait to check lpsp after disabling all outputs.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 0ce694e6..5f15c034 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -91,7 +91,7 @@ static void screens_disabled_subtest(data_t *data)
 		igt_display_commit(&data->display);
 	}
 
-	igt_assert(lpsp_is_enabled(data));
+	igt_assert(igt_wait(lpsp_is_enabled(data), 1000, 100));
 }
 
 static void check_output_lpsp(data_t *data)
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
