Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7108C55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B39D10E7C3;
	Fri, 20 Feb 2026 14:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7xOj5cy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F171410E7C3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596149; x=1803132149;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=npTNoW2Zd869dJhNHOg9VapFRy7Ff7z+q/EyGxGeutY=;
 b=d7xOj5cyW6aiJ8omV5GgonHGsvEFndU/O/HlEYAOis0C0QW8E8ZcgFIr
 limXaiC8CMVin2POXxERD+R7VogmTg6qHe/CYEkRdUh1n//GunShtlujE
 isxvINhCN/d8tyGhs/QLFrhwUN7MDzBR1bIiv8UAEP+plcTKv2C8Xh9qk
 RhfJ8WVMvmQGbAJelLLJHlszWOLRYNaIR/OhbFXOQkFplcJvyRB33G0Ms
 i5lZRPwmv5HQZT0RbP7O0VmU5yLq+qz/QZE0OIRlgskKjEB6zQn2edTIs
 4Ownc2qeS4BOQgwy4n8Xq7gDwpPAcd0KiHCwZJE+PbQn+ODYpczASeC0c A==;
X-CSE-ConnectionGUID: GJYvECEzS3KIJhIMnOPMxg==
X-CSE-MsgGUID: a6iezMJhR4WrnWAkk1M0wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83007024"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="83007024"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:29 -0800
X-CSE-ConnectionGUID: /4CgnrutRPyEMDUAJofGzA==
X-CSE-MsgGUID: 75WwbsCiQPqfxVxbpujCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214973694"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:28 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/21] tests/kms_lease: Pass lease_t to prepare_crtc()
Date: Fri, 20 Feb 2026 16:01:39 +0200
Message-ID: <20260220140154.4138-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
References: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
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

cleanup_crtc() gets passed the appropriate lease_t directly
by the caller, but prepare_crtc() instead takes the same information
as a boolean flag (and picks the appropriate lease_t based on that).
Unify the approach to also pass the appropriate lease_t directly
to prepare_crtc().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_lease.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 045cd62de0d7..9f7935e99902 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -147,10 +147,9 @@ static igt_output_t *connector_id_to_output(igt_display_t *display, uint32_t con
 	return igt_output_from_connector(display, &connector);
 }
 
-static int prepare_crtc(data_t *data, bool is_master)
+static int prepare_crtc(data_t *data, lease_t *lease)
 {
 	drmModeModeInfo *mode;
-	lease_t *lease = is_master ? &data->master : &data->lease;
 	igt_display_t *display = &lease->display;
 	igt_crtc_t *crtc = igt_crtc_for_crtc_id(display, data->crtc_id);
 	igt_output_t *output = connector_id_to_output(display, data->connector_id);
@@ -315,7 +314,7 @@ static void simple_lease(data_t *data)
 	igt_display_require(&data->lease.display, data->lease.fd);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(data, false));
+	igt_assert_eq(0, prepare_crtc(data, &data->lease));
 
 	/* Paint something attractive */
 	paint_fb(data->lease.fd, &data->lease.primary_fb, "simple-lease",
@@ -364,7 +363,7 @@ static void page_flip_implicit_plane(data_t *data)
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(data, true));
+	igt_assert_eq(0, prepare_crtc(data, &data->master));
 
 	/* sanity check */
 	do_or_die(drmModePageFlip(data->master.fd, data->crtc_id,
@@ -436,7 +435,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	}
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(data, true));
+	igt_assert_eq(0, prepare_crtc(data, &data->master));
 
 	/* sanity check */
 	ret = drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
@@ -477,7 +476,7 @@ static void cursor_implicit_plane(data_t *data)
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(data, true));
+	igt_assert_eq(0, prepare_crtc(data, &data->master));
 
 	/* sanity check */
 	do_or_die(drmModeSetCursor(data->master.fd, data->crtc_id, 0, 0, 0));
@@ -788,7 +787,7 @@ static void lease_revoke(data_t *data)
 	igt_assert_eq(revoke_lease(data->master.fd, &mrl), 0);
 
 	/* Try to use the leased objects */
-	ret = prepare_crtc(data, false);
+	ret = prepare_crtc(data, &data->lease);
 
 	/* Ensure that the expected error is returned */
 	igt_assert_eq(ret, -ENOENT);
-- 
2.52.0

