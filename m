Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C496EC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3862D10E458;
	Fri, 31 May 2024 14:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRfqN2KQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8077610E221
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165498; x=1748701498;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7OQ6P8IhnkLEXRy564/Brq8Iqrlgf0CrJIkJZ0Tdq3g=;
 b=cRfqN2KQ/HjK/7BROgWetK+wO3MEbFZQ5CyubKNHaHEA1lCwYetFo2OK
 BYWusjk2ygII9vFiZPC0pwCqNQ+dSScW+O2liCX6K6Wc5ZyM8siD78a3i
 di9OWIhAx3Ln2xqZ1gjdfOr5Ev4OHPPoz+c20XQpH8a0jP59QZ0GIMxun
 XSp2+QrHr6Gc2U2odJXFAnWKxcCuo65YIoif2UtogEwbs57Ps/j3bfyre
 0+wxt06gyjN5PNlAXB70yFIeZs2ooqkaVhGoFQPr5a5yFpXktdgKh3cBx
 b3l0Y5v56JKlIIP4YxZ7/gLwvbpKPUdGXVuZ1XigfEBNPHvTfuq9O3qTJ A==;
X-CSE-ConnectionGUID: YraMQR6LRNazT+RTRhF/oQ==
X-CSE-MsgGUID: Jgdosx8aSqOKOfFx1AUXtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113658"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113658"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:02 -0700
X-CSE-ConnectionGUID: yzYxWHdHSMquoVwfE3xNaw==
X-CSE-MsgGUID: kX5LcypKSUWztMr41hsaSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160801"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:23:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/20] tools/intel_vbt_decode:
 s/dump_sdvo_panel_dtd()/dump_sdvo_lvds_dtd()/
Date: Fri, 31 May 2024 17:23:36 +0300
Message-ID: <20240531142354.16528-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
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

Rename s/dump_sdvo_panel_dtd() to dump_sdvo_lvds_dtd() so that
it matches the struct naming scheme.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 9d05de3f9975..aeaee5713472 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1953,8 +1953,8 @@ print_detail_timing_data(const struct bdb_edid_dtd *dvo_timing)
 	printf("\tclock: %d\n", dvo_timing->clock * 10);
 }
 
-static void dump_sdvo_panel_dtds(struct context *context,
-				 const struct bdb_block *block)
+static void dump_sdvo_lvds_dtd(struct context *context,
+			       const struct bdb_block *block)
 {
 	const struct bdb_edid_dtd *dvo_timing = block_data(block);
 	int n, count;
@@ -2724,8 +2724,8 @@ struct dumper dumpers[] = {
 	},
 	{
 		.id = BDB_SDVO_LVDS_DTD,
-		.name = "SDVO panel dtds",
-		.dump = dump_sdvo_panel_dtds,
+		.name = "SDVO LVDS DTD",
+		.dump = dump_sdvo_lvds_dtd,
 	},
 	{
 		.id = BDB_DRIVER_FEATURES,
-- 
2.44.1

