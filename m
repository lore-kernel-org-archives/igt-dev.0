Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CE3C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 12:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF6F10F38D;
	Fri,  9 Feb 2024 12:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcFyChSR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7710F38C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707482149; x=1739018149;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=gm0COISMDWV5C8TVXeh8Fa5CuZJ4dgV/QuJRzv9TecA=;
 b=WcFyChSRmG0S6tyvcBiayjh/cIOP7hJmT7WJF0ErjR9JtkRCCygQy0Tc
 +WL4tGX9Iruux4ul2wYeim8zmHdRyrKAVsGmOY8U8DKn52rSSZ8zvcbKn
 m2HlXU0vuC+6BOPfBDqLS33kro34Ix7DLDSY9iFBxRRrAlWzJZr+YzSYY
 0Y0FCrwYfBC36W5B5PSjeOyE3FVYmNQYHClFywFK4JHo1k5ApUeivqS1C
 FKmFBRPgnIX7Q+OvntPwICqkxjgp+HhPWdc7QHga9VnobUfMgv941MV/c
 R1GTkUBOUNloymkMHPJXc8Z1mWEXuPeIqF6c96TZrSAmKheTDvkzy6dhG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1554278"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1554278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39363250"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
Received: from linux.intel.com (unknown [10.245.246.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3FA12580E62
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 04:35:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYQ6b-00000001DGJ-0aBq for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 13:35:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 7/8] scripts/igt_doc.py: simplify and cleanup
 tests_per_list logic
Date: Fri,  9 Feb 2024 13:34:46 +0100
Message-ID: <20240209123543.289204-8-mauro.chehab@linux.intel.com>
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

Re-do the logic which calculates tests_per_list dict inside
gen_intelci_testlist():

- better handle "other" runtype;

- better handle driver name discovery logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index bf51e5f4ebb3..1b4f7eafd135 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -61,36 +61,35 @@ class IgtTestList(TestList):
         split_regex = re.compile(r",\s*")
 
         for subname, subtest in subtest_dict.items():
-            run_types = subtest.get("Run type", "other")
-            run_type_set = set(split_regex.split(run_types))
-
+            run_types = subtest.get("Run type", "other").lower()
+            drivers = set()
             run_type_set = set()
             for run_type in set(split_regex.split(run_types)):
-                run_type = run_type.lower()
-
-                drivers = set(self.drivers)
 
                 for driver in self.drivers:
-                    driver = driver.lower()
-
                     if run_type.startswith(driver):
                         run_type = re.sub(r"^" + driver + r"[\W_]*", "", run_type)
                         drivers = set([driver])
                         break
 
+                if not drivers:
+                    drivers.update(self.drivers)
+
+                if not run_type:
+                    run_type = "other"
+
                 run_type_set.add(run_type)
 
+            if not drivers:
+                drivers = set(self.drivers)
+
             for driver in drivers:
                 if driver not in tests_per_list:
                     tests_per_list[driver] = {}
 
                 for run_type in run_type_set:
-                    if not run_type:
-                        run_type = "other"
-
                     if run_type not in tests_per_list[driver]:
                         tests_per_list[driver][run_type] = {}
-
                     if subname not in tests_per_list[driver][run_type]:
                         tests_per_list[driver][run_type][subname] = {}
 
-- 
2.43.0

