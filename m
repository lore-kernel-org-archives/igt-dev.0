Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9493AC54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 10:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48D210E9D0;
	Fri,  8 Mar 2024 10:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XD4A7zlK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BE410E9D0
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709892578; x=1741428578;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=/Mhy7evt0yEvsx3j/kc0cEa2aHfWdglAzBaFnlU4/ag=;
 b=XD4A7zlKuzg2qXFcpJtVfiRz4a3T9GiuuiSo+KnVkJCqzAIJ9QJhjyKc
 /RpCgYmnnSg7+eFG2M3cT9PXlacqblrzQl4xRunW70HJAjdQHZD5BNd6q
 nRhXBVh3fhW1ma+zoyTmM4YKMQFAgTAx2vB1ZEgesDUGT9RdF74UFkBe1
 A2aZ1KEBOTLfHcsixFXnQXfhY6nMMPxWv/uNJqnTAaRAhJRIp1crfMIF0
 V3E88eqN+qnNACvmRU1EFnisvAFL+NqlwZ8H+/wdDn/9fT42QhKK1T21K
 4OAdosJtuLIwuo0fxVr8DnUsn7teJTB0d9uijFYC3cNJp66rqKlZI/aMZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8427392"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="8427392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10429889"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:09:38 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D73F2580DF3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 02:09:36 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1riXAU-00000003pHr-49oi for igt-dev@lists.freedesktop.org;
 Fri, 08 Mar 2024 11:09:34 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] scripts/xls_to_doc.py: make the script work again
Date: Fri,  8 Mar 2024 11:07:42 +0100
Message-ID: <20240308100933.912014-2-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
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

There were some changes at test_list that caused it to stop
working. Fix them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index ed56a02bf5ca..60ad8225d71d 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -40,8 +40,8 @@ class FillTests(TestList):
 
             subtest_array = self.expand_subtest(fname, name, test, True, True, True)
             for subtest_dict in subtest_array:
-                name = subtest_dict["Summary"]
-                del subtest_dict["Summary"]
+                name = subtest_dict["_summary_"]
+                del subtest_dict["_summary_"]
 
                 match = self.testname_regex.match(name)
                 if not match:
@@ -263,6 +263,7 @@ class FillTests(TestList):
 
                 if subtest_nr not in self.doc[test_nr]["subtest"]:
                     print(f"Error: missing subtest {subtest_nr} at {self.doc[test_nr]['subtest']}")
+                    continue
 
                 doc_content = self.doc[test_nr]["subtest"][subtest_nr]
 
-- 
2.43.2

