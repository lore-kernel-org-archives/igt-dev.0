Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ABDC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28273112767;
	Fri, 22 Mar 2024 20:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8t/XzUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0AA112767
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140107; x=1742676107;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=URUC4b2cXXR0wQ/uRv2LQDU0sBJO4h9lek9lnPXy/pg=;
 b=l8t/XzUA+5nfCa3ft1OmI3eCRmVCkVGz8cH0rCjye/5pPz4/QEs+HpsG
 yzUbdzLFzLVUa5+1LdC/2jnALv6Sbc7gaj5nvqpZYTAdwA20FjMfZWnU3
 2NHZpHsmsga/ENDDHhq7biprxM3CtpW8P3NTzXpRVKhgNeRQ3YdFYTfKa
 4qpME8g3Zt/qJlMw4jUz76poz2JJOmw1MFIzFcEwK1eTXhNPh5r5gE5jI
 v3ZZ3WWzP++1s7nGZLOtOVjNpMbt68bG5yE4auqAIX/IcNPuzfiz6MnH3
 uEUDUhFN8bqdwiv4XeQny5tQJJMdHxmuhyvCYWHdbg6t/5+H4tUXs+N/l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329362"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329362"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783615"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783615"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:43 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/13] tools/intel_vbt_decode: Decode the backlight i2c
 stuff
Date: Fri, 22 Mar 2024 22:41:18 +0200
Message-ID: <20240322204125.17212-7-ville.syrjala@linux.intel.com>
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

Decode the (obsolete) backlight i2c stuff for completeness.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 45 ++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 9c0774248e56..fa7bbc345eec 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -592,6 +592,27 @@ static void dump_general_features(struct context *context,
 	printf("\tDP SSC dongle supported: %s\n", YESNO(features->dp_ssc_dongle_supported));
 }
 
+static const char *inverter_type(u8 type)
+{
+	switch (type) {
+	case 0: return "none/external";
+	case 1: return "I2C";
+	case 2: return "PWM";
+	default: return "reserved>";
+	}
+}
+
+static const char *i2c_speed(u8 i2c_speed)
+{
+	switch (i2c_speed) {
+	case 0: return "100 kHz";
+	case 1: return "50 kHz";
+	case 2: return "400 kHz";
+	case 3: return "1 MHz";
+	default: return "<unknown>";
+	}
+}
+
 static void dump_backlight_info(struct context *context,
 				const struct bdb_block *block)
 {
@@ -615,11 +636,20 @@ static void dump_backlight_info(struct context *context,
 
 		blc = &backlight->data[i];
 
-		printf("\t\tInverter type: %u\n", blc->type);
-		printf("\t\tActive low: %u\n", blc->active_low_pwm);
+		printf("\t\tInverter type: %s (%u)\n",
+		       inverter_type(blc->type), blc->type);
+		printf("\t\tActive low: %s\n", YESNO(blc->active_low_pwm));
 		printf("\t\tPWM freq: %u\n", blc->pwm_freq_hz);
 		printf("\t\tMinimum brightness: %u\n", blc->min_brightness);
 
+		if (blc->type == 1) {
+			printf("\t\tI2C pin: 0x%02x\n", blc->i2c_pin);
+			printf("\t\tI2C speed: %s (0x%02x)\n",
+			       i2c_speed(blc->i2c_speed), blc->i2c_speed);
+			printf("\t\tI2C address: 0x%02x\n", blc->i2c_address);
+			printf("\t\tI2C command: 0x%02x\n", blc->i2c_command);
+		}
+
 		printf("\t\tLevel: %u\n", backlight->level[i]);
 
 		control = &backlight->backlight_control[i];
@@ -933,17 +963,6 @@ static const char *hdmi_frl_rate(u8 frl_rate)
 	}
 }
 
-static const char *i2c_speed(u8 i2c_speed)
-{
-	switch (i2c_speed) {
-	case 0: return "100 kHz";
-	case 1: return "50 kHz";
-	case 2: return "400 kHz";
-	case 3: return "1 MHz";
-	default: return "<unknown>";
-	}
-}
-
 static void dump_child_device(struct context *context,
 			      const struct child_device_config *child)
 {
-- 
2.43.2

