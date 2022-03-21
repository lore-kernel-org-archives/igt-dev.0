Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DCC10E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Mar 2022 13:20:07 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Mon, 21 Mar 2022 18:42:04 +0530
Message-Id: <20220321131205.267500-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220321131205.267500-1-priyanka.dandamudi@intel.com>
References: <20220321131205.267500-1-priyanka.dandamudi@intel.com>
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

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/prime_self_import.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
index 38a55439..a56ec313 100644
--- a/tests/prime_self_import.c
+++ b/tests/prime_self_import.c
@@ -442,6 +442,8 @@ igt_main
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe_f("Verify PRIME_HANDLE_TO_FD functionality in"
+				" different scenarios:%s", tests[i].name);
 		igt_subtest(tests[i].name)
 			tests[i].fn();
 	}
-- 
2.25.1
