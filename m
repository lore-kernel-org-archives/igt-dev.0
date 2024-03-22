Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB7CC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3F011276A;
	Fri, 22 Mar 2024 20:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzLk5jto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9031E11276A
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140115; x=1742676115;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mlCW3MHp7A29Gnz6IZHJNkVIu6Yu17nm2bVZvAxgCOU=;
 b=ZzLk5jtogVZZ81GPmwY539vF8vULhXsRUxIH6aCrxM+yDCnULIZIqv9b
 BUYHOm08m9Q63MYSoWEyGxHWxrhp/eM1hLGr7WqBfh74QBBiPBzdzYDw7
 X+IXAPE2wBEytT7fa0k0IOiW/T1t1E4XoZmN3nqCkM9E/R4C0Btz9S6w9
 KU9Oi+dOG8dbofXsd7V7V361XeGMuJfZnk4QtDaFPD0Quu3Xgebxil/fs
 kOnPp4OfYHGqHKfBrjy5ZbWofdgJOwzrsK3Ym28X5iT/P1NW5XeswYsLt
 +o7gKmR1Xu19x2QaSxObBFeVBe3t3M7qC74f64AUyYE0I1GoZXhcU70Rw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329369"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783618"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783618"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:51 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/13] tools/intel_vbt_decode: Add version checks for
 backlight decoding
Date: Fri, 22 Mar 2024 22:41:21 +0200
Message-ID: <20240322204125.17212-10-ville.syrjala@linux.intel.com>
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

Decode stuff from the backlight block based on the version
number.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index fa9c45920853..642cb84a56b6 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -650,27 +650,38 @@ static void dump_backlight_info(struct context *context,
 			printf("\t\tI2C command: 0x%02x\n", blc->i2c_command);
 		}
 
+		if (context->bdb->version < 162)
+			continue;
+
 		printf("\t\tLevel: %u\n", backlight->level[i]);
 
+		if (context->bdb->version < 191)
+			continue;
+
 		control = &backlight->backlight_control[i];
 
 		printf("\t\tControl type: %u\n", control->type);
 		printf("\t\tController: %u\n", control->controller);
 
-		if (context->bdb->version >= 234) {
-			printf("\t\tBrightness level: %u\n",
-			       backlight->brightness_level[i].level);
-			printf("\t\tBrightness min level: %u\n",
-			       backlight->brightness_min_level[i].level);
-		}
-
-		if (context->bdb->version >= 236)
-			printf("\t\tBrigthness precision bits: %u\n",
-			       backlight->brightness_precision_bits[i]);
-
-		if (context->bdb->version >= 239)
-			printf("\t\tHDR DPCD refresh timeout: %.2f ms\n",
-			       backlight->hdr_dpcd_refresh_timeout[i] / 100.0);
+		if (context->bdb->version < 234)
+			continue;
+
+		printf("\t\tBrightness level: %u\n",
+		       backlight->brightness_level[i].level);
+		printf("\t\tBrightness min level: %u\n",
+		       backlight->brightness_min_level[i].level);
+
+		if (context->bdb->version < 236)
+			continue;
+
+		printf("\t\tBrigthness precision bits: %u\n",
+		       backlight->brightness_precision_bits[i]);
+
+		if (context->bdb->version < 239)
+			continue;
+
+		printf("\t\tHDR DPCD refresh timeout: %.2f ms\n",
+		       backlight->hdr_dpcd_refresh_timeout[i] / 100.0);
 	}
 }
 
-- 
2.43.2

