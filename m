Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF253C77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 11:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9DC10E362;
	Mon, 23 Jun 2025 11:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IknXHC/Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B68A10E367
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 11:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750677113; x=1782213113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2dM6yEN//pHQIidoG7QaEOILMeyhKyQP0gGzGAAWFKY=;
 b=IknXHC/ZhuLzOPV3Qqkspefb4M4ABDoA4qb2jFAZC1/X7rfE1yhlXbC0
 W0/Cc9hqdFYd3xysIcrHs/FHsXX0pMOUOCXKDFvY/OsVV2RjaJO9ixTow
 BakeS8AXNFRawSqEDYH9ZXYIUP0NJk0WDDELdgd+wUXZN0JDPhgSBie5q
 VkZB0Oqpr7Ak+GjM/TFSjQTLQ/5boqUq1bTgC59nl8i1TkZsKTb4tsZyD
 /7OWOWyixsCod4Qi4jrzPX1/JExqO0qPZPOZRnTcxpPQmsxxZkAYufMob
 Sh5Qilh7HllMAlHPDWwHkeN5523RfsfYg5AbYkmYxn6TpqSjcwk4n8ySZ A==;
X-CSE-ConnectionGUID: j05ES9oDR/mAy1ipLrZAew==
X-CSE-MsgGUID: DNNLzZZWR7+F8FqPGPkEdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="53018936"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="53018936"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:11:53 -0700
X-CSE-ConnectionGUID: JZFEaWSNTvy48driuCm5Aw==
X-CSE-MsgGUID: 9pIFjceETy6saqaOuUsDtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157063760"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:11:52 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v15 5/5] tests/kms_async_flips: Skip Async Flips with
 Linear Modifier
Date: Mon, 23 Jun 2025 16:39:18 +0530
Message-Id: <20250623110918.606014-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
References: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
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

Skip the linear modifier subtest on unsupported platforms

V2: Remove platform check and use in_formats_async (Chaitanya)
    Update the commit message

V3: Fix crash

v4: Handle the case for linear modifiers on platforms where
IN_FORMATS_ASYNC is not supported. (Chaitanya)

v5: Move the linear modifier support checks to run_test (Chaitanya)

v6: Remove hard coding pipe and refactor to move checks inside run_test
(Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index e176b2a28..5a7daaf07 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -799,6 +799,23 @@ static void test_crc(data_t *data)
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
 }
 
+static void require_linear_modifier(data_t *data)
+{
+	if(!igt_plane_has_prop(data->plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
+		data->modifier = DRM_FORMAT_MOD_LINEAR;
+		return;
+	}
+
+	for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+		if (data->plane->async_modifiers[i] == DRM_FORMAT_MOD_LINEAR) {
+			data->modifier = DRM_FORMAT_MOD_LINEAR;
+			return;
+		}
+	}
+
+	igt_skip("Linear modifier not supported for async flips\n");
+}
+
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_display_t *display = &data->display;
@@ -814,7 +831,11 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			continue;
 
 		test_init(data);
-		data->modifier = data->linear_modifier ? DRM_FORMAT_MOD_LINEAR : default_modifier(data);
+
+		if (data->linear_modifier)
+			require_linear_modifier(data);
+		else
+			data->modifier = default_modifier(data);
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 			/*
-- 
2.34.1

