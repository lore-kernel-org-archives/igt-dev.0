Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E27AC4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 07:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BBA1121EB;
	Wed,  1 May 2024 07:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R66OesgI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5041121EB
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 07:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714546920; x=1746082920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3AFYQf0TzcLTS7+RcJqJSNW9o/eAWqs6JjGlbA0N4as=;
 b=R66OesgI27c/RPOGUltPhcLAUsbj+0ctZvZfub8ECNQDFMS2+Sn8Tslo
 W/xZr6NF2rhQiOurWLi+CLbeCh5i2wZzFBEtq8kc4mE58GmVv5rMTO1pg
 AC7vJ2vDkcGGKxY5WoC3L2a1rixDNPnvEzuUU18PlmjWGpLcq5fQgPKMr
 Xh+CzIFYZaXcCklBfReeRx0+cpp28iGE76UEZQSgpUEitqJm9IGIdbv7o
 zyqCQRS6AJ4Hni9FNY07hWaE+Owu3KUaZWhV7Xb0iCqUTla98wFCRpGeP
 oz+Upr1B4Y2O27gkoHHXpy1dIpnJDNPTbGzGt9s+KRfqpg03b2mETDkmX g==;
X-CSE-ConnectionGUID: sfBoITtnTTyo4iP2cGimiQ==
X-CSE-MsgGUID: UzPKHAsyQE+IDsR0H+1L3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10493270"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="10493270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 00:02:00 -0700
X-CSE-ConnectionGUID: 2gb4rwgHQQyAJ1CHIOYe4g==
X-CSE-MsgGUID: s1lb+ZTcRFW6yjSeRpY2ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="57594484"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.109.81])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 00:02:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] lib/i915/perf: Fix warning on codegen
Date: Wed,  1 May 2024 02:01:45 -0500
Message-ID: <20240501070145.49810-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.45.0
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

For a normal string, it's not correct to use just one backslash as
escape char as that conflicts with Python's escape. Use raw strings for
the regex patterns to avoid this problem. Fix the followin warnings:

[4/1809] Generating lib/i915-perf-registers-hsw with a custom command
/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:165: SyntaxWarning: invalid escape sequence '\$'
  m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:168: SyntaxWarning: invalid escape sequence '\$'
  m = re.search('\$GtSlice([0-9]+)$', name)
/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:171: SyntaxWarning: invalid escape sequence '\$'
  m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:341: SyntaxWarning: invalid escape sequence '\$'
  m = re.search('\$GtSlice([0-9]+)$', name)
/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:344: SyntaxWarning: invalid escape sequence '\$'
  m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:347: SyntaxWarning: invalid escape sequence '\$'
  m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/i915/perf-configs/codegen.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index 020e76ef4..0d1847592 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
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
             return 'intel_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
-        m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
+        m = re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
         if m:
             return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
-        m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
+        m = re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
         if m:
             return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
         return None
-- 
2.45.0

