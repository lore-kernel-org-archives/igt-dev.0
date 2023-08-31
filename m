Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD0A10E696
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:30:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 31 Aug 2023 20:52:00 +0530
Message-Id: <20230831152200.1192557-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230831152200.1192557-1-bhanuprakash.modem@intel.com>
References: <20230831152200.1192557-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] testplan/kms: Make documentation is mandatory
 for all kms subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mauro.chehab@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

As testplan documentation is ready for all kms tests, update the
testplan config to make sure we are not missing the documentation
all the kms tests.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 docs/testplan/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index e838f2eb1..433464dc8 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -31,13 +31,13 @@ xe_test_dict = {
 if build_xe
 	test_dict = {
 		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
-		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
+		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
 		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
 	    }
 else
 	test_dict = {
 	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
-	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
+	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
 	    }
 endif
 
-- 
2.40.0


