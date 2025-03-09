Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26088C282D1
	for <igt-dev@archiver.kernel.org>; Sun,  9 Mar 2025 08:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C4D10E21C;
	Sun,  9 Mar 2025 08:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG6OnTeD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F4310E21C
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Mar 2025 08:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741507500; x=1773043500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbVpTq1liUCvw3Z0+eQkpYXR1/Tpyc93dgH54lwGhWc=;
 b=cG6OnTeD4eF1QkCTbv2mA8pny/glq5GXx5/vG7uCHkM/FyijH0FTf3oI
 +2gWdKLmt3MFVClcTjkIYJGwAiL3gNaysyRTJA9GGqLCIwt6QThnCOHcq
 qsjNwHgCS4Z1GmJcFEnnwTVtgKXzkCRIf6K+xhoT/fqN22XoPAtaX3nn/
 hYSyJdGfCm2rzWzub/D4rqkIcT36Mz2SB3KtsgBuHn2LIV4ks16Tr11pg
 8Md1wKJ02JthOuvPE+jlymrZKJiocmJwZHVEk4wm3fL+X8lgBsIhMM8At
 PjX97PTRRNqUH2AKZhxBFlF+fushJOaGf6Tkh+013/KFcYG0pKkfTmvTB g==;
X-CSE-ConnectionGUID: QmzX/VUZSqiXfsZMHUnUjQ==
X-CSE-MsgGUID: UzmKo37yQ1+4i52nppxcjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42630718"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; d="scan'208";a="42630718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 00:05:00 -0800
X-CSE-ConnectionGUID: bpNIOP//T9OoJU5PhAHk3g==
X-CSE-MsgGUID: l7dOMHBqQG2TZ+c/q/aqWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; d="scan'208";a="124632093"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by orviesa003.jf.intel.com with ESMTP; 09 Mar 2025 00:04:58 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Add skip logic and logging
 for DC5 psr test
Date: Sun,  9 Mar 2025 13:34:47 +0530
Message-Id: <20250309080448.21470-1-mohammed.thasleem@intel.com>
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
to enforce these requirements."

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

