Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5355CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FFF10E058;
	Tue, 12 May 2026 12:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q34JWHk+";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F0E10E058
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DE0Wa0BjsYUMc+Y/NiMSE+wTgPLFCpPm8je1s/eIL/I=; b=q34JWHk+gIx8ZQVqbifOq2uNCh
 3OdU4s+T7G41GfpGpkhaTUHNGiW4Qu8Ot8QrnF9A1MuAgqn+Ri6yHNJt+6/bYb6AovYsrW5jLAM43
 GkkgyDzoknZryyI3CTVKN5Zmt3l9f7j5HnKqbzSiiRIy7mWrj1ElVhBrQaAKCR94uhQTThq6EOtWA
 fg6WwB57X663QpgSlRNMiFzGdmvnNLIJAunG/ji3liwaFYIg015rOd60goaVQb2/HQRQCVisbaRBE
 yRm2hlfl9QI4fqtyaz79eMiz9rZcO2hGlzXyeJhOgpWqD8Ga+5rZB1CgEGOBYHbqki6BD6X5sSJMt
 sVzkrSVw==;
Received: from [189.7.87.67] (helo=prince) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMmK1-009Sqa-4Q; Tue, 12 May 2026 14:34:48 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t v2 2/5] drm-uapi/v3d: Sync v3d UAPI
Date: Tue, 12 May 2026 09:29:47 -0300
Message-ID: <20260512123408.1115589-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512123408.1115589-2-mcanal@igalia.com>
References: <20260512123408.1115589-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Update the UAPI header to expose support to a new ioctl:
DRM_IOCTL_V3D_PERFMON_SET_GLOBAL. Sync the v3d UAPI with Linux 7.0.

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 include/drm-uapi/v3d_drm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm-uapi/v3d_drm.h b/include/drm-uapi/v3d_drm.h
index 87fc5bb0a..d9b01f4c3 100644
--- a/include/drm-uapi/v3d_drm.h
+++ b/include/drm-uapi/v3d_drm.h
@@ -43,6 +43,7 @@ extern "C" {
 #define DRM_V3D_PERFMON_GET_VALUES                0x0a
 #define DRM_V3D_SUBMIT_CPU                        0x0b
 #define DRM_V3D_PERFMON_GET_COUNTER               0x0c
+#define DRM_V3D_PERFMON_SET_GLOBAL                0x0d
 
 #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
 #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
@@ -61,6 +62,8 @@ extern "C" {
 #define DRM_IOCTL_V3D_SUBMIT_CPU          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CPU, struct drm_v3d_submit_cpu)
 #define DRM_IOCTL_V3D_PERFMON_GET_COUNTER DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_COUNTER, \
 						   struct drm_v3d_perfmon_get_counter)
+#define DRM_IOCTL_V3D_PERFMON_SET_GLOBAL  DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_PERFMON_SET_GLOBAL, \
+						   struct drm_v3d_perfmon_set_global)
 
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
 #define DRM_V3D_SUBMIT_EXTENSION		  0x02
@@ -290,6 +293,9 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
 	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
 	DRM_V3D_PARAM_MAX_PERF_COUNTERS,
+	DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES,
+	DRM_V3D_PARAM_GLOBAL_RESET_COUNTER,
+	DRM_V3D_PARAM_CONTEXT_RESET_COUNTER,
 };
 
 struct drm_v3d_get_param {
@@ -765,6 +771,21 @@ struct drm_v3d_perfmon_get_counter {
 	__u8 reserved[7];
 };
 
+#define DRM_V3D_PERFMON_CLEAR_GLOBAL    0x0001
+
+/**
+ * struct drm_v3d_perfmon_set_global - ioctl to define a global performance
+ * monitor
+ *
+ * The global performance monitor will be used for all jobs. If a global
+ * performance monitor is defined, jobs with a self-defined performance
+ * monitor won't be allowed.
+ */
+struct drm_v3d_perfmon_set_global {
+	__u32 flags;
+	__u32 id;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.54.0

