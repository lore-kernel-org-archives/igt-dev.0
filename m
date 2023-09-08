Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7523F10E07F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 10:32:37 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:31:49 +0200
Message-ID: <20230908103218.1089792-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
References: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 07/11] scripts/test_list.py: don't be
 greedy while matching data from testlists
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

Testlist regexes are not greedy: despite not containing a $ at the
end, they stop parsing at the end of string.

Honour that, doing the same logic as IGT runner does.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index ff4b2d8d76ae..c9073cc0305f 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -457,6 +457,8 @@ class TestList:
                 if match:
                     test = match.group(1)
                     subtest = match.group(2)
+                    if not subtest.endswith("$"):
+                        subtest += r"(\@.*)?$"
                     testlist[name].append(re.compile(f"{test}{subtest}"))
 
     def __filter_subtest(self, test, subtest, field_not_found_value):
-- 
2.41.0
