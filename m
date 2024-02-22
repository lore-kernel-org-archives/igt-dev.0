Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B6BC48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 11:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878A810E545;
	Thu, 22 Feb 2024 11:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wo63dLPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B0010E545
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708602468; x=1740138468;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=Xmuo7kosiasMigtNnowc3iW2WYuAx8Ws/NHwHucPC8E=;
 b=Wo63dLPhFyGkNDGD7rAQfMAcFIxw9uY91HjSb2cgqDIGJK6xvFRvT8MS
 d2DqLkq6FjLwD1Q2Ph6yjN8HzTkD83ku5pb/3b0xnWooK7d5oaNt3aUcJ
 jZtrBb9GVD+PyQuP2iAb9Vk+ySzdGsaWIuv3eXhO2k7qIyVZPHy77NrC3
 DK86Y779+YfLqJ9EQnC1yqxc7eoQoPke1SrhpfBQyAlk66UFvG6ZOeSnO
 u0J/gCTMWnw0gQcm63vxaeCBR8bNQ6CfBjLuX6C0HuO3Uwegt502wSiBx
 2xUSToqnC9ClVPdT8lzXY4oq3RohyON7nbN2fVQqwnVllrXs9gjWm/otG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2960908"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2960908"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5415653"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:47:48 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3FC87580DEF
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 03:47:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd7YH-00000000p2y-1BsB for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 12:47:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 4/4] scripts/igt_doc.py: fix intelci testlist join
 logic
Date: Thu, 22 Feb 2024 12:45:28 +0100
Message-ID: <20240222114741.196042-5-mauro.chehab@linux.intel.com>
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

Joining testlists shall take into account default values for GPUs
that are defined only on some JSON config files.

Add a logic to propagate such values.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 2417081b80be..295589c002c6 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -190,10 +190,10 @@ class IntelciTestlist:
     def __init__(self):
         self.testlists = {}
         self.gpu_set = set()
+        self.default_gpu = "default"
 
     def add(self, testlist, gpu_set):
-        self.gpu_set.update(gpu_set)
-
+        # Handle GPUs found at the set to be added
         for driver, gpus in testlist.items():
             if driver not in self.testlists:
                 self.testlists[driver] = {}
@@ -208,6 +208,26 @@ class IntelciTestlist:
 
                     self.testlists[driver][gpu][run_type].update(testlist[driver][gpu][run_type])
 
+        # Apply default values to gpus that aren't in common
+        if self.gpu_set:
+            not_intersecting_gpus = self.gpu_set.symmetric_difference(gpu_set)
+
+            for driver in self.testlists.keys():
+                for gpu in not_intersecting_gpus:
+                    if gpu not in self.testlists[driver]:
+                        self.testlists[driver][gpu] = {}
+
+                    for run_type in self.testlists[driver][gpu].keys():
+                        if run_type not in self.testlists[driver][self.default_gpu]:
+                            continue
+
+                        default_list = self.testlists[driver][self.default_gpu][run_type]
+
+                        self.testlists[driver][gpu][run_type].update(default_list)
+
+        self.gpu_set.update(gpu_set)
+
+
     def write(self, directory):
         '''Create testlist directory (if needed) and files'''
 
-- 
2.43.2

