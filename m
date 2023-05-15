Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0495410E237
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 16:39:38 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Mon, 15 May 2023 18:39:08 +0200
Message-Id: <20230515163908.50961-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] meson: fix testplan building for old meson
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
List-ID: <igt-dev@lists.freedesktop.org>

Old meson 0.47.2 do not support dictionary adding so fix
testplan building.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 docs/testplan/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 2014f91b5..6454f2933 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -27,12 +27,15 @@ xe_test_dict = {
 		 'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
 	       }
 
-test_dict = {
+if build_xe
+	test_dict = {
+		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
+		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
+	    }
+else
+	test_dict = {
 	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
 	    }
-
-if build_xe
-	test_dict += xe_test_dict
 endif
 
 foreach testplan, fields: test_dict
-- 
2.39.2


