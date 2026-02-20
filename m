Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E2FC55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6595210E80E;
	Fri, 20 Feb 2026 14:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVv9/P1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD7810E80C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596144; x=1803132144;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iaYXNTc5UltZldJV61Hr3wgfcGob5vBYDTa0q+hO4tA=;
 b=bVv9/P1FhwA16BcENsijXd+T96WW/nflVnKFY/9TM/Mkt8Hc2ZcuqC3a
 CMae3XfY760pqfWfpyfZPrbz7/3LQecn9CGS8ciph5tXwBJRDJLVk3MC6
 +NGprgudWYO9wRP2AS96wyVDXoBHrC+SOa6i3YLqU6RR1EiFjcDns5ORu
 6uo7+pNDgUL/8jX84dgc9NOEcT1baIo2EAVmZFf65VqtkMwgob/iEKdQO
 u4wG5AI9p/6YmicxbWwrocSgf9TDl+rE4JuyXzNsP7WJzVpUu0QepGYVU
 eM6iyNeK1e8xJwPUa1rPc6GHLSyjHOojfEdMD4fNj0rXJnYrwtn+j8Ls5 w==;
X-CSE-ConnectionGUID: OLV0mkkEQL2ohMiqQHnqbA==
X-CSE-MsgGUID: RLdPg+cbQRCEKmj5WF09Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83007020"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="83007020"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:24 -0800
X-CSE-ConnectionGUID: ZGVJEP90Tn+Tk7IV7ZjeMQ==
X-CSE-MsgGUID: Ti1fet4QTS6+VRmWdMGsSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214973691"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:23 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/21] tests/kms_lease: Use igt_crtc_t instead of enum
 pipe
Date: Fri, 20 Feb 2026 16:01:38 +0200
Message-ID: <20260220140154.4138-7-ville.syrjala@linux.intel.com>
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

Convert kms_lease from 'enum pipe' to 'igt_crtc_t'.

The lessor and lessee each have their own igt_display_t and
igt_crtc_ts. Thus we have to track the igt_crtc_t in the lease_t
structure instead of the previous approach of tracking the pipe
in the shared data_t structure.

The CRTC ID will be the same for both lessor and lessee, so
we can use that to locate the appropriate igt_crtc_t. The
CRTC ID is already being tracked in the data_t structure.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_lease.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 39f5e69440b4..045cd62de0d7 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -126,6 +126,7 @@ typedef struct {
 	uint32_t lessee_id;
 	igt_display_t display;
 	struct igt_fb primary_fb;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	drmModeModeInfo *mode;
 } lease_t;
@@ -133,7 +134,6 @@ typedef struct {
 typedef struct {
 	lease_t lease;
 	lease_t master;
-	enum pipe pipe;
 	uint32_t crtc_id;
 	uint32_t connector_id;
 	uint32_t plane_id;
@@ -152,8 +152,8 @@ static int prepare_crtc(data_t *data, bool is_master)
 	drmModeModeInfo *mode;
 	lease_t *lease = is_master ? &data->master : &data->lease;
 	igt_display_t *display = &lease->display;
+	igt_crtc_t *crtc = igt_crtc_for_crtc_id(display, data->crtc_id);
 	igt_output_t *output = connector_id_to_output(display, data->connector_id);
-	enum pipe pipe = igt_crtc_for_pipe(display, data->pipe)->pipe;
 	igt_plane_t *primary;
 	int ret;
 
@@ -161,7 +161,7 @@ static int prepare_crtc(data_t *data, bool is_master)
 		return -ENOENT;
 
 	/* select the pipe we want to use */
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
@@ -179,8 +179,9 @@ static int prepare_crtc(data_t *data, bool is_master)
 	if (ret)
 		return ret;
 
-	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
+	igt_wait_for_vblank(crtc);
 
+	lease->crtc = crtc;
 	lease->output = output;
 	lease->mode = mode;
 	return 0;
@@ -308,8 +309,6 @@ static int paint_fb(int drm_fd, struct igt_fb *fb, const char *test_name,
 
 static void simple_lease(data_t *data)
 {
-	enum pipe pipe = data->pipe;
-
 	/* Create a valid lease */
 	igt_assert_eq(make_lease(data), 0);
 
@@ -321,7 +320,7 @@ static void simple_lease(data_t *data)
 	/* Paint something attractive */
 	paint_fb(data->lease.fd, &data->lease.primary_fb, "simple-lease",
 		 data->lease.mode->name, igt_output_name(data->lease.output),
-		 kmstest_pipe_name(pipe));
+		 igt_crtc_name(data->lease.crtc));
 	igt_debug_wait_for_keypress("lease");
 	cleanup_crtc(&data->lease,
 		     connector_id_to_output(&data->lease.display, data->connector_id));
@@ -341,8 +340,6 @@ static void page_flip_implicit_plane(data_t *data)
 	drmModePlaneRes *plane_resources;
 	uint32_t wrong_plane_id = 0;
 	int i;
-	igt_display_t *display;
-	enum pipe pipe = data->pipe;
 
 	/* find a plane which isn't the primary one for us */
 	plane_resources = drmModeGetPlaneResources(data->master.fd);
@@ -374,9 +371,7 @@ static void page_flip_implicit_plane(data_t *data)
 			      data->master.primary_fb.fb_id,
 			      0, NULL));
 
-	display = &data->master.display;
-
-	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
+	igt_wait_for_vblank(data->master.crtc);
 
 	do_or_die(drmModePageFlip(data->lease.fd, data->crtc_id,
 			      data->master.primary_fb.fb_id,
@@ -386,7 +381,7 @@ static void page_flip_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = wrong_plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
 
-	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
+	igt_wait_for_vblank(data->master.crtc);
 
 	igt_assert_eq(drmModePageFlip(data->lease.fd, data->crtc_id,
 				      data->master.primary_fb.fb_id,
@@ -1290,7 +1285,6 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s", f->name) {
 				for_each_crtc_with_valid_output(display, crtc,
 								output) {
-					data.pipe = crtc->pipe;
 					igt_display_reset(display);
 
 					igt_output_set_crtc(output,
-- 
2.52.0

