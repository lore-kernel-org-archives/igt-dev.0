Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4672F10E02F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 05:15:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Jun 2023 10:39:54 +0530
Message-Id: <20230612050954.1412387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] scripts/test_list: Add igt-test-documentation URL
 to the logs
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

For new IGT users, it's helpful to have the URL (in case of
missing documentation) in IGT logs to refer igt documentation
page.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 scripts/test_list.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 2810c2358..0d31ac75f 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -21,6 +21,8 @@ MIN_PYTHON = (3, 6)
 if sys.version_info < MIN_PYTHON:
     sys.exit("Python %s.%s or later is required.\n" % MIN_PYTHON) # pylint: disable=C0209
 
+IGT_DOC_URL = "https://gfx-linux.intel.com/igt-doc.html#igt-test-documentation"
+
 #
 # ancillary functions to sort dictionary hierarchy
 #
@@ -953,6 +955,8 @@ class TestList:
         if run_missing:
             for test_name in run_missing:
                 print(f'Warning: Missing documentation for {test_name}')
+            print(f'Please refer: {IGT_DOC_URL}')
+
         if doc_uneeded or run_missing:
             sys.exit(1)
 
-- 
2.40.0
