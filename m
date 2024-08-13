Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82955C531DC
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 13:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4408410E34E;
	Tue, 13 Aug 2024 13:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1fHQCTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED94110E34E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723555500; x=1755091500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PTZFLoWLk9wo6PtR9tkxXEeZgQCZvIL6OqpNrdoUk04=;
 b=T1fHQCTXiDq2NkJEnRX/VClBj+x+MD2fQNghICuemAagrD+/Ud2eg7XF
 MEcgpGPSBsBHOBYRVe8AwLdkj3gN01Lf/+WkYwYb1gQGyxVDOMjJMFyKN
 HKp1mAaaKkZfMEECJuu8+V+qkZH7th5UAGb6W/ec4TmtePcHj8sf91GFS
 63pp8xLoL+BRi8rAXGioHJmkk8bpVRNyi9pg+GWhKDkUebL8aevg/wn3b
 3sWIlnnFpqBp29cOXLSMXUaSTb94wmKXp6X7aNes8g7dOkP1z/24XS3xH
 5BSNCyI/bmT+53YKqWGm/I+JFYb1wp7aqOw1ZmFr/qHNScMOOx5YGUev3 A==;
X-CSE-ConnectionGUID: R/EfaiihTRuuzNhOMiDbhA==
X-CSE-MsgGUID: JCsJBz9GQO+/FND1SF1YMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21579261"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21579261"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:24:59 -0700
X-CSE-ConnectionGUID: KUThmLsRSpy/H5Mjnz0a7g==
X-CSE-MsgGUID: J5K4gYWyTeOjHhfT62bnxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63515042"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:24:59 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 2/2] lib/igt_kms: Clear all connector properties on reset
Date: Tue, 13 Aug 2024 18:45:20 +0530
Message-ID: <20240813131520.2715442-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813131520.2715442-1-bhanuprakash.modem@intel.com>
References: <20240813131520.2715442-1-bhanuprakash.modem@intel.com>
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

Just to sanitize all properties we should clear all
connector properties on reset.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f5fc9ada1..f52b35a72 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2575,6 +2575,7 @@ static void igt_output_reset(igt_output_t *output)
 	memset(&output->override_mode, 0, sizeof(output->override_mode));
 
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, 0);
+	igt_output_set_prop_value(output, IGT_CONNECTOR_DPMS, DRM_MODE_DPMS_OFF);
 
 	if (igt_output_has_prop(output, IGT_CONNECTOR_BROADCAST_RGB))
 		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB,
@@ -2597,6 +2598,13 @@ static void igt_output_reset(igt_output_t *output)
 	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
 		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
 					 "off");
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
+		igt_output_set_prop_value(output, IGT_CONNECTOR_SCALING_MODE,
+					  DRM_MODE_SCALE_NONE);
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC))
+		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 12);
 }
 
 /**
-- 
2.43.2

