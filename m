Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0D510E1B4
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 12:22:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 17:47:00 +0530
Message-Id: <20230515121700.3804073-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-80-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-80-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 79/79] testplan/kms: Make documentation is
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

V2: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 docs/testplan/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 2014f91b5..1b03ae444 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -28,7 +28,7 @@ xe_test_dict = {
 	       }
 
 test_dict = {
-	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
+	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
 	    }
 
 if build_xe
-- 
2.40.0
