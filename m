Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13838CCD195
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 08:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16E810E760;
	Wed, 15 Oct 2025 08:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUvu9cxt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3976F10E171
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760429188; x=1791965188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=idub4QqqQN3anFkQcr2MLrA50ScaP0Go3tvqIBYtg+s=;
 b=RUvu9cxtONOYPWxJhE8hIMsrJ7zGQddIgiPs0SZYso5KJackkXZMqCkY
 /KBom5cEbuwTGudkHMaKP1T5SmfkSK5dQlsGc/6csuWQb6j3VbNEvUth0
 DJA5W0eS7292V/ixFNViqMUX/3AZDKS9cACIXhZG35JDX4gOeheHi9c/t
 A/Q4gypXtTKOhDe6HU268TYYPqFFMaQsQtunQegQFwzraNo5axVF4zqzg
 h16r0h7tL7dCdWD6H85LvvfjIVl7pdfhXVYGOSb30JRS7k3VOF6WY+w7f
 lUkA1KCehWQgpGjwnEzpdmQ41Pmz8xkwKhE0pQ+CErgM8SqM67zybp1aI A==;
X-CSE-ConnectionGUID: aJmL5dnrQp+FJYalFwVAIQ==
X-CSE-MsgGUID: cJa8hajjS6mtgfQ14T6DVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61792752"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="61792752"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:06:27 -0700
X-CSE-ConnectionGUID: izPH2Zn0QkqE5lsHfL+DpQ==
X-CSE-MsgGUID: 3P0CN06kT9axy2F+r5aMhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="212794412"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:06:26 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_cursor_legacy: Change debug mask to
 reduce log
Date: Tue, 14 Oct 2025 13:53:29 +0530
Message-ID: <20251014082330.2936489-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014082330.2936489-1-sowmiya.s@intel.com>
References: <20251014082330.2936489-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Oct 2025 08:58:12 +0000
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

Set log level to low for subtests that fail due to
disk limit exceeded

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_cursor_legacy.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index ed1c77d55..3eafc0e30 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -2061,6 +2061,7 @@ igt_main
 
 		for (i = 0; i <= flip_test_last; i++) {
 			int j;
+			int flag = 0;
 
 			igt_subtest_f("cursor-vs-flip-%s", modes[i])
 				cursor_vs_flip(&display, i, 50);
@@ -2069,9 +2070,22 @@ igt_main
 				flip_vs_cursor(&display, i, 150);
 
 			for (j = 0; j < ARRAY_SIZE(tests); j++) {
-				igt_subtest_f("%s-%s", tests[j].name, modes[i])
+				igt_subtest_f("%s-%s", tests[j].name, modes[i]) {
+					if (strstr(tests[j].name, "flipA") &&
+					    strstr(modes[i], "atomic-transitions") &&
+						igt_get_connected_output_count(&display) > 2) {
+						flag = 1;
+						update_debug_mask_if_ci(DRM_UT_DRIVER);
+					}
+
 					flip(&display, tests[j].cursor_pipe,
 					     tests[j].flip_pipe, tests[j].timeout, i);
+
+					if (flag == 1) {
+						update_debug_mask_if_ci(DRM_UT_KMS);
+						flag = 0;
+					}
+				}
 			}
 		}
 	}
-- 
2.43.0

