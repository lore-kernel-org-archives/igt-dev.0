Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D68CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C6A10E317;
	Mon, 15 Jun 2026 09:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXj7ng/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E63710E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515911; x=1813051911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YfAEliKF2A6GfZG0uGcDkIt7o6cD2nYFUusz/D6fHow=;
 b=CXj7ng/WIBmMwRkz+meFabD2p55jQSeTnHT+cvfxpZhfLln3RrD2Xg+w
 TNHWbtsgeQRKjLddoX9Zdc6/c+bUN7s+58LOpJVekFNyQI1w/wAdE6GT3
 +ufgPVG4/PqUZEUacJeLFVkaNtgS1Q+y35B/hET8lVucFv1IDPtKsKFAW
 2AAF8rSTP0HdtTPAU3FmrTr1PxGeCt2OewXGsBbxxFhoTkd76N5R884r2
 mwf5VfG3rpp8UZeQgv4TyoJprwRVyljAUke3LJKr6al4xmLXgNVNIlZBb
 kVcv5rHUGUc9LwalI8tdK7hGJcHzHamQ9fM/LxgQk5hj/X2Q9xXn6CllA g==;
X-CSE-ConnectionGUID: AwAFhhMORo+cOo84QlkSYQ==
X-CSE-MsgGUID: irkg267fQqmpEXhgYRTcaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82235894"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82235894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:31:51 -0700
X-CSE-ConnectionGUID: VlA5mos+Re63553LU1CHvg==
X-CSE-MsgGUID: v+arp6suRtiJqk3t016POg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247465288"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 02:31:50 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v3 06/10] tools/intel_vbt_decode: fall back to guessing
 PCI ID from VBT signature
Date: Mon, 15 Jun 2026 11:31:33 +0200
Message-ID: <20260615093137.681050-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615093137.681050-1-michal.grzelak@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

From: Jani Nikula <jani.nikula@intel.com>

From: Jani Nikula <jani.nikula@intel.com>

If the PCI ID wasn't passed on the command-line, DEVICE environment
variable, or VBIOS, fall back to guessing the device ID from the VBT
signature.

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 0956d34dc2..a2e57206d6 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -4331,6 +4331,8 @@ int main(int argc, char **argv)
 	}
 	if (!context.devid)
 		context.devid = get_device_id(VBIOS, size);
+	if (!context.devid)
+		context.devid = intel_guess_device_id(context.codename);
 	if (!context.devid)
 		fprintf(stderr, "Warning: could not find PCI device ID!\n");
 
-- 
2.45.2

