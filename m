Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEC0C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D29A10E1B9;
	Tue, 18 Jun 2024 05:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzNTkqRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F36410E56F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688239; x=1750224239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6gzKZFLLzgaDxqLwKBQXLhdpiLWDCR7jSYbXN4DCyA=;
 b=bzNTkqRPxeRCyrzCvFsIl5JThqtY0fZyJ3WkqzmnsweGcogYjF1JNV6I
 UJCoQoB+1pR0yrJGPoDRZtD2eP/fh5nH5K/n/S09x8hKOyAk1R0ZMvR6Q
 nX45LPNS4tf1q9Oisop1p/WJeuyaUfzCpgdT8uGGibvKL/XwEgmN5YtaS
 MQ6VUYkyGW3S81NjgG64h6LdilSkr8E4ltzG9kBiLA3nEyGz9ntUZcO+M
 +hHXvgehsR/4EuwgX9Ywgq5lJ6Yi5RBmMWBdc+I1Pfucc4AKEZO7NTbTv
 v8NsSn9o71cqACOhlkRkaceGk8jl+GcrnEk6Lfh8MYbeL8ndhZ9ynt16O g==;
X-CSE-ConnectionGUID: IeHcvLDBSxuJBosPU6pRWA==
X-CSE-MsgGUID: 20tEEJCsRnKncf7zoTb+zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26660077"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="26660077"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:23:59 -0700
X-CSE-ConnectionGUID: ZOA8Vo/3TUeGR6Ucy7iCkQ==
X-CSE-MsgGUID: NZj/40aATua2pccYUeovkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41525207"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:23:57 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 05/12] lib/intel_bufops: Add Yf tiling
Date: Tue, 18 Jun 2024 07:23:28 +0200
Message-Id: <20240618052335.152588-6-zbigniew.kempczynski@intel.com>
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

Start supporting Yf tiling in xe as detection reveals it is Yf, not
Tile4.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 56e37d2da7..36b9aa2a8c 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1697,8 +1697,6 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		bops->y_to_linear = copy_y_to_linear;
 		bops->linear_to_tile4 = copy_linear_to_tile4;
 		bops->tile4_to_linear = copy_tile4_to_linear;
-		bops->linear_to_yf = NULL;
-		bops->yf_to_linear = NULL;
 		bops->linear_to_ys = NULL;
 		bops->ys_to_linear = NULL;
 
@@ -1954,6 +1952,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
 		igt_debug("-> use SW on tiling 4\n");
 		break;
 
+	case I915_TILING_Yf:
+		igt_debug("-> use SW on tiling Yf\n");
+		break;
+
 	default:
 		igt_warn("Invalid tiling: %d\n", tiling);
 		was_changed = false;
-- 
2.34.1

