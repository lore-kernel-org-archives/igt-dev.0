Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40115C54E69
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68E510FA45;
	Thu, 14 Mar 2024 10:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEg1tKeA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D594510FA40
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412224; x=1741948224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=NoGgKbHk/Tx3QMsgP3i22abvS2j4u+muYlnHeXuWIOg=;
 b=PEg1tKeAJS3hjN9IrUHhAKOjI2KOFTXfmfV/nBuumZfP29GqIN83NoLM
 Z0j5vRSBebArtGgJdbhZGMOHvi+AthuDgmhGTnOrlzPVyCTalWN/aVwR5
 q81cBPiEyJ1yGHcOhylldUlk6TGUtFCwvU1yyoo+hUFIdBNxR1KIRfBFo
 70dC533MjJsicqqHVgU8MMighTgsHMYAcTesuyiGJG9Mp9n66PG2fPKyg
 lsQduB+0CWau+g3tM/DVtvTPK6LrCdRVxRpVU7peTc7x+nkNmu0LaKjJV
 hZj+uHWqZ7yCJzr0dU9kFTYNqzjkHP2Dyb56nIcHk1P9jNi9kVgCSulS0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5087654"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5087654"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12132010"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:20 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2F269580EA3;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVe-0yxy; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 05/10] scripts/xls_to_doc.py: improve the addition logic
Date: Thu, 14 Mar 2024 11:29:14 +0100
Message-ID: <20240314103014.1170437-6-mauro.chehab@linux.intel.com>
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

If the last line before inserting a new value is a blank comment,
add the new fiels before that.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index a090dcffe98e..0aa774e811a3 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -205,6 +205,9 @@ class FillTests(TestList):
                     content[i] = ""
 
         if value != "":
+            if i > 2 and re.match(r'\s*\*\s*$', content[i - 1]):
+                i -= 1
+
             content.insert(i, f' * {field}: {value}\n')
 
     def parse_spreadsheet(self, fname, sheets=None):
-- 
2.43.2

