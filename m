Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24E8D37496
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721AD10EBA3;
	Fri,  5 Dec 2025 19:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lz5v6FBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C903110EBA3
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963983; x=1796499983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cAYRYZSZrLziWcK3R5P80Dpqv2rFWU0PPAxXQzx4X6o=;
 b=Lz5v6FBs84zgIPXkW6+V/4CUl81SuGyg/MltEpd+hu8S9nyhyw+rbZWR
 9aZ/q44EZ1Djiq2BpAsXcrPx3NrVS9j/4/UIaUSQi0RsB1fk3nfTGNBAx
 m27yfXTOf4ypEJTZfzMjfPSYqSXgwNGsqz+5sPKlfK0EjmCdiJkYsSNj1
 yrgmWSjxv2QLfbJuJMcijVEg7Xvar1NNeHH2q8qDeH2RzqPoBVCaGC9Kk
 4VvbMvfam40SGXJ9NxkLP3WeIXw4wLYZ4zQOjVUwr+i3Be75Bn2pZsp8k
 PSad6z0OjNLvdtRcKilNW8IYy4g5wbh24bpNvXYbYtA1vfi2PVRMu8YNX A==;
X-CSE-ConnectionGUID: NYElnWo+RkW9lqE52fXavQ==
X-CSE-MsgGUID: uU7ApTDZSOur+sl2sU9/uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606656"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606656"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:23 -0800
X-CSE-ConnectionGUID: rOM9Mbg4QCeFGYKgBv9vrQ==
X-CSE-MsgGUID: Pi+nVePJRbqyvO2k3k/Mmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624878"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:21 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 04/13] tests/kms_color_helper: Add helper to convert coefficients
 to drm_color_lut32
Date: Sat,  6 Dec 2025 01:23:03 +0530
Message-Id: <20251205195312.1234330-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205195312.1234330-1-swati2.sharma@intel.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
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

Add coeffs_to_lut32() to generate 32-bit color LUT entries from gamma
coefficients. This complements coeffs_to_lut(), which handles 16-bit
entries, and is required for validating color pipelines that use
drm_color_lut32.

The helper also applies color depth masking for CRC consistency across
different bit depths.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_helper.c | 47 ++++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  4 ++++
 2 files changed, 51 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 143dff43e..fceac45bb 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -218,6 +218,53 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	return lut;
 }
 
+struct drm_color_lut32 *coeffs_to_lut32(data_t *data,
+				        const gamma_lut_t *gamma,
+				        uint32_t color_depth,
+				        int off)
+{
+	struct drm_color_lut32 *lut;
+	int i, lut_size = gamma->size;
+	uint64_t max_value = (1ULL << 32) - 1;
+	uint32_t mask;
+
+	if (is_intel_device(data->drm_fd))
+		mask = ((1ULL << color_depth) - 1) << (32 - color_depth);
+	else
+		mask = max_value;
+
+	lut = malloc(sizeof(struct drm_color_lut32) * lut_size);
+
+	if (IS_CHERRYVIEW(data->devid))
+		lut_size -= 1;
+	for (i = 0; i < lut_size; i++) {
+		uint32_t r = gamma->coeffs[i].r * max_value;
+		uint32_t g = gamma->coeffs[i].g * max_value;
+		uint32_t b = gamma->coeffs[i].b * max_value;
+
+		/*
+		 * Hardware might encode colors on a different number of bits
+		 * than what is in our framebuffer (10 or 12bits for example).
+		 * Mask the lower bits not provided by the framebuffer so we
+		 * can do CRC comparisons.
+		 */
+		r &= mask;
+		g &= mask;
+		b &= mask;
+
+		lut[i].red = r;
+		lut[i].green = g;
+		lut[i].blue = b;
+	}
+
+	if (IS_CHERRYVIEW(data->devid))
+		lut[lut_size].red =
+			lut[lut_size].green =
+			lut[lut_size].blue = lut[lut_size - 1].red;
+
+	return lut;
+}
+
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma)
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 23463b944..8acc7722e 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -89,6 +89,10 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
 				    int off);
+struct drm_color_lut32 *coeffs_to_lut32(data_t *data,
+					const gamma_lut_t *gamma,
+					uint32_t color_depth,
+					int off);
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma);
-- 
2.25.1

