Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E3AC54E71
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E72310FA37;
	Thu, 14 Mar 2024 10:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIOBSgvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD1C10FA3A
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412222; x=1741948222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=ckbPvJdfLknbl0moDj57J/uj4OAQvaLdsre+SJYJi/Q=;
 b=iIOBSgvswHozyRFg5SnYXHwj406u3JXdEhQ5MEXamIj/TgjfCRTPyHQI
 4z3S+Kh8SmTMpGZ6U0kKUd+Iac5/0ufv36HXUfQf1jfzlSPM9B6V8c36v
 1yxvrKtc528EsDQ/P72a6j2UG6bfWwBLgCmrxwGc9HexrQjb8n/B1tGGN
 kF/eVK0NLDBFoBLa3sYtwSGKaW/5UmB8Kva3aB9TP8Xsgxa62oDG2hZcx
 yvIOLQVbnSXZgvPGr3T/SEU/wThhDgAKttlr6Jrj741EBf9fBEhCThviV
 JaDIl3M5oh43jRhrD1JE4XkI//weAXcUSJ/S+qKCNhEFR4vJkCfX0nih9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5345267"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5345267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43171340"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:20 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 23163580E33;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVV-0mOy; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 02/10] scripts/xls_to_doc.py: don't ignore the last
 column
Date: Thu, 14 Mar 2024 11:29:11 +0100
Message-ID: <20240314103014.1170437-3-mauro.chehab@linux.intel.com>
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

Currently the last line of the spreadsheet is not processed.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index f47d56719bfe..bd14320a3bce 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -103,7 +103,7 @@ class FillTests(TestList):
         for cell in sheet[1]:
             column_list.append(cell.value)
 
-        for row in range(2, sheet.max_row):
+        for row in range(2, sheet.max_row + 1):
             if sheet[row][0].value is None:
                 print(f"Ignoring sheet after A{row} row, as test name is empty")
                 return
-- 
2.43.2

