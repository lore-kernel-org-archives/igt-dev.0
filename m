Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2753AFF885E
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 13:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D2010E746;
	Mon, 27 Apr 2026 13:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEpOqtiG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D555810E743
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294862; x=1808830862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=laq7mQ1Zh4n8wPjc7IPuFdFkZnCa//iHkpUBjb8XFA8=;
 b=gEpOqtiGumhB8C9Ombi8xWnbPrbvY0gRQTtxUqBQ8++WbeEPRANm7+uP
 tp2tCLQIzaC58Ol8MQiFxsz1tyeI4z/LD/upR6pl7AkUlqOK140U0R+O3
 X3+A2j4/LqJb5sQmo+OS9/bKE+EZ4byCzNVJ9khbgykyzt8zu7fzq2HQV
 mGYOhv5CfOeg+dOJ8KMAtxNNAZcsTuwdItbGpX7cNMzi75T/w4uX3Xin4
 5Uyq+yT782alGsqjV4L2R2MhBHlVj74vCu1Zk2NXf8ee+mF5LmW/D4NDH
 zzZH0E5NXlaFs/fyi37SEHRQVW0ru7JeBM04RIn93brWcba8LLg61/VYW w==;
X-CSE-ConnectionGUID: 336a/7nOQ1mr7Un70Al+GQ==
X-CSE-MsgGUID: PWSyVxNeT+iIyEBCmzLNdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77339267"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77339267"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:01:01 -0700
X-CSE-ConnectionGUID: GORyG1jTSayacfx2kNZZQA==
X-CSE-MsgGUID: mDiCMr6gSF+ecGAtMmLJeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237597742"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:55 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 4/8] tools/intel_vbt_defs: sync intel_vbt_defs.h with
 kernel commit 203c7904f2d8
Date: Mon, 27 Apr 2026 18:16:03 +0530
Message-ID: <20260427124607.3115567-5-ankit.k.nautiyal@intel.com>
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

203c7904f2d8 ("drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc")

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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

