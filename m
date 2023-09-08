Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B513610E07F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 10:32:37 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:31:44 +0200
Message-ID: <20230908103218.1089792-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
References: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 02/11] xe_test_config.json: add testlists
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
