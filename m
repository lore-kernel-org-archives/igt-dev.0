Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15371D6A228
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B637210E093;
	Thu, 14 Nov 2024 19:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wd60ychI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ABE10E2BD
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611025; x=1763147025;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=idpM2MYyVB7sdL5vzGYagnHAbF4UZAkrNkwcm1AokKQ=;
 b=Wd60ychIBxxkvRrpzmlY/iwlYKI+50swADSxRxCIDufPRe/HtEn4kh/D
 JwS9lCVvJHE8sy52PX7xxOvMZs4Pmmpn04gDFbCWQQ2ayNAng9Al75ugA
 rk6m3jxyDjLtsmDGN9lnmmmWBy5IleLvobum5N7JbAypYSBvWrAvgfoea
 D4idoeuiQ1o3WdraKmnKIrAzSRIjBERhe/5xPq0ffNSrjfTd3fZnqPsPZ
 hmK6NLNmUKOr0L6cl0e7/W5yEFplr0KkDtTx1gvrc/KxUVmCGn1Z/MIaq
 yoAAlzt8T2hmIXW0uXwcFGanjHYZbbDGCsXt+eLtHXRYGfnt9eO1ouaxq w==;
X-CSE-ConnectionGUID: Uj7WQQpiSVWMY0++fhwG3A==
X-CSE-MsgGUID: sqS1qT/GT0+6aq5s4fxwwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442559"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442559"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:44 -0800
X-CSE-ConnectionGUID: d8sJPkx/TJSMSrsuJTX7KA==
X-CSE-MsgGUID: R47gpYb4RJe8QNkBx05s7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242106"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 3/9] XE3: lib/intel_pat: extend for xe3
Date: Thu, 14 Nov 2024 11:03:33 -0800
Message-Id: <20241114190339.3885752-4-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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

From: Matthew Auld <matthew.auld@intel.com>

Xe3 should use the same pat_index modes as Xe2. Also matches the kernel
side.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 lib/intel_pat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 7f175b057..156b1ee5d 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -19,7 +19,8 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	if (intel_get_device_info(dev_id)->graphics_ver == 20) {
+	if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
+	    intel_get_device_info(dev_id)->graphics_ver == 20) {
 		pat->uc = 3;
 		pat->wt = 15; /* Compressed + WB-transient */
 		pat->wb = 2;
-- 
2.25.1

