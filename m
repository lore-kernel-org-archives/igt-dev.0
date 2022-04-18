Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DD210E0EA
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 05:21:52 +0000 (UTC)
From: krishnaiah.bommu@intel.com
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Apr 2022 10:34:17 +0530
Message-Id: <20220418050417.30641-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] i915/gem_eio: increasing the timeout for forced
 reset completion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Konieczny Kamil <kamil.konieczny@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

GUC log capture is taking more time on few platforms, so increasing the timeout

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Konieczny Kamil <kamil.konieczny@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
---
 tests/i915/gem_eio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index d9689534d5a..d7fa9e02e92 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -72,8 +72,14 @@ static void trigger_reset(int fd)
 	igt_kmsg(KMSG_DEBUG "Forcing GPU reset\n");
 	igt_force_gpu_reset(fd);
 
-	/* The forced reset should be immediate */
-	igt_assert_lte(igt_seconds_elapsed(&ts), 2);
+	/* The forced reset should be immediate, even though
+	 * GUC log capture is taking more time on few platforms,
+	 * so Increasing the timeout
+	 */
+	if (gem_using_guc_submission(fd))
+		igt_assert_lte(igt_seconds_elapsed(&ts), 10);
+	else
+		igt_assert_lte(igt_seconds_elapsed(&ts), 2);
 
 	/* And just check the gpu is indeed running again */
 	igt_kmsg(KMSG_DEBUG "Checking that the GPU recovered\n");
-- 
2.25.1
