Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359DEC35FF1
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 04:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FE610E0D4;
	Wed, 19 Mar 2025 04:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdbzHCrM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C64710E0D4
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 04:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742358394; x=1773894394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4SiPGCcjOGXpZZI+vByt5NC0U8CjrU2zWr8I3l6g0fI=;
 b=XdbzHCrMe0S7QnazpxDd3U7SLvOGgLxzwtHbU6kYAR51D7KzI1EJ0yfv
 zzcCHjZ6fzZuAmVJfiTmia7mRQZi1i1pPUfDV3FzbXdpmLURj24mrIyCY
 NRV7WNajH6+SToJXKBzuMGo/JINI8Jbx8RBghvKTQ02lUC+CSG0MDf7ni
 /9Z6/d9HfuXXlii9ODh/V09K2T8jEOLLS80w4t9WRIetJoIwT9bCmD8BE
 0uOI7scZ01cOG7IrD8orboHFhICyJ0/alkbSZ9VDpF51p/Ysy3i0dsqJx
 ClItSMBDg/Xn1CuAyAO456kuDu9FIGWqQpVxLO4gGRVbDtEmzc31zpBMA w==;
X-CSE-ConnectionGUID: NaGgOvYTSxy7aZleqYWiLQ==
X-CSE-MsgGUID: cIx9hX6dQ9SR+gOCcPcyeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="47174629"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="47174629"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 21:26:32 -0700
X-CSE-ConnectionGUID: Sl59wjNOTyC8GVPkT/C+Tg==
X-CSE-MsgGUID: HIbfH828Rgm/aaDp/kKM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="123393800"
Received: from ba_tws-123.gar.corp.intel.com (HELO
 spottumu-desk.iind.intel.com) ([10.190.216.156])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 21:26:30 -0700
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.teja.pottumuttu@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_oa: Keep OA user buffer size dynamic
Date: Wed, 19 Mar 2025 09:53:36 +0530
Message-Id: <20250319042336.3280115-1-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
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

non-zero-reason OA test has a hardcoded user buffer size for
any kernel OA buffer. This makes the test act differently for
different sizes. Thus make the user buffer size to be in line
with the kernel OA buffer being allocated.

v2: Address operator precedence (Ashutosh)

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9bc62c5b9..5c768e4cf 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2480,7 +2480,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	uint32_t buf_size = 3 * 65536 * report_size;
+	uint32_t buf_size = 3 * (oa_buffer_size ?: buffer_fill_size);
 	uint8_t *buf = malloc(buf_size);
 	uint32_t total_len = 0;
 	const uint32_t *last_report;
-- 
2.34.1

