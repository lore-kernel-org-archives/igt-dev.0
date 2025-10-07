Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ED0CCD186
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 23:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6724E10E71A;
	Tue,  7 Oct 2025 23:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FkubJiEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025AE10E718
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759879601; x=1791415601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79LyaUodEqYCwVatfuchBN5cpBRJ9coqtHztyTd5JPM=;
 b=FkubJiEFwdDu3ak2DFRd6mOLxOikZ6uXzcSBje56HloVa9Xmk66sXXVu
 FhMGKQp+1fe3V1xHQDNW0Xnl2Xia/Njaq1U3ND7AQJn90Cwdxn3nLK0iV
 lbF9qAud/iNwFFvgeaJHSEhwDTL1nsFQEpr5aVYJnUeIF8QhsIPFtvcvE
 raxBjSxKJ1oipIqe6+KF/BWZ7zJBt8qtCKfHFXpBHxglKl0cVEaubDJ+j
 AK/bf89bhXZFzHxpl6Btd1GVQnTBmACBJM28zw2fsM0KHmYHZ/ya72iAn
 tJkYd7GcrG9HuGS5r4qgJlzAHThZ+Q+XsFvCLruymGlfzTFKI8mmA3neW A==;
X-CSE-ConnectionGUID: /ekNAKu4QomzwG3imUq25g==
X-CSE-MsgGUID: 3OU9by9+SKK7c2ydX3yDTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="79717940"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="79717940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 16:26:41 -0700
X-CSE-ConnectionGUID: 1WEP7KklSJ69Mg6FgGQEgw==
X-CSE-MsgGUID: 5O1Eq+OnQhW2NPoFaIIVgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="179882176"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by orviesa009.jf.intel.com with ESMTP; 07 Oct 2025 16:26:40 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 5/6] tools: Use new APIs for xe device info queries
Date: Tue,  7 Oct 2025 23:26:05 +0000
Message-ID: <20251007232606.363629-6-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007232606.363629-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251007232606.363629-1-x.wang@intel.com>
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

Update tools to use new runtime query APIs:
- Replace intel_gen(devid) with intel_query_gen(fd)
- Replace intel_get_device_info(devid) with intel_query_device_info(fd)
- Update meson.build dependency from lib_igt_chipset to lib_igt

These changes enable runtime device info queries for xe devices
instead of relying on static device ID lookups.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tools/intel_tiling_detect.c      | 3 +--
 tools/xe-perf/meson.build        | 2 +-
 tools/xe-perf/xe_perf_configs.c  | 2 +-
 tools/xe-perf/xe_perf_recorder.c | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
index 951e2eecd..a6aca36f9 100644
--- a/tools/intel_tiling_detect.c
+++ b/tools/intel_tiling_detect.c
@@ -217,12 +217,11 @@ static void render(int fd, uint32_t width, uint32_t height, uint32_t tiling)
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
 	struct intel_buf src, dst;
-	uint32_t devid = intel_get_drm_devid(fd);
 	igt_render_copyfunc_t render_copy = NULL;
 
 	bops = buf_ops_create(fd);
 
-	igt_debug("%s() gen: %d\n", __func__, intel_gen(devid));
+	igt_debug("%s() gen: %d\n", __func__, intel_query_gen(fd));
 
 	ibb = intel_bb_create(fd, SZ_4K);
 
diff --git a/tools/xe-perf/meson.build b/tools/xe-perf/meson.build
index 8506aa320..575b525e2 100644
--- a/tools/xe-perf/meson.build
+++ b/tools/xe-perf/meson.build
@@ -1,7 +1,7 @@
 executable('xe-perf-configs',
            [ 'xe_perf_configs.c' ],
            include_directories: inc,
-           dependencies: [lib_igt_chipset, lib_igt_xe_oa],
+           dependencies: [lib_igt, lib_igt_xe_oa],
            install: true)
 
 executable('xe-perf-recorder',
diff --git a/tools/xe-perf/xe_perf_configs.c b/tools/xe-perf/xe_perf_configs.c
index bd37fef5c..6ee261f88 100644
--- a/tools/xe-perf/xe_perf_configs.c
+++ b/tools/xe-perf/xe_perf_configs.c
@@ -192,7 +192,7 @@ main(int argc, char *argv[])
 
 	fprintf(stdout, "Found device id=0x%x\n", devid);
 
-	devinfo = intel_get_device_info(drm_fd);
+	devinfo = intel_query_device_info(drm_fd);
 	if (!devinfo) {
 		fprintf(stderr, "No device info found.\n");
 		return EXIT_FAILURE;
diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index f200fe9c9..7ce4a5684 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -1029,7 +1029,7 @@ main(int argc, char *argv[])
 
 	xe_device_get(ctx.drm_fd);
 
-	ctx.devinfo = intel_get_device_info(ctx.devid);
+	ctx.devinfo = intel_query_device_info(ctx.drm_fd);
 	if (!ctx.devinfo) {
 		fprintf(stderr, "No device info found.\n");
 		goto fail;
-- 
2.43.0

