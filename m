Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CEDC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 20:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ECE10ED19;
	Fri,  7 Jun 2024 20:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfXWV9oG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD3510ED0E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 20:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717790942; x=1749326942;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+A1wwFe1V5YZ1jGfgjG3R9a3xpIOeeXeed7TGHc+Aeg=;
 b=DfXWV9oGH0C2GoZS3d92W3HPmlqlOTdBi95q4iaEgBJLxoyCZHO19M0D
 L28KzYqWSkxRMf1U5PawsfZHrs+tkVksiBDKVf41TuFZK2Vb0mF/tnP8z
 G7RGC3DfvMF6eLV4QfJd5AD+pMcYNTr4m/xf/hDIqNXwH6V8Uu6JLoNAc
 HDOUlTdeKlIdL4aScYN0kN7v1NRFgYGcOmoN5JLqP0PZVT/DiZmX7X0ir
 dPanzhGoKLahNsjPBv97qddIsgOxK1anD1eilveIfQdDbdQE0fEMVDNyI
 /wbovvs4DiO831ybsPsHN7yfGjwvTSyG4kc4wO8SErgG4igkPhtJleolw g==;
X-CSE-ConnectionGUID: Dt0d+gkeTmqhO8pv9ETCXA==
X-CSE-MsgGUID: PC8d1alfRlmvSyuGR2ubzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18383241"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18383241"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:09:01 -0700
X-CSE-ConnectionGUID: 0Wk+5FzFQm+dlS9/aFRduw==
X-CSE-MsgGUID: AvP/nkrQTIq7xoSpYPaipA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38373869"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:09:01 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 27/27] xe/oa/oa-metricset-codegen: Fix
 XE_OA_FORMAT_PEC64u64 offsets
Date: Fri,  7 Jun 2024 13:08:47 -0700
Message-ID: <20240607200847.1964629-28-ashutosh.dixit@intel.com>
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

XE_OA_FORMAT_PEC64u64 only has pec_offset.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/xe/oa-configs/oa-metricset-codegen.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index f4a008d690..5fa12f9caf 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -145,11 +145,7 @@ def generate_metric_sets(args, gen):
                 metric_set->perf_raw_size = 576;
                 metric_set->gpu_time_offset = 0;
                 metric_set->gpu_clock_offset = 1;
-                metric_set->a_offset = 2;
-                // metric_set->b_offset = metric_set->a_offset + 38;
-                // metric_set->c_offset = metric_set->b_offset + 8;
-                metric_set->perfcnt_offset = metric_set->a_offset + 64;
-
+                metric_set->pec_offset = 2;
             """))
         else:
             c(textwrap.dedent("""\
-- 
2.41.0

