Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F29C369A8
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3046F10E2DB;
	Tue,  8 Apr 2025 18:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fULOc3Yf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919B10E29E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744135945; x=1775671945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RcLHb/fcwIwmhB08AJbvQ+ZEMKah59tjfqpLt9qrhgU=;
 b=fULOc3Yf7lq9lVCWrc9SdZXXWfBSaVJLfdh6EYhaBcXHZy7l3y6B8QCe
 1OmwHs17x/lSi8RY9JDMPCXVpPwPU+RDn+ZQx6EiKuzM4S8FvyyFI5YdR
 FIq8LQpraXdQhw+if3EJbIMiOzxd6v7+gWLK5o6RXOcsly21xH9kpYZfp
 4u4XV065QYi9vdsGUVnsQO1Uu4sQdTC3OxmFMMfkh0i/9E2ZCfKlV9Wry
 qUlmW1PUj2DOAg0F9oPQxQtxFwsItyTxduq55LM7piIPCftjx9wxq7fPt
 j/A0jfRcgSQ+NyssCNv/15PRghEX2gzAokJoWW2lBcMD5kLQv2ll0+/eO A==;
X-CSE-ConnectionGUID: +m7ELaLaR4mLQbBM2hI3vA==
X-CSE-MsgGUID: tI4w2zP3RDaLTDCtXDDlFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45479355"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45479355"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:25 -0700
X-CSE-ConnectionGUID: 5nakdpfTRyC7QdjX8KVq6A==
X-CSE-MsgGUID: HuDPot2sTvWqni0WsOZ97g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128683605"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/6] tests/intel/xe_oa: Fix oa_tick_delta
Date: Tue,  8 Apr 2025 11:12:06 -0700
Message-ID: <20250408181210.1052760-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
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

oa_tick_delta should take into account whether OA report header is 64 or 32
bit when passing width to elapsed_delta.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index a20120881a..2440101900 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -627,8 +627,11 @@ oa_tick_delta(const uint32_t *report1,
 	      const uint32_t *report0,
 	      enum intel_xe_oa_format_name format)
 {
+	struct oa_format fmt = get_oa_format(format);
+	uint32_t width = fmt.report_hdr_64bit ? 64 : 32;
+
 	return elapsed_delta(read_report_ticks(report1, format),
-			     read_report_ticks(report0, format), 32);
+			     read_report_ticks(report0, format), width);
 }
 
 static void
-- 
2.48.1

