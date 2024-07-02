Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4F7C31D97
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04A210E2AA;
	Tue,  2 Jul 2024 23:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lopXYRcP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D0410E50A
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962911; x=1751498911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hF/lz+E6jdwlMY3bb1Tnl4bGcPVUqg9pa6O6AdnaQ+M=;
 b=lopXYRcPURH9uTl0QkzTt8ZHjtWmKL6mHjlMh576JnGIJv2MfdU2VuN/
 mw1sP64KOGQkyshNWDPN84ZndoGGa8zumDes3ymZbOUiOco4+1IynSGZJ
 zFy39l0KxFP/2XxTggEE/0scWMAd+OfNvsJLzvyek2L2bPa71Q6oaq49A
 0Bznu6FU1ImB8Kz9n/Vsb4RZDKa2vitb6+cN2Lbf6ABT3Sqd42XE/sCD2
 UKjzS5bPRRsc3dgZZfzjDgMx0aOfQeHqvXGTbVNFyyGtDfRlhcdelSJRG
 Au8+ssuNegoZ2I5Xnx4SYdSlz/EjJNzL9nNP18QiC9oz8uuIJv+JrQF22 Q==;
X-CSE-ConnectionGUID: /iVHRVlFSdCsSbu5Xjqmjg==
X-CSE-MsgGUID: VEUlK5I7RDCsn4QaCBO5ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559488"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559488"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:30 -0700
X-CSE-ConnectionGUID: 6EOgLDPGTnyDNypSSUFD9Q==
X-CSE-MsgGUID: +apVLCeBQNqVxqqi4DJxdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043768"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 03/37] tests/kms_big_fb: Use igt_fb_create_intel_buf()
Date: Wed,  3 Jul 2024 02:27:43 +0300
Message-ID: <20240702232817.31147-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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
index 605813f7fd2e..1838ee6261ae 100644
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

