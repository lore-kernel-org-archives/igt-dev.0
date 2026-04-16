Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F35F8D770
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7E110E16B;
	Thu, 16 Apr 2026 19:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imdlsSb+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4667610E209
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776367127; x=1807903127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z4nFWMwm6EGXGrcN/BXR2uFZmEnIY+Ncw5ydKBYDwRA=;
 b=imdlsSb+q63etBOVx7gyuy3CzsL4HMgQIeyAzGxZju6o9ALrwb4Apo9N
 WeD1wYMc2ZjqrgAIUFl5B5R+okLHiBxKXY4MWYGMv+/oXZY5j9LUTqYkF
 jg6pIPvzUSAr3zgfNsV6NKW7CGKlg+P6rNO7bJChcI7WMAKXBSdFcofvj
 8ycYcHW5UUtiyhOhuc985JKPZiWQ+D2v81E6L3lAb3ORNm+xKoouxbRWW
 Yjifxl8B9W+Q6gS0SLbMo8Z0sGDtBZaMB8HuvG04TM2KvthzO2Qnhv2tm
 vaROKyclJERjDCFzU6yCzjfWEVzF4PTmqg3w/0yJj/aFoomkyO+DxNQwx Q==;
X-CSE-ConnectionGUID: RmcE7lHTR5i7CRRn7Kcssg==
X-CSE-MsgGUID: a9VTttW9QEexBwYtzIgqLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81260630"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81260630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:18:28 -0700
X-CSE-ConnectionGUID: Fim4+OXDS0WAfxjrV7F12A==
X-CSE-MsgGUID: zLHSCaIYSYmq0P3Gtpui/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229818035"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:18:27 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH,
 v2 5/5] tests/kms_color_pipeline: Remove unused color_depth and
 drm_format
Date: Fri, 17 Apr 2026 00:57:00 +0530
Message-Id: <20260416192700.1579042-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416192700.1579042-1-swati2.sharma@intel.com>
References: <20260416192700.1579042-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Co-developed-by: Claude Opus 4.6
---
 tests/kms_color_pipeline.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 6cc5e9bfc..5e9a63551 100644
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

