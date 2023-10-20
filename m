Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A98110E0E8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:30:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507c8316abcso1027888e87.1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 06:30:49 -0700 (PDT)
From: Petri Latvala <adrinael@adrinael.net>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 16:30:41 +0300
Message-Id: <20231020133041.58257-3-adrinael@adrinael.net>
In-Reply-To: <20231020133041.58257-1-adrinael@adrinael.net>
References: <20231020133041.58257-1-adrinael@adrinael.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/3] runner/runner_tests: Fix name of no-subtests
 in unit tests
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

Now that runner normalizes no-subtest entries in testlists, make sure
the name matches what's available.

Signed-off-by: Petri Latvala <adrinael@adrinael.net>
---
 runner/runner_tests.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index e6024de11..11ff05bc0 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -802,7 +802,7 @@ igt_main
 		char filename[] = "tmplistXXXXXX";
 		const char testlisttext[] = "igt@successtest@first-subtest\n"
 			"igt@successtest@second-subtest\n"
-			"igt@nosubtests\n";
+			"igt@no-subtests\n";
 		int multiple;
 		struct job_list *list = malloc(sizeof(*list));
 
@@ -830,7 +830,7 @@ igt_main
 
 				igt_assert_eqstr(list->entries[0].binary, "successtest");
 				if (!multiple) igt_assert_eqstr(list->entries[1].binary, "successtest");
-				igt_assert_eqstr(list->entries[multiple ? 1 : 2].binary, "nosubtests");
+				igt_assert_eqstr(list->entries[multiple ? 1 : 2].binary, "no-subtests");
 
 				igt_assert_eq(list->entries[0].subtest_count, multiple ? 2 : 1);
 				igt_assert_eq(list->entries[1].subtest_count, multiple ? 0 : 1);
-- 
2.39.2
