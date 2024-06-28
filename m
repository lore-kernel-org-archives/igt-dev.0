Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A35C31D97
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 20:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB38E10ED56;
	Fri, 28 Jun 2024 20:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EboClXft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D734F10ED40
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719607437; x=1751143437;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QwkuohqoWzcnusmhqayY0Ug61NcGn5C9Zu125N7kOn8=;
 b=EboClXftUCUlAA+KZDtlFtUNwggQQwzOZOrI08xadqaQmXjuAf97h8tY
 6H79EB1KGdSI8A0IQcBgaKNoEJvwoJAGS6ABc6yO6hoi0KLJLF6xGTKVP
 ckLpz5WtTrMLzrYGFi31jFpkIUdrA63nvXSAjqgq3dltv+QlwNLQlhiiL
 zO2ReyufEhrTjqGhGRq0wchPDmSgJqfFOYy7DYvoeT51VE1GXFXiGZd7W
 Eu20PJy8Fp21NqsYaa7P2lg+g/sJnP6aHcKjjFxrEOXYo8csY009k7qkm
 CQeJpit7xyf5F+D/O4bmJfbw0q95nsbXb7qePDpONHUo/9bZ1L1n1WWF/ g==;
X-CSE-ConnectionGUID: XIjG2j0iRBuwvWRB4nnGlw==
X-CSE-MsgGUID: QdHlJNqEQRCcT8Vqt3kHkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27427499"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27427499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:56 -0700
X-CSE-ConnectionGUID: lSvwjUVaTs6Yy99/BtQetQ==
X-CSE-MsgGUID: PkKi9OyBSTis/bTubOBIsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="49465219"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:56 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/16] xe/oa/oa-metricset-codegen: Fix
 XE_OA_FORMAT_PEC64u64 offsets
Date: Fri, 28 Jun 2024 13:43:48 -0700
Message-ID: <20240628204348.2142940-17-ashutosh.dixit@intel.com>
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

