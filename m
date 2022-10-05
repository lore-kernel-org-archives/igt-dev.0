Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F55410E4F0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 07:46:04 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.61.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7A936580DFE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 00:45:54 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ofz6F-000Egs-3B
 for igt-dev@lists.freedesktop.org; Wed, 05 Oct 2022 09:45:51 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Oct 2022 09:45:46 +0200
Message-Id: <20221005074546.55955-78-mauro.chehab@linux.intel.com>
In-Reply-To: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
References: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 77/77] igt_core: add a line break at the
 end of some internal_assert
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The logic which prints internal_assert expects a line break, as
otherwise it would print things like:

	must only be called outside of a subtestplease refer to lib/igt_core documentation

So, add a \n on a couple of places that it is missing it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index dc6486c841f0..2aee0d0802fd 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -627,7 +627,7 @@ uint64_t igt_nsec_elapsed(struct timespec *start)
 void __igt_assert_in_outer_scope(void)
 {
 	internal_assert(!in_subtest,
-			"must only be called outside of a subtest");
+			"must only be called outside of a subtest\n");
 }
 
 bool __igt_fixture(void)
@@ -1688,7 +1688,7 @@ void igt_fail(int exitcode)
 		exit_subtest("FAIL");
 	} else {
 		internal_assert(igt_can_fail(), "failing test is only allowed"
-				" in fixtures, subtests and igt_simple_main");
+				" in fixtures, subtests and igt_simple_main\n");
 
 		if (in_fixture) {
 			skip_subtests_henceforth = FAIL;
@@ -1755,7 +1755,7 @@ void igt_describe_f(const char *fmt, ...)
 
 	internal_assert(!in_subtest || _igt_dynamic_tests_executed < 0,
 			"documenting dynamic subsubtests is impossible,"
-			" document the subtest instead.");
+			" document the subtest instead.\n");
 
 	if (!describe_subtests)
 		return;
-- 
2.37.3
