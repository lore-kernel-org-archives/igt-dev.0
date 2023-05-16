Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89F210E2D0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 03:59:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 09:23:58 +0530
Message-Id: <20230516035358.3879159-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515121700.3804073-1-bhanuprakash.modem@intel.com>
References: <20230515121700.3804073-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 79/79] testplan/kms: Make documentation is
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
List-ID: <igt-dev@lists.freedesktop.org>

As testplan documentation is ready for all kms tests, update the
testplan config to make sure we are not missing the documentation
all the kms tests.

V2, V3: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 docs/testplan/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 6454f2933..704d4b3a2 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -29,12 +29,12 @@ xe_test_dict = {
 
 if build_xe
 	test_dict = {
-		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
+		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
 		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
 	    }
 else
 	test_dict = {
-	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
+	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
 	    }
 endif
 
-- 
2.40.0
