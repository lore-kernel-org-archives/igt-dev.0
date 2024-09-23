Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCBDCF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 21:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3D110E4A4;
	Mon, 23 Sep 2024 21:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vz1PiyVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C916510E4A4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 21:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727127492; x=1758663492;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GTXLJBH6DYxno7DfkfXt5xkmobg743/1QSxqBMOgSc0=;
 b=Vz1PiyVlZquIHdWcZ9XAu9F1HF3KkVdftM1NSTylkMg4d70kjU1TnO1D
 Yfq5VTMXuvRJ2r7bpoFjOGZyW1ESxqrtQa1bVSrUpPjQW7hTsmXQGy1/R
 05nF5Q9coaUrsflWE6Sdqg86myKIUJGvaw2DI4MFXxj5vThSzT7DER32m
 D3WsyILWSRayk9L/dJVIinv/aEtZT9hYPnRKw221f/lmAxm7JLc8sfOYr
 0X9KtVzx0eRRubADW2sRJ/eLhwZjynn5ZNre/rLKAcKrxK+VwUEA815M5
 CmTFby7nfCApd+U8vfyeoL7rzm8NrL7Sici0THPk7ExH3e9r+oSyND1oA g==;
X-CSE-ConnectionGUID: ns9Z+1BLTWSvXz8EFHZqmw==
X-CSE-MsgGUID: VSkdCEAwRz6XXKOsGN/XLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43613233"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43613233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:36:25 -0700
X-CSE-ConnectionGUID: 1BaTWbZ3RhusqCffsrvUeg==
X-CSE-MsgGUID: MZB0kAUDRpS1+qmWcLpFHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71338539"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 14:36:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Sep 2024 00:36:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/igt_fb: Fix intel_buf surface init
Date: Tue, 24 Sep 2024 00:36:20 +0300
Message-ID: <20240923213620.12369-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
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

The current coed is populating buf->ccs[] and buf->surface[]
in a rather inconsistent way.

It looks like for flat CCS platforms:
- we populate buf->ccs[] with some nonsense even though
  we shouldn't since the AUX stuff is completely hidden by
  the hardware
- we seem to stick data about the clear color into both
  both buf->ccs[] and buf->surfaces[] when it should be in neither

For non-flat CCS platforms the code seems more reasonable,
except it only manages to skip the clear color fumble by
the fact that num_planes is always odd with clear color
and thus the /2 will truncate it away.

Anyways, let's make the code make actual sense for all platforms
by properly calculating how many main surfaces and ccs surfaces
there should be.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index b8ffd7cfb261..6deb2a221df6 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2636,6 +2636,35 @@ static int yuv_semiplanar_bpp(uint32_t drm_format)
 	}
 }
 
+static int intel_num_surfaces(const struct igt_fb *fb)
+{
+	int num_surfaces;
+
+	if (!igt_fb_is_ccs_modifier(fb->modifier))
+		return fb->num_planes;
+
+	num_surfaces = fb->num_planes;
+
+	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
+		num_surfaces--;
+
+	if (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
+		num_surfaces /= 2;
+
+	return num_surfaces;
+}
+
+static int intel_num_ccs_surfaces(const struct igt_fb *fb)
+{
+	if (!igt_fb_is_ccs_modifier(fb->modifier))
+		return 0;
+
+	if (HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
+		return 0;
+
+	return intel_num_surfaces(fb);
+}
+
 struct intel_buf *
 igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
                         const struct igt_fb *fb,
@@ -2705,13 +2734,12 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 	if (buf->format_is_yuv_semiplanar)
 		buf->yuv_semiplanar_bpp = yuv_semiplanar_bpp(fb->drm_format);
 
-	if (igt_fb_is_ccs_modifier(fb->modifier)) {
-		num_surfaces = fb->num_planes / (HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? 1 : 2);
-		for (i = 0; i < num_surfaces; i++)
-			init_buf_ccs(buf, i,
-				     fb->offsets[num_surfaces + i],
-				     fb->strides[num_surfaces + i]);
-	}
+	num_surfaces = intel_num_surfaces(fb);
+
+	for (i = 0; i < intel_num_ccs_surfaces(fb); i++)
+		init_buf_ccs(buf, i,
+			     fb->offsets[num_surfaces + i],
+			     fb->strides[num_surfaces + i]);
 
 	igt_assert(fb->offsets[0] == 0);
 	for (i = 0; i < num_surfaces; i++) {
-- 
2.44.2

