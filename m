Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09E2F8E4A4
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 03:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5040110E285;
	Fri, 17 Apr 2026 03:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Su9nV4pO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E7E10E285
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 03:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776396818; x=1807932818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yx8uzEXClVk0HjcOR+fp0LxAaikIwucMaqlcUU9iYP4=;
 b=Su9nV4pOCMTbCMBGpVyn1hluHmJwjhJ/4OBw/EjIVmzcnLP8AU7zlO/L
 etkHYsPUFwIUgFlfXsL+Y9kriLMMIGF9WbJv92FKw7kOLwT1FHwBuvsJs
 8CQoCjcG9cNRToasQkeClU9RVLQ3tKEUfh7YEBZzeDOXV8JKCGyelo9D+
 EuQdvAlkmb6st7jyM7pd0fQKrjMChjQySjIxybHLFiISfZj67NSTzeiro
 G1owuzrDRXKvkOyTkkKUd01/UY3B3SayO/NNGd/fIZsV5+pnZOnKQ7lWZ
 /n+Wf4pS0g6GuYygswzt0iNRW/4WYoJu1USQbTQid7whGaraPT/Q+CCu4 A==;
X-CSE-ConnectionGUID: xsaAj6iXRkmqKFQyKedCmg==
X-CSE-MsgGUID: 7IeOehJySPeHgSSD8Nl9Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="102869976"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="102869976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 20:33:37 -0700
X-CSE-ConnectionGUID: AdmFDYPLSSys6/pIe4As+Q==
X-CSE-MsgGUID: qGNQufZFRLiGa/SaanyZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230841595"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 20:33:37 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH i-g-t] lib/xe/oa: Add support for 192B_MPEC8LL_NOA16 OAM format
Date: Thu, 16 Apr 2026 20:33:34 -0700
Message-ID: <20260417033334.933419-1-ashutosh.dixit@intel.com>
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

v2: Fix B/C counter accumulation (Shekhar C)
v3: Fix other places where 192B_MPEC8LL_NOA16 OAM format is used (Shekhar C)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/oa-metricset-codegen.py | 13 +++++++++++-
 lib/xe/xe_oa.c                            | 26 +++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

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
index b2f447c944..891f4868a5 100644
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
+			accumulate_uint32(start + 24 + i, end + 24 + i, deltas + idx++);
+
+		/* 8x 32bit C counters */
+		for (i = 0; i < 8; i++)
+			accumulate_uint32(start + 32 + i, end + 32 + i, deltas + idx++);
+
+		break;
+
 	case XE_OA_FORMAT_PEC64u64:
 		/* 64 bit timestamp */
 		if (perf->devinfo.oa_timestamp_shift >= 0)
@@ -910,6 +934,7 @@ uint64_t intel_xe_perf_read_record_timestamp(const struct intel_xe_perf *perf,
                ts = report32[1];
                break;
 
+       case XE_OAM_FORMAT_MPEC8u64_B8_C8:
        case XE_OAM_FORMAT_MPEC8u32_B8_C8:
        case XE_OA_FORMAT_PEC64u64:
                ts = report64[1];
@@ -941,6 +966,7 @@ uint64_t intel_xe_perf_read_record_timestamp_raw(const struct intel_xe_perf *per
                ts = report32[1];
                break;
 
+       case XE_OAM_FORMAT_MPEC8u64_B8_C8:
        case XE_OAM_FORMAT_MPEC8u32_B8_C8:
        case XE_OA_FORMAT_PEC64u64:
                ts = report64[1];
-- 
2.48.1

