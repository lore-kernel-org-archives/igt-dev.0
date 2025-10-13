Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A870DCCD18F
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B3110E548;
	Mon, 13 Oct 2025 20:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTsYigf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636CF10E526
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387449; x=1791923449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlf2cgxzpSubIfCRjqOalYR8JqaxRu0pPqghaRRWw1w=;
 b=kTsYigf3xTIwOy2gcPwJJS/U0vii8rkdwPcVqbo42OqNTbHgSQP7pNc3
 S7vf6Il0RxIwgiaR77lu8r0fG8iYJ//ShJjS80Fkb7+zLnnBmy4COyByo
 VYTCDM4ID1Dm7+0cdsdnW14c6ncedc2q2sS1MEIpSvBJhD3rmDYruWoUu
 XI6LeVfBKWhmHhkP8AsiFhFbFKyHeRNOTPBeByAu97ajTymyJYpucSRR+
 DXB0hiatyYJ7seN+OBn9Hm935ijAvK8ZDq44NarxKBQHSbPu/gHZ5BQV6
 AezKIjPFuPIiV3f7rXwHD6gPbnAsgmdK9SnFdFl07Z8soFNBbzKoNjWU6 w==;
X-CSE-ConnectionGUID: +UPxxceOS9ap5GLOliKu7A==
X-CSE-MsgGUID: x188gjfXQ4CZ3FypeuUEIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641928"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641928"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: 3PeEqbdSSle9AXnVs7+rRg==
X-CSE-MsgGUID: Egzo37a8QeO1znnXfj67VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924008"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 01/18] tests/intel/xe_oa: Add OAM formats to
 lnl_oa_formats
Date: Mon, 13 Oct 2025 13:30:24 -0700
Message-ID: <20251013203042.925115-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013203042.925115-1-ashutosh.dixit@intel.com>
References: <20251013203042.925115-1-ashutosh.dixit@intel.com>
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

Add previously missing OAM formats to list of Xe2+ OA formats.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 4f2aff59ac..0a00105bd4 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -242,6 +242,18 @@ static struct oa_format mtl_oa_formats[XE_OA_FORMAT_MAX] = {
 };
 
 static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
+	[XE_OAM_FORMAT_MPEC8u64_B8_C8] = {
+		"MPEC8u64_B8_C8", .size = 192,
+		.oa_type = DRM_XE_OA_FMT_TYPE_OAM_MPEC,
+		.report_hdr_64bit = true,
+		.counter_select = 1,
+	},
+	[XE_OAM_FORMAT_MPEC8u32_B8_C8] = {
+		"MPEC8u32_B8_C8", .size = 128,
+		.oa_type = DRM_XE_OA_FMT_TYPE_OAM_MPEC,
+		.report_hdr_64bit = true,
+		.counter_select = 2,
+	},
 	[XE_OA_FORMAT_PEC64u64] = {
 		"PEC64u64", .size = 576,
 		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
-- 
2.48.1

