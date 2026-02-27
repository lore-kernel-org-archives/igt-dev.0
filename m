Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2954FD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3D310EA54;
	Fri, 27 Feb 2026 08:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEwGrOm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D5A10EA55
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179683; x=1803715683;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SJNi8542kj4xV67a4eTPNE1ArUqthxuG304dHfRWZmI=;
 b=KEwGrOm1ckuWjjlKmg9YuJgOgcjSJPG2DgI33wHpmy63oA9WHVXtNdYK
 ajUM+bMnpaj5CPHnOykTDcQ4ylEUW7+QbeG2KeRx5FrBh5U6f8BEbw3Y1
 mVY96aihrvB9r45TOi8XM10A4PThmdlLpBWW2WGWkMpLBb8vu3IiNVaXN
 ImOU6m3JGYFqtrjGJ0G9vyY5NqnlwfuFgJ9OPXL4BZLD7Q00vsAwiR5hE
 RyOqz06/r5c35fGpyeWJ2d4n8InX6lAM8dvBVfGtb38uOlu+2fqGEjpBt
 caW5DabYxA5gx1A18xVh2+eWoaYOsTUS2eEP57/u0mhyB5dg5q4XCfwrQ A==;
X-CSE-ConnectionGUID: iMvhkyuYQkmnm/P3aIo4Pg==
X-CSE-MsgGUID: bL3AMLj8Rj6lRdhxrpizeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83893262"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83893262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:08:03 -0800
X-CSE-ConnectionGUID: Gn3Oz6HnRTut0zChxXPiBA==
X-CSE-MsgGUID: qgsDd0OVRsmelnvSyjmNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214278282"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:08:02 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/17] lib/kms: Introduce igt_crtc_get_vbl_flag()
Date: Fri, 27 Feb 2026 10:06:52 +0200
Message-ID: <20260227080653.30389-17-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

Provide a crtc based wrapper (igt_crtc_get_vbl_flag())
for kmstest_get_vbl_flag(), and make use of it where
appropriate.

 #include "scripts/iterators.cocci"

@@
igt_crtc_t *CRTC;
@@
- kmstest_get_vbl_flag(CRTC->crtc_index)
+ igt_crtc_get_vbl_flag(CRTC)

@@
typedef uint32_t;
@@
kmstest_get_vbl_flag(...) { ... }
+/**
+ * igt_crtc_get_vbl_flag:
+ * @crtc: CRTC
+ *
+ * Convert a CRTC into flag representation
+ * expected by DRM_IOCTL_WAIT_VBLANK.
+ *
+ * See #igt_wait_for_vblank_count for details.
+ */
+uint32_t igt_crtc_get_vbl_flag(igt_crtc_t *crtc)
+{
+       return kmstest_get_vbl_flag(crtc->crtc_index);
+}

@@
type T;
@@
T igt_first_crtc_with_single_output(...);
+
+ uint32_t igt_crtc_get_vbl_flag(igt_crtc_t *crtc);

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c           | 14 ++++++++++++++
 lib/igt_kms.h           |  2 ++
 tests/intel/perf_pmu.c  |  2 +-
 tests/kms_async_flips.c |  8 ++++----
 tests/kms_vblank.c      | 14 +++++++-------
 5 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b3c44d9748d2..c3fe6198d302 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6095,6 +6095,20 @@ uint32_t kmstest_get_vbl_flag(int crtc_index)
 	return flag;
 }
 
+/**
+ * igt_crtc_get_vbl_flag:
+ * @crtc: CRTC
+ *
+ * Convert a CRTC into flag representation
+ * expected by DRM_IOCTL_WAIT_VBLANK.
+ *
+ * See #igt_wait_for_vblank_count for details.
+ */
+uint32_t igt_crtc_get_vbl_flag(igt_crtc_t *crtc)
+{
+	return kmstest_get_vbl_flag(crtc->crtc_index);
+}
+
 static inline const uint32_t *
 formats_ptr(const struct drm_format_modifier_blob *blob)
 {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b38f62f354fc..3e88d49fdaba 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -586,6 +586,8 @@ igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id);
 igt_crtc_t *igt_first_crtc(igt_display_t *display);
 igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
 
