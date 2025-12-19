Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072AED767DC
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 11:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B217B10EBA1;
	Fri, 19 Dec 2025 11:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mz/ldRwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4B210EBA1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 11:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766143152; x=1797679152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2SuZPG13dAVCmP6jUysO41kxu/uxNwCkC/DDiJZOQsM=;
 b=Mz/ldRwJzBUyS1CKRfFesz+BHXdRCWuuhrqf1eyu9im1Si/C40NEBzUX
 K5G6fNI9tljHqxRNyY1fxwlJBEO5wajo1q+Ijif9dzESwzP4IKCKXR31Q
 cLu0heO8FwmVa+F5lWhYPf4V7XrCsaZ035VNl6iDF85vrYfnJzQo37Wuk
 5OU5Xl2dLmwj/glDNC/M0eqEWuCP769veA5Qc0DPln+Amt9J4c95wMxla
 8Axlatxyy94JTSkN0gL9bURhPVXOCGqQ6fg0kHzxa2JkopMW6gQjeYxX/
 qn2a7PEJbw4heP/UmlrZG47vqFMlmgC6w6RLLe09SJg7v+eay3rXYYHdQ w==;
X-CSE-ConnectionGUID: rpGr7xO1QLq8rX0NC7e1OA==
X-CSE-MsgGUID: NaFSgCftSIOxa7lnKqmZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78816173"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78816173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:19:12 -0800
X-CSE-ConnectionGUID: DseMjFUGQpqOfCRqLXLcrw==
X-CSE-MsgGUID: zZIXDqTTTvOU+guKz0Q0EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203235511"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:19:11 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v7 7/8] tests/kms_colorop_helper: Cast pixel values to double
Date: Fri, 19 Dec 2025 16:56:05 +0530
Message-Id: <20251219112606.1330425-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219112606.1330425-1-swati2.sharma@intel.com>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
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

