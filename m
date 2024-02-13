Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63C9C4829A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 10:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492F810E2CD;
	Tue, 13 Feb 2024 10:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKPudMUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B667D10E2E4
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818498; x=1739354498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5h39FvDH0qqf3m3HdKBBefuUIIHzdb20Ua4Y6xFN6LM=;
 b=hKPudMUC8PUnnXpgLKZv5FXQXTaROeAsS++mxwEuqIHpyXpv8Ju4cggP
 bxGVfb/VC4m3pnh9dMDzmE6t1wnZms3wPsrL/YBmM1cd7oUSdNxfM1A/k
 3wXqgVjtPvySs6IDuQWVI1UxNmDrzTni4HcJl+ZGxkf+t+s3uj4fhG470
 C7jbMEOazedWxD4hhiU3XWnN07CdCtTA8t4H6DYGdG9kpjZqlE+A0F6ZT
 D3jpAQ9ujfkjy3Nia8YVQb0Zl7tz8ZpF4egmCLuDWrruPQYwtToCJbKxD
 yz7cnA8/DjsnS/7QxDCQFnZn7rc0hqW2VSPeZh4Ig3xd6Fq/DRpwPEgZk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19232351"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="19232351"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2815502"
Received: from gfmckenx-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:36 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 2/8] tests/intel: prefer intel_buf_init_in_region()
Date: Tue, 13 Feb 2024 10:01:19 +0000
Message-ID: <20240213100125.90085-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213100125.90085-1-matthew.auld@intel.com>
References: <20240213100125.90085-1-matthew.auld@intel.com>
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

We want to get rid of intel_buf_init_using_handle(), in favour of
something where bo_size is always passed in. It looks like we can
instead just use intel_buf_init_in_region() here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/gem_gpgpu_fill.c   | 7 ++-----
 tests/intel/gem_media_fill.c   | 7 ++-----
 tests/intel/i915_pipe_stress.c | 8 +++-----
 tests/intel/i915_pm_rpm.c      | 8 +++-----
 4 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index 25f2a96c1..ac283620e 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -78,7 +78,6 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
 {
 	struct intel_buf *buf;
 	uint8_t *ptr;
-	uint32_t handle;
 	int i;
 
 	buf = calloc(1, sizeof(*buf));
@@ -88,10 +87,8 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
 	 * Legacy code uses 32 bpp after buffer creation.
 	 * Let's do the same due to keep shader intact.
 	 */
-	handle = gem_create_in_memory_regions(data->drm_fd, SIZE, region);
-	intel_buf_init_using_handle(data->bops, handle, buf,
-				    width/4, height, 32, 0,
-				    I915_TILING_NONE, 0);
+	intel_buf_init_in_region(data->bops, buf, width/4, height, 32, 0,
+				 I915_TILING_NONE, 0, region);
 
 	ptr = gem_mmap__cpu_coherent(data->drm_fd, buf->handle, 0,
 				     buf->surface[0].size, PROT_WRITE);
diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index a678d2f99..79a06f7b8 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -75,21 +75,18 @@ static struct intel_buf *
 create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
 {
 	struct intel_buf *buf;
-	uint32_t handle;
 	uint8_t *ptr;
 	int i;
 
 	buf = calloc(1, sizeof(*buf));
 	igt_assert(buf);
 
-	handle = gem_create_in_memory_regions(data->drm_fd, SIZE, region);
-
 	/*
 	 * Legacy code uses 32 bpp after buffer creation.
 	 * Let's do the same due to keep shader intact.
 	 */
-	intel_buf_init_using_handle(data->bops, handle, buf, width/4,
-				    height, 32, 0, I915_TILING_NONE, 0);
+	intel_buf_init_in_region(data->bops, buf, width/4, height, 32, 0,
+				 I915_TILING_NONE, 0, region);
 
 	ptr = gem_mmap__cpu_coherent(data->drm_fd, buf->handle, 0,
 				     buf->surface[0].size, PROT_WRITE);
diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index f9da5f023..79f83d266 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -192,7 +192,6 @@ static struct intel_buf *
 create_buf(struct data *data, int width, int height, uint32_t region)
 {
 	struct intel_buf *buf;
-	uint32_t handle;
 
 	buf = calloc(1, sizeof(*buf));
 	igt_assert(buf);
@@ -201,10 +200,9 @@ create_buf(struct data *data, int width, int height, uint32_t region)
 	 * Legacy code uses 32 bpp after buffer creation.
 	 * Let's do the same due to keep shader intact.
 	 */
-	handle = gem_create_in_memory_regions(data->drm_fd, width * height, region);
-	intel_buf_init_using_handle(data->bops, handle, buf,
-				    width/4, height, 32, 0,
-				    I915_TILING_NONE, 0);
+	intel_buf_init_in_region(data->bops, buf,
+				 width/4, height, 32, 0,
+				 I915_TILING_NONE, 0, region);
 
 	return buf;
 }
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 2b0a63bde..7f64d1069 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -218,7 +218,6 @@ create_buf(struct data_t *data, uint32_t color)
 {
 	struct intel_buf *buf;
 	uint8_t *ptr;
-	uint32_t handle;
 	struct buf_ops *bops;
 	int i;
 
@@ -226,10 +225,9 @@ create_buf(struct data_t *data, uint32_t color)
 	igt_assert(buf);
 	bops = buf_ops_create(drm_fd);
 
-	handle = gem_create_in_memory_regions(drm_fd, SIZE, data->region);
-	intel_buf_init_using_handle(bops, handle, buf,
-				    data->width / 4, data->height, 32, 0,
-				    I915_TILING_NONE, 0);
+	intel_buf_init_in_region(bops, buf,
+				 data->width / 4, data->height, 32, 0,
+				 I915_TILING_NONE, 0, data->region);
 
 	ptr = gem_mmap__cpu_coherent(drm_fd, buf->handle, 0,
 				     buf->surface[0].size, PROT_WRITE);
-- 
2.43.0

