Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB8CC48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 07:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352EE10E87E;
	Thu, 22 Feb 2024 07:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hh3uuu8d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD92F10E892
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708587734; x=1740123734;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=7MXGpFW9pOxlbagf6ZUdrkngJboGeb+sPOZNLqD2HrQ=;
 b=hh3uuu8dYLNnDGnhtXXT/tKP0NjT23YbaaDSXxUZsBwISRQZ8R4iAUiT
 15cVQpCDcymzSAU2pC8vrhJwRASc0tcdjJQXrz1jo8r5d1OtoqPXz/bD9
 greq/+SDDgTR1aOzygNwyjGfy8VlXDwV3pHv6JNJ+R183Rt0mjbu3A3iI
 t59sRigja4Vd3L+aOAxpzS5LpvH+CQyQrNZL/SJXrzexr+abAE8IQcugu
 OecfTOzJ7ImG1Q7lMteOgfMyyLmCjNcMcw7EZ/iJX8ngxyMrqoXahc9Tu
 OZMoC8iilDGhhuL81IueMRFGN0kIjKFHDJSszH8t/m0QwUUo4o780HJVe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13354972"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="13354972"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="42890826"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:42:13 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4A110580DB4
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 23:42:12 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd3ic-00000000j8h-1NVM for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 08:42:10 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] scripts/igt_doc.py: fix intelci testlist generation
 for complex cases
Date: Thu, 22 Feb 2024 08:39:59 +0100
Message-ID: <20240222074208.173368-2-mauro.chehab@linux.intel.com>
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

