Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81C6D10DC0
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 08:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906310E21B;
	Mon,  2 Dec 2024 08:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8GZA2pq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC9F10E668
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733129317; x=1764665317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vbhuA6yarB3m52+UcLfrxZSXEVgTVg3arFrCFkS62Ko=;
 b=X8GZA2pqxh9Pk/w97boOs8oj33O+r+y5Ng+d10FCLXXDoCy4DxNwQ31+
 YEBuhssLfgqdP4cFdUqLiT2xf3lQNmduJyFFKT8RfjmSwrkmk3IGSNqPJ
 Qy630Jh9/M9rrnPzehXNcXgcmZvyzwA8lO4KkRQwCzC4Ror5l4VyoN+Fb
 zpK0pFneY3dWFNlEn5qEhSsggURuzRveXDGcfm9u3ybIy/tesN3HOcMs1
 kjGgFshubGL+wiRSURM9VqjK644AdNI8zw5ilVeYXgN+LndLMcYBu2tPB
 kJuovfU5ojYOQjzzkFJLw9ndRxFD3yJXsBneaJ6IVn140Q+83b+tTy/03 g==;
X-CSE-ConnectionGUID: gO8i7QUqQgOEBzQRdZV1Gg==
X-CSE-MsgGUID: 2gBLB9UOS3OuO0F7HzK4ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33533047"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="33533047"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 00:48:37 -0800
X-CSE-ConnectionGUID: xgISvJ1rRHOPaMSlFuX50w==
X-CSE-MsgGUID: U5i1RfbVTWu73f5b+4IrJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="130528835"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 00:48:36 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_dsc: Split max_bpc constraint
Date: Mon,  2 Dec 2024 14:21:27 +0530
Message-Id: <20241202085127.1785594-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241202085127.1785594-1-swati2.sharma@intel.com>
References: <20241202085127.1785594-1-swati2.sharma@intel.com>
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

Split max_bpc constraint and add igt_info message.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 9b48caf76..5508e7a9e 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -281,10 +281,14 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		data->pipe = pipe;
 
 		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
-		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe) ||
-		     igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
+		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
 			continue;
 
+		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC) {
+			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
+			continue;
+		}
+
 		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
 		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
 						     data->output, data->output_format)))
-- 
2.25.1

