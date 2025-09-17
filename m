Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F6CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 17:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B4E10E1D4;
	Wed, 17 Sep 2025 17:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVB1+eXz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A787110E061
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758128641; x=1789664641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zfLvp6PvHEYbzE2VV/dx5BXCQjFcbsaL1QU/AA8f0VA=;
 b=hVB1+eXz29Di3mu2s7LzXktJvAO+mnWKor9IWKAuEZ1daTe5zd+ZJhWY
 3UsGMjwkUPowf1vYfkiCGS2jtlSn67oyKNgMMcsDL8nh8UVmY/5DxvQHq
 JckxXIWgyNFFtqnUwlG50Nt1Bu8S4BOmnUoMFLbT297IW/FwTDSQfQQmf
 3nXz1R8sUDM2z70fFJud0rt5tAApv/KD5ohoQ1o1m0HPCAI0+sDVhL6ZI
 ySqW4leR6TzqXip6vWkr6/j4J70R+bLQQHrUJNdgrmarNvLcQgjqyA9Qe
 F9e7EGct+E54d/UlOOKnhRIYSVkZpMZZxA6y9SKpd/XTzOOPkT8XjiZTn w==;
X-CSE-ConnectionGUID: O2NJb5rfTLOJ43MA3uDSAg==
X-CSE-MsgGUID: BjDgbv+YRq6cjrcA1+6j6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71073532"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71073532"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:55:59 -0700
X-CSE-ConnectionGUID: z4pDj851Qm6t6c6/FGxXZQ==
X-CSE-MsgGUID: OwIWkdshT4SxidbSxLawnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="212449753"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:55:56 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, andrzej.hajda@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/4] lib/gpgpu_shader: add function for computing max number
 of threads per tg
Date: Wed, 17 Sep 2025 16:55:39 +0000
Message-Id: <20250917165541.85203-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917165541.85203-1-jan.maslak@intel.com>
References: <20250917165541.85203-1-jan.maslak@intel.com>
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

Adds function gpgpu_shader__get_max_threads_in_tg() that computes the
maximum allowed amount of threads in a thread group based on the provided
shader.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/gpgpu_shader.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h | 10 +++++++
 2 files changed, 85 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index e8600de23..39908c491 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -282,6 +282,9 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
 	shdr->code = malloc(4 * shdr->max_size);
 	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
 	shdr->num_threads_in_tg = 1;
+	shdr->large_grf_mode = false;
+	shdr->simd_size = 16;  /* Default SIMD size */
+	shdr->hw_local_id_generation = false;
 	shdr->vrt = VRT_DISABLED;
 	igt_assert(shdr->code);
 
@@ -333,6 +336,78 @@ void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes
 	shdr->vrt = vrt;
 }
 
+static uint32_t compute_max_threads_in_tg_no_vrt(bool large_grf_mode,
+						 uint32_t simd_size)
+{
+	/* BSpec: 56590 */
+	if (large_grf_mode)
+		return 32;
+	if (simd_size == 16)
+		return 64;
+	if (simd_size == 32)
+		return 32;
+
+	igt_warn("Unsupported SIMD size %d\n", simd_size);
+	return 1;
+}
+
+static uint32_t compute_max_threads_in_tg_vrt(enum gpgpu_shader_vrt_modes vrt,
+					      uint32_t simd_size,
+					      bool hw_local_id_generation)
+{
+	/* BSpec: 56590 */
+	if (vrt <= VRT_128) {
+		if (simd_size == 16)
+			return 64;
+		if (simd_size == 32) {
+			if (hw_local_id_generation)
+				return 32;
+			else
+				return 64;
+		}
+	} else if (vrt == VRT_160) {
+		if (simd_size == 16)
+			return 48;
+		if (simd_size == 32) {
+			if (hw_local_id_generation)
+				return 32;
+			else
+				return 48;
+		}
+	} else if (vrt == VRT_192) {
+		if (simd_size == 16)
+			return 40;
+		if (simd_size == 32) {
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
+/**
+ * gpgpu__shader_get_max_threads_in_tg:
+ * @shdr: shader to query
+ *
+ * Returns the maximum number of threads in thread group for the given shader
+ * based on its current configuration (VRT mode, SIMD size, etc.).
+ *
+ * Returns: maximum number of threads in thread group
+ */
+uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr)
+{
+	if (shdr->vrt == VRT_DISABLED) {
+		return compute_max_threads_in_tg_no_vrt(shdr->large_grf_mode, shdr->simd_size);
+	} else {
+		return compute_max_threads_in_tg_vrt(shdr->vrt, shdr->simd_size,
+						     shdr->hw_local_id_generation);
+	}
+}
+
 /**
  * gpgpu_shader__breakpoint_on:
  * @shdr: shader to create breakpoint in
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index 90ef3eec8..be84525ce 100644
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
 
@@ -29,6 +34,9 @@ struct gpgpu_shader {
 	struct igt_map *labels;
 	bool illegal_opcode_exception_enable;
 	uint32_t num_threads_in_tg;
+	bool large_grf_mode;
+	uint32_t simd_size;
+	bool hw_local_id_generation;
 	enum gpgpu_shader_vrt_modes vrt;
 };
 
@@ -72,6 +80,8 @@ static inline uint32_t gpgpu_shader_last_instr(struct gpgpu_shader *shdr)
 
 void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes vrt);
 
+uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr);
+
 void gpgpu_shader__wait(struct gpgpu_shader *shdr);
 void gpgpu_shader__breakpoint_on(struct gpgpu_shader *shdr, uint32_t cmd_no);
 void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr);
-- 
2.34.1

