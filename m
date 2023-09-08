Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BC010E882
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:37:39 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 90895580EA2
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 01:37:38 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qeWzg-004YD1-1g
 for igt-dev@lists.freedesktop.org; Fri, 08 Sep 2023 10:37:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 10:27:38 +0200
Message-ID: <20230908083734.1084351-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 02/11] xe_test_config.json: add testlists
 and blacklists
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

Specify the testlists and blacklists to be used to store CI
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
