Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD74C27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 20:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCBB10E105;
	Wed, 26 Jun 2024 20:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmJk6LyC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2FB10E269
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719435291; x=1750971291;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=el8xU5V77z5LsgmwyONNKnR/P30+1j/MAp10Vw4GvHk=;
 b=bmJk6LyC3to6ayjiZsE2J4G78l0ouwH95PagGy1ulk35u06EGI/xMign
 JOYpmVciYXjZxlzoAh69/QBzfQopSX9j8rRmldvm2sYujuAQuS0EgNlak
 EgBzw9Cfl2dZ8hOkpg2+w7OyCK7a4Hmaad07KEEgXfdTZyuZJu+MriAbW
 vZWkIlIwi2OE/bQYPPfXFFgtXJCKfengioK5b8s1bkAEyeWu48T7tBaMK
 3F2Y6YaRpB7+f3SuH3L3RvLDYjW0VRcu7rg+0p/6ozBRBt6Utm6B4U6gZ
 y9zdhaxJhmPrPIDAzRB4tE2rBdTzQArG8yVE4XQXPM+RL7uRZzAhlCqZ6 g==;
X-CSE-ConnectionGUID: Aaavl5WiQy2xW5ABWgfR1g==
X-CSE-MsgGUID: i7fFcCtcSB2aLNho5SlfOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27671001"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="27671001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:54:51 -0700
X-CSE-ConnectionGUID: WYUk3l0dRoKVBXBBtRNa6g==
X-CSE-MsgGUID: jKOekGGUQVawr3G8mStLRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44018929"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:54:51 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/16] xe/oa: Fix invalid escape warnings
Date: Wed, 26 Jun 2024 13:54:40 -0700
Message-ID: <20240626205443.1560171-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240626205443.1560171-1-ashutosh.dixit@intel.com>
References: <20240626205443.1560171-1-ashutosh.dixit@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

