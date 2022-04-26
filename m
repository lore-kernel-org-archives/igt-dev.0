Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108111277B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 07:29:34 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Tue, 26 Apr 2022 12:50:48 +0530
Message-Id: <20220426072049.518210-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220426072049.518210-1-priyanka.dandamudi@intel.com>
References: <20220426072049.518210-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] prime_self_import: Add description for
 test
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add description for test.

v2: add description to tests[].

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/prime_self_import.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
index 38a554396..bf5486194 100644
--- a/tests/prime_self_import.c
+++ b/tests/prime_self_import.c
@@ -429,19 +429,29 @@ igt_main
 	struct {
 		const char *name;
 		void (*fn)(void);
+		const char *describe;
 	} tests[] = {
-		{ "basic-with_one_bo", test_with_one_bo },
-		{ "basic-with_one_bo_two_files", test_with_one_bo_two_files },
-		{ "basic-with_two_bos", test_with_two_bos },
-		{ "basic-with_fd_dup", test_with_fd_dup },
-		{ "export-vs-gem_close-race", test_export_close_race },
-		{ "reimport-vs-gem_close-race", test_reimport_close_race },
-		{ "basic-llseek-size", test_llseek_size },
-		{ "basic-llseek-bad", test_llseek_bad },
+		{ "basic-with_one_bo", test_with_one_bo,
+			"Check prime import/export with one buffer object." },
+		{ "basic-with_one_bo_two_files", test_with_one_bo_two_files,
+			"Check prime/flink with one buffer object." },
+		{ "basic-with_two_bos", test_with_two_bos,
+			"Check prime import/export with two buffer objects."},
+		{ "basic-with_fd_dup", test_with_fd_dup,
+			"Check prime export with duplicate fd."},
+		{ "export-vs-gem_close-race", test_export_close_race,
+			"Check race of gem close against prime export." },
+		{ "reimport-vs-gem_close-race", test_reimport_close_race,
+			"Check race of gem close against reimport." },
+		{ "basic-llseek-size", test_llseek_size,
+			"Check dmabuf llseek support." },
+		{ "basic-llseek-bad", test_llseek_bad,
+			"Check dmabuf llseek support with invalid values."},
 	};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe(tests[i].describe);
 		igt_subtest(tests[i].name)
 			tests[i].fn();
 	}
-- 
2.25.1
