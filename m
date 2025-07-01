Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256CCC7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 13:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DC410E5B7;
	Tue,  1 Jul 2025 13:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNTI632/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8910210E5B6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751378001; x=1782914001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xx7T+3zvbr42bggDghVv3scKXmaxGexEcVrICwOGRsc=;
 b=mNTI632/Bct9taXE0w0cOCBl8T9D5G85YSmpooV/1wGjDkYVK4tdLtxK
 cFX5BnJHf3w2Gq4DQxkAKYx7SpDPy+1m/Wfd7TwQOmb1PCqCvzxBJHYSF
 dcrgEypxnbZdKoXbjPAtbPPqS+ha5dQjD51c3YCrNYHdkfvVVT9f9kfeG
 JQd4J+JDvOSMnrYmVORosHrUv1UaLGf3cL226Ikf22ibEuJaZ7DN7+rD1
 RPdMrwnfxj4r3oqC51xrGBAeOZkC/fntJcfuPcP6s/AULIXC2MBsa7dba
 7p+3TFV0arrTnfR/v1iNEq8nAt1mk9anijS1GY7nJCc48bRwFqzZloAcV w==;
X-CSE-ConnectionGUID: 6zLjDvUjRrGMPNSvV0TBqg==
X-CSE-MsgGUID: 4roSwTMqSK6xLvoaf723eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57421130"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57421130"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:53:20 -0700
X-CSE-ConnectionGUID: Ef+qGKpzScWswOSX2sGm8g==
X-CSE-MsgGUID: MLvBGBv8SBCsz1dz//kG5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154504161"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:53:19 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/3] lib/gpgpu_shader: add function for computing max number
 of threads per tg
Date: Tue,  1 Jul 2025 13:53:06 +0000
Message-Id: <20250701135307.68147-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135307.68147-1-jan.maslak@intel.com>
References: <20250701135307.68147-1-jan.maslak@intel.com>
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

Adds function compute_max_threads_per_tg() that computes the maximum
allowed amount of threads in a thread group for XE2-3 platforms.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/gpgpu_shader.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h |  9 +++++++
 2 files changed, 73 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index b83e645e3..7e1d73d72 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -919,3 +919,67 @@ void gpgpu_shader__read_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
 #endif										\n\
 	", lower_32_bits(addr), upper_32_bits(addr));
 }
+
+static uint32_t compute_max_threads_in_tg_no_vrt(bool large_grf_mode,
+						 uint32_t simd_size)
+{
+	if (large_grf_mode) {
+		return 32;
+	} else {
+		if (simd_size == 16)
+			return 64;
+		else if (simd_size == 32)
+			return 32;
+	}
+
+	igt_warn("Unsupported SIMD size %d\n", simd_size);
+	return 1;
+}
+
+static uint32_t compute_max_threads_in_tg_vrt(enum gpgpu_shader_vrt_modes vrt,
+					      uint32_t simd_size,
+					      bool hw_local_id_generation)
+{
+	if (vrt <= VRT_128) {
+		if (simd_size == 16)
+			return 64;
+		else if (simd_size == 32) {
+			if (hw_local_id_generation)
+				return 32;
+			else
+				return 64;
+		}
+	} else if (vrt == VRT_160) {
+		if (simd_size == 16)
+			return 48;
+		else if (simd_size == 32) {
+			if (hw_local_id_generation)
+				return 32;
+			else
+				return 48;
+		}
+	} else if (vrt == VRT_192) {
+		if (simd_size == 16)
+			return 40;
+		else if (simd_size == 32) {
+			if (hw_local_id_generation)
+				return 32;
+			else
+				return 40;
+		}
+	}
+
+	igt_warn("Unsupported VRT mode %d or SIMD size %d\n", vrt, simd_size);
+	return 1;
+}
+
+uint32_t compute_max_threads_in_tg(enum gpgpu_shader_vrt_modes vrt, bool large_grf_mode,
+				   uint32_t simd_size, bool local_id_generation)
+{
+	if (vrt == VRT_DISABLED) {
+		return compute_max_threads_in_tg_no_vrt(large_grf_mode, simd_size);
+	} else {
+		return compute_max_threads_in_tg_vrt(vrt, simd_size,
+						     local_id_generation);
+	}
+}
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index 411ad6292..b4db48b32 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -14,7 +14,12 @@ struct intel_bb;
 struct intel_buf;
 
 enum gpgpu_shader_vrt_modes {
+	VRT_32 = 0x0,
+	VRT_64 = 0x1,
 	VRT_96 = 0x2,
+	VRT_128 = 0x3,
+	VRT_160 = 0x4,
+	VRT_192 = 0x5,
 	VRT_DISABLED,
 };
 
@@ -103,4 +108,8 @@ void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
 			    uint32_t dw_offset, uint32_t value);
 void gpgpu_shader__loop_begin(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__loop_end(struct gpgpu_shader *shdr, int label_id, uint32_t iter);
+
+uint32_t compute_max_threads_in_tg(enum gpgpu_shader_vrt_modes vrt, bool large_grf_mode,
+				   uint32_t simd_size, bool local_id_generation);
+
 #endif /* GPGPU_SHADER_H */
-- 
2.34.1

