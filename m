Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327F1C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 07:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D8110E893;
	Thu, 22 Feb 2024 07:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVH4kc0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA6F10E893
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708587734; x=1740123734;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=vWRRf6RuwUEc6gUCdSLGabxxzwc/BG7WIfn1bpmV3js=;
 b=JVH4kc0/uOk3XqiIQbRkxYZSmYIlXcOT/pFt2AhpNrZt8lBKP/Xjznin
 3Jkw4XPkipy0dIeFpeVCszWjNN/dLa2xDdNrvjJbSKxR3vH+u7TOUpQiE
 obUIx5Chn4QPr5YyzCax432azN/pnrK/B52H5geJ0kwasU1iScJsyUNEH
 dHb6ayHRwcoIpRCtdquBsE6xgnyv8F2HnojRQ2BWxka14scIzk/ySe6Ts
 FVaf/SdJyncrOAQGISlInzoVMcrzDulOxfa6yS6EJ7dinm5auDvMxqGaP
 /fK6CbYfUcpLb8RtQmQwYDwmYyEw6qOXGyE4F9Q9UVyQLC0nVqn15Zrp3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13354973"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="13354973"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="42890828"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:42:13 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6DE80580D54
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 23:42:12 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd3ic-00000000j8n-1Wzl for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 08:42:10 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] scripts/igt_doc.py: fix trivial case handling
Date: Thu, 22 Feb 2024 08:40:01 +0100
Message-ID: <20240222074208.173368-4-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222074208.173368-1-mauro.chehab@linux.intel.com>
References: <20240222074208.173368-1-mauro.chehab@linux.intel.com>
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

The check is done too late, causing it to not do what it was
expected: instead of checking for the gpu_set, it shall instead
check if the subnames dict is empty.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 7985cdd5ac5e..db2713e65fa3 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -124,6 +124,10 @@ class IgtTestList(TestList):
         testlists = {}
         default_gpu = "default"
 
+        # Always create a default GPU, as not all GPUs may be
+        # listed at include/exclude testlists
+        gpu_set.add(default_gpu)
+
         for driver, run_types in tests_per_list.items():
             testlists[driver] = {}
             for run_type, subnames in run_types.items():
@@ -131,15 +135,10 @@ class IgtTestList(TestList):
                 if not run_type:
                     run_type = "other"
 
-                for subname, gpus in subnames.items():
-                    # Globally blocklisted values: ignore subtest
-                    if "all" in tests_per_list[driver][run_type][subname]:
-                        continue
-
-                    # Trivial case: fields not defined: add subtest
-                    if not gpu_set:
-                        if default_gpu not in testlists[driver]:
-                            testlists[driver][default_gpu] = {}
+                # Trivial case: no GPUs defined for the test
+                if not subnames:
+                    if default_gpu not in testlists[driver]:
+                        testlists[driver][default_gpu] = {}
 
                         if run_type not in testlists[driver][default_gpu]:
                             testlists[driver][default_gpu][run_type] = set()
@@ -147,6 +146,11 @@ class IgtTestList(TestList):
                         testlists[driver][default_gpu][run_type].add(subname)
                         continue
 
+                for subname, gpus in subnames.items():
+                    # Globally blocklisted values: ignore subtest
+                    if "all" in tests_per_list[driver][run_type][subname]:
+                        continue
+
                     if not gpus:
                         for gpu in gpu_set:
                             # blocked on all GPUs: ignore subtest
@@ -184,9 +188,6 @@ class IgtTestList(TestList):
 
                         testlists[driver][gpu][run_type].add(subname)
 
-        if len(gpu_set) == 0:
-            gpu_set.add(default_gpu)
-
         return (testlists, gpu_set)
 
 class IntelciTestlist:
-- 
2.43.2

