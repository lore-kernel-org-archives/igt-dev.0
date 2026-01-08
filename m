Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F3FD1D47C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACCE10E783;
	Thu,  8 Jan 2026 15:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gft0i3mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC7710E783
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767886099; x=1799422099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AMHbYTGnUoNv9AEp6MrVjRI0aUBcfUjK0s2kF/oMp4c=;
 b=Gft0i3mjakD9K8wkl+JVi6Ml8o5Z5dV/XzUG8MNN2Zp5qz4jfZoHgkIA
 1l9dQju1oTO/9Lsjs6T93y+L/6SVzq5ltBnWXKvc7Ap/R2opGVB6vHPq1
 aLc8RTSO7uCmqXmwnNpuIq4OkkEPhQCi4AKoPfetPsIq5TVmTb+WcV4m4
 Rf2C8w4tbSlT+0Rjfa8tql4zsUBqtE/v+LLR7wAU4u2ECpIx9Q8aa3uZF
 4e3UkI0QJUcXxg2m8lrQ4smMp/z883sjcelqsmsbHyl6gOyimFFs4bPKE
 rz5q1kEntxGwYvWyYTJZ6B/EFyl3KRCcKYiysdaAbuJ5MxET3knIFGvyJ A==;
X-CSE-ConnectionGUID: 115E+efRSum9L/ovZSQLlA==
X-CSE-MsgGUID: k8O1EXCmRE6XyS+zINkShw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80374882"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80374882"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:19 -0800
X-CSE-ConnectionGUID: Q8YUDH3sQrC+tjpOU07BGg==
X-CSE-MsgGUID: TjXoLhuNSg2+vwVcaB77Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="234402887"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:17 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 3/6] tests/kms_writeback: Add intel check for
 vendor-specific restriction
Date: Thu,  8 Jan 2026 21:18:14 +0530
Message-ID: <20260108154817.48665-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108154817.48665-1-sowmiya.s@intel.com>
References: <20260108154817.48665-1-sowmiya.s@intel.com>
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

Add intel checks for vendor specific restriction.
Disallow empty FB as writeback FB only for Intel.

v4: Restore drm_fd added in struct and access it from
    igt_display_t struct (Suraj)
v5: Revise commit message and subject with detailed
    explanation. (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 691774777..defe43686 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -291,7 +291,7 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 
 	/* Zero WRITEBACK_FB_ID */
 	ret = do_writeback_test(output, 0, NULL, false);
-	igt_assert_eq(ret, 0);
+	igt_assert_eq(ret, is_intel_device(output->display->drm_fd) ? -EINVAL : 0);
 
 	/* Valid output buffer */
 	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
@@ -406,7 +406,8 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 
 	/* Two commits, the second with no writeback */
 	out_fbs[0] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
+	if (!is_intel_device(output->display->drm_fd))
+		writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	/* Two commits, both with writeback */
 	out_fbs[1] = output_fb;
-- 
2.43.0

