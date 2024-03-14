Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED4FC54E6A
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0911210FA3F;
	Thu, 14 Mar 2024 10:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBXA6L76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40E910FA39
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412222; x=1741948222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=WyjSZQ22mFvFy4LLZSqW64I4kZMkgWutRPwiQerbfQ8=;
 b=lBXA6L76ClM2Cy60cO3Rc2WF9PSbsr1tMbGXeOeaZ7/JaWdo+dHZlupE
 zXdCa+wSjhZ5/ZUdh1o/4JF62YFC+az1+W541l/dHWJ00vMt4zobmWF5A
 oFXLhsEAhGyh+R4XOFcrQXHKb4BSkiHQ7IqfxkSRJ6b+covNvhV1WVAcn
 WIkiIBAcrHIKGWveNomcyHpy/0mhh/P9tZQY0PxmUDtB+SvvvQvKMnS5g
 lUiGly7J5r/GQZz81b4Nv5Jk7OmePSL5RBgXuF/ekFDuCZMha+zefxrui
 ZMEnc97V3bllIwKcgCv5LNDJNVuJL1S3Pzk+ltCw1KpeVMmnw2Li8Eu5u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5345268"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5345268"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43171347"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:20 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2CFBA580E6B;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVS-0iV6; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 01/10] scripts/xls_to_doc.py: make the message about
 wildcards clearer
Date: Thu, 14 Mar 2024 11:29:10 +0100
Message-ID: <20240314103014.1170437-2-mauro.chehab@linux.intel.com>
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

Automatically creating/updating wildcards is not an easy task.
This script can't do it, so make it clearer that it will be
skipped.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index a7eaeead1a49..f47d56719bfe 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -294,7 +294,7 @@ class FillTests(TestList):
                     doc_value = doc_content.get(field)
                     if doc_value:
                         if self.key_has_wildcard.search(doc_value):
-                            print(f"Warning: {subtest} field {field} has wildcards.")
+                            print(f"Warning: {subtest} field {field} has wildcards. Skipping it.")
                             continue
                         if doc_value == value:
                             if self.verbose > 1:
-- 
2.43.2

