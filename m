Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E257BC4829E
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 12:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580BD10F396;
	Fri,  9 Feb 2024 12:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBm0zkYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DE110F391
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707482149; x=1739018149;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=9sXEpxfb42y5JwYz8kDyzH/8a0FxQw4yCwJdICknmdY=;
 b=YBm0zkYU0nrDdMva33wwBOUYcKEKHp48Wtsm1G/4NClOriMKi5cLMZia
 dNHXIVuo6Nws5u8DcmtYDLX3EvlFNRrvPp+X0qQmTqhFh7g1HdBS6oFFi
 Hd1sKbmqphiYwr2tXHhJNe1Q7PbgVngsZosjpbq6BwOMQPTGPvl99P3AI
 Fl474nRnvod+VS4fdgbSAxhZuP7g6/flTXdozSiYC8usJWELxcmCT2gD/
 c29Pis1TZ9dluQPdyGNZas5uAaHiuVfgUSnWF0+477RMFCaOgfaFWO+q1
 Dw5txJqGuB+/imxoJhE5P/hdsFxZatk40uIBAj6FsZQ14RSc1Mp3wIDDx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1554274"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1554274"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39363247"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
Received: from linux.intel.com (unknown [10.245.246.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 34774580E3F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 04:35:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYQ6b-00000001DGC-0SrM for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 13:35:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 5/8] scripts/igt_doc.py: better handle default gpu
Date: Fri,  9 Feb 2024 13:34:44 +0100
Message-ID: <20240209123543.289204-6-mauro.chehab@linux.intel.com>
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

