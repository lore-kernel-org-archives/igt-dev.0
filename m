Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2602688A36
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2020 14:05:25 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed,  5 Aug 2020 17:05:01 +0300
Message-Id: <20200805140501.485699-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] test: fix missing syncobj_timeline tests
 for Autotools
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

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 28c1e6980d6e20 ("igt: add timeline test cases")
---
 tests/Makefile.sources | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index fc1cb59c..269b506d 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -99,6 +99,7 @@ TESTS_progs = \
 	prime_vgem \
 	sw_sync \
 	syncobj_basic \
+	syncobj_timeline \
 	syncobj_wait \
 	template \
 	tools_test \
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
