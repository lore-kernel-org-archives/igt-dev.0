Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492C8C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C357910E3EF;
	Fri, 31 May 2024 14:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqgNrVDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD2810E64A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165513; x=1748701513;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xbq69gGkGpsDllq2vhbTEjEqpbDCg8cOAYMiPb6YAwQ=;
 b=eqgNrVDoKg0Ec33SvG7amwuh5TM6OvxsGy8wDffsW/eT/8NsitGaOVoP
 TtUFChKw3L/TiCbS2+N26XF3t3zBCaOWdJPNgz1OUvAiGon78fWGcz0uI
 C8cRUARAkJrXMmNNaDvMC01WGTinznbhN0mAN/YwOnIiSEDEO2uUMsPgA
 9sSDrWmkja/GfGnVROBBc1msXbXo4XobTeSZ/hGtYGIG3FSaDoV7eoBoU
 qDzY7tLo1p5h9Etwq3jpwjPf875kQEsATDisX7XJGhAW8bV0RU/tYy4iK
 ohqTwLMzZLac3ZhFCct4c5zUgFrdySSVj4WJKX77LeiMe4y1Uwxg1Z4jb Q==;
X-CSE-ConnectionGUID: +8mYqDZhSzKe4DDBDOh4OA==
X-CSE-MsgGUID: LNdGDZalTISJYy/PBh77qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113758"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113758"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:47 -0700
X-CSE-ConnectionGUID: BopcKDJQTQCmQnE+a1xzcg==
X-CSE-MsgGUID: W5G2MsxiR2yfwqxXXhSNFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160932"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 18/20] tools/intel_vbt_decode: Make device handle names
 more compact
Date: Fri, 31 May 2024 17:23:52 +0300
Message-ID: <20240531142354.16528-19-ville.syrjala@linux.intel.com>
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

Drop the extra "(HDMI/eDP/...)" part from the device handle names.
We'll be using these names when decoding bitfields that have
multiple bits set, and the extra junk is making the output rather
hard on the eyes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 485e0bdb5a59..dcfa3a5db90f 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -801,12 +801,12 @@ static const struct {
 	const char *name;
 } child_device_handles[] = {
 	{ DEVICE_HANDLE_CRT, "CRT" },
-	{ DEVICE_HANDLE_EFP1, "EFP 1 (HDMI/DVI/DP)" },
-	{ DEVICE_HANDLE_EFP2, "EFP 2 (HDMI/DVI/DP)" },
-	{ DEVICE_HANDLE_EFP3, "EFP 3 (HDMI/DVI/DP)" },
-	{ DEVICE_HANDLE_EFP4, "EFP 4 (HDMI/DVI/DP)" },
-	{ DEVICE_HANDLE_LFP1, "LFP 1 (eDP)" },
-	{ DEVICE_HANDLE_LFP2, "LFP 2 (eDP)" },
+	{ DEVICE_HANDLE_EFP1, "EFP1" },
+	{ DEVICE_HANDLE_EFP2, "EFP2" },
+	{ DEVICE_HANDLE_EFP3, "EFP3" },
+	{ DEVICE_HANDLE_EFP4, "EFP4" },
+	{ DEVICE_HANDLE_LFP1, "LFP1" },
+	{ DEVICE_HANDLE_LFP2, "LFP2" },
 };
 static const int num_child_device_handles =
 	sizeof(child_device_handles) / sizeof(child_device_handles[0]);
-- 
2.44.1

