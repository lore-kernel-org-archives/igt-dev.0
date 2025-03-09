Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A3BC282D1
	for <igt-dev@archiver.kernel.org>; Sun,  9 Mar 2025 10:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962AF10E30B;
	Sun,  9 Mar 2025 10:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCZQdK4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF10710E30B
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Mar 2025 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741514968; x=1773050968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2s2nzQkxSaBHwSr2c+ApaS4R4101XB8u0gqjWhG7taI=;
 b=bCZQdK4wGki9y6brhWRPSKYW38o1DAoKy6EGgmCuKkcTZlPme825DE9f
 PTgTYD3Z8Vh0qseLTRG1DroXzi+s6mSK9gf8P9O1ivGQH3p+dhUv3t7Bb
 vN9dFCdmeYU3QcyqtvsOcol4WB5V6aeVL6W/6Z784Y/2Jh0yBNA5eFT5t
 kHTy7iFV0RHaDeQNYj3X6EaER0QmWpkfUKGLy1gvQq1k7AaFrRaYpwP26
 XSlZ9Coc49YUWWtMhZUaoOzD2jzd4mKUycMnZAZwQ7M1aWKy8LdJUluKf
 EhdNKmlfdxGGG+qB4db5GgxT9tKlXaBmD6piLxT4Ufc5YL0KLBIpOcZOn g==;
X-CSE-ConnectionGUID: qcfKRpDWSFeV2hDleEuxmw==
X-CSE-MsgGUID: 4gXkGHjhSumHHH/F6HXYug==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="53903010"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; d="scan'208";a="53903010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 03:09:27 -0700
X-CSE-ConnectionGUID: 4DhOe2kZRd6ffu644NhN9g==
X-CSE-MsgGUID: 3cV4rxONQpuO9y78L6doog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; d="scan'208";a="119719324"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2025 03:06:59 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Add skip logic and logging
 for DC5 psr test
Date: Sun,  9 Mar 2025 15:36:49 +0530
Message-Id: <20250309100649.26528-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226065202.84015-1-mohammed.thasleem@intel.com>
References: <20250226065202.84015-1-mohammed.thasleem@intel.com>
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

Low power Pipe A is required to run the DC5 transaction for Gen12.
For Gen12+ to Xe3, either Pipe A or Pipe B is needed for the DC5
transaction using a low power pipe. Added skip logic and logging
to enforce these requirements.

v2: Updated subject title and discription.
    Add Gen checks for low power pipe selection. (Santosh)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index bbb29d7d9..c7fde2af7 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -156,10 +156,15 @@ static void setup_output(data_t *data)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
+	int disp_ver = intel_display_ver(data->devid);
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		drmModeConnectorPtr c = output->config.connector;
 
+		igt_skip_on_f((disp_ver <= 12 && pipe != PIPE_A) ||
+			      (disp_ver <= 30 && !(pipe == PIPE_B || pipe == PIPE_A)),
+			       "Low power pipe was not selected for the DC5 transaction.\n");
+
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-- 
2.25.1

