Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C918CE8D66
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D838A10EAE3;
	Fri, 14 Nov 2025 17:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yz6EZu/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BCE10EAE3
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140966; x=1794676966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IOH8DX/0Jdo8FB8O0IByPXNXTVkVN64iBmFetO+XRpk=;
 b=Yz6EZu/yTTXJ3WXD1REgCB4HhMwTtsi4hmoQ6R81MCdo8ShIahzjWqTA
 Ss1RjZLbeXFjSbpmS+zpf+wSwpi+Qynj+NQUpYf59TuquMTDqGACxCm3b
 8aJBUbdHjIwinan66Z5ky2UUNZg15WOXkYUAzmwiHMU0j1zEwe/NigVbO
 OEL1U1X0hJXEk03QZe9qK4yEsUWdHVnJdAFFRl+/bhtPP8VcWz7Pwir3c
 M1/7CZURA+ucEZ7bUDOF1vHg3LEvEMfSgzktfQL76RZM4nVCXXf4i+zv5
 Qm9xLGJtDvU56/cka73/MZdYIfD+WIgIXkjRQePDcLntrDHymD42rhf8w Q==;
X-CSE-ConnectionGUID: 8Nnm48nZQNysdYDhkxmOXw==
X-CSE-MsgGUID: jdzeuXXoQI6kzlw7Y0QJjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871452"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:46 -0800
X-CSE-ConnectionGUID: y4FXlCztT2SZyozoB8DS0Q==
X-CSE-MsgGUID: LndZ6HjnRcaFS0mq7WGPAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981520"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:44 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 12/23] tests/kms_color_helper: Skip custom 1D LUT fill on Intel
 devices
Date: Fri, 14 Nov 2025 22:58:57 +0530
Message-Id: <20251114172908.1027816-13-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Avoid calling fill_custom_1dlut() for Intel devices, as the LUT setup is
handled differently in the Intel color pipeline.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 85b85677e..35b4a53d8 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -581,7 +581,8 @@ void set_colorop(igt_display_t *display,
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
-		fill_custom_1dlut(display, colorop);
+		if (!is_intel_device(display->drm_fd))
+			fill_custom_1dlut(display, colorop);
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
 		break;
-- 
2.25.1

