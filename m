Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E2BC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AF8112766;
	Fri, 22 Mar 2024 20:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dr6+M30E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B8B112766
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140109; x=1742676109;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ySZgWimQNHTttOinV2JKsCpL/vKPYxmHTeOdnaL+Z5U=;
 b=Dr6+M30EWvD8cmKfBLMTWDh5+zYT66ADYlDCLCDHlsqlIL4x7UBhMQ/i
 RGve9JTyqU6eluPTdc8HEEzfKCpkKk8JNxgZd1W3QTkzJl8gEZXuvnUGE
 fVEWH+ZNJvjzjlEg1xLbvRnh3HN8GQVrMQDYeYQTHRFiLByA1HDDyoCo/
 VlU5VbKqj/0lto2JHQRtla24g5McGAHhT1HopoHBzIwg8FxEf2T6L3DUj
 qHBIwL4wfsZDlm3iU9OePw8EA+runuss6WiRUe/FnGge0Ip/+INskyfZ7
 QwNouE6i1XiUXHN7RCdDOaixQ7q03kEUBXoSV2zGzMAywUO3QRcj2C7qZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329364"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783616"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783616"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:46 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/13] tools/intel_vbt_decode: Decode the obsolote DPST
 supported field
Date: Fri, 22 Mar 2024 22:41:19 +0200
Message-ID: <20240322204125.17212-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
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

Looks like there used to be a field for DPST in the LFP power block
feature bits. Later that got first into the driver features block,
and then back into a different part of the LFP power block.

Not sure when this got deprecated.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index fa7bbc345eec..7cfa357ac526 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1800,6 +1800,8 @@ static void dump_lfp_power(struct context *context,
 	       YESNO(lfp_block->features.lace_enabled_status));
 	printf("\tPower conservation preference level: %d\n",
 	       lfp_block->features.power_conservation_pref);
+	printf("\tDPST support: %s\n",
+	       YESNO(lfp_block->features.dpst_support));
 
 	for (i = 0; i < 5; i++) {
 		printf("\tALS backlight adjust: %d\n",
-- 
2.43.2

