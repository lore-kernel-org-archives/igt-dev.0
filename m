Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC9BC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 10:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D614310E432;
	Tue, 29 Apr 2025 10:20:59 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8DE10E435
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 10:20:58 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id E7EC536A0008; Tue, 29 Apr 2025 15:50:54 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 "Prosyak@sunil.khatri"@amd.com, Vitaly <Vitaly.Prosyak@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v1 1/4] drm-uapi/amdgpu: add UAPI query if user queues are
 supported
Date: Tue, 29 Apr 2025 15:50:50 +0530
Message-ID: <20250429102053.183188-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
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

Add UAPI support of userq mask of ip's supporting userqueues on a
asic.

The changes have been pulled from below kernel commit.
https://lists.freedesktop.org/archives/amd-gfx/2025-April/122559.html

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 3f4813879..ddcda5d3b 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1446,6 +1446,9 @@ struct drm_amdgpu_info_device {
 	__u32 csa_size;
 	/* context save area base virtual alignment for gfx11 */
 	__u32 csa_alignment;
+	/* Userq IP mask (1 << AMDGPU_HW_IP_*) */
+	__u32 userq_ip_mask;
+	__u32 pad;
 };
 
 struct drm_amdgpu_info_hw_ip {
-- 
2.43.0

