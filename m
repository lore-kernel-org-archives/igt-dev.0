Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BAAFF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 13:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C2110E744;
	Mon, 27 Apr 2026 13:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6gF7PlJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F1510E744
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294868; x=1808830868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m5FEolNEaCW64joDeRajTpdi6s912PUrImrP31mEvmw=;
 b=F6gF7PlJMs9V6C2GxQ0SLN6lplBgXeae9C44ZMdT/uGaz3d+SWwBQJpu
 ckokUfhw3c1FG95NHiMuLKApb3T3e7y0iN0NqZ4NPZSTYmOq5SIV/wlAD
 Njbi+SaRQ2HndnfdLKkD1GVEbF2o/m9rgo7pCI13aUcVvKHwQ3UISkrmK
 0/BFSnpJ3Qm1YS7fgNNbB5aRFZBCX1pnNHRps1IYe2CboszhDd3ypfCsi
 YLx3QcHlJ/fig88GPyzyFTMGZI2BR2253K90/BeHX5QGbaagKO3FgJTjB
 K124BnauuErjmAEc6uyI8b4MxbUe6bOsCqZISuT6YzmBRuxXHFSSX/96Z g==;
X-CSE-ConnectionGUID: 1SQvZVlFTMuO+Lf/G71vig==
X-CSE-MsgGUID: EQS0s8lsT/KsPVUyQAf3Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77339334"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77339334"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:01:08 -0700
X-CSE-ConnectionGUID: 5VpBZv7gR9uBuJLWMxIHHQ==
X-CSE-MsgGUID: HqSFoYqyS7CWHsTodRqITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237597806"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:01:05 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 8/8] tools/intel_vbt_decode: Dump dedicated_external and
 dyn_port_over_tc fields
Date: Mon, 27 Apr 2026 18:16:07 +0530
Message-ID: <20260427124607.3115567-9-ankit.k.nautiyal@intel.com>
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

VBT version 264 adds two new child device fields: dedicated_external
and dyn_port_over_tc. The dedicated_external field indicates TC ports
connected to PHYs outside the Type-C subsystem, while dyn_port_over_tc
indicates that a TC port supports dynamic DDI allocation in TCSS.

Dump these fields in the VBT decode tool.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tools/intel_vbt_decode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 78bc355b961d..cf7bcc5771a4 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1317,6 +1317,11 @@ static void dump_child_device(struct context *context,
 
 	if (context->bdb->version >= 263)
 		dump_edp_data_rate_override(child->edp_data_rate_override);
+
+	if (context->bdb->version >= 264) {
+		printf("\t\tDedicated External TC Port: %s\n", YESNO(child->dedicated_external));
+		printf("\t\tPort supports dynamic DDI allocation in TCSS: %s\n", YESNO(child->dyn_port_over_tc));
+	}
 }
 
 static void dump_child_devices(struct context *context, const uint8_t *devices,
-- 
2.45.2

