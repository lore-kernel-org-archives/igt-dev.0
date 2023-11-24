Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B5610E19B
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 08:18:40 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.154.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 39FE7580E3A
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 00:18:39 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r6ROX-0008nb-06
 for igt-dev@lists.freedesktop.org; Fri, 24 Nov 2023 09:18:37 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 09:16:06 +0100
Message-ID: <20231124081834.33714-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20231124081834.33714-1-mauro.chehab@linux.intel.com>
References: <20231124081834.33714-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] scripts/test_list.py: don't add a blank
 description
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

At the first versions, it was assumed that a Description field
would always exist. This is not true anymore.

Stop artificially creating one with an empty value by default.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 5ff2b18c2dd8..20377b708f83 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1270,7 +1270,6 @@ class TestList:
                         self.doc[current_test]["subtest"][current_subtest][field] = self.doc[current_test][field]
 
                     self.doc[current_test]["subtest"][current_subtest]["_summary_"] = match.group(1)
-                    self.doc[current_test]["subtest"][current_subtest]["Description"] = ''
                     self.doc[current_test]["_subtest_line_"][current_subtest] = file_ln
 
                     if not arg_ref:
-- 
2.42.0
