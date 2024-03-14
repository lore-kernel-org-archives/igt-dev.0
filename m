Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2A4C54E69
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52FE10FA3A;
	Thu, 14 Mar 2024 10:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWMWv9Ez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A540B10FA35
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412222; x=1741948222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=2ujQxK6zxaQLDn5YNL+OE5ECk1WqQljzggqspchr0jI=;
 b=EWMWv9EzngNEp/tZdnbKIT70GziKlSDJsdb2NsoMEnjifCg/+hMEnwll
 u/aSy4ShfTOoBrRVsC50LaXNIJpuePAQg2+x/V92HjpoAK943yPTtSs1Q
 RBGcaMnhsnnlDbwl4GxgYzMx3r7Y4s5Uk921adhmzzVxFP8M5WIIgjNBD
 gP+tmIU31J8npwaZcBeMme3S+ocw+gLBfi7Di2CAg2vmQNFanSrsyJzW8
 wQjE7GLtFZQMVm+qerlNOoxXrCSEL1Z+jjNpMmzrWDtF0s7P4gIfPJL4Q
 GgmErzMl/Q7bUqsQbbpGpbQfzkFv2zZIKVw1/Y/9a91h06NdUrNZOgUOQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5345269"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5345269"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43171354"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:20 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3818C580EA5;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVh-13Ob; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 06/10] scripts/xls_to_doc.py: preserve line for found
 fields
Date: Thu, 14 Mar 2024 11:29:15 +0100
Message-ID: <20240314103014.1170437-7-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

By default, the update logic will place new values at the end of
subtests.

Yet, if the field is already at the source file, just update
the value at the line.

Please notice that the logic needs to parse the entire subtest
description, as continuation lines may be present.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 0aa774e811a3..749666faf41f 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -155,6 +155,7 @@ class FillTests(TestList):
         """
 
         current_field = None
+        found_line = None
         i = line
         while True:
             i += 1
@@ -193,7 +194,7 @@ class FillTests(TestList):
                 current_field = self.field_list[match.group(1).lower()]
                 if current_field != field:
                     continue
-                content[i] = ""
+                found_line = i
 
             # Handle continuation lines
             if current_field:
@@ -205,6 +206,10 @@ class FillTests(TestList):
                     content[i] = ""
 
         if value != "":
+            if found_line:
+                content[found_line] = f' * {field}: {value}\n'
+                return
+
             if i > 2 and re.match(r'\s*\*\s*$', content[i - 1]):
                 i -= 1
 
-- 
2.43.2

