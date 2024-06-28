Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B942C3271E
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 20:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7360110ED63;
	Fri, 28 Jun 2024 20:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZ88v6c0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC35110E0A8
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719607436; x=1751143436;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=el8xU5V77z5LsgmwyONNKnR/P30+1j/MAp10Vw4GvHk=;
 b=DZ88v6c0atD4dKxiNz94+jU3FyklEGSIv2ZZwrizm0GOExhUSMfjn4GI
 VpECQIpocU3Wn7CVEwnTVmcljHrM2F0oUTBousXt2+bBS8p2x5DdvPS3g
 ejLNhCt6MLF3NobbCP4dNBhoCsXaSGE5/SI6V/ovtp48xXs2RAb1WtvWh
 UEJ1PnIt9bVdfq4/iu6nzAog/zXOsA76oJmw0J+nMNKEe5jfCqZhgLWBT
 S8dAwcBg0qjZneaPhBRPiR5w6AI04/djI+fNipFIlXMRFfzG7BtIpT4X8
 DTK00lQH0KPvSAra0PJJhnIh/LlllC2J6SbxKmf6AUBgh5RQ2Z6JD7sTg A==;
X-CSE-ConnectionGUID: r+Z+ogzsQtCeXf2NaLPTTw==
X-CSE-MsgGUID: 8CVryyOmQ6yc+9Z18ytAJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27427494"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27427494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:55 -0700
X-CSE-ConnectionGUID: 8KV+u0U3Qd2JnbUVLjXUOQ==
X-CSE-MsgGUID: 6VUvQ2XWQxu1/4ECBL0kVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="49465212"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:55 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/16] xe/oa: Fix invalid escape warnings
Date: Fri, 28 Jun 2024 13:43:45 -0700
Message-ID: <20240628204348.2142940-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
References: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
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

