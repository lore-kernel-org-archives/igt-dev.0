Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB71CCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 12:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C51710E8EC;
	Fri,  3 Oct 2025 12:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIH3aRkb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E3610E8E9
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759493951; x=1791029951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y7Dv7A4XC5r1R5s64Rp/Eo8v7QGQv70cO0IufAt5B2s=;
 b=QIH3aRkbd78Dcn4V8Bkl8YUROhjw6XvyknANl7Oliq+4DNAybhVviuPn
 Es0TCXtrqdb/o/Lx3OIgH3b4dgx476tEAnZdRSsZsNkSelisPa52Mjsi2
 bXDvs3kyroT7jg6j5WussE1J54tk99Eq2hnvA9niAGDOe2dR1MGEI3NPM
 GV/IHCr0aCAN8LSEYqvWk7GnyYUeVLngD8wmYaR/9KEYwIHIMl/iif4K2
 4XJnJsXOlmGpKyHcMr5m+8U14zTOpu+dboCv8fkqUkxcXdh44wstxB9Sq
 xpjXD/0Nua2KQ+0InHLbL0seXpmxdNtOyKVo9+QuJKKlpyxnZQXztKo94 g==;
X-CSE-ConnectionGUID: 0AX5URyLSGqnTTehVmWsgw==
X-CSE-MsgGUID: T/t1TxCcQfWYBUY+ZY61xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84399226"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="84399226"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:19:11 -0700
X-CSE-ConnectionGUID: dmP98q1PSs63qwlJ08TkMQ==
X-CSE-MsgGUID: cYt2LcqzTSOvYFurSFvcNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183300120"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:19:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/9] drm-uapi: Add 1D LUT multi-segmented color op
Date: Fri,  3 Oct 2025 17:55:44 +0530
Message-Id: <20251003122550.729242-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251003122550.729242-1-swati2.sharma@intel.com>
References: <20251003122550.729242-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 include/drm-uapi/drm_mode.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 1298274d9..d354526e8 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -912,6 +912,16 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_LUT,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT_MULTSEG:
+	 *
+	 * A 1D LUT with multiple segments to cover the full color range with non-uniformly
+	 * distributed &drm_color_lut entries, packed into a blob via the DATA property.
+	 * The driver's expected LUT size and segmented capabilities are advertised via the
+	 * HW_CAPS property.
+	 */
+	DRM_COLOROP_1D_LUT_MULTSEG,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.25.1

