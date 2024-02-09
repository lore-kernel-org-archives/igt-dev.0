Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94777C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 12:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E7810F391;
	Fri,  9 Feb 2024 12:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyYnGRde";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0227F10F390
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707482149; x=1739018149;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=tOStPZa49zjcaGXj6i6SojH6zsLvwymFMbJvaCqMfwU=;
 b=TyYnGRdeOsTkMRCqIHpIoqCZMEquzja6J6oJAfxaKaSDrE5/pxGT+rfU
 4FS3XmxMSvhrKOzyJhQRKuaZUx9MGxVBS5HJdKeuiyeKRPDKgMSDH3f1j
 pKm8DnaoeZJYcDHH5ApXjctqi9hk6n6wNPFBeB/0oQxir74n4WPspQjOK
 Jr+O9byEzixG2eUrv2qUCD2Ejq/XehzLkK0WwrIdDXlg4aR2fMfH3/oOw
 Lto/JOVb+rQXqZmJcwvOKpl+PU4jlcjVeVYANdzXI1m7gyBMzGqIxfs3W
 4MQlMXrsjhVM2LK6uRKgO+37rTlPWRS0HLbRgQ1Gtwm3Rou5uDd1e+L6J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1554277"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1554277"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39363249"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
Received: from linux.intel.com (unknown [10.245.246.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 41CD25804FA
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 04:35:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYQ6b-00000001DGN-0dxB for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 13:35:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 8/8] scripts/igt_doc.py: use an ancillary function to
 simplify the code
Date: Fri,  9 Feb 2024 13:34:47 +0100
Message-ID: <20240209123543.289204-9-mauro.chehab@linux.intel.com>
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

The code inside gen_intelci_testlist() is too complex, and currently
buggy.

Basically, if we have two testlists with driver name + name, like
"Xe BAT" and "i915 BAT", the current logic picks just one
(randomly), which produce different results on each run.

Simplify the logic by moving the routine which fills the run_type
set to a separate function, fixing the bug.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 72 ++++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 1b4f7eafd135..3a45371a27e7 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -18,6 +18,40 @@ import sys
 from test_list import TestList
 
 class IgtTestList(TestList):
+    def __init__(self, *args, **kwargs):
+        self.split_regex = re.compile(r",\s*")
+
+        super().__init__(*args, **kwargs)
+
+    def _get_run_type_drivers(self, run_types):
+        """
+            Ancillary routine to return drivers and run type set from
+            a run type string.
+        """
+
+        run_type_dict = {}
+        for run_type in set(self.split_regex.split(run_types)):
+            driver_set = set()
+            if not run_type:
+                run_type = "other"
+            else:
+                for driver in self.drivers:
+                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, re.IGNORECASE)
+                    if result != run_type:
+                        driver_set = set([driver])
+                        run_type = result
+                        break
+
+            if not driver_set:
+                driver_set = set(self.drivers)
+
+            if run_type in run_type_dict:
+                run_type_dict[run_type].update(driver_set)
+            else:
+                run_type_dict[run_type] = driver_set
+
+        return run_type_dict
+
     """
         This class implements testlist generation as expected by Intel CI.
         It does that by handling test lists split by "Run type" and
@@ -50,7 +84,7 @@ class IgtTestList(TestList):
         - if "GPU excluded platform" exists, for each GPU listed on
           the list, it will block the test.
     """
-    def gen_intelci_testlist(self): #pylint: disable=R0912
+    def gen_intelci_testlist(self):
         """Return a list of gpu configs and testlists."""
 
         subtest_dict = self.expand_dictionary(True)
@@ -58,48 +92,30 @@ class IgtTestList(TestList):
         # Create a tests_per_list dict
         gpu_set = set()
         tests_per_list = {}
-        split_regex = re.compile(r",\s*")
+
+        for driver in set(self.drivers):
+            tests_per_list[driver] = {}
 
         for subname, subtest in subtest_dict.items():
             run_types = subtest.get("Run type", "other").lower()
-            drivers = set()
-            run_type_set = set()
-            for run_type in set(split_regex.split(run_types)):
 
-                for driver in self.drivers:
-                    if run_type.startswith(driver):
-                        run_type = re.sub(r"^" + driver + r"[\W_]*", "", run_type)
-                        drivers = set([driver])
-                        break
+            run_type_dict = self._get_run_type_drivers(run_types)
 
-                if not drivers:
-                    drivers.update(self.drivers)
-
-                if not run_type:
-                    run_type = "other"
-
-                run_type_set.add(run_type)
-
-            if not drivers:
-                drivers = set(self.drivers)
-
-            for driver in drivers:
-                if driver not in tests_per_list:
-                    tests_per_list[driver] = {}
-
-                for run_type in run_type_set:
+            for run_type, drivers in run_type_dict.items():
+                for driver in drivers:
                     if run_type not in tests_per_list[driver]:
                         tests_per_list[driver][run_type] = {}
+
                     if subname not in tests_per_list[driver][run_type]:
                         tests_per_list[driver][run_type][subname] = {}
 
                     if "GPU" in subtest:
-                        for gpu in split_regex.split(subtest["GPU"]):
+                        for gpu in self.split_regex.split(subtest["GPU"]):
                             gpu_set.add(gpu)
                             tests_per_list[driver][run_type][subname][gpu] = True
 
                     if "GPU excluded platform" in subtest:
-                        for gpu in split_regex.split(subtest["GPU excluded platform"]):
+                        for gpu in self.split_regex.split(subtest["GPU excluded platform"]):
                             gpu_set.add(gpu)
                             tests_per_list[driver][run_type][subname][gpu] = False
 
-- 
2.43.0

