Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409E7F94CB2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 03:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECE310E261;
	Wed, 22 Apr 2026 03:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjxkhsBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECF610E261
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 03:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776830317; x=1808366317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nwQlXLGnjnYMOhasz9u2kAkt4NnPZft7GdjVOBR0O6c=;
 b=BjxkhsBPYNkyIC4uS2y3wIi+5VhdyruGLs1XYqQ2NfjEJFAGo2x4DsX0
 uFGR3SHRkw2w5/5wkA6Hn4R4n/7KCvWgaey1mmpDGMQ+Gr6glBBUn5WpU
 RtavVszNGLhfptQEkeDAPx7v6ZzTvu6XtTPeN+Avub890bUU6KDy1U9Ch
 jCUNpRUqJEbNiBcd6idrII8DvRYUEIAmUdzucOD8Lz1Bds9doIMSGfFDz
 pkJKU2tMEsJbwqJ9lWqngSTXpuGJ99YspRw4U+TGCV7cWeG/PuDsl7Qeu
 qtY8bu9kQt65ZoJNNH5mIfoUwZ7CdDrmModL9p9crbkaURQJakWF7YNTZ w==;
X-CSE-ConnectionGUID: 3ecaMUZBTdiLZvw151a4cg==
X-CSE-MsgGUID: HQw6jAnZRm+V1R8+q4f+7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95338488"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95338488"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:37 -0700
X-CSE-ConnectionGUID: seVuMuNSQ/iGeqaC/dAVZQ==
X-CSE-MsgGUID: ryj42sOBQPyzZcRFFWorcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232151353"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:35 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 5/8] tools/intel_vbt_defs: sync intel_vbt_defs.h with
 kernel commit 1b85a9b04681
Date: Wed, 22 Apr 2026 09:13:32 +0530
Message-ID: <20260422034335.2326098-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_defs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 57fda5824c9c..0dc13d080e8a 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1109,6 +1109,7 @@ struct bdb_edp {
 	u16 edp_dsc_disable;					/* 251+ */
 	u16 t6_delay_support;					/* 260+ */
 	u16 link_idle_time[16];					/* 260+ */
+	u16 pipe_joiner_enable;					/* 261+ */
 } __packed;
 
 /*
-- 
2.45.2

