Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C260CC54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 07:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792D710F19C;
	Wed, 13 Mar 2024 07:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ox3817qW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF3A10F31A
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710316699; x=1741852699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=JVY1JFqcZdfXXrVbrD0Buc2+c5kAG3ifxZfamGk1uB4=;
 b=Ox3817qW5M8Rwfvyq3FCS+S4YDOh7jPSrw3t0K4w5Hh1Z/9HBbfwzW2t
 lTCpsKo5hITHms6+Ch015xjfX99GUZkWoM6IfTj8rOZ/BpmDQfu2zbt37
 9TnmeJO1eMhaOkfxLgxIb04PhduuqUbg8F8BKhTbmz2DDmJznZLxFHGHx
 uKaLUaO5Zny9q7fFG3kQEJ1uS2zPEN12zZnUG0TW7jxeWBQOacquFwJme
 mcrHh2T1j1aoHYBMX20HXI8gJO35IdOhWN4l41Iatf3eqr9cGHDD2k3sj
 kfzAhTiyw4Q4Efnnk+boAn9lIn8LvIBsaBagP9MPZEJ05rfaVsjqQUTfd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5250205"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5250205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12408532"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:19 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AD01C580E6B;
 Wed, 13 Mar 2024 00:58:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkJV9-00000004frl-32BS; Wed, 13 Mar 2024 08:58:15 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 4/6] scripts/xls_to_doc.py: fix issues with python < 3.7
Date: Wed, 13 Mar 2024 08:56:07 +0100
Message-ID: <20240313075813.1114081-5-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240313075813.1114081-1-mauro.chehab@linux.intel.com>
References: <20240313075813.1114081-1-mauro.chehab@linux.intel.com>
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

The current logic relies on dict = sorted(dict) to preserve the
sorted order. Ordered dicts were introduced only on python 3.7.

This is a silly requirement, as all we want is to sort the
dict.item() tuple. Change the logic to avoid the need of
checking for an specific python version.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 7ea92a344aff..cf2cfe2fe233 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -17,6 +17,7 @@ from openpyxl import load_workbook
 
 from test_list import TestList
 
+
 #
 # FillTests class definition
 #
@@ -127,7 +128,7 @@ class FillTests(TestList):
 
             self.process_spreadsheet_sheet(sheet)
 
-        return dict(sorted(self.spreadsheet_data.items()))
+        return self.spreadsheet_data
 
     def change_value(self, content, subtest, line, field, value):
 
@@ -190,7 +191,7 @@ class FillTests(TestList):
 
         data = self.read_spreadsheet_file(fname, sheets)
 
-        for test, row in data.items():
+        for test, row in sorted(data.items()):
             match = self.testname_regex.match(test)
             if not match:
                 sys.exit(f"Error: can't parse {test}")
-- 
2.43.2

