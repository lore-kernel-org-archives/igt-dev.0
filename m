Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CA2F94CB2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 03:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467A610E261;
	Wed, 22 Apr 2026 03:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWF0ilMT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342E510E262
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 03:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776830324; x=1808366324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l73oTDdXwYvihtqEiU6q+HZhOhvLDr+FuaSKLWj/e6g=;
 b=CWF0ilMTu9ZCOEyPnSIcADBqzCztc6tr+iJ+Wgnfxt41CCrVT32IUrHb
 Owjg+YxYTLePZx4NAiRihVFQBocoK9L4FwJbOtca6wC7m5kGyEAMWPt7G
 tplctM6fU1jrhDn77bwuBgr3SVgbiFNq/o/0h3EwOADfNrnbNx4Nm0R2V
 MtSzMJdQ1BtKN1lMnGAhGHKo5GjstNc4Hp38Z9gkQicKVWpqCUjtsn67G
 n3ZCbfzBZt/6P47ShkHW1c+mFP7HzfllHicO9aeJQJqtFJ3I4vJ/BidV+
 fNUBRTdcXmfE2abpcJbucJJdE0xSIJ2YzXewrldnXVF+BZqI3VrmQi271 w==;
X-CSE-ConnectionGUID: TdsbQxACQ3u2JMVcBka0gA==
X-CSE-MsgGUID: XAZyF2ddQlShPpyQbtQraA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95338499"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95338499"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:44 -0700
X-CSE-ConnectionGUID: J6/mJ5aRSaGhWZeSatq5NQ==
X-CSE-MsgGUID: ydG5h1sHT7GywJfMaY1TQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232151368"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:42 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 8/8] tools/intel_vbt_decode: Dump dedicated_external and
 dyn_port_over_tc fields
Date: Wed, 22 Apr 2026 09:13:35 +0530
Message-ID: <20260422034335.2326098-9-ankit.k.nautiyal@intel.com>
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

VBT version 264 adds two new child device fields: dedicated_external
and dyn_port_over_tc. The dedicated_external field indicates TC ports
connected to PHYs outside the Type-C subsystem, while dyn_port_over_tc
indicates that a TC port supports dynamic DDI allocation in TCSS.

Dump these fields in the VBT decode tool.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_decode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index dbc92e12a39a..1f4545c8e10c 100644
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

