Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997EC10E4D3
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 10:51:06 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.94.248.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6BCEF580D79
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 02:50:59 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r7vg9-0006MF-27
 for igt-dev@lists.freedesktop.org; Tue, 28 Nov 2023 11:50:57 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 11:48:57 +0100
Message-ID: <20231128105054.24317-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20231128105054.24317-1-mauro.chehab@linux.intel.com>
References: <20231128105054.24317-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] scripts/test_list.py: don't add a blank
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
