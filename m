Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F381CFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AFA10E8F4;
	Fri, 21 Nov 2025 19:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RI2+1rJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D9E10E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763752007; x=1795288007;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A/dobYvF0njMjObUSzIdsaPTHycduuBDnF4EGPdEm54=;
 b=RI2+1rJvdNcp7tysahxHrsKCa2WAxvblQNCQUDoNc+8ERAd+2ya6g4US
 O+A7gKQMzfsLDAjnHDzecJN1Jj57SVTh6orpyfPgIaTHQQFIEiGlAo2Kq
 8ZGN3nfTWQFhrCFjPUuYC8FtUa0FvH0K3a2Jl65/zRWsYDZezK2cqjJB4
 FKKPtcYSS9NVt5wxRbB1t/V51qZD8VrP1yPHp89uNpmBNBkab1trXfbiq
 3sbfmfKnjSc/xdMFD6dC83hsZB0d79BOfON5dNUVzVmNwHHAYBM2QY4wL
 glbdq3eKS52pu3RyJDGz65PwLfwUyTcZqBW8tbWpPo+jo8lck1ziKanMQ A==;
X-CSE-ConnectionGUID: ePe1cDreQm+vsdSCbQ+G1w==
X-CSE-MsgGUID: slx64zISQQepr/ER5+GDlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68454382"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="68454382"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:47 -0800
X-CSE-ConnectionGUID: PoT/VEazRyS3Pk/eJ4SBBQ==
X-CSE-MsgGUID: aWyzsoN/SzCbpFYLcGnETA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192537574"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/8] lib/kms: Nuke PIPE_ANY
Date: Fri, 21 Nov 2025 21:06:27 +0200
Message-ID: <20251121190633.24522-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

For some reason we have two names for the same
enum value (PIPE_NONE and PIPE_ANY). Get rid of
the less used one.

Done with cocci:
@@
@@
enum pipe {
...,
- PIPE_ANY = PIPE_NONE,
...
};

@@
@@
- PIPE_ANY
+ PIPE_NONE

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h                  | 1 -
 tests/intel/kms_fb_coherency.c | 2 +-
 tests/intel/kms_flip_tiling.c  | 2 +-
 tests/intel/perf_pmu.c         | 2 +-
 tests/intel/prime_mmap_kms.c   | 2 +-
 tests/kms_flip_event_leak.c    | 2 +-
 tests/kms_plane_multiple.c     | 2 +-
 tests/vmwgfx/vmw_prime.c       | 2 +-
 8 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f7ff0b17eb02..e1241342a0c9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -72,7 +72,6 @@
  */
 enum pipe {
         PIPE_NONE = -1,
-        PIPE_ANY = PIPE_NONE,
         PIPE_A = 0,
         PIPE_B,
         PIPE_C,
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index 573037db1102..5f5bf7b8e9df 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -144,7 +144,7 @@ static void cleanup_crtc(data_t *data)
 
 	igt_plane_set_fb(data->primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index d078653e9d91..a6a162b94817 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -176,7 +176,7 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	/* Clean up. */
 	igt_plane_set_fb(primary, NULL);
 	pipe_crc_free(data);
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
 	igt_remove_fb(data->drm_fd, &data->fb[1]);
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index bf43da8db57b..e06ddafaf4e6 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1079,7 +1079,7 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 }
 
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index c0c2f2fc0e00..a8d84f034d94 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -161,7 +161,7 @@ static void cleanup_crtc(gpu_process_t *gpu)
 
 	igt_plane_set_fb(gpu->primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 
 	igt_remove_fb(gpu->drm_fd, &gpu->fb);
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 71b58b4dfe31..d88b08d16dbc 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -97,7 +97,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_device_set_master(data->drm_fd);
 
 	igt_plane_set_fb(primary, NULL);
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(&data->display);
 
 	igt_remove_fb(data->drm_fd, &fb[0]);
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 4e6ca780a6ed..947a0e6bc591 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -120,7 +120,7 @@ static void test_init(data_t *data, enum pipe pipe, int n_planes)
 static void test_fini(data_t *data, igt_output_t *output, int n_planes)
 {
 	/* reset the constraint on the pipe */
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 
 	igt_pipe_crc_free(data->pipe_crc1);
 	data->pipe_crc1 = NULL;
diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index 5c39ff1a4d45..5f0556c0c6a8 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -185,7 +185,7 @@ static void cleanup_crtc(struct gpu_process_t *gpu)
 
 	igt_plane_set_fb(gpu->primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 
 	igt_remove_fb(gpu->mdevice.drm_fd, &gpu->fb);
-- 
2.49.1

