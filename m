Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C13CF433CB
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 21:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2881310E75E;
	Wed, 15 Apr 2026 21:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcQ3YnwH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A8A10E75E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 21:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776289981; x=1807825981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hgzl1/krwyjiQiRQjVEVW2hNV4Z2DyKyowhGp3o/JvI=;
 b=FcQ3YnwHmMu2JGMNLLpLsXW5nTVb1LodlIUaJ7fU8hLNETBrA/rtqRBS
 DbgSrFG9hLrF49h/W43PzJnbDRIbUyXkNtipSeIRFFGOhBpUGlfwPNA6c
 KJKkLdGXv5aYgou6i416x6LJ3KzDqUdOcFSpNtCuXFW07xfXDeFoHh3+b
 kgVd05mmJxySFTdgz+/Lr/lh/5EfVhB2DvZqNt2g+lQS0bQOS5qqKJvvj
 5dJLlOjFdIreHe2teEoGkrjlAfiS64YdltLuwoh0UxXvRBmJSuNm8Zkv/
 3Pnwj5k9mQ6hJEfqXgT8eCHuRacVN17s2O4HNAcSw7U+4Que8gOKcEr11 Q==;
X-CSE-ConnectionGUID: T1dvLNH9QcWceu0UUDvhvQ==
X-CSE-MsgGUID: xe0rYfagTsWj62cEbHSqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="102744407"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="102744407"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 14:53:00 -0700
X-CSE-ConnectionGUID: oZ3Y0mAxRtSOGyYvrt4TLQ==
X-CSE-MsgGUID: 6IdHY6RBRhSSA4WYIX9Zaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229515317"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 14:53:01 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH i-g-t] lib/xe/oa: Add support for 192B_MPEC8LL_NOA16 OAM format
Date: Wed, 15 Apr 2026 14:52:57 -0700
Message-ID: <20260415215257.898995-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Support for CRI 192B_MPEC8LL_NOA16 OAM format was previously missed
out. Add it.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/oa-metricset-codegen.py | 13 +++++++++++-
 lib/xe/xe_oa.c                            | 24 +++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index c5c7a2c8d4..b44d4d73af 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -139,7 +139,7 @@ def generate_metric_sets(args, gen):
                     metric_set->perfcnt_offset = metric_set->c_offset + 8;
                 """))
         elif gen.chipset == "lnl" or gen.chipset == "bmg" or gen.chipset == "ptl" or gen.chipset == "cri":
-            # See intel_xe_perf_accumulate_reports for the offsets
+            # See intel_xe_perf_accumulate_reports for the offsets (value of idx variable)
             if set.oa_format == "128B_MPEC8_NOA16" or set.oa_format == "128B_MERT_PEC8":
                 c(textwrap.dedent("""\
                     metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
@@ -151,6 +151,17 @@ def generate_metric_sets(args, gen):
                     metric_set->b_offset = metric_set->pec_offset + 8;
                     metric_set->c_offset = metric_set->b_offset + 8;
                 """))
+            elif set.oa_format == "192B_MPEC8LL_NOA16":
+                c(textwrap.dedent("""\
+                    metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u64_B8_C8;
+
+                    metric_set->perf_raw_size = 192;
+                    metric_set->gpu_time_offset = 0;
+                    metric_set->gpu_clock_offset = 1;
+                    metric_set->pec_offset = 2;
+                    metric_set->b_offset = metric_set->pec_offset + 8;
+                    metric_set->c_offset = metric_set->b_offset + 8;
+                """))
             else:
                 c(textwrap.dedent("""\
                     metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index b2f447c944..d1a382bdd1 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -875,6 +875,30 @@ void intel_xe_perf_accumulate_reports(struct intel_xe_perf_accumulator *acc,
 
 		break;
 
+	case XE_OAM_FORMAT_MPEC8u64_B8_C8:
+		/* 64 bit timestamp */
+		if (perf->devinfo.oa_timestamp_shift >= 0)
+			deltas[idx++] += (end64[1] - start64[1]) << perf->devinfo.oa_timestamp_shift;
+		else
+			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
+
+		/* 64 bit clock */
+		deltas[idx++] += end64[3] - start64[3];
+
+		/* 8x 64bit MPEC counters */
+		for (i = 0; i < 8; i++)
+			deltas[idx++] += end64[4 + i] - start64[4 + i];
+
+		/* 8x 32bit B counters */
+		for (i = 0; i < 8; i++)
+			accumulate_uint32(start + 16 + i, end + 16 + i, deltas + idx++);
+
+		/* 8x 32bit C counters */
+		for (i = 0; i < 8; i++)
+			accumulate_uint32(start + 24 + i, end + 24 + i, deltas + idx++);
+
+		break;
+
 	case XE_OA_FORMAT_PEC64u64:
 		/* 64 bit timestamp */
 		if (perf->devinfo.oa_timestamp_shift >= 0)
-- 
2.48.1

