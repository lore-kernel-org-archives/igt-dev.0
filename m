Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC726E1E0
 for <igt-dev@lists.freedesktop.org>; Mon, 24 May 2021 11:05:52 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 24 May 2021 16:34:47 +0530
Message-Id: <20210524110447.6166-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dp_tiled_display: added test
 description for chamelium subtest
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

Added description for the newly added chamelium subtest,
test is basically the same as basic-test-pattern just the
fact it executes on chamelium.

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_dp_tiled_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index 6dafc888..eb28dd6b 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -481,6 +481,8 @@ igt_main
 	}
 
 	#ifdef HAVE_CHAMELIUM
+        igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
+                     "page flips for all tiled CRTCs in one vblank (executes on chamelium).");
 	igt_subtest_f("basic-test-pattern-with-chamelium") {
 		int i;
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
