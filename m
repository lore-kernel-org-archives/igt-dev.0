Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7347CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928C610E324;
	Mon,  2 Sep 2024 14:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNOCo/GS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9510E324
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287887; x=1756823887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nBSGzdwggYqaKYQs4GL9Stg73yjuU0yx2nCO6jBET3E=;
 b=jNOCo/GScYKAgRBscIMC9BNUUgcsaqhnStazx05AN7uBH7FMZTT5XjWc
 K2nQ55PTu/uqGBqktw4WzJKPp2EjzNavg3VI5zN2TcT6U3+GAY/auR+9d
 badjsr1cR2hIzPvw3IifNFXwN+elIxcTEIO3oNoxyp25b8TXfEC4pCfzp
 jRRIrV96m/FWF+Rtk5jdFrLDrtRdOfjJ1FE5U7coLwzCGpzcNzGBP1N7M
 7tFxoD1u6ze+pciJvGHepRhh7yBFdWLliu61HASr5z+xzUhjGKLjQw3qa
 ahBfCZMbAqkU+trYk86zKMK0+ZAxjK6NEl1xvwl1Jesikvd4Fr6oQWqFn w==;
X-CSE-ConnectionGUID: DFj/riJ4T5eSBfp7hB2o9A==
X-CSE-MsgGUID: fB5c3OjbRMOn/79IkgkYaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009422"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009422"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:06 -0700
X-CSE-ConnectionGUID: 6X5dnxXMTfuGYrP/DtFnMA==
X-CSE-MsgGUID: GHSARX/6S4mwtb4OVi0dBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639372"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:03 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 02/23] tests/kms_big_fb: Use igt_fb_create_intel_buf()
Date: Mon,  2 Sep 2024 17:37:37 +0300
Message-ID: <20240902143758.21036-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use igt_fb_create_intel_buf() instead of hand rolling something
similar but less capable (igt_fb_create_intel_buf() handles
planar and compressed formats, the hand rolled version does not).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/kms_big_fb.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index b808b4a02f77..2fef03ab7412 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -188,32 +188,7 @@ static struct intel_buf *init_buf(data_t *data,
 				  const struct igt_fb *fb,
 				  const char *buf_name)
 {
-	struct intel_buf *buf;
-	enum intel_driver driver = buf_ops_get_driver(data->bops);
-	uint32_t name, handle, tiling, width, height, bpp, size;
-	uint64_t region = driver == INTEL_DRIVER_XE ?
-				vram_if_possible(data->drm_fd, 0) : -1;
-
-	igt_assert_eq(fb->offsets[0], 0);
-
-	tiling = igt_fb_mod_to_tiling(fb->modifier);
-	bpp = fb->plane_bpp[0];
-	size = fb->size;
-	width = fb->strides[0] / (bpp / 8);
-	height = fb->height;
-
-	name = gem_flink(data->drm_fd, fb->gem_handle);
-	handle = gem_open(data->drm_fd, name);
-	buf = intel_buf_create_full(data->bops, handle, width, height,
-				    bpp, 0, tiling, 0, size, 0,
-				    region,
-				    intel_get_pat_idx_uc(data->drm_fd),
-				    DEFAULT_MOCS_INDEX);
-
-	intel_buf_set_name(buf, buf_name);
-	intel_buf_set_ownership(buf, true);
-
-	return buf;
+	return igt_fb_create_intel_buf(data->drm_fd, data->bops, fb, buf_name);
 }
 
 static void fini_buf(struct intel_buf *buf)
-- 
2.44.2

