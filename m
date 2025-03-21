Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F683C36000
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 17:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DCA10E7FD;
	Fri, 21 Mar 2025 17:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCy9BhR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C5110E7FD
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742579589; x=1774115589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HY2v9SIu5PIeAp5+BhdIZWilr4thnQqDFPaT2sCV7Gg=;
 b=hCy9BhR1ZyyoYVgMZpJygrRCoTOKBUGdbreb/62bwtoYJS9V0qzDjwCU
 0SXIfZDiiEXUa+HXCYh+9w4FVpRGVFvLVv9VV+ZnUb4DgbOkXcmmk/LsP
 A1KcbwLxl2aA6J9rxBTaXeqkPlUFztb9H5juB5TYKC6/rTkqtWEZlwrEv
 +RrRbn85u+Rc36w0Zp2L6sAvY+GW5ap3RLu8Bo1cru3gGvswa52tLitIz
 RI7cToGeshCQ86Lszl+C3Rz94TjeahIBSf/bFkkU0a0HBvjrfNn8wbRgI
 R5xBTrzhznCLQlCWbEVJ4BxQSJ21sDmwR/ej6QmAv0eaGLAA1wn/4nYt5 w==;
X-CSE-ConnectionGUID: Mw5p0aKaS0i5aU5FURkuhg==
X-CSE-MsgGUID: Anj8a/OOS8uhtoqpzSNoIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43018722"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="43018722"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:53:09 -0700
X-CSE-ConnectionGUID: Q8ZdJOzqRhmOhHOPCvjPZw==
X-CSE-MsgGUID: 4cfrEFsESA6AxSnZ0B83og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="124241954"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by fmviesa009.fm.intel.com with ESMTP; 21 Mar 2025 10:53:07 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t v4] tests/intel/kms_pm_dc: Add skip logic and logging
 for DC5 psr test
Date: Fri, 21 Mar 2025 23:22:59 +0530
Message-ID: <20250321175259.20603-1-mohammed.thasleem@intel.com>
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
v4: Update logic style. (Gustavo)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/kms_pm_dc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 50473321a..4b2464c24 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -145,13 +145,26 @@ static void set_output_on_pipe_b(data_t *data)
 
 static void setup_output(data_t *data)
 {
+	int disp_ver = intel_display_ver(data->devid);
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
+	bool is_low_power;
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		drmModeConnectorPtr c = output->config.connector;
 
+		if (disp_ver >= 13) {
+			if (disp_ver == 20 || IS_BATTLEMAGE(data->devid) || IS_DG2(data->devid))
+				is_low_power = (pipe == PIPE_A);
+			else
+				is_low_power = (pipe == PIPE_A || pipe == PIPE_B);
+		} else {
+			is_low_power = (pipe == PIPE_A);
+		}
+
+		igt_skip_on_f(!is_low_power, "Low power pipe was not selected for the DC5 transaction.\n");
+
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-- 
2.43.0

