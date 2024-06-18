Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6036DC2BA18
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D5010E102;
	Tue, 18 Jun 2024 05:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esR0GtFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A4510E102
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688266; x=1750224266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8hpgooPsS9gbsV1GX4y3tNxsnanv6PsN9WGT/ocqJno=;
 b=esR0GtFH+EJnp6wH/LXxGcEEObicKDD2nKs9W+mXiZRmHo6xVMgti/wz
 /TQDHAgTvtPlS04mGzYzQw093BSd0Z5BmbgJ6BmdGioG+20X1h7meaVX9
 8idY3an2bmwI8Pc9sC7zRxKwVaagj2YSmoxrF4rBUt1OnYAa6L4eBpNTd
 tkBJhXui/mHNW+3nsN2y20ffPpYP8xlsfXdjKzecvhAHlKROkVI0OPS3R
 4TtGB9ZSohkelnoGCts08kdAzaQE9pumTrM3Cs+KIJgOOHnVFYqRN+8lt
 G2yklIuh5XFJhm97QL6E0RAydhQruErjSPVhQm/jQ4vEDFr22TUNTcMaN g==;
X-CSE-ConnectionGUID: k2Wdi80zTAqZdFxbphBX6Q==
X-CSE-MsgGUID: 4ZocSY9oRheAXR2RavfPNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15666167"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15666167"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:24:21 -0700
X-CSE-ConnectionGUID: /55PP73VS0WOADzcXsa16A==
X-CSE-MsgGUID: RL/85toNTUuw/DkR1Rk4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41286643"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:24:20 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 11/12] lib/intel_bufops: Don't disable x and y on
 platforms without swizzling
Date: Tue, 18 Jun 2024 07:23:34 +0200
Message-Id: <20240618052335.152588-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
References: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

