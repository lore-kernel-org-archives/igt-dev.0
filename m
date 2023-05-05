Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2610E56A
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 06:19:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  5 May 2023 11:44:31 +0530
Message-Id: <20230505061431.3157151-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/test_list: Create dir if it doesn't
 exist
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

To generate the testlist create the destination dir if it
doesn't exist.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 scripts/test_list.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 1c5e195eb..9ae1cd154 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1149,6 +1149,9 @@ class TestList:
             fname = directory + "/" + test_prefix + fname + ".testlist"
             fname = re.sub(r"[\s_]+", "-", fname)
 
+            if not os.path.exists(directory):
+                os.makedirs(directory)
+
             with open(fname, 'w', encoding='utf8') as handler:
                 for sub in test_subtests[test]:
                     handler.write (f"{sub}\n")
-- 
2.40.0


