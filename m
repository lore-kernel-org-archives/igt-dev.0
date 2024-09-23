Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356EBCF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA4210E497;
	Mon, 23 Sep 2024 20:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOMsiam4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE00710E497
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124369; x=1758660369;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ff7OXK8R+5022ygRKDoe85iaoDgDN+IPQESNZM6wLr0=;
 b=fOMsiam4qEOiABe27dHPdVRH/Kx+L7432CRBwI1WQlSJyj3UFWEXYkmn
 buAWiHVqkCcXzyCDFbZYmAvNC/8CmyFFl4ktP1RQKRx841VY0LlEh9Coz
 uprFZquoVWkZpAliTD2eBr0SXiB0saLTIbx0f/g9PKyxZpd2SGAJj7X+Q
 Om7kvFVgywamcuaPmGd0UtwKKJZ9iKoa6bjfI1z3NcEV9Qcgt93eNidVm
 0BXUWJ+HzCeppYVJjVPI0B7RjAwsuhBzr+JKVhu/fjuhv4kvx+ehBJkj3
 v+H8gt1SC1HLcYd+jYlxv+5FpdfzHpW5TKRgbty0xEeET3xJhcsP71d/L Q==;
X-CSE-ConnectionGUID: in2XPWjNR0+q1UDH7Ax+rQ==
X-CSE-MsgGUID: 1RTp+d2QSF2IlXodYfPvCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25955992"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25955992"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:46:09 -0700
X-CSE-ConnectionGUID: rr+fx775T0m/BvlJxTpQ4Q==
X-CSE-MsgGUID: /dtErknKS1SVgk4043FUBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71326755"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:46:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:46:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/6] tests/kms_ccs: Use logical && instead of bitwise &
Date: Mon, 23 Sep 2024 23:45:54 +0300
Message-ID: <20240923204557.32123-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
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

The code appears to want to use a logical AND instead
of a bitwise AND. Make it so.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 835a3fe5aed2..8be8ac58e576 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -394,8 +394,8 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
 	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
 	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
-	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &
-						xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
+	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &&
+			   xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
 
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
-- 
2.44.2

