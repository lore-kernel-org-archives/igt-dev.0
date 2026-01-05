Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAACACD0405
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 20:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9947010E43D;
	Mon,  5 Jan 2026 20:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFl6HTLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB83910E43D
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767646667; x=1799182667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hee9bbwI01Oi3froJhdn0WlHCzkUwKrBNwSH1PSE9mU=;
 b=mFl6HTLxe5jw06GrJVCDGJnmtQHL+WyN5b0G7XXAGcbijJ8JMHP+Tibr
 8OA0upUxLIKNdA3oYTKH3x0ZlEKzMJFJP3Gmk4eArM7OfoLxXU5mXn5Rh
 wtWOZPjx92iEQEZzDcA5vFCenyxfiEzyoLYTUtkQzF85IYz2NKwCVF5Gd
 1svVH8dx7SKz2Ezt537YEuwLBOsT22vfbaT035+SsrZ8Zb248VgGbH9+D
 G+9/Q94qap4QbKSA6iSiuXHodKpQRsYxgjSVEgzmgw2qqAlN22p21XtzL
 T/vLYN4oTzHeuptsmqIu5fiUO2LAI0W1KyCCiayX0fBGtsKqtK83V64YY Q==;
X-CSE-ConnectionGUID: cF4hhLroSfaniK5oT8cW5w==
X-CSE-MsgGUID: SolQ1CUKTVSSsG8sHnKWyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68029720"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68029720"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:57:47 -0800
X-CSE-ConnectionGUID: dyGvPW8kTDemKpaC6joYYw==
X-CSE-MsgGUID: kDOWQWGqRtSh4l61c9SpUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202381580"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 12:57:45 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t,
 v9 3/5] tests/kms_colorop_helper: Cast pixel values to double
Date: Tue,  6 Jan 2026 02:36:01 +0530
Message-Id: <20260105210603.62170-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260105210603.62170-1-swati2.sharma@intel.com>
References: <20260105210603.62170-1-swati2.sharma@intel.com>
MIME-Version: 1.0
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

Explicitly cast transformed pixel channel values to double before
scaling by UINT_MAX to avoid overflows for values approaching 1.0.

v2: -improve commit message (Chaitanya)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_colorop_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 76728b47b..152e90f26 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -300,9 +300,9 @@ static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
 
 		colorop->transform(&pixel);
 
-		colorop->lut1d->lut[i].red = pixel.r * UINT_MAX;
-		colorop->lut1d->lut[i].green = pixel.g * UINT_MAX;
-		colorop->lut1d->lut[i].blue = pixel.b * UINT_MAX;
+		colorop->lut1d->lut[i].red = (double)pixel.r * UINT_MAX;
+		colorop->lut1d->lut[i].green = (double)pixel.g * UINT_MAX;
+		colorop->lut1d->lut[i].blue = (double)pixel.b * UINT_MAX;
 	}
 }
 
-- 
2.25.1

