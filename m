Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4BAC35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 09:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FC010E758;
	Fri, 21 Mar 2025 09:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3PW3dgc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B8610E758
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742548887; x=1774084887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8BlA3D2gqSYJ300RFWJ1NXfzLWF2uiIbx1ugm+OFsAM=;
 b=c3PW3dgcLCvHzVzEfaxzHF3udOmTeddy/0m1QprQ1sTKq4bATrNI0Sjo
 7z3qYfjJj0zu5j+1sPnJj/s/MEFwMQYlUicPz04UlBq8XSkGZ0clzvt0+
 9/i8qzTIuhQXmUjNy86DK4hqm+K0zGNkhHXEKHkqKZLsayApUy1QuAFCk
 fw+HkI72eHG1/vl9wSLqb4aEf/KKGl05DxAyeAHjDlT0RGZ63WJA1j0W4
 vMSjYRGfqEVF2p9LTGZoJD9FUIi/lQrjzCq3TQn9nfKg+F98PBjetb2oJ
 zOIAjoGJskfvuTvn3LBvq7IdF/gMITBL//aPLJRItvdsYBRP4eYxBj3LG g==;
X-CSE-ConnectionGUID: E5SqsaQ5Qr2TMjXgMmFYNg==
X-CSE-MsgGUID: cyveeD4kSAS2tqAkd3xsoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43821330"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43821330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 02:21:27 -0700
X-CSE-ConnectionGUID: fJ9ehcrmSfyRbPf02rr9UA==
X-CSE-MsgGUID: wWkFV8vqTKSZcW7mYBq3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123323214"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa010.jf.intel.com with ESMTP; 21 Mar 2025 02:21:26 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_pm_dc: Add skip logic and logging
 for DC5 psr test
Date: Fri, 21 Mar 2025 14:51:20 +0530
Message-ID: <20250321092120.85206-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
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

Prior to Gen12, Pipe A is required to run the DC5 transaction,
ensuring low power operation. In display versions greater than 12,
either Pipe A or Pipe B can be used for the DC5 transaction,
providing flexibility in pipe selection

However, display version 20 specifically requires Pipe A.
Additionally, for Battlemage and DG2 devices, only Pipe A is
required due to specific hardware constraints. To enforce these
conditions, skip logic and logging have been added, ensuring that
tests are only executed when the appropriate pipes are selected.

v2: Updated subject title and discription.
    Add Gen checks for low power pipe selection. (Santosh)
v3: Add check for bmg and dg2 for Pipe A also other checks for Pipe A
    and B. (Gustavo)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_pm_dc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 50473321a..b23c13363 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -148,10 +148,16 @@ static void setup_output(data_t *data)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
+	int disp_ver = intel_display_ver(data->devid);
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		drmModeConnectorPtr c = output->config.connector;
 
+		igt_skip_on_f(((IS_BATTLEMAGE(data->devid) || IS_DG2(data->devid)) && pipe != PIPE_A) ||
+			      (disp_ver <= 12 && pipe != PIPE_A) || (disp_ver == 20 && pipe != PIPE_A) ||
+			      (disp_ver > 12 && disp_ver != 20 && !(pipe == PIPE_A || pipe == PIPE_B)),
+			       "Low power pipe was not selected for the DC5 transaction.\n");
+
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-- 
2.43.0

