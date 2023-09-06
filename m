Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC2510E731
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 22:06:58 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Sep 2023 00:05:54 +0200
Message-ID: <20230906220642.507532-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230906220642.507532-1-mauro.chehab@linux.intel.com>
References: <20230906220642.507532-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/6] xe_test_config.json: add testlists
 and blocklists
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Specify the testlists and blocklists to be used to store CI
run type.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_test_config.json | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 8fb65d02d840..408afcbb03bc 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -32,6 +32,12 @@
                         "_properties_": {
                             "mandatory": true,
                             "description": "Defines what category of testlist it belongs",
+                            "testlists": {
+                                "Xe BAT": "../intel-ci/xe-fast-feedback.testlist"
+                            },
+                            "blocklists": {
+                                "Xe BAT": "../intel-ci/xe.blocklist.txt"
+                            },
                             "order": [
                                 "boot",
                                 "__all__",
-- 
2.41.0
