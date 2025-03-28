Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B306C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73E110E9A8;
	Fri, 28 Mar 2025 08:24:38 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375A810E9A6
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:36 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OWQI1470030; Fri, 28 Mar 2025 13:54:32 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OWZ61470029;
 Fri, 28 Mar 2025 13:54:32 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 13/19] drm-uapi/amdgpu: sync with drm-next
Date: Fri, 28 Mar 2025 13:54:10 +0530
Message-Id: <20250328082416.1469810-13-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
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

Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")

Adds a new subquery (AMDGPU_INFO_UQ_FW_AREAS) in
AMDGPU_INFO_IOCTL to get the size and alignment of shadow
and csa objects from the FW setup. This information is
required for the userqueue consumers.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index fed39c9b4..8108c0c8a 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1439,6 +1439,27 @@ struct drm_amdgpu_info_hw_ip {
 	__u32  ip_discovery_version;
 };
 
+/* GFX metadata BO sizes and alignment info (in bytes) */
+struct drm_amdgpu_info_uq_fw_areas_gfx {
+	/* shadow area size */
+	__u32 shadow_size;
+	/* shadow area base virtual mem alignment */
+	__u32 shadow_alignment;
+	/* context save area size */
+	__u32 csa_size;
+	/* context save area base virtual mem alignment */
+	__u32 csa_alignment;
+};
+
+/* IP specific metadata related information used in the
+ * subquery AMDGPU_INFO_UQ_FW_AREAS
+ */
+struct drm_amdgpu_info_uq_fw_areas {
+	union {
+		struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
+	};
+};
+
 struct drm_amdgpu_info_num_handles {
 	/** Max handles as supported by firmware for UVD */
 	__u32  uvd_max_handles;
-- 
2.43.0

