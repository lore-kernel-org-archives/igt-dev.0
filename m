Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E989DC53209
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA6010E6CA;
	Mon, 27 Jul 2026 18:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AorILue4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6610F10E6CA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785177998; x=1816713998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tqNbC8AvnyQs+H6BJ/F0cGwUAokmnKXM5vpBNNzSnkA=;
 b=AorILue4qLQUxnHwt82cd8mfTtrRTzge5Oqc/7bZl2eYegD3+VIKTdQR
 h4s/Td2U3016po1ngCSDmskopiry3A8eNEqolWXkGRNTEJXFqt3arl8dM
 ZcWbZjVBAvTdyZ308X8KUKlG1ZgeZu42+6OOQffHpuJIxgXJVHOZzqlO/
 M0OmfJQ7bkhiLq5rT725uXQyzpXdxzH4qhzymdZedr4q0NUQUBqFi4/wc
 pcEFtwBgFc/O7b36p4RaCDZxn7pip758TscCsMV4a2XiZMnTeQJ2srhDN
 G6CJj6WQA547QhB51Ecz8hhHnga3mcrxqNrSkhoA/s6ske3duWg+a6fka A==;
X-CSE-ConnectionGUID: 3i6eUPKkTr+8UjwgZhK50Q==
X-CSE-MsgGUID: zUVVKrBXSiCEIWCUM2L0Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103296107"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="103296107"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:46:38 -0700
X-CSE-ConnectionGUID: 5vKf5ozYReG8xbN9rx60Xg==
X-CSE-MsgGUID: qA76I6evSnK8oEufd/goRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259545273"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:46:37 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/6] tests/kms_color_pipeline: Remove unused color_depth
 and drm_format
Date: Tue, 28 Jul 2026 00:25:30 +0530
Message-Id: <20260727185531.4046807-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260727185531.4046807-1-swati2.sharma@intel.com>
References: <20260727185531.4046807-1-swati2.sharma@intel.com>
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

Remove the data->color_depth and data->drm_format assignments from
run_tests_for_plane() as they are not used anywhere in the color
pipeline test path.

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 2bd6722a7..03c8a0d4b 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -336,9 +336,6 @@ run_tests_for_plane(data_t *data)
 				test_setup(data,
 					   crtc);
 
-				data->color_depth = 8;
-				data->drm_format = DRM_FORMAT_XRGB8888;
-
 				test_plane_colorops(data, crtc,
 						    plane_colorops_tests[i].fb_colors,
 						    plane_colorops_tests[i].exp_colors,
-- 
2.25.1

