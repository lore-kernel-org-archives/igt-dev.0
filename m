Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF418CA1001
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 17:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D0510E1BF;
	Fri, 29 Aug 2025 17:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBb7os2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8CD10E09A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487721; x=1788023721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/iz8gSXzsiaVczqL7M38yNE9ItVj1QlsiXhas9cZLaQ=;
 b=JBb7os2lmkZaLje0m0+XxYjlybNrXNS4I1c9npsSHRbzGUUcoN2k5C0V
 8YuAQWnBsgKnRrvMs28nJjfNVqgjSy4ZxhZESo27BvwM1L1MqveLCTPO0
 cefuxvzbAYDb+iVdJ7D9FekS4x2bsfa1/SnqdqYmPz99JVR2hyfJ/svtb
 QgtL5Wz67mGPdUZVA6PgDUxKZvRRWKvZGKyCRMYHouZ5NzLtZLGU9XxG3
 WEBw3Z+DuLn3cVVHD24sXiwfE2x+DCFVs71DTd1BbPeTsEIGafiGfDXvg
 r6RJ7XSPpDo6W1xChL2Z/2AJlrs1a7+CBvRUBEk1y2oqTu3on7QyBjPoG A==;
X-CSE-ConnectionGUID: 7CWy0hoTQVOrT/Eq2NWt8g==
X-CSE-MsgGUID: Di9Htie1Tau7XxQkBhCARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212407"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:15:21 -0700
X-CSE-ConnectionGUID: 7uMJfXyMTQiHMOFXJKj1rA==
X-CSE-MsgGUID: f59c+kOWTyeW9F9BISL3YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170816746"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:15:19 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH i-g-t 4/4] lib/xe/oa: Fix OA media metric set properties
Date: Fri, 29 Aug 2025 10:15:06 -0700
Message-ID: <20250829171506.3148434-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
References: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
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

Fix generated format, OA report size and other properties for Xe2+ OA media
metric sets.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/oa-metricset-codegen.py | 26 +++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index 748f587875..922fae58cb 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -139,14 +139,26 @@ def generate_metric_sets(args, gen):
                     metric_set->perfcnt_offset = metric_set->c_offset + 8;
                 """))
         elif gen.chipset == "lnl" or gen.chipset == "bmg" or gen.chipset == "ptl":
-            c(textwrap.dedent("""\
-                metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
+            # See intel_xe_perf_accumulate_reports for the offsets
+            if set.oa_format == "128B_MPEC8_NOA16":
+                c(textwrap.dedent("""\
+                    metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
 
-                metric_set->perf_raw_size = 576;
-                metric_set->gpu_time_offset = 0;
-                metric_set->gpu_clock_offset = 1;
-                metric_set->pec_offset = 2;
-            """))
+                    metric_set->perf_raw_size = 128;
+                    metric_set->gpu_time_offset = 0;
+                    metric_set->gpu_clock_offset = 1;
+                    metric_set->pec_offset = 2;
+                    metric_set->b_offset = metric_set->pec_offset + 8;
+                    metric_set->c_offset = metric_set->b_offset + 8;
+                """))
+            else:
+                c(textwrap.dedent("""\
+                    metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
+                    metric_set->perf_raw_size = 576;
+                    metric_set->gpu_time_offset = 0;
+                    metric_set->gpu_clock_offset = 1;
+                    metric_set->pec_offset = 2;
+                """))
         else:
             c(textwrap.dedent("""\
                 metric_set->perf_oa_format = XE_OA_FORMAT_A32u40_A4u32_B8_C8;
-- 
2.48.1

