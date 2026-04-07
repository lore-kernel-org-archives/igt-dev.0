Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305FCFD5F88
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 08:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C787F10E47D;
	Wed,  8 Apr 2026 08:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ntMzrV8H";
	dkim-atps=neutral
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0AD89AAE
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 20:30:13 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-2c54c68db4dso10853231eec.0
 for <igt-dev@lists.freedesktop.org>; Tue, 07 Apr 2026 13:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775593813; x=1776198613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fJMPZXyp+50Ngx9yDYd3Y2SpkvXFFTACuCGoLGP7MIA=;
 b=ntMzrV8H3yzUB2xg+oEgLARA3qkdKnOVqHENU8EJtra+TCra/exWVdLUuR5th/uRCl
 jobdh9bSw/FTef31OnYRFrSCtn1IgxSMd6L7lJUghb2sO30uRtWtJuWFVUyCSU2bnHcT
 dOkKRq4V5IAR428iAdN+w5r1S3vKwaXr5FHeHvGkCVHlmym4KqQWsSkrcnlKKbWQyKmw
 HYcelj9u2YTbbFelQIe0akkEY6D6LRk4JggoMCFyZPIO/YTVdl0jt9tByCTp8heRIT/Y
 5dS0QnsGEsE8wBnReLbHBjagpAXpdi+/ftV6bkXyHFKFfjMFiIxczgzJ4X4V9vLg9ZJQ
 x0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775593813; x=1776198613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJMPZXyp+50Ngx9yDYd3Y2SpkvXFFTACuCGoLGP7MIA=;
 b=hmpXfydoFTbl7RHO2Nk5P/6FzeHqMOLYwecorYtMH1uxW/eZUXZ/4X978P9ad6EHDg
 UsHXAMzqlWGQd4Pk5CN0RE56DXUqBh5aQIScxFxJx9aI2F/iFPQGWomnrqYYYMRvxZy3
 fS7lYQumTTV/SrKcUYgRicQDqM3CqfKuXo9wEh+kBmhC5TEUknlfmLxLzGUtfjA3cidS
 64p0Xd2x/hNFFHEDIXrq/2akjvPVRygAdS6WYNIwgGjp1oX3gH/9dmQaVf35cJDqlnlL
 VqBbCDO1XA5gwXL1l/Bgfps/jyLg4FB1P4/JGz6oQxuPg4OaYMv9xqMRODo/99ESIZDO
 hJMw==
X-Gm-Message-State: AOJu0YzMkJpypdw3WVFyyZe1WQbBvtd2jrH+KRA0ZoCZFMx7bN66fdCu
 U1bMoq3Hjsk7HnfMXZeeZE9UdVD1qQE2BXOWRyh7AVhtmCF1lKVCPdC69VNhQO8NnYE=
X-Gm-Gg: AeBDiesBbdZ9nwy2WRi7ivsXAQuSnkOTu32vLBlouo1FBAdRGbctyxF08sJK/lfqmD2
 vpzGrbN4gDc2CRqlsTQlGuZQThM0dP9PKvakXKa0obBA45XVZI0tx4+sXbE4pP+rL+9LGFCicbK
 aBkNjkqYDBxQxnZfYOQGXI0o8zQQpmQf9VW6zqAteLZrT+SWRE4RzROj8TuAGn+5UNVcilj+3K+
 lp43ZX+NrtOEqE1NtF8wrKfA7xF0NKtEVbt4COpNvdU6L5FvE96RxPyt+hRfR4ngVdwQioL78lJ
 11wIsDJcq29h8AJWdJBLpCIW8/U0sbDKWcj66l+eqbYV0aMg35//fJbrUA/ka2se+rvEateYwL3
 DgZodz6jgPt2yfGz2YhDxSGJC6T9OSi3KNQY+YPCt4coF2mN0pZu0ITebehgd5YKJuOu06HVuNZ
 dzGBnX5CFl8Ndv3vjdvWMbytoOeYP0vrejUMOW0/JdSmUGo4S0Jp9ktPUKOZRN/TRsPxH6
X-Received: by 2002:a05:693c:40c2:b0:2ce:3aa1:d39b with SMTP id
 5a478bee46e88-2ce3aa1d9d2mr5255607eec.20.1775593812429; 
 Tue, 07 Apr 2026 13:30:12 -0700 (PDT)
Received: from hu-hdhatt-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2cc6e17e0bdsm14532675eec.31.2026.04.07.13.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 13:30:12 -0700 (PDT)
From: Harshdeep Dhatt <harshdeepdhatt@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: rob.clark@oss.qualcomm.com,
	Harshdeep Dhatt <harshdeepdhatt@gmail.com>
