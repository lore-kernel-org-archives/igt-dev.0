Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C3FC10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 13:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1791610F07D;
	Mon,  6 May 2024 13:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0v0SlUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DE610F07D
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002672; x=1746538672;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+vTWv58uQo2JFawme/K24WVs/ffv1n94pOZNNATU9zk=;
 b=X0v0SlUubiKwhFtR/l7VRZkSgmiVObMbl4KUOu8qrJnboLRQUEbqFH2o
 fqgH4u/pzz2Yonvl+/gYTIpeCDJZf9uoziNGG4Ak+e1C+TM/ieMaB4iMu
 UU7snbmafqNJP2kd6MyYhhGwT7SHAb8AiYIkLKxORPl7exKDQ8QCBf6cT
 nFZmwvmhab0nA824uRMP1ZoVAnnPT4xcUs8zIz92sLTIPc9/BX2CeAJxZ
 taOHGSCNY0lTDaGHWtVaDW9gsS4QFRby+8hAJfJrUyHtBm+tbHN3AYJmC
 mwrl78HZsr7zqUGZrQW9oswyz5zYGU4t5Um4SNvXMo0kavImj+O6vQZ2k Q==;
X-CSE-ConnectionGUID: 3udelmsJS4eBM7Cji5FPBw==
X-CSE-MsgGUID: q0hwFCv7TEmgDDK+CuX/rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903273"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903273"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:37:51 -0700
X-CSE-ConnectionGUID: vo6eC1AoSPGk0xgD/D0PgA==
X-CSE-MsgGUID: O/f0p7ERRDGpB3Oa3866Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28172359"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 06 May 2024 06:37:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 06 May 2024 16:37:48 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_ccs: Test XRGB2101010
Date: Mon,  6 May 2024 16:37:48 +0300
Message-ID: <20240506133748.30321-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

I want to enable 10bpc CCS support for i915. To that end start
testing it.

Note that we are faking things a bit because rendercopy will
still use a 8:8:8:8 format here (plumbing the full pixel format,
as opposed to just bpp, would require quite a bit more work).
However this seems to work fine, I suspect due to:
- we only do 1:1: copies of data
- the compression is lossless

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index a5cb3b3b4f27..c91370a9abe7 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -197,6 +197,7 @@ static const struct {
 static const uint32_t formats[] = {
 	DRM_FORMAT_XYUV8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_P012,
@@ -635,6 +636,7 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
 {
 	switch (fb->drm_format) {
 	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
@@ -849,7 +851,8 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 		return false;
 
 	if (is_ccs_cc_modifier(data->ccs_modifier) &&
-	    data->format != DRM_FORMAT_XRGB8888)
+	    data->format != DRM_FORMAT_XRGB8888 &&
+	    data->format != DRM_FORMAT_XRGB2101010)
 		return false;
 
 	if ((fb_flags & FB_MISALIGN_AUX_STRIDE) ||
-- 
2.43.2

