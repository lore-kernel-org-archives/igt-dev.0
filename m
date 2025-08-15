Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64213CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 08:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ABC10E8DB;
	Fri, 15 Aug 2025 08:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFSR9O9F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5699210E8DB
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755245126; x=1786781126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a2i333O2FULMGJJ2MISwPuV8VLwCBTd/ijQ+/N1UMRQ=;
 b=BFSR9O9FkBmd44MZLxP7/SPcRWhEUv7dvuIWn49ABDM9EkU35FVtXqXZ
 3/01fjWVFJHn7EIJZ4dL25wn9P2uL49FfgW6gezZbPcFuCb03CpWRjQln
 9Gj7VT2md8OwyA7jMNardPJBqwe5wV39tDUZD3lgdK8AH4k+k1iHCsFU3
 S0+hOyJUEzrFD5CNbdzllbTUWAzq6GvCwX87ygsIXHrgya0o6CBrABruB
 QRfkbZChlo1Gdx1V44y8movbVnm64H8uMElGTbIwNPvvZeNEN4qzdvdsy
 FoAXwnTdjZdkwX+hWGdTWSQ3Z+UYHbNFo86YTzwnjFH5P4gaTnU+hxvfF g==;
X-CSE-ConnectionGUID: gkfznELuQemYbmWkh0oEvA==
X-CSE-MsgGUID: bPiu/u6iT3W6RJdgtNaWow==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57494997"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57494997"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:05:26 -0700
X-CSE-ConnectionGUID: +9IrPnVwQFGM7bf0TQ8Hgg==
X-CSE-MsgGUID: yo8EV+xeTUqJONfMe4qZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166882123"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:05:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [RESEND i-g-t 5/5] tools/intel_vbt_decode: Add missing DSI VBT defs
Date: Fri, 15 Aug 2025 11:04:55 +0300
Message-ID: <4a1271e36ed9bfc70afec1e4e41f1c204aab8b5d.1755245038.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1755245038.git.jani.nikula@intel.com>
References: <cover.1755245038.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Synchronize intel_dsi_vbt_defs.h with kernel commit:

906cbdc1fffa ("drm/i915/vbt: add missing DSI VBT defs")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_dsi_vbt_defs.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
index 3f9b9ed6592c..edc7331dcca2 100644
--- a/tools/intel_dsi_vbt_defs.h
+++ b/tools/intel_dsi_vbt_defs.h
@@ -94,10 +94,15 @@ struct mipi_config {
 #define DL_DCS_PORT_A_AND_C		0x02
 		u16 dl_dcs_cabc_ports:2;
 		u16 dl_dcs_backlight_ports:2;
-		u16 rsvd3:4;
+		u16 port_sync:1;				/* 219-230 */
+		u16 rsvd3:3;
 	} __packed;
 
-	u16 rsvd4;
+	/* DSI Controller Parameters */
+	struct {
+		u16 dsi_usage:1;
+		u16 rsvd4:15;
+	} __packed;
 
 	u8 rsvd5;
 	u32 target_burst_mode_freq;
@@ -118,7 +123,9 @@ struct mipi_config {
 		u16 dphy_param_valid:1;
 		u16 eot_pkt_disabled:1;
 		u16 enable_clk_stop:1;
-		u16 rsvd7:13;
+		u16 blanking_packets_during_bllp:1;		/* 219+ */
+		u16 lp_clock_during_lpm:1;			/* 219+ */
+		u16 rsvd7:11;
 	} __packed;
 
 	u32 hs_tx_timeout;
-- 
2.47.2

