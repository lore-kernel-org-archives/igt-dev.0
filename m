Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F271C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 11:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2495610E78C;
	Fri,  9 Feb 2024 11:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpiLprmo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1410E236
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707479469; x=1739015469;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=WSvbFMcZUo3b0tI2yIG7chgxMYSMkXHvNhMMDppq54w=;
 b=ZpiLprmoLEnHXHkY5r4vSrAgV0cWmG4BkKphxgcjoi0Jlqf1cBWpGyOc
 RyLDZn1GuG8VFywehzzwNwUDqmvZAoVcdW/6VUe0qUpsoCbzg1t5gsoON
 IENBgdnpfeTFe4GWDdbEfdgwhABd+RGekochhxZkNND6iE/gZaErbfotJ
 tvlRfmvq+BhId0XntiCTAI3fkFMHih8wjc3egWzwhsZbp4Kjqf4rQgNBJ
 DGBNgLZHKe+OskektOIZg55Qhsq3UxuHEyBRVmRI6O+ncDnIySJu4Mzcq
 ChvU7e1uu3U3kr+hhckmvsD9qYGCQ7han6vj29VfJBEbzYDpkJiwoMznw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12063280"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12063280"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:51:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39358096"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:51:08 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EBE0C580DEE
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 03:51:06 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYPPM-00000001CFr-3kZM for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 12:51:04 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 6/8] scripts/igt_doc.py: remove some unused logic
Date: Fri,  9 Feb 2024 12:49:55 +0100
Message-ID: <20240209115101.285319-7-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209115101.285319-1-mauro.chehab@linux.intel.com>
References: <20240209115101.285319-1-mauro.chehab@linux.intel.com>
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

There's no need to check for empty string anymore, as the logic
at gen_intelci_testlist() already ensures that missing run types
are associated with "other" The same applies to GPUs, whose
default is "default".

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index fd1960dac6e0..bf51e5f4ebb3 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -231,11 +231,8 @@ class IntelciTestlist:
                     pass
 
                 for testlist, subtests in names.items():
-                    if testlist == "":
-                        testlist = "other"
-                    else:
-                        testlist = re.sub(r"[\W_]+", "-", testlist).lower()
-                        testlist = re.sub(r"_+", "_", testlist)
+                    testlist = re.sub(r"[\W_]+", "-", testlist).lower()
+                    testlist = re.sub(r"_+", "_", testlist)
 
                     if not subtests:
                         if testlist != "other":
-- 
2.43.0

