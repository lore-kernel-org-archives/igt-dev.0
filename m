Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40B9C27C55
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 20:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CF510ED08;
	Fri,  7 Jun 2024 20:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdG+vJ2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB2310ED04
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717790941; x=1749326941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4udvJSZq9oZ/CdG+lhLM5PYSf5x4ScbIriyucMVdYys=;
 b=ZdG+vJ2nG6YiZUY41b9oRbQcO/hw1YnfLcUYnOGQthFJiy/7uGPWv+vt
 DHFYZSo48zFMiefZilYB8nHPUp0F616MzxCFObrV7wv07ZzhbkqiOosER
 ts8UVfn41mElmIxmQhDDMndVzxX0wEHtdmUvfHrjJQ/AiJeR+1jcIja8L
 Yw/5YINFkFWUxviQMLQONugh6iBprwFt6Idi/ubvp/6TARowrBtvwca5A
 rCLFZPzRAPpEG8ZNzzb/o5MCr3nc1gfilr2/eD2KynYxTUSOyAtcO7Mrs
 Aqx67B7I4MujQ7fhWwgCbYP/gqvntY2AElswiejOcc5tidgzGoQENg+Oa g==;
X-CSE-ConnectionGUID: B5gl8wKvTV6gRRb0GN9nzg==
X-CSE-MsgGUID: sAqTlkoZQViAZVEeh+Fnjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18383238"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18383238"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:09:01 -0700
X-CSE-ConnectionGUID: Lt2UMhXLSPOrJkcJzaG5kg==
X-CSE-MsgGUID: Q67YWnDZR2ywgAGGedw2GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38373865"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:09:01 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 24/27] xe/oa: Fix invalid escape warnings
Date: Fri,  7 Jun 2024 13:08:44 -0700
Message-ID: <20240607200847.1964629-25-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240607200847.1964629-1-ashutosh.dixit@intel.com>
References: <20240607200847.1964629-1-ashutosh.dixit@intel.com>
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

