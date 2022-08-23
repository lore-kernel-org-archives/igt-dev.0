Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44B711A232
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:42 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:18 +0000
Message-Id: <20220823183036.5270-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/23] i915/perf: Bump timestamp tolerance
 for DG1
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

Timestamp deltas obtained from the batch vs the delta obtained from oa
reports have a delta that's between 4 to 5 us in DG1. Adjust the test
accordingly.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index ca3ccc17..95600562 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4084,8 +4084,9 @@ static void gen12_single_ctx_helper(void)
 	delta_delta = delta_ts64_ns > delta_oa32_ns ?
 		      (delta_ts64_ns - delta_oa32_ns) :
 		      (delta_oa32_ns - delta_ts64_ns);
-	if (delta_delta > 500) {
-		igt_debug("delta_delta exceeds margin, skipping..\n");
+	if (delta_delta > 5000) {
+		igt_debug("delta_delta = %d. exceeds margin, skipping..\n",
+			  delta_delta);
 		exit(EAGAIN);
 	}
 
-- 
2.25.1
