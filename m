Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBEAD185DD
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 12:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9F510E293;
	Thu,  8 Jan 2026 12:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XadlEPMM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DA410E293
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767874138; x=1799410138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l7sNtb3eW3Bc3uPB0thzlJoJXkcZ2FANcUONjSlHMCg=;
 b=XadlEPMMUzFLlrC1QZ97sWlPon3p3pWUxGmLc8blFd0AIqMwWfRgQC1l
 yT8j+6pmXIJstAef4EjN5jRwdrw8x5h9EaE7IN4CMidH1vL52w/6GPmGr
 r9wgltPUg8PleI+mxPEHHSKd/dZoKZuP+zmAW33tOb5ZX+IjzOS1X2jsh
 3u8l7bo2zr/VDv5y+14c4xvPunsM7BIyFD2X54G0WKjKrfaojn50BjIVT
 Q74Fz9TKFRSPDDh2ol/q9LF0+cXGqtiKtUpbMWq4fj+TKxdC5GH0TMmtB
 FvNZIx871dBsBlUiTvnJylBOSOFGQrn7BS7HHMNcNGu9d5tzqf3uT9PSX w==;
X-CSE-ConnectionGUID: NXtUnFkQScWQwLsndHdFDg==
X-CSE-MsgGUID: 8sgq5QHhQeCEK06sLHh8mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86666406"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="86666406"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:08:58 -0800
X-CSE-ConnectionGUID: FLO8UdjhQ7KZ0Mpf2gtu+w==
X-CSE-MsgGUID: ttEPJnRKRPW81ZNotuMUiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="207324443"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:08:57 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t] tools/intel_vbt_decode: Add decoding for eDP pipe
 joiner enable flag
Date: Thu,  8 Jan 2026 17:22:55 +0530
Message-ID: <20260108115255.1405329-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Extend intel_vbt_decode to parse and display the VBT field that
controls eDP Pipe Joiner enablement. This field was introduced in VBT
version 261 and allows OEMs to specify whether the joiner feature should
be enabled for eDP panels.

Bspec:20142
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++++
 tools/intel_vbt_defs.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d4aada743e42..a96b936d4b8e 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2483,6 +2483,10 @@ static void dump_edp(struct context *context,
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
index 6612d3a4ec49..550a9bfba868 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1090,6 +1090,7 @@ struct bdb_edp {
 	u16 edp_dsc_disable;					/* 251+ */
 	u16 t6_delay_support;					/* 260+ */
 	u16 link_idle_time[16];					/* 260+ */
+	u16 joiner_enable;					/* 261+ */
 } __packed;
 
 /*
-- 
2.45.2

