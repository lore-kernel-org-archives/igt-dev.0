Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D54CCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EB810E589;
	Wed, 18 Sep 2024 12:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYY83x80";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1954910E589
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661136; x=1758197136;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8jPWxjJIRz8N87FOEEcMZjSbqXFsuSV1vmYsBIkEJ00=;
 b=nYY83x80weF6bEGK6BSD829BL2Pg1Xx0kl/dBGHUg9/d8QcAmJGDPPt0
 ZHsvHuJQK6DO1OhYKpuFqtGsKhdCIsDAfAgn2ZNxPWjaLwibQOFuSTH7P
 g3UM4z1VjeMkXStJGTEQVm5MtNS1dgvZhQhd9z10PzL2cIRYjFTQSGLk4
 pILc8BuOnUMov2ediOJFWwGmqWRRQm/zXQuyawnKeHJVglBfebbZ/GXzo
 GrVtqFJdp5FL7uYKt0sAqdTBeEssulTN/iMkIdBp6Ep+cEU19sKMSLhKK
 00HO9Z/FkMWNOiYIGkYMZ0NYob+h494SSnxkc7v2GeVfPOGDKEXz1SW0n g==;
X-CSE-ConnectionGUID: eXrD8IeZReG26FJo2PPV6Q==
X-CSE-MsgGUID: pdYSiQ1cTt6ecuv12NYAzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687522"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687522"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:36 -0700
X-CSE-ConnectionGUID: Biec92HAQLGpOrpPgoEsrQ==
X-CSE-MsgGUID: XJzrIAFJRfCUYtsb7W9MQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634444"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:33 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 05/18] lib/rendercopy: Skip AUX surface setup in TGL+
Date: Wed, 18 Sep 2024 15:05:05 +0300
Message-ID: <20240918120518.30258-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

On TGL+ the AUX stuff is handled via the magic AUX pagetables.
Mesa code tells me that the hardware only uses that the
SURFACE_STATE AUX stuff for MCS, which is of no interest to us.
So just skip the AUX setup in SURFACE_STATE.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index b33e7fc9feba..719307e6f45b 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -261,8 +261,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 		else
 			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
 
-		if (buf->ccs[0].stride) {
-
+		if (intel_gen(ibb->devid) < 12 && buf->ccs[0].stride) {
 			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
 
 			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
-- 
2.44.2

