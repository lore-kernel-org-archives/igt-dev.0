Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC83AC25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3538A10E221;
	Fri, 31 May 2024 14:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QlWjcc0Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE9710E4C4
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165501; x=1748701501;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qvGZAq7mCVr9Pc2sI7bJc1kRoEYhtqKGV7BhlpE9JsA=;
 b=QlWjcc0Z4tWRvGZo1ZTp5btvkzVxUf0crvddV/4TSc37ktKBO840ULeD
 EOGUiPuDwhigl65YY5lACF7y8BblaksDF2TcfoXzunUlKxpAHzHt0UsnP
 ymRYx+uGCeyb2uX+8JlKvjJYE6r26dhWpGsuxBH6XQoPEuadek9L4RofF
 d4XV1aiTP4qEIOeeaiYP9ScXFcXQZ8JDaV9zOM1N9jg3P4Nb4eOOxTUPY
 9T1K4p2J/Ec5gyVj2vb7oF2W2iEfyX5qL488UIGcSA+WVmqBesT4R+V2m
 0I2POHsVOS1XuruoIoQ9uG0tEocx2ElrlOPcWPtoB0QGpqvMSB2peafkX A==;
X-CSE-ConnectionGUID: DCuVRU8QT2a0ZqOCriOlvA==
X-CSE-MsgGUID: IWRaovd5S5CIpOpIIkrXMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113697"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113697"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:19 -0700
X-CSE-ConnectionGUID: HMI6tb19Stup7IPFrp3wXw==
X-CSE-MsgGUID: 5VjySnzoSdWeI/K57ZMVPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160839"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:16 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/20] tools/intel_vbt_decode: Decode the "not HDMI" bit
 right way up
Date: Fri, 31 May 2024 17:23:42 +0300
Message-ID: <20240531142354.16528-9-ville.syrjala@linux.intel.com>
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

The inverted decoding of the "not HDMI" bit is confusing me more
than it's helping as it typically gets flagged for all non-HDMI/DVI
encoders now. Just decode it the same way the VBT specifies
it.

The other option would be to only do the invert trick when TMDS
encoding is supported. But dunno how confusing that would be.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f01f90b301f7..6cf6d471b5e2 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -775,7 +775,7 @@ static const struct {
 	{ DEVICE_TYPE_POWER_MANAGEMENT, "Power management" },
 	{ DEVICE_TYPE_HOTPLUG_SIGNALING, "Hotplug signaling" },
 	{ DEVICE_TYPE_INTERNAL_CONNECTOR, "Internal connector" },
-	{ DEVICE_TYPE_NOT_HDMI_OUTPUT, "HDMI output" }, /* decoded as inverse */
+	{ DEVICE_TYPE_NOT_HDMI_OUTPUT, "Not HDMI output" },
 	{ DEVICE_TYPE_MIPI_OUTPUT, "MIPI output" },
 	{ DEVICE_TYPE_COMPOSITE_OUTPUT, "Composite output" },
 	{ DEVICE_TYPE_DUAL_CHANNEL, "Dual channel" },
@@ -793,8 +793,6 @@ static void dump_child_device_type_bits(uint16_t type)
 {
 	int i;
 
-	type ^= DEVICE_TYPE_NOT_HDMI_OUTPUT;
-
 	for (i = 0; i < ARRAY_SIZE(child_device_type_bits); i++) {
 		if (child_device_type_bits[i].mask & type)
 			printf("\t\t\t%s\n", child_device_type_bits[i].name);
-- 
2.44.1

