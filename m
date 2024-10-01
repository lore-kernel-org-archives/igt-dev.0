Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47261CE7D05
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 09:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D0210E065;
	Tue,  1 Oct 2024 09:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nL9GR91F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF7210E065
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727776050; x=1759312050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zlJOuEII82azyul/PWTe/46pCJuoUhHwrX/86Cybz9w=;
 b=nL9GR91FxRwDblzgpQE6ghlSMup7BTOkM0GWdfeHmd2Kux6UefnBavbq
 oQVVK7Rt7BRTMPcNspSEosq8m5b4rmicjoZDkywh9RQnXi/yqEaNieEBQ
 N9BERXLAMiVKlW6KC/+IxJoB4y1guH5dq8/8xuGeei3l24Yymjy34Txif
 Z9hnQAG2ZX1EMxF5om661fuHdGHLZsu4cCAonxyHtEtAScrr2jgBmyTJ+
 Qx9aSWlc7AMicnYjOcIZwfCuHmOb2HJZwFXgU7YVW8C7qsB9aSTqQu+5X
 94QQD6gTOdJow/mi0MZjcAO0NQbXNOi7Nfp+bDkBca4aw+ERPJOMbPgIW g==;
X-CSE-ConnectionGUID: Cjy5LTu8Qf+bjM9Rc3BuLA==
X-CSE-MsgGUID: qXPCuqPzQMuRRg9j564m1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26776633"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26776633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 02:47:29 -0700
X-CSE-ConnectionGUID: MuG6CI+ITx2i+h3ecAAJcg==
X-CSE-MsgGUID: VP7XxFJRRoWgJOq7vceDXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78576491"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 02:47:27 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/kms_joiner: Reset the force_joiner_supported
 variable
Date: Tue,  1 Oct 2024 15:15:06 +0530
Message-Id: <20241001094506.25037-1-karthik.b.s@intel.com>
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

With this remove the redundant check in all the force joiner subtests
for force_joiner_supported as the following output check is inherently
checking this as well.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_joiner.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 508e82ce3..198de9e43 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -418,7 +418,6 @@ igt_main
 	data_t data;
 
 	igt_fixture {
-		force_joiner_supported = false;
 		ultra_joiner_supported = false;
 		data.big_joiner_output_count = 0;
 		data.ultra_joiner_output_count = 0;
@@ -443,6 +442,7 @@ igt_main
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false;
 			drmModeConnector *connector = output->config.connector;
+			force_joiner_supported = false;
 
 			/*
 			 * Bigjoiner will come in to the picture when the
@@ -539,8 +539,6 @@ igt_main
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-force-big-joiner") {
-		igt_require_f(force_joiner_supported,
-			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
 			      "No non big joiner output found\n");
 		igt_require_f(data.n_pipes > 1,
@@ -560,8 +558,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
-		igt_require_f(force_joiner_supported,
-			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
 			      "Non big joiner output not found\n");
 		igt_require_f(data.n_pipes > 1,
@@ -584,8 +580,6 @@ igt_main
 
 	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
-		igt_require_f(force_joiner_supported,
-			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(ultra_joiner_supported,
 			      "Ultra joiner not supported on this platform\n");
 		igt_require_f(data.non_ultra_joiner_output_count > 0,
@@ -600,8 +594,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
-		igt_require_f(force_joiner_supported,
-			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(ultra_joiner_supported,
 			      "Ultra joiner not supported on this platform\n");
 		igt_require_f(data.non_ultra_joiner_output_count > 0,
-- 
2.39.1

