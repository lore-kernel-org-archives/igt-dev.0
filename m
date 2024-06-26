Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55D1C30659
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 20:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DAF10E12C;
	Wed, 26 Jun 2024 20:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnyjeRaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EF110E0B1
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719435292; x=1750971292;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QwkuohqoWzcnusmhqayY0Ug61NcGn5C9Zu125N7kOn8=;
 b=UnyjeRaqQNPxSKMHPly19dHOIe0VCbXqUoituFte53LQZvmhQq/VUjLz
 o+WLgG6IQnrOF6Flx8HzN/nzMiwQwe5dDB/VT/4jejnW/nwCe7jKZwSyG
 sE8+Dj2Kth69K5D8m4XuC3gVr5OnVI+46O1oqR7fKWeTDYvGjTBjhQXxC
 2lMZTlqtuITHhx/KOCYiR43MudddOq3I5QhF4tojYafwCXvcfvaiRCBOq
 07qHBeNnqz14VFRpL15bWZ6oMU0tGX/UlXs7vpCSuOr55I/82VceLTmb1
 HFPeLqtz47wYmrgFI0/XV+ocNrVlkchODllwe2vnZ3D2QytWw4tSJZWhL w==;
X-CSE-ConnectionGUID: oA2+wiZ/Tj2IZ5NSUdFRcw==
X-CSE-MsgGUID: JYk6Wod8RRmsCLwMv/WUNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27671005"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="27671005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:54:52 -0700
X-CSE-ConnectionGUID: QM7wGF9ITOWHPgSUV1wd/g==
X-CSE-MsgGUID: 3fpdgVNuQ7aNfXpzJEzKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44018934"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:54:51 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/16] xe/oa/oa-metricset-codegen: Fix
 XE_OA_FORMAT_PEC64u64 offsets
Date: Wed, 26 Jun 2024 13:54:43 -0700
Message-ID: <20240626205443.1560171-17-ashutosh.dixit@intel.com>
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

XE_OA_FORMAT_PEC64u64 only has pec_offset.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

