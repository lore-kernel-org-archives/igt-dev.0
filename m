Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB7910E324
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 07:12:23 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.28.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id ADBC0580BF0
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 00:12:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJ7Xj-0035s5-1s
 for igt-dev@lists.freedesktop.org; Tue, 11 Jul 2023 09:12:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 09:12:13 +0200
Message-Id: <20230711071213.737377-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230711071213.737377-1-mauro.chehab@linux.intel.com>
References: <20230711071213.737377-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] scripts/test_list.py: document what BAT
 stands for
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

BAT means Basic Accetance Test, which is a set of tests that
are meant to test basic functionalities and provide a fast
feedback. Add some documentation where the term is present
at the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 1fd27ef560a7..0452be8d7994 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1256,7 +1256,7 @@ class TestList:
             testlist = test.lower()
             if testlist == "":
                 fname = "other"
-            elif testlist == "bat":
+            elif testlist == "bat":         # Basic Acceptance Test
                 fname = "fast-feedback"
             else:
                 fname = testlist
-- 
2.40.1
