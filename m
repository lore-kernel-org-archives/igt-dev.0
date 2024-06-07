Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470C1C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C3D10EC71;
	Fri,  7 Jun 2024 13:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tmsx42HY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D3710EC71
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768690; x=1749304690;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=l+PWed5kc7L61+G6Laqh0LW9U76NVaBdOIz8+Sx4nhQ=;
 b=Tmsx42HYEZx444y3UviJd82r2suoq+rqdDgpDLsPcwR1AxV+5sIaY/pP
 C6lGN7764dpTBRgIfH0cUjVU0agn3KqwtS/RZ7dq8H7OC+qF8L83ATGYN
 04I//7zdkcaSoXLRwnzYgLn0bIN7E9/qSfn+KJFxtryCnxRXY9YTgTw81
 W3xKb5LbFIqS/2TGzsbTqtneEskuih+ILm+uqMlRUk1r13HWGI+/y38Is
 iuT1YauPMyuDvLYM0Pum7ThjvBMx8jj9M7WzgkT8jI3axC1FUkgf3Dyn7
 iC0SIOrH3bEKtAs4GvGvmDY19FRNBoaCTRcr3JVCz6PaHP5lpWtnbcf1c Q==;
X-CSE-ConnectionGUID: 2XbuO9foRWmmt8/TEL0S3Q==
X-CSE-MsgGUID: jYz3aFN6RRac5j8+AG33Aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116773"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116773"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:10 -0700
X-CSE-ConnectionGUID: 6pKX3+JCTGS+x6tvBIL3iQ==
X-CSE-MsgGUID: gdHCNOWcSWCimAWUDFe/Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323734"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/27] tools/intel_vbt_decode: Dump MIPI config for the
 correct panel
Date: Fri,  7 Jun 2024 16:57:34 +0300
Message-ID: <20240607135758.31421-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently dump_mipi_config() just dumps the data for the same
panel index six times. Actually dump the data for each of the
six possible panels as intended.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 40c05fbadacb..cee1d5196a9a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2016,12 +2016,9 @@ static void dump_mipi_config(struct context *context,
 	const struct bdb_mipi_config *start = block_data(block);
 
 	for (int i = 0; i < ARRAY_SIZE(start->config); i++) {
-		const struct mipi_config *config =
-			&start->config[context->panel_type];
-		const struct mipi_pps_data *pps =
-			&start->pps[context->panel_type];
-		const struct edp_pwm_delays *pwm_delays =
-			&start->pwm_delays[context->panel_type];
+		const struct mipi_config *config = &start->config[i];
+		const struct mipi_pps_data *pps = &start->pps[i];
+		const struct edp_pwm_delays *pwm_delays = &start->pwm_delays[i];
 
 		if (!dump_panel(context, i))
 			continue;
-- 
2.44.2

