Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C6C48BC0
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 12:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE9A10F399;
	Fri,  9 Feb 2024 12:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrwTk1Bm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32C210F38C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707482149; x=1739018149;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=WSvbFMcZUo3b0tI2yIG7chgxMYSMkXHvNhMMDppq54w=;
 b=mrwTk1Bme7Qe6Ro29Uiocrkn/Zh7rXQM5VBHZ/sQ4bp46vLiV7xRZ2K0
 iJgVLWX2lUA6xgsKxMB87bpaNE2eiEi6VBKmF2l/J3iCKAryT7tWWd0Vq
 MnsNfrP0dYcTHFTChhdCmrFor8OnfUEeRC2UDbhDxGvLLifKrt09pnM4G
 zqFAj9cSmDy0YPgdXypyIi61Z9tWM7bUzKq5EP2V8xwrtlDZwDn12QLfa
 YRImUCnvHx0HUhE8fBXxpaIhdHKL4X19lJCgFvlp7qbLkJ7jyYk9/+8en
 IkO5I43P57LRTXaRYwcfRa9+Kymq93HkBw8wmloWV03TZRW2x+8Gz9ml2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1554276"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1554276"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39363248"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
Received: from linux.intel.com (unknown [10.245.246.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3C91A580E5E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 04:35:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYQ6b-00000001DGG-0Whr for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 13:35:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 6/8] scripts/igt_doc.py: remove some unused logic
Date: Fri,  9 Feb 2024 13:34:45 +0100
Message-ID: <20240209123543.289204-7-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
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

