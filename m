Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E30FCFA763
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB6D10E295;
	Fri,  4 Oct 2024 10:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UU/eggWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE64610E295
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038501; x=1759574501;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=srg8ZbFDZA7p7bK4HQ2TKxDL4/izcw5r+wOG2c85ViA=;
 b=UU/eggWYh4yUhu4JSazDX9ORhfE3bnibhnoWy8urmz61yeKbK3W4RJss
 TNlZHj07niBvUxsr2+v1MyDDmdY4OBkYSM1/UOJKlSRYnL5IYAntD+Pa8
 UWx3t6KhnFzsGlVqt9MaqJi0ykg6w0UZqkaLfz823jZyZNj6WL8ft0Pv9
 lu+xAwLcBRjhD97DfUIhKvsDZtaUWGNHdmgyYYGfcl2NQB/sYMBD1gu5T
 tyuvs9Xt3N0/sajiCqdKEqfy/nYJVW4nZK8tDj6oqE7Lq1Dko5BN272VU
 T0teOmtNSksQPPeemExTY1bP0cTwaNxeUws7arMnDDlyxw38M8ZWiQm/R w==;
X-CSE-ConnectionGUID: iWstNhq9S2OmmTtMo7/6+A==
X-CSE-MsgGUID: Z2GIrFciQj+f2KqWoQRl8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140477"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140477"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:35 -0700
X-CSE-ConnectionGUID: 8Jb3NzKURa68DXBOGy3Yfw==
X-CSE-MsgGUID: pw/A4RlIRia3YYeuIebh/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778293"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/14] lib/igt_draw: Support 8bpp int the mmap/pwrite
 paths
Date: Fri,  4 Oct 2024 13:41:11 +0300
Message-ID: <20241004104121.32750-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

Handle 8bpp pixels formats correcly in the mmap/pwrite
methods.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_draw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 54c46fe6360c..b39a33dcf2cb 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -365,7 +365,10 @@ static void tile4_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
 
 static void set_pixel(void *_ptr, int index, uint64_t color, int bpp)
 {
-	if (bpp == 16) {
+	if (bpp == 8) {
+		uint8_t *ptr = _ptr;
+		ptr[index] = color;
+	} else if (bpp == 16) {
 		uint16_t *ptr = _ptr;
 		ptr[index] = color;
 	} else if (bpp == 32) {
-- 
2.45.2

