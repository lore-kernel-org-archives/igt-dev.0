Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F469C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 11:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2438010EB8C;
	Fri,  9 Feb 2024 11:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcvQUXkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259010EB3D
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707477575; x=1739013575;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=9sXEpxfb42y5JwYz8kDyzH/8a0FxQw4yCwJdICknmdY=;
 b=IcvQUXkNDuZOG6pfXB9PCsWThmVFxXGTj2iDLxRWo4ypeH0JGV6lIkWD
 0m4WMR18bcSTlz6yYmnPF5Wc1KAdXVYAbhCU8+6UjjXMtZ2r8ngvDBSbe
 UOfEUNvHsE1+YDEQxhDxfJwWsfB2VxtXlTD0EN7oxIIjSBlo3RRsoQguI
 LFOyeDMN6DYc1G+l4D+n9PZp8M4hHYvVQEGym2RTDaFG92YXrG/VgSFuV
 OkhBLHeozdCn2YjpMmRYmA8ElH0PDFPHet7/SqxnaXZ6nSVEUf5Am9pI/
 dkekQeq6fkTSInCG08mkkKcjjrAoRaLtJBG6mfS2O+illBVTekKUJOEFf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12785730"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12785730"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6534177"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:19:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 61FB3580DA3
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 03:19:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYOum-000000018j3-1M6k for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 12:19:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/8] scripts/igt_doc.py: better handle default gpu
Date: Fri,  9 Feb 2024 12:17:03 +0100
Message-ID: <20240209111925.271717-6-mauro.chehab@linux.intel.com>
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

The variable "gpu" is used on several loops inside
gen_intelci_testlist(). That's confusing and error-pruned.

Instead, use "default_gpu" for the one used only for
default values.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 1c2c7a8ef973..fd1960dac6e0 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -107,6 +107,7 @@ class IgtTestList(TestList):
         # Create a testlist dictionary
 
         testlists = {}
+        default_gpu = "default"
 
         for driver, run_types in tests_per_list.items():
             testlists[driver] = {}
@@ -120,18 +121,15 @@ class IgtTestList(TestList):
                     if "all" in tests_per_list[driver][run_type][subname]:
                         continue
 
-                    if not gpu_set:
-                        gpu = "default"
-
                     # Trivial case: fields not defined: add subtest
                     if not gpu_set:
-                        if gpu not in testlists[driver]:
-                            testlists[driver][gpu] = {}
+                        if default_gpu not in testlists[driver]:
+                            testlists[driver][default_gpu] = {}
 
-                        if run_type not in testlists[driver][gpu]:
-                            testlists[driver][gpu][run_type] = set()
+                        if run_type not in testlists[driver][default_gpu]:
+                            testlists[driver][default_gpu][run_type] = set()
 
-                        testlists[driver][gpu][run_type].add(subname)
+                        testlists[driver][default_gpu][run_type].add(subname)
                         continue
 
                     if not gpus:
@@ -173,7 +171,16 @@ class IgtTestList(TestList):
                             testlists[driver][gpu][run_type].add(subname)
 
                     if default_gpu_value:
-                        testlists[driver][gpu][run_type].add(subname)
+                        if default_gpu not in testlists[driver]:
+                            testlists[driver][default_gpu] = {}
+
+                        if run_type not in testlists[driver][default_gpu]:
+                            testlists[driver][default_gpu][run_type] = set()
+
+                        testlists[driver][default_gpu][run_type].add(subname)
+
+        if len(gpu_set) == 0:
+            gpu_set.add(default_gpu)
 
         return (testlists, gpu_set)
 
-- 
2.43.0

