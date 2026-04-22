Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27481F94CB2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 04:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C985A10E261;
	Wed, 22 Apr 2026 04:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWOKyi42";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF3010E262
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 03:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776830322; x=1808366322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZIvwlA40Vq83AWWt5BfnxU9mQbP9HKHTpU30TiwHLx0=;
 b=TWOKyi42Rg9u3/l7dPaCneUw/E0N9UjBWgOyCreFVLgGz+Ko2j1XD1Ta
 rxEcZdlYsFGU/FB40wbDacxPNFEGNIWUtd3omyRooazPQpLzB/eusnj+U
 ZzFq4WVuMmcFsnCQaichLNzIXJ2OMoc7AUSlzGWcFab2TG7NQ5/hJJ0mD
 CSmVLcAiPsLwUGDNhbHKrlZtAex5ndB5aUPgewPgMZYYgawjvETtfnckb
 HdBsXuvM6WpHxRWYhrAVRaOBOFNEFbdO2AndXgZEDGMyOek+7WdaQGlFa
 259UmnD24QmP5PZCJDU534n5+7euM1MzdzI9OPAmzPUiqp4e7qPih0rJE g==;
X-CSE-ConnectionGUID: YzoFOktsTCiemJOWLR5d6Q==
X-CSE-MsgGUID: ZGKOrOzZSO+8Ri2fmRpYjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95338497"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95338497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:42 -0700
X-CSE-ConnectionGUID: GIcxtGhCR7magJ7yKmydMg==
X-CSE-MsgGUID: hyY2T8LkSNCXlaK9PnfyRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232151363"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:40 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 7/8] tools/intel_vbt_decode: dump eDP joiner enable field
Date: Wed, 22 Apr 2026 09:13:34 +0530
Message-ID: <20260422034335.2326098-8-ankit.k.nautiyal@intel.com>
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

Add decoding support for the eDP joiner enable field introduced
in VBT version 261+.

v2: Use pipe_joiner_enable to match with kernel variable name. (Karthik)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 6c0273aeecfc..dbc92e12a39a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2515,6 +2515,10 @@ static void dump_edp(struct context *context,
 		if (context->bdb->version >= 251)
 			printf("\t\teDP DSC disable: %s\n",
 			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
+
+		if (context->bdb->version >= 261)
+			printf("\t\teDP Joiner Enable: %s\n",
+			       YESNO(panel_bool(edp->pipe_joiner_enable, i)));
 	}
 }
 
-- 
2.45.2

