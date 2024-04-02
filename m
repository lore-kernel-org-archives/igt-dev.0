Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F77C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 08:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F1910EF2A;
	Tue,  2 Apr 2024 08:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxSh/7Hg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B8A10EF2A
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712048243; x=1743584243;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=FkEmH7FXYbR/AbZBG/z5A9vydRBJEFl4r0gE7Pw4c0E=;
 b=kxSh/7Hgqk1VggkWkmJHUBIBmVUdpsAUvi32WoYVzOg8ncUC/vIEAxyZ
 /DQscmkNPoZy4I0WGrZo5UwgqN69jXmWwvkqZZqZ70HjM2w5rP2CfQsj+
 WyHnPF0Hxe5IDbUgnVk+8RLotNS4aa3jI6nTEa6n3qgcfsk0/n+KxvguI
 HCfwN33YJkE5NemW+MvobH2J0+AW/cgN5NWjId3Q/5wJozUi90KNiRRWg
 Nsnp5fXjqJNqO6yNMJ8AsT0rTAYF/hDhG7yffI1By6pJ5TyutwMG/feRj
 xtVrg8XrvAWHvq0W70xVt7OJKZkOeHRZ4nDIgzTh6xZhadcTaxbbbVUhy Q==;
X-CSE-ConnectionGUID: tOVUVksVQ1ClVcvv9LMWgg==
X-CSE-MsgGUID: XUQR8USETUia27hfvTcP0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17931657"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17931657"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="22476789"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:57:06 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.245.155])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C1B1820921DC
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 01:57:05 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rrZx1-00000003U5w-3Gnq for igt-dev@lists.freedesktop.org;
 Tue, 02 Apr 2024 10:57:03 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] scripts/doc_to_xls.py: fix spreadsheet generation
Date: Tue,  2 Apr 2024 10:57:02 +0200
Message-ID: <20240402085702.830658-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

The logic which sets the max_length is wrong: it shall always use
sheet[0], as this may be the only only row on a table.

Yet, it might be possible that a caller to test_to_xls() would
have been sending a completely empty sheet. While this doesn't
occur currently, it doesn't hurt adding an explicit check,
reporting a warning if this is indeed the case.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/doc_to_xls.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
index 448ff18429b6..3b10a6e9ae83 100755
--- a/scripts/doc_to_xls.py
+++ b/scripts/doc_to_xls.py
@@ -16,6 +16,8 @@ from openpyxl.styles import Font
 from openpyxl.utils import get_column_letter
 from openpyxl import Workbook
 
+from sys import stderr
+
 from test_list import TestList
 
 EPILOG = """
@@ -47,16 +49,20 @@ def tests_to_xls(tests, fname):
         test = tests[row]
         sheet_name = test.title
 
+        sheet = test.get_spreadsheet(expand_fields)
+        # Ignore empty sheets
+        if not len(sheet):
+            print(f"Warning: sheet '{test.title}' is empty!", file=stderr)
+            continue
+
         if not ws:
             ws = wb.active
             ws.title = sheet_name
         else:
             ws = wb.create_sheet(sheet_name)
 
-        sheet = test.get_spreadsheet(expand_fields)
-
         max_length = []
-        for col in range(len(sheet[row])):
+        for col in range(len(sheet[0])):
             max_length.append(0)
 
         for row in range(len(sheet)):
-- 
2.44.0

