Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9375210E883
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:37:40 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 98D69580ABD
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 01:37:38 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qeWzg-004YDK-20
 for igt-dev@lists.freedesktop.org; Fri, 08 Sep 2023 10:37:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 10:27:44 +0200
Message-ID: <20230908083734.1084351-9-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 08/11] scripts/test_list.py: fix
 gen_testlist logic
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

Don't try to find a common prefix for tests, as this cause
troubles when filtering out tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index c9073cc0305f..01f6528ac84c 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1352,8 +1352,6 @@ class TestList:
 
         """Generate testlists from the test documentation"""
 
-        test_prefix = os.path.commonprefix(self.get_subtests()[""])
-        test_prefix = re.sub(r'^' + self.main_name, '', test_prefix)
 
         # NOTE: currently, it uses a comma for multi-value delimitter
         test_subtests = self.get_subtests(sort_field, ",", with_order = True)
@@ -1374,7 +1372,7 @@ class TestList:
                 fname = testlist
 
             fname = re.sub(r"[^\w\d]+", "-", fname)
-            fname = directory + "/" + test_prefix + fname + ".testlist"
+            fname = directory + "/" + fname + ".testlist"
 
             with open(fname, 'w', encoding='utf8') as handler:
                 for sub in test_subtests[test]:
-- 
2.41.0
