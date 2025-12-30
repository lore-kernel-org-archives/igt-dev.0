Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260EAE94116
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 06:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B542F10E5BC;
	Tue, 30 Dec 2025 06:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALDdVpYk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383E410E82F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767076671; x=1798612671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hee9bbwI01Oi3froJhdn0WlHCzkUwKrBNwSH1PSE9mU=;
 b=ALDdVpYknPMddja1rcB7/OqH6043BSo93PO8fzsI7DwWGfDfuTXSjFsg
 82iFgi1EeTiPc+5/5nFiQMc1HinDVSWdaX4kqedmugDADd5qXlBJssp5O
 +M3mC10mcaZ6p+l/0gH0mBoSRzuzpFNDFUXfSo1/E9ejYMx9WsaBpLWse
 aZYxbLHUn6NBhYaJyVXHtpEBBuH7CPncXBgfpKHwmsUOpg0dGYdrEZ1bU
 Hd6oM9DK4WfVs7i0HQntIVXmSDREDBLBy8wgnixaX5e9B66J6cynXM6w6
 iEUuGuNBudDIH9Jiry5/UU1hjFqFUSaJoU/nH+Bylk7+ESER7M3jADG8t w==;
X-CSE-ConnectionGUID: iuagcXFsTfq0SrGKs/zdmg==
X-CSE-MsgGUID: ArcR5YaeSXSY3rgxam62Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67672911"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="67672911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 22:37:51 -0800
X-CSE-ConnectionGUID: NLJRWUZ1TZmdOJLo0W6TQw==
X-CSE-MsgGUID: +4LwCRgISCyVK5+GM2nXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="224644612"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:37:44 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v8 3/5] tests/kms_colorop_helper: Cast pixel values to double
Date: Tue, 30 Dec 2025 12:15:50 +0530
Message-Id: <20251230064552.22909-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230064552.22909-1-swati2.sharma@intel.com>
References: <20251230064552.22909-1-swati2.sharma@intel.com>
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

