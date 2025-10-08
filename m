Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8DECCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D5A10E8DF;
	Wed,  8 Oct 2025 21:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVToQOWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E8810E8DE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958294; x=1791494294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lz8Rnhc57Bi6UjIAasLrgB3b9oFJV/25w3oJd3yC5/0=;
 b=MVToQOWYGb1QN6icCgmBiG3D+YrXKN9eLlhCRbYMjysPGTY0v9g7Gong
 5JwWT8AKmojmD2Y3F2Vfjt3a+AOTodh0n3uynBD+iBHgR2THI/PJUijqK
 sNFyIu5IRFs6cYtT5UpXaxxTNX1bbB+4mhX3CJlsljeG+voJQBh1YchSz
 ouV39j71c06LK8U+JWc/4veCTcI7fqK087G6sf+gLNm3jSs+WisE18Dw3
 JhKTIEBrac7dPP5VSmJSkPzwhtPu4L1BCYuKgbn39ad6F38tuY92r4Qd0
 9jRBcohGZUvfW9yfjCuK3JqK4rsnPrybn6a1RmPYgBS5ZUbyS5CSJLi52 Q==;
X-CSE-ConnectionGUID: Rf1Dq4BaQeOtP/c0SjTdvw==
X-CSE-MsgGUID: y4tSZpmlRpmXBG2f9qdc2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989643"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989643"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: NHmaNwCPTYmL5ZFXKZO0IA==
X-CSE-MsgGUID: GQf6VadARfaUZ6G2fyzyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805258"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 01/18] tests/intel/xe_oa: Add OAM formats to
 lnl_oa_formats
Date: Wed,  8 Oct 2025 14:17:48 -0700
Message-ID: <20251008211806.625154-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008211806.625154-1-ashutosh.dixit@intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
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

