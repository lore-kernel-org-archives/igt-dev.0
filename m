Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F137C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8878210F3A2;
	Mon, 27 May 2024 07:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAwHutVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB0310F921
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795288; x=1748331288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+eb2NPsTvhI/ITOgVWprwsVJXqUyAiBt1Wf4PxMPh0s=;
 b=PAwHutVlD7vDwwK5caDNYTcPmKt5OY5GN2L0rOSihACqCf+OQTHLsgT4
 hwqwjCWAmdWO7tIvDiD0Bn8sPl8iY6OU+LcXV3soAnGM3+n5Q675P9it5
 SxHWYZDRUiEWvCfbjwDHxdGlXM226kc6vmkWDAKrivDuQrHlfujfCCzfm
 QPXRNjECvgD02p+JAylvKVMpJEeeRA0O+596em4/ZUsByfPHh2J4uscTX
 id391POWtYdgin6vjUWeKCbM03BTajOV2GhIWaItY8xiP+FI9IdgsB3qu
 qJU3G+TvhMTubB3Ae2UQCsXMMmWtHVy7y2RBDlYBkb+jkED7anq+FzSTs A==;
X-CSE-ConnectionGUID: HfNz1qQqRT2B2jSe9aYK+w==
X-CSE-MsgGUID: U2/hX25OR4y65gviPSYk/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24225337"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24225337"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:48 -0700
X-CSE-ConnectionGUID: zOBiSjdLT1qjBbNFUI7Kpg==
X-CSE-MsgGUID: ERVnjIZRSaasWcjb7H3NKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34584552"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:46 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 11/12] lib/intel_bufops: Don't disable x and y on
 platforms without swizzling
Date: Mon, 27 May 2024 09:33:44 +0200
Message-Id: <20240527073345.54729-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
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

Upcoming tiling detection tool wants to produce X and Y surfaces
in software so we can't disable X and Y in supported tilings,
otherwise there's no possibility to generate reference tiled surface.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index d0f6ab481f..1dfc12bf45 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1720,7 +1720,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		bool supported = probe_hw_tiling(bops, I915_TILING_X,
 						 &swizzling_supported);
 
-		if (!swizzling_supported) {
+		if (!swizzling_supported && bops->intel_gen < 12) {
 			igt_debug("Swizzling for X is not supported\n");
 			bops->supported_tiles &= ~TILE_X;
 		}
@@ -1738,7 +1738,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		bool supported = probe_hw_tiling(bops, I915_TILING_Y,
 						 &swizzling_supported);
 
-		if (!swizzling_supported) {
+		if (!swizzling_supported && bops->intel_gen < 12) {
 			igt_debug("Swizzling for Y is not supported\n");
 			bops->supported_tiles &= ~TILE_Y;
 		}
-- 
2.34.1