Subject: [PATCH i-g-t] lib/igt_kms: Identify writeback connectors in msm
 driver on android
Date: Tue,  7 Apr 2026 13:29:52 -0700
Message-ID: <20260407202953.3871752-1-harshdeepdhatt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Apr 2026 08:20:00 +0000
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

The msm drm driver that runs on android platforms sets up its writeback
connectors as DRM_MODE_CONNECTOR_VIRTUAL instead of DRM_MODE_CONNECTOR_WRITEBACK.
This means when setting up the drm resources, these connectors get exposed
to userspace even though userspace has not explicitly asked for writeback
connectors. These connectors are by default in the connected state. When we
try to configure one of the crtc's for this output (to get the primary plane),
the msm driver bails because this connector (being a writeback connector)
doesn't have an output framebuffer assigned to it. To avoid this failure, get the
correct property id for setting up the output framebuffer id for writeback connectors
as defined by the msm driver on android. Allocate and bind a dummy output fb for
these connectors.

Signed-off-by: Harshdeep Dhatt <harshdeepdhatt@gmail.com>
---
 lib/drmtest.c |  5 +++++
 lib/drmtest.h |  1 +
 lib/igt_kms.c | 28 ++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..2e6895618 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -143,6 +143,11 @@ bool is_msm_device(int fd)
 	return __is_device(fd, "msm");
 }
 
+bool is_msm_android_device(int fd)
+{
+	return __is_device(fd, "msm_drm");
+}
+
 bool is_nouveau_device(int fd)
 {
 	/* Currently all nouveau-specific codepaths require libdrm */
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 37874d729..c042a2b20 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -147,6 +147,7 @@ bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
 bool is_msm_device(int fd);
+bool is_msm_android_device(int fd);
 bool is_nouveau_device(int fd);
 bool is_vc4_device(int fd);
 bool is_xe_device(int fd);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 04b1f3972..3948426bc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -950,6 +950,14 @@ igt_atomic_fill_connector_props(igt_display_t *display, igt_output_t *output,
 	for (i = 0; i < props->count_props; i++) {
 		drmModePropertyPtr prop =
 			drmModeGetProperty(fd, props->props[i]);
+		/*
+		 * msm android driver installs writeback fb id as a custom property which can be
+		 * identified by "FB_ID" string
+		 */
+		if (is_msm_android_device(fd) && (!strcmp("FB_ID", prop->name))) {
+			output->props[IGT_CONNECTOR_WRITEBACK_FB_ID] = props->props[i];
+			continue;
+		}
 
 		for (j = 0; j < num_connector_props; j++) {
 			if (strcmp(prop->name, conn_prop_names[j]) != 0)
@@ -1003,6 +1011,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
 	int drm_fd = output->display->drm_fd;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
+	struct igt_fb out_fb = {0};
 	igt_plane_t *plane = NULL;
 	uint32_t crtc_id;
 	int i;
@@ -1016,6 +1025,23 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
 
 	crtc_id = crtc->crtc_id;
 
+	/*
+	 * msm android driver exposes writeback connectors as DRM_MODE_CONNECTOR_VIRTUAL and not
+	 * DRM_MODE_CONNECTOR_WRITEBACK. The driver will bail if the output fb is not specified for
+	 * this connector. Hence, allocate a dummy output fb here and assign it to the connector.
+	 */
+	if (is_msm_android_device(drm_fd) && igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID)) {
+		igt_require(igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_MOD_NONE,
+			&out_fb) == 0);
+		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, out_fb.fb_id);
+		igt_assert(drmModeConnectorSetProperty(drm_fd, output->id,
+			output->props[IGT_CONNECTOR_WRITEBACK_FB_ID],
+			output->values[IGT_CONNECTOR_WRITEBACK_FB_ID]) == 0);
+	}
+
+
 	/*
 	 * Do a legacy SETCRTC to start things off, so that we know that
 	 * the kernel will pick the correct primary plane and attach it
@@ -1039,6 +1065,8 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
 
 	/* Removing the FB will also shut down the display for us: */
 	igt_remove_fb(drm_fd, &fb);
+	if (out_fb.fb_id != 0)
+		igt_remove_fb(drm_fd, &out_fb);
 	igt_assert_f(plane, "Valid assigned primary plane for CRTC_ID %d not found.\n", crtc_id);
 
 	return plane;
-- 
2.43.0

