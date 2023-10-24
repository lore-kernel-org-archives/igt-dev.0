Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFE410E3CA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 14:19:05 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A417F580E5F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 07:19:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qvIFG-000fqz-0G
 for igt-dev@lists.freedesktop.org; Tue, 24 Oct 2023 16:18:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Oct 2023 16:11:10 +0200
Message-ID: <20231024141855.160633-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
References: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] runner/runner_tests: change a regex to
 match case-insensitive
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

As regular expressions are now case-insensitive, change an
unit test to verify that case-insensitive logic is working
as expected.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/runner_tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 11ff05bc0e7e..c35668bc8f0e 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -1812,7 +1812,7 @@ igt_main
 
 	igt_subtest_group {
 		const char testlisttext[] = "igt@successtest";
-		const char blocktext[] = "igt@successtest@first";
+		const char blocktext[] = "igt@successTEST@first";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
 		char dirname[] = "tmpdirXXXXXX";
-- 
2.41.0
