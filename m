Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635CCD6E2CA
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 19:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1335310E48C;
	Thu, 18 Dec 2025 19:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReOY0hfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B863510EB37
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766086694; x=1797622694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2SuZPG13dAVCmP6jUysO41kxu/uxNwCkC/DDiJZOQsM=;
 b=ReOY0hflHhmlhNxfENirLSoi/+tIrT+/M/wtF0U3RjFwb/L4F/arkR8x
 zBFiyI2xMnbbAe8E2YvB7PlyRF2aXnWy4ONfD37IRoQ1Oz79lCg8Bh8QB
 /yycNGZ0dSWduJQN3wa73/JO86p2y9ja53oP3X3QFuiircarugQC1hkaz
 zGdXGD9Lb6fFa8xuFbf6b0wtXVT7j9eonZmdYdXgIc50Swq515G6AwRGh
 56di6vO/ImN87BKAKyYe7pKm20S3qbkBVmEdWj0DJ/yn2lIahxBYr68X8
 DJ85llwZVDD4LCS9KuZkEUkFH+qTx9J0x0Mquj7t27rq1X3ea8VWNCk0Z w==;
X-CSE-ConnectionGUID: C3NFkqcdRbGGz3Zjxnqw2A==
X-CSE-MsgGUID: 67y/DEmkTB+Grvu6ARc3kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67244725"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67244725"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:38:13 -0800
X-CSE-ConnectionGUID: kgPLb/dLRrKO/yMSRCqpmg==
X-CSE-MsgGUID: 6LSXBkk3Q7uNyQ6D1p4Qhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198680647"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 11:38:11 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v6 7/8] tests/kms_colorop_helper: Cast pixel values to double
Date: Fri, 19 Dec 2025 01:15:01 +0530
Message-Id: <20251218194502.1306975-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218194502.1306975-1-swati2.sharma@intel.com>
References: <20251218194502.1306975-1-swati2.sharma@intel.com>
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
scaling by UINT_MAX.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorop_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index da95ec72d..ffc81f01c 100644
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

