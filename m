Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398C1D35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6A310EC9D;
	Wed,  1 Apr 2026 11:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jjrs0yqU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0597510ECC8
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043253; x=1806579253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c/EWCLrste7iqukbynk5AayGc5e1MoYAwwL0yL6ndmw=;
 b=Jjrs0yqUsL1NIFp36E6FCE3TrHv3CgcH0u/VUGwhVdveAjXdWNrqT0uv
 qc8NMRklK1ZexBZv8GVfzEMnMmlLXg6mAWoJdZldUtTw7sWoYI/6NnOnA
 LF4tAXYccJg0HlVkyJ75H4Jb8Mgit5hLLjmggJYz3CWlVq1mHm0SeVvwK
 jDkTL2vAcZ7Kigo2LlvJp/S66xJg/+s6panjHwZF4Zbcr2vlBkMrncvA1
 M7GW5F/gFYnhievQMbtu6P2fchTjRzeircVqQg2E7/n/qeOF5I9w8M/pu
 3erX3oXIt08QobSPa4CKNFp5WYO8Mb4pTU57hXN6LiuSxsDU4Mp9r35su Q==;
X-CSE-ConnectionGUID: VGZtyjphSIynMheLbFyZHQ==
X-CSE-MsgGUID: XvHRPNOwSUq7NN0M094rUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76092222"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76092222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:34:12 -0700
X-CSE-ConnectionGUID: 6bjy4P2PR6SXSjiDGQmksw==
X-CSE-MsgGUID: VfeHpzhnT9eJlwvn8Yy8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231450367"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.206])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:34:12 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v6 3/4] lib/intel_pat: Set PTA + ATS PAT entries to
 invalid value
Date: Wed,  1 Apr 2026 13:33:57 +0200
Message-ID: <20260401113353.2825367-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401113353.2825367-6-zbigniew.kempczynski@intel.com>
References: <20260401113353.2825367-6-zbigniew.kempczynski@intel.com>
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

Some platforms (like LNL) requires PTA PAT entries shouldn't be
programmed and default register value should be used.

Setting this to max during parsing pat_sw_config or pat debugfs
allows detect these platforms and ignore some actions if necessary.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_pat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index f1f5644dce..2f35bb7724 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -51,6 +51,8 @@ static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cach
 
 	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
 	xe_pat_cache->uc_comp = XE_PAT_IDX_INVALID;
+	xe_pat_cache->pta_mode = UINT32_MAX;
+	xe_pat_cache->pat_ats = UINT32_MAX;
 
 	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
 		uint32_t value = 0;
-- 
2.43.0

