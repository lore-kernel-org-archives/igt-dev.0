Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8959CC2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 20:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C54D10EC2C;
	Thu, 20 Jun 2024 20:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWJqVCWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BCD10E99A
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 20:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718913661; x=1750449661;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+A1wwFe1V5YZ1jGfgjG3R9a3xpIOeeXeed7TGHc+Aeg=;
 b=SWJqVCWfF39RkE9kKKaLEHi2sCh54OYXoVu29eSMRHv5taBfvXVj5LVI
 +vkCcuFHv5zI1Zu2aN4Ps1T39aa2SjR6121SGF2J3loPsaTbkAosD5iym
 lJQdioS+3/ZZLxUOGhPpwa94v6S3Z7IWxynaFj2teocu2o3rZ8vK8Yv3l
 hTHeLGrIq7FkVz/T6rIEhIl5JRFXeZ53ZzuWoC58bgYWj1DRtxIPe2C9R
 REAcRKQuC3/UZ0ZLRSRvJgvtaqU2YnWkqktayXHoKX2uA5xiKcHpr2nBX
 XewzdMAGLk2oaTxEm6cbmvL0rprKhUhLoUwVHy+SjWH/xp25ZpEorpPg1 Q==;
X-CSE-ConnectionGUID: yXgh59VTRfia6QihNFPPdQ==
X-CSE-MsgGUID: pCj/rzRmS7SmQ8vzsc6o1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41329345"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41329345"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:01:00 -0700
X-CSE-ConnectionGUID: cWUPETOZR0CEH36te4WhIQ==
X-CSE-MsgGUID: VpBw52EERO6YKLiOzLEtJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42459877"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:01:00 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 27/28] xe/oa/oa-metricset-codegen: Fix
 XE_OA_FORMAT_PEC64u64 offsets
Date: Thu, 20 Jun 2024 13:00:52 -0700
Message-ID: <20240620200054.3550653-28-ashutosh.dixit@intel.com>
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

