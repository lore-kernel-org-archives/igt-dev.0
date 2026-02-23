Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E98EF5864
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 04:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F0D10E211;
	Mon, 23 Feb 2026 04:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEb6Q9pY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCA010E20F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 04:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771820671; x=1803356671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YVHUXg8ce7BTsrIqDQnffuscd1QipC+jcYczddCaNm4=;
 b=oEb6Q9pYznnFsB/FboqWnOr/yxapgIurE0PpE/WIRrefvtY3zkzpUoQZ
 NIGUEwR0lWs262t/p10r9tEuFvaFcX24sws2Eenv3NclGTbE0vdOQZK+5
 R/y3uxM570p/0hvf80UQOM7mdi00c22+BqOgHcI33mFsD8heuAHoYlEE1
 nqU3/1tqOHvLmJz6fWjfVNwWhx5iBFD1R9PT6c3xmi8PcvUKI/MSg2FFI
 JTaGKDj5gq+MtFiK9MiWqKZsQ9amLnvOTcjIwjnhtbo4cjQcIE1nOtNL+
 LuJzALzIgIBe9JH290Bg0xHvARsUSZIbW11W+8ElG4IppOWEaeqalRhk6 A==;
X-CSE-ConnectionGUID: PO3nFVj0QrCN/SUsoYiYMw==
X-CSE-MsgGUID: m4rA3rMnSgW5HZtTDsF5KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76673717"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76673717"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:24:31 -0800
X-CSE-ConnectionGUID: 1Ah1DzGVShSWLZkJu6Dd0w==
X-CSE-MsgGUID: GXOw2u8XTmKxYvEztkhEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212876796"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:24:29 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 2/2] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 commit 1b85a9b04681
Date: Mon, 23 Feb 2026 09:38:59 +0530
Message-ID: <20260223040859.1362813-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223040859.1362813-1-ankit.k.nautiyal@intel.com>
References: <20260223040859.1362813-1-ankit.k.nautiyal@intel.com>
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

Synchronize intel_vbt_defs.h with kernel commit:
1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")

Bspec:20142
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_vbt_decode.c | 4 ++++
 tools/intel_vbt_defs.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 6f6f70dcee63..1cc863f59808 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2519,6 +2519,10 @@ static void dump_edp(struct context *context,
 		if (context->bdb->version >= 251)
 			printf("\t\teDP DSC disable: %s\n",
 			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
+
+		if (context->bdb->version >= 261)
+			printf("\t\teDP Joiner Enable: %s\n",
+			       YESNO(panel_bool(edp->joiner_enable, i)));
 	}
 }
 
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 932305df2320..acdd973bd006 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1108,6 +1108,7 @@ struct bdb_edp {
 	u16 edp_dsc_disable;					/* 251+ */
 	u16 t6_delay_support;					/* 260+ */
 	u16 link_idle_time[16];					/* 260+ */
+	u16 joiner_enable;					/* 261+ */
 } __packed;
 
 /*
-- 
2.45.2

