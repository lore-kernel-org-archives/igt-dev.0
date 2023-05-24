Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED47510E47A
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 15:51:19 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8396F580C63
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 08:51:16 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q1qlD-00BTBL-1g
 for igt-dev@lists.freedesktop.org; Wed, 24 May 2023 17:50:47 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 17:50:39 +0200
Message-Id: <20230524155045.2733552-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230524155045.2733552-1-mauro.chehab@linux.intel.com>
References: <20230524155045.2733552-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/7] gem_exec_fence: fix a typo
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

additinal -> additional

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/gem_exec_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 5a67a93e8eed..76a86e8f4197 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -3284,7 +3284,7 @@ igt_main
 				}
 			}
 
-			igt_describe("Basic check for explicit fence with additinal wait time on"
+			igt_describe("Basic check for explicit fence with additional wait time on"
 				     " each busy engine.");
 			igt_subtest_with_dynamic("basic-wait") {
 				for_each_ctx_engine(i915, ctx, e) {
-- 
2.40.1
