Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC38FF885E
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 13:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5349B10E743;
	Mon, 27 Apr 2026 13:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rxzyqc1d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BA110E744
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294862; x=1808830862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A6mDrGjnzGkjSwg1hy7zyrOwwDDdpo30rnRt7tB+F3k=;
 b=Rxzyqc1diBA1zq8rbJZYKUg59nCtyujjzlmMwsvWdEGP+RNaSFi9nKa1
 vN8He16tojhF+STtEEDYs1XlMvUXfcaPWd8pKoY5M6r0RWF6Q+wshzXny
 ZK2ThAmTW5bKqamCkjiKNy+p6yqyAERaxFQtyeYxRzNtvH4NRgvcgnUTy
 Wtz5Kr3ctXcHBR1KLXQg7Muy36/FVK3nl/F3bflcxvSkPlZYHywbTmYPi
 45a56GBuJpM/igbiPWo39L1uO+totblvufJ5S8taRAxsnrB2tl01mlfhw
 gmcnhoTmcWgdGth1Sx8D2H/RT2vjXRhzcsAO3+Etlkum0cRn6HAE7UwAK g==;
X-CSE-ConnectionGUID: 7AD3+Pp5Ql+AdVoZzP5uQA==
X-CSE-MsgGUID: 2v2kaAmKRBWwPXokmdbGOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77339269"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77339269"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:01:01 -0700
X-CSE-ConnectionGUID: SM4CgzTrRf6KFRxKgzqaCA==
X-CSE-MsgGUID: ghwkA9bJTdu5GmDh6b0kmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237597756"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:59 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 5/8] tools/intel_vbt_defs: sync intel_vbt_defs.h with
 kernel commit 1b85a9b04681
Date: Mon, 27 Apr 2026 18:16:04 +0530
Message-ID: <20260427124607.3115567-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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

