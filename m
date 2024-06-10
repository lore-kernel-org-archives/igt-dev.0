Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A40C27C5E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790F910E4D3;
	Mon, 10 Jun 2024 16:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JM9LQgfU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA40F10E4C5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037779; x=1749573779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KVDA//xIcPQ9/ZM/bh2UYjDdwtTHPB4wCEuGFW/e2cc=;
 b=JM9LQgfUtfz6rtlu43UkXQhh4GPW9SVCzds8MRjaM495f1pXNa2Kyoox
 9keLR/E4kGRitaXuUR04lla6iXtycI9BbkHJk882LeOzrdTcAyJ8v6mhp
 6QscAssDpOZGnAcdym6uQIcI7x8V38VEK9FhvRiIvuM2tgNI6UfQXIpfS
 E7WX4jLZGUPOQzhbwtpfPhhLxDBye6yzYfEccHhOtyVMwH2NbZ7ordFHJ
 4kCSTrVliEOgehiE/kXR6ByFV9qavhPh3/IrATOBRHsoQZVO7e+nT/spl
 TfH1ya2anlr980JwaugNU4wFJXDwKBO2r4r8eDAtzvhAF2G5fz6Pi7HRw w==;
X-CSE-ConnectionGUID: Q2Ds70ZfQBqb1DUDQmPLgA==
X-CSE-MsgGUID: +gmfH6PgQYWgN484zBwBAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819739"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819739"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:59 -0700
X-CSE-ConnectionGUID: p96z40ArQ66pcJd/c/SBxA==
X-CSE-MsgGUID: I0fEV9WsQMKbtL2XKxSDaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39681363"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:57 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 8/9] tests/kms_universal_plane: Test cleanup
Date: Mon, 10 Jun 2024 22:04:56 +0530
Message-ID: <20240610163457.3711476-9-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
References: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
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

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_universal_plane.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index a6e11777d..8c1ce8143 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -139,7 +139,7 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->red_fb);
 	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -386,7 +386,7 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->undersized_fb);
 	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -516,7 +516,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->red_fb);
 	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -603,7 +603,7 @@ cursor_leak_test_fini(data_t *data,
 	for (i = 0; i < 10; i++)
 		igt_remove_fb(data->drm_fd, &curs[i]);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 }
 
 static int
@@ -752,7 +752,7 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->smallred_fb);
 	igt_remove_fb(test->data->drm_fd, &test->smallblue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
-- 
2.43.2

