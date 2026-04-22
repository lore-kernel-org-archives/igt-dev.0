Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A416F94CC2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 03:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007A210E261;
	Wed, 22 Apr 2026 03:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMie45Dg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C158210E261
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 03:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776830315; x=1808366315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WnokykgMC502wJ/YbzHgp9YwlbDn48/IfKyNqv4O6lo=;
 b=VMie45Dg8xV+F4coTdyfTUlgblLowTHhTOAKEdS841PyMmAG1+avGTGe
 Z6gvQMH50AzQSGdN3BSz+sZtrwSBeUs9p6noE1vLKQfywRtAsL4PcFQWl
 xdol53gBX44PX3JoB/6UMjp6YGlzJj1xvWAU7rxKTTduDyVcONGWRf8Gd
 LiQk2k9tQ7NV4aWBtgy+5m804z3Gklj34Dsr2GnZlAq3lg03vFXFrn4MV
 RCnvGp/Hl0CuyiJLwxCnM+ZVrfl9wQ8+ov3yLuc7W5UGqKpmscdC4l75n
 jHZmmm1pR/YQ7VXVoD3pHiq/DfdDHGUDDMEHmFeK40utkHX+SNc2JaII/ Q==;
X-CSE-ConnectionGUID: gzC0TqA/RbGKHO+6RX3TyQ==
X-CSE-MsgGUID: oQIMOdAiRVmNZvLpaJFFWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95338487"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95338487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:34 -0700
X-CSE-ConnectionGUID: EGFDMowwQ4GZf0k7Cyk6Gw==
X-CSE-MsgGUID: MuJI7hItQ2SmgCGze5CbDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232151348"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 4/8] tools/intel_vbt_defs: sync intel_vbt_defs.h with
 kernel commit 203c7904f2d8
Date: Wed, 22 Apr 2026 09:13:31 +0530
Message-ID: <20260422034335.2326098-5-ankit.k.nautiyal@intel.com>
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

203c7904f2d8 ("drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc")

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_defs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 70e31520c560..57fda5824c9c 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -554,7 +554,8 @@ struct child_device_config {
 	u8 dvo_function;
 	u8 dp_usb_type_c:1;					/* 195+ */
 	u8 tbt:1;						/* 209+ */
-	u8 flags2_reserved:2;					/* 195+ */
+	u8 dedicated_external:1;				/* 264+ */
+	u8 dyn_port_over_tc:1;					/* 264+ */
 	u8 dp_port_trace_length:4;				/* 209+ */
 	u8 dp_gpio_index;					/* 195+ */
 	u16 dp_gpio_pin_num;					/* 195+ */
-- 
2.45.2

