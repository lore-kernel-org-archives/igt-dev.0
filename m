Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2671910E33F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 14:22:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.143.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 378A5580DAB
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 07:22:08 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q16QH-00Abcz-1P
 for igt-dev@lists.freedesktop.org; Mon, 22 May 2023 16:22:05 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 16:21:56 +0200
Message-Id: <20230522142201.2527800-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] scripts/test_list.py: add support to
 define a name at the config file
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

Instead of inferring the driver name from the test directory, allow
specifying it at the JSON config file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 21767870b1c1..654ccd8692d4 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -337,16 +337,16 @@ class TestList:
         if has_implemented:
             if has_planned:
                 planned_class = "Planned"
-                self.title = "Planned and implemented tests for "
+                self.title = "Planned and implemented "
             else:
-                self.title = "Implemented tests for "
+                self.title = "Implemented "
         else:
             if has_planned:
-                self.title = "Planned tests for "
+                self.title = "Planned "
             else:
                 sys.exit("Need file names to be processed")
 
-        self.title += driver_name + " driver"
+        self.title += self.config.get("name", "tests for " + driver_name + " driver")
 
         # Parse files, expanding wildcards
         field_re = re.compile(r"(" + '|'.join(self.field_list.keys()) + r'):\s*(.*)', re.I)
-- 
2.40.1
