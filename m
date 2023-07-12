Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369D10E542
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 13:59:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 57B78580E3A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 06:59:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJaMs-00412Q-1H
 for igt-dev@lists.freedesktop.org; Wed, 12 Jul 2023 15:58:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 15:58:53 +0200
Message-Id: <20230712135854.957128-13-mauro.chehab@linux.intel.com>
In-Reply-To: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 12/13] scripts/test_list.py: skip some
 internal fields
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

both subtest_line and _summary_ are used internally at the script
logic. They shouldn't be part of the output.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 1551bc92c010..11aed63cb67a 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -661,6 +661,10 @@ class TestList:
                     continue
                 if field == "arg":
                     continue
+                if field == "_summary_":
+                    continue
+                if field == "subtest_line":
+                    continue
 
                 print(f":{field}: {self.doc[test][field]}")
 
-- 
2.40.1
