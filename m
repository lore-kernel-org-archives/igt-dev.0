Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCF8C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 11:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CFD10EC29;
	Fri,  9 Feb 2024 11:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3+cwZuH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E9710E988
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707477577; x=1739013577;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=WSvbFMcZUo3b0tI2yIG7chgxMYSMkXHvNhMMDppq54w=;
 b=m3+cwZuHtXvtTh6vGNaQz9k59VtO59FPAcqQXFYzPGVBiJEAzDzWwy7m
 4Sv6H+BogZNDyf5BX/UnglyCZNGjercNSmPRccuHc3ivQaeaAjKz9YdVz
 W5qvuMndSr4x+rr4bVEu76G48fXaPi4TAioC8REWhJDN/yG07as1YRGhb
 aWoWG86zVMQcyXEym95aRO0Tb3cUa3b0As7kFwAJXGjA/XGEIpToNSAB9
 cVt7LidDui5mX8xZ0jDHj6P4khGCQZI95Q7x5BCTKCulCESfpzUGwsW0j
 vpswtsjksf7+THIovvDUq/gj1kC+YreFwmBCkalph5LFKVfUIRHqIiQ2d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="11984188"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="11984188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1908153"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:19:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 860FE580E79
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 03:19:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYOum-000000018j6-1PoQ for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 12:19:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/8] scripts/igt_doc.py: remove some unused logic
Date: Fri,  9 Feb 2024 12:17:04 +0100
Message-ID: <20240209111925.271717-7-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209111925.271717-1-mauro.chehab@linux.intel.com>
References: <20240209111925.271717-1-mauro.chehab@linux.intel.com>
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

