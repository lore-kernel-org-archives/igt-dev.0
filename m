Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3054EC0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 19:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BAB10E430;
	Fri, 31 Jan 2025 19:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zkw9Jv2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233B210E431
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738350055; x=1769886055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AEa1bVIAeSzq+5IXPRkhGB2Js2cCEY4ys1rfqhAjooY=;
 b=Zkw9Jv2jlAfV1IWAFsPUiem1RM9LUPLu8c/NuIwrIzlzfb5UZHgN9eYF
 5emXG6RcJ1EVX7upcIrwUwuQUEB9baQVuTbm+mGLai8EFnqHnBQ+Jqs3/
 gNGnNokFgUN4tkBgRR4DBwGSr5rV9OLCYXroYPKSRxL9uajlAnR2Q66mc
 N3tO8pKAI5NyUK3Wwu1vrBJrV9PTUkqHMk/oBcDvWxPeUMld3krPDUzwk
 OK+O7vSB4Bntcmf1SNzFAUZk/ObMECS9mG76bJpzw6aKzGOVE1kzHASql
 /Yd1j/5XzE5bdJ8qHe1W+Y7WUHP+idNqscGsC8DjgL4i7lAHn5dSxOGb9 Q==;
X-CSE-ConnectionGUID: 38XS30baSIu8FvKZQSFSOg==
X-CSE-MsgGUID: nzHXWnKKRWaQMaxZ345wyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38630668"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38630668"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 11:00:43 -0800
X-CSE-ConnectionGUID: rlNKk6boTPmMLualYeN1pw==
X-CSE-MsgGUID: W/XRsgypQSGqBcS62hCJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114855385"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:00:42 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_atomic: Add necessary checks to ensure
 proper cleanup
Date: Sat,  1 Feb 2025 00:46:12 +0530
Message-Id: <20250131191613.447979-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
References: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
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

Stop CRC and free up CRC resources to prevent memory leaks.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_atomic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 489b0d709..8fb26a079 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -506,6 +506,10 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 					  DRM_FORMAT_XRGB8888,
 					  DRM_FORMAT_MOD_LINEAR,
 					  0.0, 0.0, 1.0, &fb_lower);
+	if (!fb_id_lower) {
+		igt_pipe_crc_stop(pipe_crc);
+		igt_pipe_crc_free(pipe_crc);
+	}
 	igt_assert(fb_id_lower);
 
 	fb_id_upper = igt_create_color_fb(data->drm_fd,
@@ -513,6 +517,10 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 					  DRM_FORMAT_XRGB8888,
 					  DRM_FORMAT_MOD_LINEAR,
 					  1.0, 1.0, 0.0, &fb_upper);
+	if (!fb_id_upper) {
+		igt_pipe_crc_stop(pipe_crc);
+		igt_pipe_crc_free(pipe_crc);
+	}
 	igt_assert(fb_id_upper);
 
 	/*
@@ -560,6 +568,8 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 		igt_plane_set_fb(plane_upper, NULL);
 	}
 
+	igt_pipe_crc_stop(pipe_crc);
+	igt_pipe_crc_free(pipe_crc);
 	igt_remove_fb(data->drm_fd, &fb_ref);
 	igt_remove_fb(data->drm_fd, &fb_lower);
 	igt_remove_fb(data->drm_fd, &fb_upper);
-- 
2.25.1

