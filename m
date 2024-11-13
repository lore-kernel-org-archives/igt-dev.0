Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A08D637A4
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 17:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB3810E05E;
	Wed, 13 Nov 2024 17:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZslGiUxU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D085F10E05E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731520469; x=1763056469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ROdnD52D8bc8YBa7YUvQwQISXo6h+2vPybQjEyGo+DE=;
 b=ZslGiUxURXXvj9irZgL/DJp9y3dhAv5yvU6V6BEZWTcedBx+tHiIxGv9
 IbM6fwyNis2i1d/2XdxavEl0pOr1W45I+XRCBy/hI455Y3W72cCHxZFoR
 zf6gM16LOjhJDdHydz9RgzHgqISsgZdUJehmGTp8zx9YU4+Exts7wfnm/
 5oMA2v0WdczEZeGo9D2QxclMLbkHs3sgaOFRWSQ5C/K+39LuYu5rOBAUy
 Wg6yO/DhjXcsC9gMloVWPRmYOYzVu2hw44Azlxdo1QVwP8kJY+o3OFiMC
 AfqqFiOuhjMfdFn95KmY3YzHQGxu+W9UsRoUvjQOkTlVB1jhrOZG1WaS1 Q==;
X-CSE-ConnectionGUID: 5EvL+OU0SJi3CL/HvIQq7w==
X-CSE-MsgGUID: ybL4bLW/RmaoILqiXqaGKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35135316"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35135316"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:54:29 -0800
X-CSE-ConnectionGUID: ONQ/iPkgSU6tRT9o3NrAow==
X-CSE-MsgGUID: XvFf0zg5Q1WGh0b1t0SH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="87504197"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2024 09:54:27 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/kms_histogram: Add vblank wait to get histogram
 interrupts
Date: Wed, 13 Nov 2024 23:24:00 +0530
Message-Id: <20241113175400.163568-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add igt wait for 3 vblank count to get histogram interrupt.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_histogram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_histogram.c b/tests/kms_histogram.c
index b2bd777ab..5dc02d26b 100644
--- a/tests/kms_histogram.c
+++ b/tests/kms_histogram.c
@@ -226,6 +226,7 @@ static void flip_fb(data_t *data, enum pipe pipe, igt_output_t *output, struct i
 {
 	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 3);
 }
 
 static void prepare_pipe(data_t *data, enum pipe pipe, igt_output_t *output, bool color_fb)
-- 
2.25.1

