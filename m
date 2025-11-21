Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5F2CFA474
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27B410E071;
	Fri, 21 Nov 2025 05:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Evtk6CN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0738810E071
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763703660; x=1795239660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2mRWFy6DUE+mZp4DdeEx5yrpJEcwP/vJsfvOeMD9R9Y=;
 b=Evtk6CN6ucZi9SIpeD04WqBpVVDuy0cTXvmVOInz7tXvRdLR+7kHkUjd
 p6V+L0xu5BxpFUxO7wLGX1OhPhZP+dN/1WU+jEB7rgoZJu+piunWNLLu7
 quY7Dvpt4Hwr1SqyXAmY4cCqo0PIHWehc1j722J6nb3kuujCzJFABQPD4
 r92NQaB1gLh2TF1lBIPVmOzFsfTahjZErF+0Z0feGvgGgSQbWfjVtkmyd
 Q52GiKIWgnDCKueBWyZIiVOePkyQ6Wo0mmE3PGBdEMN4I+Z2kOOQAMM+6
 ijfnV8ai0vhw5IK0NyxNRmDY+fze2HWwOd9750n3wBT0KMVPRO+HajrGZ Q==;
X-CSE-ConnectionGUID: 91RaFkGzQ9SLuoTj+j5bkw==
X-CSE-MsgGUID: g9cEGySRQYuAMqK0yrvzPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69658150"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="69658150"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:00 -0800
X-CSE-ConnectionGUID: H4YZ1BFET9etiT5MC2sphQ==
X-CSE-MsgGUID: gGGzutVETT2E0OvmSN/1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="214961826"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:40:58 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 06/12] tests/kms_writeback: Add utility function for
 shared logic
Date: Fri, 21 Nov 2025 11:28:33 +0530
Message-ID: <20251121055839.3116906-7-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121055839.3116906-1-sowmiya.s@intel.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
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

Extracted framebuffer creation logic into a separate
function to enable reuse across multiple subtests

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 46fada8b8..d031a9f54 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -508,6 +508,25 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
+static void create_fbs(igt_display_t *display, igt_fb_t *input_fb, igt_fb_t *output_fb,
+		       uint32_t format, drmModeModeInfo *mode)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay,
+			      mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      input_fb);
+	igt_assert(fb_id >= 0);
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      output_fb);
+	igt_assert(fb_id >= 0);
+}
+
 static igt_output_t *list_writeback_modes(igt_display_t *display)
 {
 	for (int i = 0; i < display->n_outputs; i++) {
-- 
2.43.0

