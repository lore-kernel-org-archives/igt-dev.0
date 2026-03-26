Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6951099B5F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C863410E9E2;
	Thu, 26 Mar 2026 07:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meOK9zHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9010E8F2
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774510001; x=1806046001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HKCkU9m4V3GW4J1K8CZz9LimWKCQXx9R+9AMUC65Q+4=;
 b=meOK9zHKOYHwb97pEYPCLYQK+8rKsQShkme5VIXE6csmv3L/v5C4AfSL
 NN9cqu/GsOjZPlm4ZuUFBWT5KGZ7U7rGaY9/vT2y/2OHu+tItyiiiPN71
 /+Rp6ibDQvtBkF3ikc7cW0gvQTy0X+kZieNeyuPh8heA2pNkRShaaO7WI
 xGtSBQtIQKbmmcQiaIdTiB7htTCHEe2WwxvelzI23dytTxYQao6lQXPJp
 4RG7O9TTWmtS9oI6nK/X7z8JnL1VUbkIIbk/HX44mhqLi8tUj9a7EfGQW
 XCsrbFbuVgx/LX+9KWRjwzNfK3zRnJuWvhI1yrgNXapOKZj9Tf7G7U836 g==;
X-CSE-ConnectionGUID: hFkCTQtATQCE7C78SOZPHg==
X-CSE-MsgGUID: tZAqqPyoSkuVbkX5AtHNaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85866220"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="85866220"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:41 -0700
X-CSE-ConnectionGUID: +UW0zTiqTpaclokYHqWjbQ==
X-CSE-MsgGUID: JVmHXT7DTbOtVdsGH9YGDw==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.223])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:39 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t 4/4] tests/intel/kms_fbc_dirty_rect: check the plane
 size before fbc dirty rect tests
Date: Thu, 26 Mar 2026 09:25:55 +0200
Message-ID: <20260326072555.160329-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326072555.160329-1-vinod.govindapillai@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

If the FBC cannot support the plan size, skip the tests

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index efbd46985..ee13e95dd 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -401,6 +401,22 @@ static void cleanup(data_t *data)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
+static bool check_fbc_supported(data_t *data)
+{
+	if (!intel_fbc_supported(data->crtc)) {
+		igt_info("FBC not supported by the chipset on pipe\n");
+		return false;
+	}
+
+	if (!intel_fbc_plane_size_supported(&data->display, data->mode->hdisplay,
+					    data->mode->vdisplay)) {
+		igt_info("Plane size not supported as per FBC size restrictions\n");
+		return false;
+	}
+
+	return true;
+}
+
 static bool prepare_test(data_t *data)
 {
 	igt_display_reset(&data->display);
@@ -411,8 +427,7 @@ static bool prepare_test(data_t *data)
 	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_require_f(intel_fbc_supported(data->crtc),
-		      "FBC not supported by the chipset on pipe\n");
+	igt_require_f(check_fbc_supported(data), "FBC is not supported with this configuration\n");
 
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
 	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, NULL) ||
-- 
2.43.0

