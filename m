Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751EBCD37AC
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 20:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECA410E3EB;
	Thu, 14 May 2026 20:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TateZeRL";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4410E3EB
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 20:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iQaTFfDDmG5a53Zm6CNv5PX9DUoDQMTehvXM7+HMLLY=; b=TateZeRLXZcX8yV8QBdVCLoADE
 z1O23aiwrK84E2GJMWLEYmvyLhPXdgplDpwhY2mz187BDtIEtx/5GTZ+IxOW6q0OolHiTMhAf0nMV
 qZqQvidpX9m8eDNrsVZIwXYP+ghwU5pwO/YgZjI2EpQEqY/eVwth3cyy3lwvCzpxq5IsEr/iXHvig
 lSyGBf11RlDCrFhybRt6LsfdzsHqYnPMY4/NxWZTxy5D0/UB/EcToNqXzCBnRMt06utFlF+yCVTAW
 E0Ds93prscDIRvhx3YECJvZQtbIbEgg6pts7x4vlMlFWhRfguBOGEZjQroLeeVJIsiEMNL0BQVLFj
 xWglCUnA==;
Received: from [189.7.87.67] (helo=prince) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wNcUG-000Dwf-Ne; Thu, 14 May 2026 22:16:53 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t v3 2/5] drm-uapi/v3d: Sync v3d UAPI with drm-next
 (commit 769c153cfc3c)
Date: Thu, 14 May 2026 17:14:54 -0300
Message-ID: <20260514201637.1811428-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514201637.1811428-1-mcanal@igalia.com>
References: <20260514201637.1811428-1-mcanal@igalia.com>
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

Sync the v3d UAPI header with drm-next up to commit 769c153cfc3c. This
will bring the following changes:

769c153cfc3c drm/v3d: Add parameter to retrieve the number of GPU resets per-fd
5774b3cfdedb drm/v3d: Add parameter to retrieve the global number of GPU resets
c6eabbab359c drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
9f8e1c93a0d4 drm/v3d: Expose Super Pages capability

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

