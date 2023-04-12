Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A45210E7CA
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 12:37:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.30.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EBDD6580BEE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 05:36:53 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pmZiU-000V90-2E
 for igt-dev@lists.freedesktop.org; Wed, 12 Apr 2023 14:36:50 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 14:35:43 +0200
Message-Id: <20230412123544.119534-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230412123544.119534-1-mauro.chehab@linux.intel.com>
References: <20230412123544.119534-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] scripts/igt_doc.py: cleanup some pylint
 warnings
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

Ensure that pylint won't report any issues on igt_doc.py.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py   | 1 +
 scripts/test_list.py | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 547cb81bce02..8fa5af15033e 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -11,6 +11,7 @@
 """Maintain test plan and test implementation documentation on IGT."""
 
 import argparse
+import sys
 
 from test_list import TestList
 
diff --git a/scripts/test_list.py b/scripts/test_list.py
index 6af1914822a3..d1b9a2794967 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,R0902,R0914,R0912,R0915,R1702,C0302
+# pylint: disable=C0301,R0902,R0914,R0912,R0913,R0915,R1702,C0302
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -394,7 +394,7 @@ class TestList:
         for subtest in self.doc[test]["subtest"].keys():
             summary = test_name
             if self.doc[test]["subtest"][subtest]["Summary"] != '':
-                 summary += '@' + self.doc[test]["subtest"][subtest]["Summary"]
+                summary += '@' + self.doc[test]["subtest"][subtest]["Summary"]
             if not summary:
                 continue
 
-- 
2.39.2