+uint32_t igt_crtc_get_vbl_flag(igt_crtc_t *crtc);
+
 typedef struct _igt_pipe_crc igt_pipe_crc_t;
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 744d619f7f4c..661ead32dc29 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1202,7 +1202,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 
 		igt_fork_helper(&waiter) {
 			const uint32_t pipe_id_flag =
-					kmstest_get_vbl_flag(data.crtc->crtc_index);
+					igt_crtc_get_vbl_flag(data.crtc);
 
 			for (;;) {
 				union drm_wait_vblank vbl = { };
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 53990917c9e4..03d1931fb2bb 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -553,7 +553,7 @@ static void test_async_flip(data_t *data)
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
 	drmVBlank wait_vbl = {
-		.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(data->crtc->crtc_index),
+		.request.type = DRM_VBLANK_RELATIVE | igt_crtc_get_vbl_flag(data->crtc),
 		.request.sequence = 1,
 	};
 
@@ -726,9 +726,9 @@ static void queue_vblank(data_t *data)
 {
 	drmVBlank wait_vbl = {
 		.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT |
-			kmstest_get_vbl_flag(data->crtc->crtc_index),
-		.request.sequence = 1,
-		.request.signal = (long)data,
+			igt_crtc_get_vbl_flag(data->crtc),
+			.request.sequence = 1,
+			.request.signal = (long)data,
 	};
 
 	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl);
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index fd1da2738ac1..e79b2535c599 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -192,7 +192,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 		memset(&vbl, 0, sizeof(vbl));
 		vbl.request.type =
 			DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
-		vbl.request.type |= kmstest_get_vbl_flag(data->crtc->crtc_index);
+		vbl.request.type |= igt_crtc_get_vbl_flag(data->crtc);
 		vbl.request.sequence = 120 + 12;
 		igt_assert_eq(wait_vblank(fd, &vbl), 0);
 	}
@@ -245,7 +245,7 @@ static void crtc_id_subtest(data_t *data, int fd)
 	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	struct drm_event_vblank buf;
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->crtc_index);
+	const uint32_t pipe_id_flag = igt_crtc_get_vbl_flag(data->crtc);
 	unsigned crtc_id, expected_crtc_id;
 	uint64_t val;
 	union drm_wait_vblank vbl;
@@ -290,7 +290,7 @@ static void crtc_id_subtest(data_t *data, int fd)
 
 static void accuracy(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->crtc_index);
+	const uint32_t pipe_id_flag = igt_crtc_get_vbl_flag(data->crtc);
 	union drm_wait_vblank vbl;
 	unsigned long target;
 	int total = 120 / nchildren;
@@ -329,7 +329,7 @@ static void accuracy(data_t *data, int fd, int nchildren)
 
 static void vblank_query(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->crtc_index);
+	const uint32_t pipe_id_flag = igt_crtc_get_vbl_flag(data->crtc);
 	union drm_wait_vblank vbl;
 	struct timespec start, end;
 	unsigned long sq, count = 0;
@@ -358,7 +358,7 @@ static void vblank_query(data_t *data, int fd, int nchildren)
 
 static void vblank_wait(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->crtc_index);
+	const uint32_t pipe_id_flag = igt_crtc_get_vbl_flag(data->crtc);
 	union drm_wait_vblank vbl;
 	struct timespec start, end;
 	unsigned long sq, count = 0;
@@ -392,7 +392,7 @@ static int get_vblank(int fd, igt_crtc_t *crtc, unsigned flags)
 	union drm_wait_vblank vbl;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc->crtc_index) | flags;
+	vbl.request.type = DRM_VBLANK_RELATIVE | igt_crtc_get_vbl_flag(crtc) | flags;
 	do_or_die(igt_ioctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl));
 
 	return vbl.reply.sequence;
@@ -435,7 +435,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 		/* Attempting to do a vblank while disabled should return -EINVAL */
 		memset(&vbl, 0, sizeof(vbl));
 		vbl.request.type = _DRM_VBLANK_RELATIVE;
-		vbl.request.type |= kmstest_get_vbl_flag(data->crtc->crtc_index);
+		vbl.request.type |= igt_crtc_get_vbl_flag(data->crtc);
 		igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
 	}
 
-- 
2.52.0

