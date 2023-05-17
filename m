Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A5410E44B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 15:56:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 21:21:14 +0530
Message-Id: <20230517155114.95959-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-82-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-82-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 81/81] testplan/kms: Make documentation is
 mandatory for all kms subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

As testplan documentation is ready for all kms tests, update the
testplan config to make sure we are not missing the documentation
all the kms tests.

V2, V3, V4: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 docs/testplan/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 6cd44be5c..cca05cf8e 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -31,13 +31,13 @@ xe_test_dict = {
 if build_xe
 	test_dict = {
 		'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
-		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
+		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
 		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
 	    }
 else
 	test_dict = {
 	      'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
-	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
+	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
 	    }
 endif
 
-- 
2.40.0


