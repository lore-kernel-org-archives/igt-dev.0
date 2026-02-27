Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD25FD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EE010EA53;
	Fri, 27 Feb 2026 08:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiDpt5fV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377A110EA54
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179675; x=1803715675;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Zv6t8x3ivQ9EkAxmHlMmqoQbtAA6eapXYIOCkdw3Z2I=;
 b=RiDpt5fVV+2L4TByJ19wIGZObaHZw9ezF1CgH4v1bao0YCgTr913+G/A
 nO8+NW/U0jFp4agm48wYBTcU05HRjjairsUO1IWATMkt/5rJrm+4LzJtT
 85NVi/DBbtSssz3sO/zFgxWokc41gy6gbeJjgPteaD3ISZGCal7tXQp2A
 vF30bmfspL0zqHfHmEohVfJWptrTkO9leIEOMzYVI07rHyIqDXyCl9tBF
 5QHWXKs2Yvp3SXDju/IV4BbBMQtaKhYNu8n8o+9njj8M9FisSgBntbs5L
 D28OxQwJXHRIVnfVTTbgBVnmh1u6h3Nme3k/zLLyXYtrrHJb8qvYmRC3N Q==;
X-CSE-ConnectionGUID: emU89X4FRRegVcglgVqmow==
X-CSE-MsgGUID: tJpAfYrJRRmQLa5u2W6nXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83893256"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83893256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:55 -0800
X-CSE-ConnectionGUID: NIipmmn4QKWO+kAQU5BjTQ==
X-CSE-MsgGUID: 9LUF/NxlRKu/ZK7PtEdK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214278250"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/17] tests/kms: Pass crtc_index to
 kmstest_get_vbl_flag()
Date: Fri, 27 Feb 2026 10:06:50 +0200
Message-ID: <20260227080653.30389-15-ville.syrjala@linux.intel.com>
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

kmstest_get_vbl_flag() is supposed to take the crtc_index
rather than the pipe. Make it so.

 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
igt_crtc_t *CRTC;
@@
kmstest_get_vbl_flag(
-	CRTC->pipe
+ 	CRTC->crtc_index
	)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/perf_pmu.c |  2 +-
 tests/kms_vblank.c     | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 787fe81d21ca..744d619f7f4c 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1202,7 +1202,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 
 		igt_fork_helper(&waiter) {
 			const uint32_t pipe_id_flag =
-					kmstest_get_vbl_flag(data.crtc->pipe);
+					kmstest_get_vbl_flag(data.crtc->crtc_index);
 
 			for (;;) {
 				union drm_wait_vblank vbl = { };
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index f381a1a331ab..fd1da2738ac1 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -192,7 +192,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 		memset(&vbl, 0, sizeof(vbl));
 		vbl.request.type =
 			DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
-		vbl.request.type |= kmstest_get_vbl_flag(data->crtc->pipe);
+		vbl.request.type |= kmstest_get_vbl_flag(data->crtc->crtc_index);
 		vbl.request.sequence = 120 + 12;
 		igt_assert_eq(wait_vblank(fd, &vbl), 0);
 	}
@@ -245,7 +245,7 @@ static void crtc_id_subtest(data_t *data, int fd)
 	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	struct drm_event_vblank buf;
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->pipe);
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->crtc_index);
 	unsigned crtc_id, expected_crtc_id;
 	uint64_t val;
 	union drm_wait_vblank vbl;
@@ -290,7 +290,7 @@ static void crtc_id_subtest(data_t *data, int fd)
 
 static void accuracy(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->pipe);
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->crtc_index);
 	union drm_wait_vblank vbl;
 	unsigned long target;
 	int total = 120 / nchildren;
@@ -329,7 +329,7 @@ static void accuracy(data_t *data, int fd, int nchildren)
 
 static void vblank_query(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->pipe);
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->crtc_index);
 	union drm_wait_vblank vbl;
 	struct timespec start, end;
 	unsigned long sq, count = 0;
@@ -358,7 +358,7 @@ static void vblank_query(data_t *data, int fd, int nchildren)
 
 static void vblank_wait(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->pipe);
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->crtc_index);
 	union drm_wait_vblank vbl;
 	struct timespec start, end;
 	unsigned long sq, count = 0;
@@ -392,7 +392,7 @@ static int get_vblank(int fd, igt_crtc_t *crtc, unsigned flags)
 	union drm_wait_vblank vbl;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc->pipe) | flags;
+	vbl.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc->crtc_index) | flags;
 	do_or_die(igt_ioctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl));
 
 	return vbl.reply.sequence;
@@ -435,7 +435,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 		/* Attempting to do a vblank while disabled should return -EINVAL */
 		memset(&vbl, 0, sizeof(vbl));
 		vbl.request.type = _DRM_VBLANK_RELATIVE;
-		vbl.request.type |= kmstest_get_vbl_flag(data->crtc->pipe);
+		vbl.request.type |= kmstest_get_vbl_flag(data->crtc->crtc_index);
 		igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
 	}
 
-- 
2.52.0

