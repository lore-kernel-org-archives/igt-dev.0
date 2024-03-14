Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BEEC5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5398210FA35;
	Thu, 14 Mar 2024 10:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFQre6i/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C0810FA3A
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412222; x=1741948222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=HCe2oFtc9Ay/wHZ6axQI0HPA5u3frdVYZXRtLQeeceM=;
 b=nFQre6i/payAa+UoVOLJIkjhSDgtm9OEj4Bfs1ZSuETws9wte36e44Dw
 kOXUingDTtY+9xzWcINnsRjEzhZBCekk6nvq7asQL+CIwtnPb9PRJANkq
 F3Xyv/f1KOhu7QSzeKi14gPCyvHCfoU3GCMKejvqvliQolorh8RGJ3pzl
 sgianD7ajTTjs9H8wqy7vBLq5dZzgQElKzDvd4iH9ejxAi+nizDxLAkFa
 EwYJ7mdvxh6+JxOmQcgJN/Qs+CJTZRP+MBDib8ZKuI/RZj8BZn24SKfcM
 Gto6Lzr16Sc1ejgZPza6yW/cjlR8gEbB08HDRUgEPg9fPWR2LtQ2Wwnqp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5345271"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5345271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43171351"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:20 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 34D36580E15;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVk-184D; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 07/10] scripts/xls_to_doc.py: don't duplicate a common
 field
Date: Thu, 14 Mar 2024 11:29:16 +0100
Message-ID: <20240314103014.1170437-8-mauro.chehab@linux.intel.com>
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

If the TEST field has the same value of the subtest one, ignore
it when updating it, as the subtest on is inherited.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 749666faf41f..0d6ad0e0b1cd 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -317,6 +317,11 @@ class FillTests(TestList):
                             print(f"{testname}@{subtest} field {field}: Value unchanged: {value}. Ignoring it")
                         continue
 
+                    if value == self.doc[test_nr].get(field, ""):
+                        if self.verbose:
+                            print(f"{testname}@{subtest} field {field}: Value matches common field. Ignoring it")
+                            continue
+
                     if self.verbose > 0:
                         print(f"Update {testname}@{subtest} field {field} on line {line}:")
                         print(f"  Change from {doc_value} to {value}")
-- 
2.43.2

