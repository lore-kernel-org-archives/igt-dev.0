Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32F810E561
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 05:39:12 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 May 2023 07:39:06 +0200
Message-Id: <20230505053906.269572-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/test_list: don't mangle directory
 names
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

While we want to standardize the testlist file names to use
"-" instead of "_", such rule doesn't apply for the directory
name.

While here, make the replace regex more generic by replacing
any non word/digit character sequences to "-".

Reported-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index e7d486858eb4..a0db07125bc4 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1156,8 +1156,8 @@ class TestList:
             else:
                 fname = testlist
 
+            fname = re.sub(r"[^\w\d]+", "-", fname)
             fname = directory + "/" + test_prefix + fname + ".testlist"
-            fname = re.sub(r"[\s_]+", "-", fname)
 
             with open(fname, 'w', encoding='utf8') as handler:
                 for sub in test_subtests[test]:
-- 
2.40.1
