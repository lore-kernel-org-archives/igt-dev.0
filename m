Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440B2C54798
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 11:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2B210E8C3;
	Thu, 22 Feb 2024 11:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMCxHxyc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF6010E545
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708602468; x=1740138468;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=7MXGpFW9pOxlbagf6ZUdrkngJboGeb+sPOZNLqD2HrQ=;
 b=hMCxHxycQ7Bu3jA52sGakpXOK4kTuvw4wPhFxLyyXOHnyl7x4YiT1Ydf
 NRaqsaFS4EN2UvAQMdb3Cc1U+LIfiXCBRikzJT9Jlr3/lUrUKP3jn8v+8
 GP0uuaiWLMXKPDY2xWoSjZIx/c1JNIDTK06srujRSTv+3gxbQMLEyd0uL
 uMOpwzeFuFItM/FXii6hzHxknku+V9hpcST6J/cCb4ak8qEw0sv7/nR86
 2RkblaBXN3yEIXic4GWJtIPWRXv12ILJNYkTQpL3+83XrPEAU4kFsj4iB
 r7+Dr4mxeMY7sQqx931COd2eRVXsnazhIvLj//diQlPkhDTieZWse0GuU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2960910"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2960910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5415659"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:47:48 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 49472580DA2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 03:47:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd7YH-00000000p2p-11Vt for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 12:47:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/4] scripts/igt_doc.py: fix intelci testlist
 generation for complex cases
Date: Thu, 22 Feb 2024 12:45:25 +0100
Message-ID: <20240222114741.196042-2-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
References: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
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

The most complex case is when a test is included or block listed, via
GPU and "Excluded GPU platform" fields, as the same test might be
on both lists.

Currently, the handling logic doesn't go though all GPUs, which ends
supressing tests from testlists if the GPU is not mentioned.

Fix it, while simplifying the logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 3a45371a27e7..7404e3d0934c 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -163,36 +163,26 @@ class IgtTestList(TestList):
                             testlists[driver][gpu][run_type].add(subname)
                         continue
 
-                    default_gpu_value = True
-
                     # If GPU field is used, default is to block list
+                    default_gpu_value = True
                     for gpu, value in gpus.items():
                         if value:
                             default_gpu_value = False
                             break
 
-                    for gpu, value in gpus.items():
+                    for gpu in gpu_set:
+                        value = tests_per_list[driver][run_type][subname].get(gpu, default_gpu_value)
+
+                        if not value:
+                            continue
+
                         if gpu not in testlists[driver]:
                             testlists[driver][gpu] = {}
 
                         if run_type not in testlists[driver][gpu]:
                             testlists[driver][gpu][run_type] = set()
 
-                        value = default_gpu_value
-                        if gpu in tests_per_list[driver][run_type][subname]:
-                            value = tests_per_list[driver][run_type][subname]
-
-                        if value:
-                            testlists[driver][gpu][run_type].add(subname)
-
-                    if default_gpu_value:
-                        if default_gpu not in testlists[driver]:
-                            testlists[driver][default_gpu] = {}
-
-                        if run_type not in testlists[driver][default_gpu]:
-                            testlists[driver][default_gpu][run_type] = set()
-
-                        testlists[driver][default_gpu][run_type].add(subname)
+                        testlists[driver][gpu][run_type].add(subname)
 
         if len(gpu_set) == 0:
             gpu_set.add(default_gpu)
-- 
2.43.2

