Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78586C3065E
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 20:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FBB10EC5C;
	Thu, 20 Jun 2024 20:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iyl8WIeh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536AF10EBCA
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 20:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718913661; x=1750449661;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4udvJSZq9oZ/CdG+lhLM5PYSf5x4ScbIriyucMVdYys=;
 b=Iyl8WIehD/SLaLHEHWykP5vDPnAHwT973rAlxT7oFeP6fXXec4fOu4mM
 t0MnfpnXszr0CEs+0tfwZTwEm9Mr/3fEEJJJkpHa3ATd7hit4s+L1FgLM
 eE9SQgEW5C2tQPORxp+dJ+fDkwP3sT99qi+JIXPVahp1eNjL1Ge2vo4z7
 ePye4TKrPeo+IPMal3mNuisinqiViJCjCJNRygDzAv7gRtAQnirX9WlBo
 EfwhSMltHzgZjWoJep8iBOihE8/QhllNpBKgfp+djk6rPvd0/Ujhci0Xh
 B+wZpEQCdHyY/29LVw27ZRs6xh6cfGG+WW5LxG0ekSdfU/HvH2ixTKxqD A==;
X-CSE-ConnectionGUID: eVBbYvxtTKKijd1FULLjjQ==
X-CSE-MsgGUID: sXSMHxtfTnCzv1oA81C7HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41329342"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41329342"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:01:00 -0700
X-CSE-ConnectionGUID: p5EeOLzmRmmhuOmSuIZSLg==
X-CSE-MsgGUID: YXX+vjg7T1uBw2AgcxI7pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42459869"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:01:00 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 24/28] xe/oa: Fix invalid escape warnings
Date: Thu, 20 Jun 2024 13:00:49 -0700
Message-ID: <20240620200054.3550653-25-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: José Roberto de Souza <jose.souza@intel.com>

Fix this warnings:
SyntaxWarning: invalid escape sequence '\

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/xe/oa-configs/codegen.py           | 12 ++++++------
 lib/xe/oa-configs/mdapi-xml-convert.py |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
index 9a7d57a33e..f078ef9498 100644
--- a/lib/xe/oa-configs/codegen.py
+++ b/lib/xe/oa-configs/codegen.py
@@ -162,13 +162,13 @@ hw_vars_mapping = {
 }
 
 def is_hw_var(name):
-    m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
+    m = re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
     if m:
         return True
-    m = re.search('\$GtSlice([0-9]+)$', name)
+    m = re.search(r'\$GtSlice([0-9]+)$', name)
     if m:
         return True
-    m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
+    m = re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
     if m:
         return True
     return name in hw_vars_mapping
@@ -338,13 +338,13 @@ class Gen:
             return self.hw_vars[name]['c']
         if name in set.counter_vars:
             return set.read_funcs[name] + "(perf, metric_set, accumulator)"
-        m = re.search('\$GtSlice([0-9]+)$', name)
+        m = re.search(r'\$GtSlice([0-9]+)$', name)
         if m:
             return 'intel_xe_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
-        m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
+        m = re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
         if m:
             return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
-        m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
+        m = re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
         if m:
             return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
         return None
diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
index ab4747ddd1..575b53e955 100755
--- a/lib/xe/oa-configs/mdapi-xml-convert.py
+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
@@ -228,7 +228,7 @@ counter_blacklist = {
 
 def underscore(name):
     s = re.sub('MHz', 'Mhz', name)
-    s = re.sub('\.', '_', s)
+    s = re.sub(r'\.', '_', s)
     s = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', s)
     s = re.sub('#', '_', s)
     return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s).lower()
-- 
2.41.0

