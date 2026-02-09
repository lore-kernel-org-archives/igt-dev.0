Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA4BE7C706
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2FC10E140;
	Mon,  9 Feb 2026 08:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMcYvmkf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB74E10E140
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770624293; x=1802160293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UXjGGP0u9f/HxqbPt74Z31YAFTt9OqRGrBlRtkNPrDs=;
 b=RMcYvmkfZx1X4J2+tbGLv3rTtULCsBoxf4ua+gqSoIzvZe4ayiGv+Rsd
 tjRaZQr9SOhAq9utCbmlRccq5wLQfEjAkmL6zorzj3o7/gk1EZbHEi+JI
 TDUDgslKtnlSID7TRxcx8deMGKuU9umXZi62SnU/5dtJapFikfj8Cv0g9
 xVxI92oz5wwK5IduLlYh9rIRUMfXKTYMVbVyNkb5/tfEXlt6ekMyfGa97
 aOTcL4XIH1YwP6+ZoR6GLsc4utdULKvLZzHeA6XjnQURAja2KTP1rbAhm
 VyFE211kRBYo3v+iQAtVKQpCVjhKwIIWMLkeUTpi5DAde63NX9Hakdrxp A==;
X-CSE-ConnectionGUID: FM8WGN+hTneDVvb7iNW+QQ==
X-CSE-MsgGUID: osEXXUvYRpyuRavFcBYoWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="89313093"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="89313093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:04:53 -0800
X-CSE-ConnectionGUID: Pp1tHdoESPa+n2HP8gqfDg==
X-CSE-MsgGUID: 8Vs5tP+HSm6TM+yfOTlZAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211156124"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 00:04:51 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ankit.k.nautiyal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_content_protection: Fix MST outputs
 assigned to same pipe
Date: Mon,  9 Feb 2026 13:30:28 +0530
Message-Id: <20260209080028.1464575-1-santhosh.reddy.guddati@intel.com>
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

dp-mst subtests fails with both are both outputs trying to use pipe A.

The test finds a free CRTC and this CRTC is not being used and instead
uses a hard coded pipe with igt_output_set_crtc.

Fix by using the found CRTC directly and remove unused pipe variable.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 40f9c418d..d2bbea351 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -867,15 +867,12 @@ test_content_protection_mst(int content_type)
 	igt_output_t *output;
 	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
 	igt_crtc_t *crtc;
-	enum pipe pipe;
 	bool pipe_found;
 	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
 
 	for_each_crtc(display, crtc)
 		max_pipe++;
 
-	pipe = PIPE_A;
-
 	for_each_connected_output(display, output) {
 		if (!output_is_dp_mst(output, dp_mst_outputs))
 			continue;
@@ -891,8 +888,7 @@ test_content_protection_mst(int content_type)
 
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+		igt_output_set_crtc(output, crtc);
 		prepare_modeset_on_mst_output(output, false);
 		dp_mst_outputs++;
 		if (output_hdcp_capable(output, content_type))
-- 
2.34.1

