Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129B4CF318A
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 00:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E9B10E33F;
	Wed,  2 Oct 2024 00:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDkcpqAT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EED10E33F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 00:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727828591; x=1759364591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TELhOzuBvqt8aIy+puewM4wJIJPJZ+t+I4CNr6fpqac=;
 b=cDkcpqATLx9vWGwTbRS4FSn/xL7prggJhhpSG80oaDLFy85Fle7eIoTG
 3D4hEX80tPyygBHnwiKgXZHZHmUWMx84sNQwZC+c4HmW/ekFUTIhI1dp0
 urJKZNv+7uiNpgMAfO4zmyAfhK6iun4MH7Jy5xRyNBqkR+HAXxK81uqqU
 FYMDjj6JdIj8L15bnJ7+JdCVQwYazLGIEELWylBrHCYEM5nkMAjKODT39
 +7ilwn0txdfFqBynTmnL7iRvJjdUTe8MC+rwQqFcLeiNOshmXH8NbOSjh
 Ss260FElIHmcnf64B3IJXQTMumjKl0yk0JzZCDWPD2D/EeqLL4DFc+8/L w==;
X-CSE-ConnectionGUID: AWuY7/NTTiGCtMloMrxveg==
X-CSE-MsgGUID: IsWV8ul6QnyVwO3TA3AvgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26496464"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="26496464"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 17:23:07 -0700
X-CSE-ConnectionGUID: WU6e3UfiSwClKit4N+Jjmw==
X-CSE-MsgGUID: 2+MtsEdqRwq5CsVuW+LvXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="104659148"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 17:23:04 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_joiner: Reset the force_joiner_supported
 variable
Date: Wed,  2 Oct 2024 05:50:45 +0530
Message-Id: <20241002002045.6828-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
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

With the current logic the test will fail on configs where the first
display supports force joiner and the second display doesn't supoprt it.
Reset the force_joiner_supported variable at the start of the loop to
avoid this failure.

Also remove the redundant check in all the force joiner subtests
for force_joiner_supported as the following output check is inherently
checking this as well.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_joiner.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 508e82ce3..9a353ee1b 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -411,14 +411,13 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 
 igt_main
 {
-	bool force_joiner_supported, ultra_joiner_supported, is_dgfx;
+	bool ultra_joiner_supported, is_dgfx;
 	int i, j, display_ver;
 	igt_output_t *output;
 	drmModeModeInfo mode;
 	data_t data;
 
 	igt_fixture {
-		force_joiner_supported = false;
 		ultra_joiner_supported = false;
 		data.big_joiner_output_count = 0;
 		data.ultra_joiner_output_count = 0;
@@ -441,7 +440,7 @@ igt_main
 			ultra_joiner_supported = true;
 
 		for_each_connected_output(&data.display, output) {
-			bool ultrajoiner_found = false, bigjoiner_found = false;
+			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
 			drmModeConnector *connector = output->config.connector;
 
 			/*
@@ -539,8 +538,6 @@ igt_main
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-force-big-joiner") {
-		igt_require_f(force_joiner_supported,
-			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
 			      "No non big joiner output found\n");
 		igt_require_f(data.n_pipes > 1,
@@ -560,8 +557,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
-		igt_require_f(force_joiner_supported,
-			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
 			      "Non big joiner output not found\n");
 		igt_require_f(data.n_pipes > 1,
@@ -584,8 +579,6 @@ igt_main
 
 	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
-		igt_require_f(force_joiner_supported,
-			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(ultra_joiner_supported,
 			      "Ultra joiner not supported on this platform\n");
 		igt_require_f(data.non_ultra_joiner_output_count > 0,
@@ -600,8 +593,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
-		igt_require_f(force_joiner_supported,
-			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(ultra_joiner_supported,
 			      "Ultra joiner not supported on this platform\n");
 		igt_require_f(data.non_ultra_joiner_output_count > 0,
-- 
2.39.1

