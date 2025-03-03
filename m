Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC59BC282C5
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 11:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4F310E23B;
	Mon,  3 Mar 2025 11:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MELE98Pc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEFF10E23B
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740999758; x=1772535758;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MvLtmEmWqC24KQxVD1IXjHH5PgRCKo6nbhn4dktXdD4=;
 b=MELE98PcGA/VwHBdhy7mUTOiHastmPrcJKO3W6obRpNDLhWSU6Vb4Yq5
 KO0C+GvyU/Aeo7NVwhCRqALlugkrzazWuXoqiox4XLc5HzU5GkjOTW7Dv
 ldLxGpAmjdGRqwNnqQBjNW3twC2PpXRgdM+A3s9gFhh0M8d4Q2auGdBeJ
 19EwV6j0iyaDvhHW9pbuKe44cjw8FzDRjJh1X1V92zmedBAUI+I1CKRca
 C2RJ8I1Q4elYVnJ+9A79qyg2gc5uf+IZj4BCFpKfnIfskjkWng52YQXJz
 hpdqDTYAiQu+/BXdkMr4dROS4WBfoYMG56KQU+ZFWBTKkZxYjD1bDsz91 w==;
X-CSE-ConnectionGUID: qwRvz4exTraYCLZo19VAsA==
X-CSE-MsgGUID: n2hEsni3QRCFNEKtu5S5SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41781402"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41781402"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 03:02:38 -0800
X-CSE-ConnectionGUID: enVb+wB6SGWjr+c1qgwOTw==
X-CSE-MsgGUID: t4o/F6C/Qkecq9pdsXvjZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123195096"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 03 Mar 2025 03:02:36 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Mar 2025 13:02:35 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/kms_draw_crc: Skip formats not supported by
 the plane
Date: Mon,  3 Mar 2025 13:02:35 +0200
Message-ID: <20250303110235.15976-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
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

The test only checks igt_display_has_format_mod() before
deciding to test a specific format. But that doesn't
mean the actual plane supports that format. Also check
for that once we know which plane to use.

Should turn the fp16 failures into skips on IVB because it
doesn't have fp16 support on the primary plane.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_draw_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 9c350853cfd9..62c6c64be710 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -158,6 +158,8 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
+	igt_require(igt_plane_has_format_mod(primary, drm_format, modifier));
+
 	igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
 		      drm_format, modifier, &fb);
 	igt_plane_set_fb(primary, &fb);
-- 
2.45.3

