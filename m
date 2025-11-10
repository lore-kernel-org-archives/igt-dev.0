Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D01ECD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AD810E300;
	Mon, 10 Nov 2025 19:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4BSd3jV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F10510E300
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802719; x=1794338719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XX1Y8x6gjOuWLDC/Ialv+2TS5DIAxTp7Kam9ST7SCkc=;
 b=W4BSd3jV6VIC3hF+EYy1fYvt9wAyo02mij/AooXKhBX7dUKhRXewpuWq
 Qi5i5tSbCp7F3GURvosa4Gme+wAvPU+0t9PSUX85FV2PlhV3GqwlLVsKD
 bydcNVDbtfL3iGCV3/lqlWIaJ18ECvxhsUoo/Qa3zm2aXFNBv9MuYONWz
 BtGBh6E8BaOTr1Zok9pJy/rwTbiyzp9F3xfcBCYdQrC/AiYJAhs4itQO/
 ICOBHSjOneuwz+OKmEu+zy2NnQhSdbOMTeGYE+RuirOOV51QPep3R+amL
 lgB5RgXaACYdGaAS64ln345oIfLUL6lDpBhQ61ehOfVVApyVUdojeIuGS Q==;
X-CSE-ConnectionGUID: OWteBTLGQCe70i2WzhrIjA==
X-CSE-MsgGUID: KC5eoHQpTTqduugaVH177Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900269"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:18 -0800
X-CSE-ConnectionGUID: 70emP2cWTimOdSS/+oedDw==
X-CSE-MsgGUID: LJN0tQsDTSyhBxykOQQt/g==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:16 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 8/8] tests/intel/kms_psr2_sf: Skip FBC tests on BMG platform
Date: Tue, 11 Nov 2025 00:54:54 +0530
Message-ID: <20251110192454.44385-9-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110192454.44385-1-mohammed.thasleem@intel.com>
References: <20251110192454.44385-1-mohammed.thasleem@intel.com>
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

Skip FBC tests on Battlemage platform as the feature is not supported
on this hardware.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 68842b020..8120d1b8f 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -203,6 +203,7 @@ enum plane_move_postion {
 
 typedef struct {
 	int drm_fd;
+	uint32_t devid;
 	int debugfs_fd;
 	igt_display_t display;
 	drmModeModeInfo *mode;
@@ -561,6 +562,9 @@ static void prepare(data_t *data)
 	igt_plane_set_position(primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	igt_skip_on_f(IS_BATTLEMAGE(data->devid) && data->op_fbc_mode == FBC_ENABLED,
+		      "FBC isn't supported on BMG\n");
+
 	if (data->coexist_feature & FEATURE_DSC)
 		igt_require_f(igt_is_dsc_enabled(data->drm_fd, output->name),
 			      "DSC is not enabled\n");
@@ -1202,7 +1206,8 @@ igt_main
 
 		display_init(&data);
 
-		disp_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		disp_ver = intel_display_ver(data.devid);
 		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, data.pipe);
 
 		data.damage_area_count = MAX_DAMAGE_AREAS;
-- 
2.48.1

