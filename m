Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC48C3ABAA
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 10:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1676810E438;
	Tue, 29 Apr 2025 10:37:03 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32FB10E439
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 10:37:01 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id C7FEF36A0007; Tue, 29 Apr 2025 16:06:59 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 "Prosyak@sunil.khatri"@amd.com, Vitaly <Vitaly.Prosyak@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v2 2/5] lib/amdgpu: add func to read the userqueue support
Date: Tue, 29 Apr 2025 16:06:50 +0530
Message-ID: <20250429103653.190107-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429103653.190107-1-sunil.khatri@amd.com>
References: <20250429103653.190107-1-sunil.khatri@amd.com>
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

The function asic_userq_readiness read the userq_ip_mask
value set by the kernel which says which ip supports
userqueues on this asic.

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 17 +++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index d6764194d..b8227ba2b 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -976,6 +976,23 @@ is_rings_available(amdgpu_device_handle device_handle, uint32_t mask,
 	return  hw_ip_info.available_rings & mask;
 }
 
+void asic_userq_readiness(amdgpu_device_handle device_handle, bool arr[AMD_IP_MAX])
+{
+	int r, i;
+	enum amd_ip_block_type ip;
+	struct drm_amdgpu_info_device dev_info = {0};
+
+	r = amdgpu_query_info(device_handle, AMDGPU_INFO_DEV_INFO,
+			      sizeof(dev_info), &dev_info);
+	igt_assert_eq(r, 0);
+
+	if (!dev_info.userq_ip_mask)
+		return;
+
+	for (i = 0, ip = AMD_IP_GFX; ip < AMD_IP_MAX; ip++)
+		arr[i++] = dev_info.userq_ip_mask & (1 << ip);
+}
+
 /**
  * asic_rings_readness:
  * @device handle: handle to driver internal information
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 7d48f9107..3c2ecd1ba 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -268,6 +268,8 @@ amdgpu_open_devices(bool open_render_node, int max_cards_supported, int drm_amdg
 void
 asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask, bool arr[AMD_IP_MAX]);
 
+void asic_userq_readiness(amdgpu_device_handle device_handle, bool arr[AMD_IP_MAX]);
+
 bool
 is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struct pci_addr *pci);
 
-- 
2.43.0

