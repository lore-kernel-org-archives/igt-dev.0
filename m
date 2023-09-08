Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE1010E04B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 10:32:38 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:31:50 +0200
Message-ID: <20230908103218.1089792-9-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
References: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 08/11] scripts/test_list.py: fix
 gen_testlist logic
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
