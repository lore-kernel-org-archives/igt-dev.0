Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E5DCCF2EA
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 11:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0737410E3FD;
	Mon, 19 Jan 2026 11:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAVtNj4+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4E110E3FD
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 11:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768822515; x=1800358515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IweaSc/fSEiwj+/3if6QT5RrMJdILVSXpyrtajP3kA0=;
 b=KAVtNj4+YSVYyP6kYvCl5Wo0b79pMOuGsr4io7rpmKLdi3vjNBv7Dp6b
 2awBnCnL2tSlhg7H99bsRXGpILofV7Tfhw+xcwhp15Ln32BKeEK5fHS3D
 mEyxnSKe/JBLChmwwPmltXLm6DeI+slPEIWLcl7/xzau8/zyCEmuNNKuB
 YtzJfalmYF8jK3M3Aay0FKzm3WeGnPkRyN9d9P14FricOFQ1DvR2OODNy
 USOis9WPGe+BEZNvvMJOfdSMF9T5WpTuTd/vXLl/0BANFFp9gwlZtclPE
 BP5nRl6MYNismPGPTSpJASnZDp/BDywxt+Jwxu1nTgc6b0mEDZgTLskI/ g==;
X-CSE-ConnectionGUID: MyVkj13URp24hpfsmKn+kQ==
X-CSE-MsgGUID: b+2ixXaHSeaEHbidu8VMvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69942210"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69942210"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:35:15 -0800
X-CSE-ConnectionGUID: qkDsMMhTRKqUlVr4gfNyuA==
X-CSE-MsgGUID: mp0eIIGQSLGOwh7gmjiqEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205102215"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:35:15 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 2/2] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 commit 1b85a9b04681
Date: Mon, 19 Jan 2026 16:49:18 +0530
Message-ID: <20260119111918.2686910-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260119111918.2686910-1-ankit.k.nautiyal@intel.com>
References: <20260119111918.2686910-1-ankit.k.nautiyal@intel.com>
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

