Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7FD10E57D
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 07:05:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 May 2023 12:30:17 +0530
Message-Id: <20230505070017.3170987-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2] scripts/test_list: Create dir if it doesn't
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
List-ID: <igt-dev@lists.freedesktop.org>

To generate the testlist create the destination dir if it
doesn't exist.

V2: - Move the logic to outside the loop (Mauro)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 855950506..9a909e364 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1134,6 +1134,9 @@ class TestList:
 
         test_subtests = self.get_subtests(sort_field)
 
+        if not os.path.exists(directory):
+            os.makedirs(directory)
+
         for test in test_subtests.keys():  # pylint: disable=C0201,C0206
             if not test_subtests[test]:
                 continue
-- 
2.40.0
