Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FB5FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 18:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD4110E707;
	Tue, 31 Mar 2026 18:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hY0KREom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC1C10E995
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774980476; x=1806516476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1lTrcz2Id1xPHp1yIjPA7FL7sFSqhGayx3BkevaDk7A=;
 b=hY0KREomNXnHVDhpiPYMyWzV2Bpo8bKAQUtW2Waxq+v4x0zgE9m0O8T6
 JOESOPXehfUlMexODeTzLoioP6Iw3OYZdz4j2B3RhDGrOf/D8UXSi0PAs
 untMmAT8GzYD4eM4DbLf6dZrVjA1simv8G5lfi4SAbvTvfx2bu1s4R1xj
 8x2VbdCb5oPZ6Oqz27XRVHG/IhAfc5rHLb4tJ2Fd8fLsLXhFIxao2NSSV
 C0Pdj4sWFcFzq9F1EtG3su/l9ypt9CrRveJbEXKHqGKKA1WjnQRBnr3HA
 FYHmvG7F23NstywQaDILWDfxlO1Hq+kxygERkalJQnHy9aTF+HQbetfp8 g==;
X-CSE-ConnectionGUID: Ab14BeF4RyWX+kaZdrK8kg==
X-CSE-MsgGUID: 5UPWMmFKTgCpNa1LyQtxog==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79607768"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="79607768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:07:56 -0700
X-CSE-ConnectionGUID: 1Os2qxsdQS61zxhM3S+Ywg==
X-CSE-MsgGUID: xV6GJRNbRiqcFzQPEu5e+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="226306897"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:07:53 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, matthew.auld@intel.com, raag.jadav@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v1 1/1] drm/xe/xe_pm: Have high VRAM usage during system
 suspend
Date: Tue, 31 Mar 2026 23:43:56 +0530
Message-Id: <20260331181356.4133309-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260331181356.4133309-1-karthik.poosa@intel.com>
References: <20260331181356.4133309-1-karthik.poosa@intel.com>
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

Create high VRAM usage by allocating a large BO prior to system suspend.
This increases eviction time, helping to expose any unknown issues in the
suspend‑resume flow.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm.c | 86 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 54f2e9d18..bff3b1cac 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -69,6 +69,8 @@ static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
 static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
 static bool child_ready = false;
+uint32_t *map_large_buf;
+uint64_t buf_size = 0;
 
 typedef struct {
 	device_t device;
@@ -871,6 +873,75 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
 	close(i2c_fd);
 }
 
+static void alloc_large_buf(int fd_xe)
+{
+	struct drm_xe_query_mem_regions *mem_regions;
+	uint64_t vram_used_mb = 0, vram_total_mb = 0;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
+		.size = 0,
+		.data = 0,
+	};
+	uint32_t bo, placement;
+	int i = 0;
+
+	igt_require(xe_has_vram(fd_xe));
+	placement = vram_memory(fd_xe, 0);
+	igt_require_f(placement, "Device doesn't support vram memory region\n");
+
+	igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	mem_regions = malloc(query.size);
+	igt_assert(mem_regions);
+
+	query.data = to_user_pointer(mem_regions);
+	igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	for (i = 0; i < mem_regions->num_mem_regions; i++) {
+		if (mem_regions->mem_regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
+			vram_used_mb +=  (mem_regions->mem_regions[i].used / (1024 * 1024));
+			vram_total_mb += (mem_regions->mem_regions[i].total_size / (1024 * 1024));
+		}
+	}
+
+	igt_debug("Before large_buf alloc vram total %lu MB, used vram_used %lu MB\n", vram_total_mb, vram_used_mb);
+
+	// Allocate a BO of the size of available free VRAM
+	buf_size = (vram_total_mb-vram_used_mb-1)*1024*1024;
+	buf_size = ALIGN(buf_size, xe_get_default_alignment(fd_xe));
+	igt_debug("Creating large_buf of size %lu MB\n", (buf_size/(1024*1024)));
+	bo = xe_bo_create(fd_xe, 0, buf_size , placement, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	igt_require(bo);
+	map_large_buf = xe_bo_map(fd_xe, bo, buf_size);
+	igt_assert(map_large_buf != MAP_FAILED);
+	memset(map_large_buf, 0, buf_size);
+
+	for (i = 0; i < buf_size / sizeof(*map_large_buf); i++) {
+		map_large_buf[i] = 0xDEADBEAF;
+	}
+
+	query.data = to_user_pointer(mem_regions);
+	igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	for (i = 0; i < mem_regions->num_mem_regions; i++) {
+		if (mem_regions->mem_regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
+			vram_used_mb +=  (mem_regions->mem_regions[i].used / (1024 * 1024));
+			vram_total_mb += (mem_regions->mem_regions[i].total_size / (1024 * 1024));
+		}
+	}
+	igt_info("After alloc vram total %lu MB, used vram_used %lu MB\n", vram_total_mb, vram_used_mb);
+
+	free(mem_regions);
+}
+
+static void free_large_buf(int fd_xe)
+{
+	igt_info("Freeing large_buf\n");
+	if (map_large_buf)
+		munmap(map_large_buf, buf_size);
+}
+
 int igt_main()
 {
 	device_t device;
@@ -925,26 +996,34 @@ int igt_main()
 	}
 
 	for (const struct s_state *s = s_states; s->name; s++) {
+
 		igt_subtest_f("%s-basic", s->name) {
 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+			alloc_large_buf(device.fd_xe);
 			igt_system_suspend_autoresume(s->state, test);
+			free_large_buf(device.fd_xe);
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
+			alloc_large_buf(device.fd_xe);
 			test_exec(device, 1, 2, s->state, NO_RPM, 0);
+			free_large_buf(device.fd_xe);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
-
+			alloc_large_buf(device.fd_xe);
 			igt_system_suspend_autoresume(s->state, test);
 			test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0);
+			free_large_buf(device.fd_xe);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
+			alloc_large_buf(device.fd_xe);
 			test_exec(device, 16, 32, s->state, NO_RPM, 0);
+			free_large_buf(device.fd_xe);
 		}
 
 		for (const struct vm_op *op = vm_op; op->name; op++) {
@@ -962,8 +1041,11 @@ int igt_main()
 			}
 		}
 
-		igt_subtest_f("%s-mocs", s->name)
+		igt_subtest_f("%s-mocs", s->name) {
+			alloc_large_buf(device.fd_xe);
 			test_mocs_suspend_resume(device, s->state, NO_RPM);
+			free_large_buf(device.fd_xe);
+		}
 	}
 
 	igt_fixture() {
-- 
2.25.1

