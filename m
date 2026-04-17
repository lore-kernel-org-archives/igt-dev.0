Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A0DF99C6A
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 21:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAFC10EAA0;
	Fri, 17 Apr 2026 21:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAJPQSaF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE3C10EAA1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776461378; x=1807997378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYSRXriY4xOIBCPGXAI3m8cFaJT8ACXs8Amz0oPaPLI=;
 b=EAJPQSaF6jA8vBMQwognKCmpia8jWfCXQku6fOW2dy64IFPFPAXMV9wQ
 lAXlkCE3uz+mP/JU6POpEyxqhJ7mX/tiIyDCQbZKmRhJRjqXeB8/EPlrX
 TkqSHzGcxQTDLed0VDjla6PHoFh1kFVBWGzsbNcQnWaJ3/KCBDZszTTMy
 lhwgJEy1a02mqV5BWY7WQTgTPkOUqRCcPWshs2SjauuE/qMv+TlB5OMHm
 lUPcPQqouj2cGRMYQzFZWJT1HnEfpWKJ2OU9+HNbVBuQcBg/qjctI8YPh
 jZrZEuvudOsoRjSUqPd5AB9UAelSvq088ZPVcAo2l+IEmB7uGrPiBqLKq Q==;
X-CSE-ConnectionGUID: 2wVXlByERbuQUrQEIhq+AA==
X-CSE-MsgGUID: MXdQ6Jk7RRWeaETvXuZ2zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76644123"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="76644123"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:29:38 -0700
X-CSE-ConnectionGUID: Ws8UA2j/TZ+hvvbI30qIig==
X-CSE-MsgGUID: SHg2/4csTXeGLH0Bvn+4Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="235140019"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 14:29:37 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v3 2/5] lib/igt_hdr: Fix EOTF bit flag checking
Date: Sat, 18 Apr 2026 03:08:15 +0530
Message-Id: <20260417213818.2050571-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260417213818.2050571-1-swati2.sharma@intel.com>
References: <20260417213818.2050571-1-swati2.sharma@intel.com>
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

From: Alex Hung <alex.hung@amd.com>

EOTF values are bit positions, not masks. Use (1 << value) to create
proper bit masks when checking HDR support in CTA-861 EDID blocks.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_hdr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index 5feb1d917..e8083556c 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -31,8 +31,8 @@ static bool cta_block(const char *edid_ext)
 
 	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
 	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
-	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
-	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
+	     ((edid_ext[2] & (1 << HDMI_EOTF_TRADITIONAL_GAMMA_HDR)) ||
+	      (edid_ext[2] & (1 << HDMI_EOTF_SMPTE_ST2084))))
 			return true;
 
 	return false;
-- 
2.25.1

