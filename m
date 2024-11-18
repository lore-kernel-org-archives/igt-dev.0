Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BB1D68BFC
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 06:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5613710E1F9;
	Mon, 18 Nov 2024 06:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbNb1g4Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0234C10E1F9
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 06:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731912015; x=1763448015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vuXtW/BwZTw0qIFOTk6BtSAmPni4JmPpLcYWl0P+YAA=;
 b=UbNb1g4Y1cHxJ73Csrhqi4h49jTTjk23I+8DU2Om95DHOsQMMVRaOEK9
 9Qkv458ad3z7KzGHwvUH4xRYczQ9IIuq0nEb6Pl8dep1uZKqf7iDhVjSz
 JRpOwc5kug0PjQAQBPwD12ZlwbSR4/LuCkeJEDwWyLt55kd+lUzuwiH7z
 qBTybtvPztAXu6e2vZPar4YyzX6pKGXLp1TKDY6jwVopZuNLWoZ+7N+8b
 bG3BQTrhwR2U5dq4VFg9qOjz+FmeO1gxoB0isJZ54+eoyPKFCk0STkEX4
 knD9jHU9bHP1FtKDp4Pd3sxTO6ewwcc4458yfun/haVivzD0aHUTmvcY+ w==;
X-CSE-ConnectionGUID: vBYBsxuWSraHRw+j+IGsiw==
X-CSE-MsgGUID: EF6HV0HsQ369kSr/An5H9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31948742"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31948742"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 22:40:14 -0800
X-CSE-ConnectionGUID: B2sFnvIMQZONlLknNVg1Bg==
X-CSE-MsgGUID: rA2lujEhQdyv4dhzZ9C/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89564562"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 22:40:10 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_oa: Replace hardcoded OA buffer size
 assumptions
Date: Mon, 18 Nov 2024 12:02:23 +0530
Message-Id: <20241118063223.3974722-3-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118063223.3974722-1-sai.teja.pottumuttu@intel.com>
References: <20241118063223.3974722-1-sai.teja.pottumuttu@intel.com>
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

A few xe_oa tests assumed that the default OA buffer size is 16MB
and had calculations around it. These would fail if the default
buffer size is changed on the kernel side.

Replace such assumptions with the OA buffer size we get from
DRM_XE_OBSERVATION_IOCTL_INFO ioctl

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 4e4d0fabc..3b65212ae 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2389,7 +2389,7 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 		.properties_ptr = to_user_pointer(properties),
 	};
 	size_t report_size = get_oa_format(fmt).size;
-	int buf_size = 65536 * report_size;
+	int buf_size = oa_buffer_size;
 	uint8_t *buf = malloc(buf_size);
 	int len;
 	size_t oa_buf_size = oa_buffer_size;
@@ -2533,7 +2533,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	uint32_t buf_size = 3 * 65536 * report_size;
+	uint32_t buf_size = 3 * oa_buffer_size;
 	uint8_t *buf = malloc(buf_size);
 	uint32_t total_len = 0;
 	const uint32_t *last_report;
@@ -2615,7 +2615,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 		.properties_ptr = to_user_pointer(properties),
 	};
 	size_t report_size = get_oa_format(fmt).size;
-	int buf_size = 65536 * report_size;
+	int buf_size = oa_buffer_size;
 	uint8_t *buf = malloc(buf_size);
 	size_t oa_buf_size = oa_buffer_size;
 	int n_full_oa_reports = oa_buf_size / report_size;
-- 
2.34.1

