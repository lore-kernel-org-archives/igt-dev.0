Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE72DC25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED6A10E472;
	Mon, 27 May 2024 07:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cO1hkUd4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B310710E472
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795265; x=1748331265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TjzR1qeCOPXNkkR1dFEWUKgYfazwxx4dHfQl0YBjS0s=;
 b=cO1hkUd4tKu8eR5nMTVcG1X6w1aotWUS79ICkNOh5ogOd/6ofaUw9kfQ
 3d3J5DeCLE5ck76yls8c41qOW8IXUS5jfLAB3kZ6lcta1RBJB6xedQ3lc
 rODSdvFasrnixXBkd4z96FIbOP+saU54lAfErWjkvwMynQIwjDKSTIgi1
 /IlWL1oPZlDuSXOdFAeKgKH0qd9xqBdNdcqh1a5aiEv+44mc9VSuirpIU
 QE2Gl2Xrx1Yeuj1FTwdEMa2nEDpX6ybYeuKXV4y1v9wPf880z34zJEApy
 ORI/b1eTmy9m/whr/5YDlcRkmLRiDugXNLq68mvX/+7nSx/Cgk0NSY/Ll A==;
X-CSE-ConnectionGUID: eprdbaKrT/GRrgIdTmRTDw==
X-CSE-MsgGUID: 2M1x+wOdTTimTaPdQX6oGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24225266"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24225266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:25 -0700
X-CSE-ConnectionGUID: frdnpXzvRhO4D9WzMMSYiQ==
X-CSE-MsgGUID: IeH8mmT0RTymW8153rqWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34584447"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 05/12] lib/intel_bufops: Add Yf tiling
Date: Mon, 27 May 2024 09:33:38 +0200
Message-Id: <20240527073345.54729-6-zbigniew.kempczynski@intel.com>
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

Start supporting Yf tiling in xe as detection reveals it is Yf, not
Tile4.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

