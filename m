Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C09BC4829B
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 11:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D280810EB72;
	Fri,  9 Feb 2024 11:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUOWEELA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FE710EB72
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707479471; x=1739015471;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=kfCBoimrQM3IWMqCGuyV7HsYhIP5OVpNP1Zk5uTjIRQ=;
 b=HUOWEELAp7afwCh3zzvgpKFCvqNazg0Jprc8Woqn8w6Gtga3so7+ArA/
 N2i209b+8RPnURutGj/QTfQdBbMIRQFbGNro6xUiZYX3wiXww5pgNVDOT
 1Ls8EewFHDnIdydoxBOaxuDFBkUsZbmuTYMfRWkRwU4F/OZLlTUMdQNrK
 z/MWKxI/cB//oUrRujhoE/nxi9zqfzz19xMon6z3WOEb6HH2FkAwMa5za
 XXgMGMSjTRHfEqHaZwuPPph/GfAgiMZh2PJni4XCqWcNcn4aHdPh4Ybbe
 GXzzWfBCLElQqWETHGdt2r1pMSGp8VJeunMryMkiwETEMJYj4EmS082Bo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1294071"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1294071"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="825116730"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="825116730"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:51:07 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0614E5808A1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 03:51:07 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYPPM-00000001CFj-3d9b for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 12:51:04 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 4/8] scripts/igt_doc.py: only create dict if subtest
 will be added
Date: Fri,  9 Feb 2024 12:49:53 +0100
Message-ID: <20240209115101.285319-5-mauro.chehab@linux.intel.com>
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

Currently, depending on the order of the sets/dict, some
empty testlists are created. Change the logic to only add
an entry into the dict if a subtest will be added to it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 8a10db13081c..1c2c7a8ef973 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -116,31 +116,31 @@ class IgtTestList(TestList):
                     run_type = "other"
 
                 for subname, gpus in subnames.items():
-                    if not gpu_set:
-                        gpu = "default"
-
-                    if gpu not in testlists[driver]:
-                        testlists[driver][gpu] = {}
-
-                    if run_type not in testlists[driver][gpu]:
-                        testlists[driver][gpu][run_type] = set()
-
-                    # Trivial case: fields not defined
-                    if not gpu_set:
-                        testlists[driver][gpu][run_type].add(subname)
-                        continue
-
-                    # Globally blocklisted values
+                    # Globally blocklisted values: ignore subtest
                     if "all" in tests_per_list[driver][run_type][subname]:
                         continue
 
-                    # Nothing blocked of explicitly added.
-                    # It means that test should be on testlists
+                    if not gpu_set:
+                        gpu = "default"
+
+                    # Trivial case: fields not defined: add subtest
+                    if not gpu_set:
+                        if gpu not in testlists[driver]:
+                            testlists[driver][gpu] = {}
+
+                        if run_type not in testlists[driver][gpu]:
+                            testlists[driver][gpu][run_type] = set()
+
+                        testlists[driver][gpu][run_type].add(subname)
+                        continue
+
                     if not gpus:
                         for gpu in gpu_set:
+                            # blocked on all GPUs: ignore subtest
                             if gpu == "all":
                                 continue
 
+                            # Nothing blocked: add subtest
                             if gpu not in testlists[driver]:
                                 testlists[driver][gpu] = {}
 
-- 
2.43.0

