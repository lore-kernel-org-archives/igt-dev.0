Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E78D11183
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 13:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB52C10E756;
	Thu, 27 Nov 2025 13:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzGDubqJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8F110E74F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764251659; x=1795787659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VrjTp1BZfJKtak9SQ30/DqNbadbrg9LQII2KX9TVXj0=;
 b=WzGDubqJ5zTMH08CIAubSMJe//us1B9eHZIz6xcQAk4N4C+98d26zlxd
 dGnSAag1noSfQ1GopnXfNiqng8B+b8+XXnaqiCGEmZCcnkQeLYZM4Z0nI
 M6gsuDYnai6vaNWgwbuT2Z0sEJco2gjFW3qao7uFmvkgZFDui/Zf/N6m3
 QRjW+rdwz7eKYZdgv2VzDzkVeTSv9oOFoZkrkDiBCnIh9XC5HIiPwgvgN
 KVE2WFj+Utwjj3BZV63Y3U7UileVsxKUeOatfaxQ1Bj2UcDyXFJ4yPrLK
 m1RxlhV18j+jK8WG4zVGVuiykn6bF1LsZrmw9aghlToAy+Q2VskCSb8r8 w==;
X-CSE-ConnectionGUID: Xp8kQlR8TSmLsgxok8c0LQ==
X-CSE-MsgGUID: I+5NO6R9St2NAJFlD3HTyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77400865"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77400865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 05:54:19 -0800
X-CSE-ConnectionGUID: ZGWKSDzxSUOG74qlFnwUQQ==
X-CSE-MsgGUID: o+Z63VqGS1ux7x9yf8TErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="192496087"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 05:54:17 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Add helper to measure vblank delay
 in simulation
Date: Thu, 27 Nov 2025 19:23:47 +0530
Message-ID: <20251127135348.2158579-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127135348.2158579-1-ramanaidu.naladala@intel.com>
References: <20251127135348.2158579-1-ramanaidu.naladala@intel.com>
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

Introduce a new helper function that determines the number of vblank
sequence increments occurring within a single wait-for-vblank
interval when operating in a simulation environment.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_kms.c | 25 +++++++++++++++++++++++++
 lib/igt_kms.h |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8973ffdb2..19d095242 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -770,6 +770,31 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
 	return rotations;
 }
 
+/*
+ * kmstest_simu_vblank_seq_diff:
+ * @fd: Opened drm file descriptor
+ * @pipe: Display pipe
+ *
+ * Measure how many vblank sequence increments occur during a single
+ * igt_wait_for_vblank() interval in simulation environment.
+ *
+ * Returns:
+ *	- On real hardware: 0
+ *	- In simulation: Number of vblank sequence increments elapsed.
+ */
+uint32_t kmstest_simu_vblank_seq_diff(int fd, uint32_t pipe)
+{
+	uint32_t vb_seq_start, vb_seq_end;
+
+	if (!igt_run_in_simulation())
+		return 0;
+	vb_seq_start = kmstest_get_vblank(fd, pipe, 0);
+	igt_wait_for_vblank(fd, pipe);
+	vb_seq_end = kmstest_get_vblank(fd, pipe, 0);
+
+	return  vb_seq_end - vb_seq_start;
+}
+
 /*
  * Retrieve all the properties specified in props_name and store them into
  * plane->props.
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f7ff0b17e..691c093f6 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -316,7 +316,7 @@ void kmstest_dumb_destroy(int fd, uint32_t handle);
 void kmstest_wait_for_pageflip(int fd);
 void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
 unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
-
+uint32_t kmstest_simu_vblank_seq_diff(int fd, uint32_t pipe);
 bool kms_has_vblank(int fd);
 
 /*
-- 
2.43.0

