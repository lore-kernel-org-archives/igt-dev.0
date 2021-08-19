Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B0D6E9A0
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 15:22:33 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 19 Aug 2021 18:25:07 +0300
Message-Id: <20210819152507.25912-2-petri.latvala@intel.com>
In-Reply-To: <20210819152507.25912-1-petri.latvala@intel.com>
References: <20210819152507.25912-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] kms_ccs: Don't skip more subtests than
 necessary
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Matthew Auld <matthew.auld@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

Wrap test_output in a subtest group so we still get to test for the
rest of the pipes if a pipe cannot drive any outputs, or any subtests
that are later written after the calls to test_output.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_ccs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 238c245c..586680ae 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -621,10 +621,12 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 	for_each_pipe_static(pipe) {
 		data.pipe = pipe;
 
-		for (int c = 0; c < ARRAY_SIZE(tests); c++) {
-			data.flags = tests[c].flags;
-			igt_describe(tests[c].description);
-			test_output(&data, tests[c].testname);
+		igt_subtest_group {
+			for (int c = 0; c < ARRAY_SIZE(tests); c++) {
+				data.flags = tests[c].flags;
+				igt_describe(tests[c].description);
+				test_output(&data, tests[c].testname);
+			}
 		}
 	}
 
-- 
2.29.2
