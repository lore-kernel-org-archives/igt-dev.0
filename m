Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ABCC021AA
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 21:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B218D10E5E9;
	Mon, 17 Feb 2025 21:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6s7hW+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D290710E5E9
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 21:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739827824; x=1771363824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zeQL0DcD0mGh/xnTC/Xg6XUciccB9LqwwsEuZ4hF82Q=;
 b=C6s7hW+N+4nHP+a9jvKUPZ9gtNcN38PUvTBDm7eXp+PktIHkuiN7z7i4
 qkQD2lPflEO7YWiV5lnIQ4QhrRw8CyaPUQtYPtAbR00V3toHSInDSmJ6O
 WrwNfVjOT5O7I5Mv4a7+xiIYsww1ioe+A5IFRJCofV6NoOeGJo4ic3Jx2
 9A8wGVLRJ1gEfI1IMFG7DqJLhH7zOMiF6Ir9x3cCcvrY0CoFfTlFAhPOS
 sS5hUHnlJhN6fnRLmlz+d1EyIomMqQYlKEw6Z0eGEfdeNOCj7S7dC413S
 oSrlhl6kdAge2+nDhFEsNQKFhMuEetVRm0xgFMQzsSxg6r7zhGd5yiFUE g==;
X-CSE-ConnectionGUID: cXzhU/HfSVOssSPsuhIrWA==
X-CSE-MsgGUID: l5NwuYMbTvKBpuGw8Fdj3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39750695"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39750695"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:24 -0800
X-CSE-ConnectionGUID: bSEPQjGiTaeLGT4glSu6Qw==
X-CSE-MsgGUID: 9zNHJphGRZKiclpMYYZPEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114411226"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:22 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/kms_cdclk: Use igt_get_max_cdclk()
Date: Tue, 18 Feb 2025 03:05:31 +0530
Message-Id: <20250217213531.402162-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217213531.402162-1-swati2.sharma@intel.com>
References: <20250217213531.402162-1-swati2.sharma@intel.com>
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

Replace hardcoded max cdclk freq with one computed from debugfs.
in igt_get_max_cdclk(). Also, add same condition for
all_outputs subtest.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_cdclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index b84ec5cae..22561ab5c 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -53,7 +53,6 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
 #define VREFRESH	60
-#define MAX_CDCLK_4K	307200
 
 /* Test flags */
 enum {
@@ -227,7 +226,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
-	if (cdclk_new != MAX_CDCLK_4K)
+	if (cdclk_new != igt_get_max_cdclk(data->drm_fd))
 		igt_assert_lt(cdclk_ref, cdclk_new);
 
 	/* cleanup */
@@ -314,7 +313,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
-	igt_assert_lt(cdclk_ref, cdclk_new);
+	if (cdclk_new != igt_get_max_cdclk(data->drm_fd))
+		igt_assert_lt(cdclk_ref, cdclk_new);
 
 	do_cleanup_display(display);
 	igt_remove_fb(data->drm_fd, &fb);
-- 
2.25.1

