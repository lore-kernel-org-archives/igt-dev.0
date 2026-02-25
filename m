Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C3FFD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01AB10E10F;
	Wed, 25 Feb 2026 12:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfD1pOW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B90810E10F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023884; x=1803559884;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1kPwehIDu0iXzozZrQ5YrJnce7074141JpXFAx+1xYQ=;
 b=nfD1pOW/puk7QYOdcBo60UY9tfTLaRZ3B5ea3L9Q9lh/h8ua5hSnIee1
 RTfXZlDTcygLzqsvV2oLql72+iFkwgQfVCAeFTzEoaxIh1VsL5X6v2NUx
 E+ChFxshzhYvs7xAYbhCQJuXbW4J0ObEnAbAkp0szstCuW18FbM9awppl
 F5+OCw/dBKGmjElHydWGh6a/2OvLCV4ixbmUHiU/JU+lUm+Y30O6C7WVP
 f8DWdCbZdHSMPkRqZil1UA2g8rQ4JXEENuduuq1VYt3twxYdJM0Vi5aWO
 q+4aQKt0qK3TAbbEMyPFTB0U45iA9NCa35A3LDKVUDiPN/aTfWiew+cY0 Q==;
X-CSE-ConnectionGUID: C9pYIPwlTJySpDQo1R9yzw==
X-CSE-MsgGUID: NGqqWRAxQ+Ko3jQoT22J+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72934474"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72934474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:23 -0800
X-CSE-ConnectionGUID: v3ORxrS0RIKC72UheQlzog==
X-CSE-MsgGUID: Iz2xfOoiSbGX3phiigKuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215331956"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:22 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/19] tests/kms_lease: Consolidate igt_crtc_for_pipe()
 calls
Date: Wed, 25 Feb 2026 14:50:52 +0200
Message-ID: <20260225125108.31119-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

kms_lease has igt_crtc_for_pipe() calls sprinkled all over the
place. Consolidate them to a few spots so that we can actually
see what's going on.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_lease.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 9f7935e99902..7531f9acf810 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -869,8 +869,11 @@ static void invalid_create_leases(data_t *data)
 	uint32_t object_ids[4];
 	struct drm_mode_create_lease mcl = {0};
 	drmModeRes *resources;
+	igt_crtc_t *crtc;
 	int tmp_fd, ret;
 
+	crtc = igt_crtc_for_pipe(&data->master.display, 0);
+
 	/* NULL array pointer */
 	mcl.object_count = 1;
 	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EFAULT);
@@ -887,11 +890,11 @@ static void invalid_create_leases(data_t *data)
 	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
 
 	/* no connector, non-universal_plane */
-	object_ids[0] = igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
+	object_ids[0] = crtc->crtc_id;
 	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
 
 	/* sanity check */
-	object_ids[0] = igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
+	object_ids[0] = crtc->crtc_id;
 	object_ids[1] = data->master.display.outputs[0].id;
 	mcl.object_count = 2;
 	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
@@ -902,8 +905,7 @@ static void invalid_create_leases(data_t *data)
 	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
 
 	/* sanity check */
-	object_ids[2] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
-						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
+	object_ids[2] = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 	mcl.object_count = 3;
 	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
 	close(mcl.fd);
@@ -1066,11 +1068,13 @@ static int _create_simple_lease(int master_fd, data_t *data, int expected_ret)
 {
 	uint32_t object_ids[3];
 	struct drm_mode_create_lease mcl;
+	igt_crtc_t *crtc;
 
-	object_ids[0] = igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
+	crtc = igt_crtc_for_pipe(&data->master.display, 0);
+
+	object_ids[0] = crtc->crtc_id;
 	object_ids[1] = data->master.display.outputs[0].id;
-	object_ids[2] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
-						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
+	object_ids[2] = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 	mcl.object_ids = (uint64_t) (uintptr_t) object_ids;
 	mcl.object_count = 3;
 	mcl.flags = 0;
@@ -1157,13 +1161,16 @@ static void implicit_plane_lease(data_t *data)
 	struct drm_mode_create_lease mcl;
 	struct drm_mode_get_lease mgl;
 	int ret;
-	uint32_t cursor_id = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
-						     DRM_PLANE_TYPE_CURSOR)->drm_plane->plane_id;
+	uint32_t cursor_id;
+	igt_crtc_t *crtc;
 
-	object_ids[0] = igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
+	crtc = igt_crtc_for_pipe(&data->master.display, 0);
+
+	cursor_id = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_CURSOR)->drm_plane->plane_id;
+
+	object_ids[0] = crtc->crtc_id;
 	object_ids[1] = data->master.display.outputs[0].id;
-	object_ids[2] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
-						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
+	object_ids[2] = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 	mcl.object_ids = (uint64_t) (uintptr_t) object_ids;
 	mcl.object_count = 3;
 	mcl.flags = 0;
-- 
2.52.0

