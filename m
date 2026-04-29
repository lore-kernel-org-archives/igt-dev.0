Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAD9FF8864
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 05:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D5210EE5C;
	Wed, 29 Apr 2026 05:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9xnsOUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA94E10EE5C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 05:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777441247; x=1808977247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kdvya6liIRyV4eHJeRoTZli2dMsvdiz5FVkiGaljdTI=;
 b=e9xnsOUhxwQ/aFnQaITX6hxcV9T1KTxBttPU9ZGva9KkMj2x7g6PnmsJ
 EPLZGdn1TyBePcmLrWGLvL3upnc9dHgSwsFi8cWQEeY6ttF4/x7hg0Xh7
 zW5OzIyUOO3i/ADnHnS2TCWoqnRkvooTc7/DoOT+eeMGF5VE5snUXy24v
 I9hNElye9/y5spUFeErOG/L+4qhhwN0jXYPkD3cSiTSZclX4aCkpzpGqX
 EbxyXq2MYr6Q7nS+Iqj70XEO+gB+X5j/l0MYgxBEuBsvn+PuZauiA5xHU
 ylxj+vuAf+yPo0x6HzcsHDRKlYehT99H37jQeL2Vq6rsBz8NGKi3oQoPM Q==;
X-CSE-ConnectionGUID: 1Z+C+cv3Tl221l4FrmV2+Q==
X-CSE-MsgGUID: MP1ILslFQfyNkMY+8h9vOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="101025136"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="101025136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:40:46 -0700
X-CSE-ConnectionGUID: vuue9qItQyGhGRR7Y814Ng==
X-CSE-MsgGUID: 7qXy8kz7RLWFJwYTs/uQGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="227651364"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2026 22:40:44 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Cc: marcin.bernatowicz@linux.intel.com,
	nitin.r.gote@intel.com
Subject: [PATCH] tests/intel/xe_configfs: Use available engine for ctx-restore
 subtests
Date: Wed, 29 Apr 2026 11:45:29 +0530
Message-ID: <20260429061528.2216101-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

The ctx-restore-post-bb and ctx-restore-mid-bb subtests were hardcoded
to use the "rcs" engine class. Platforms without a render engine (e.g.
PVC, CRI) fail because the batch buffer is never injected into any
engine's LRC, causing register readback to fail.

Fix by dynamically detecting an available engine in the fixture using
xe_for_each_engine(). Prefer render ("rcs") when available, otherwise
fall back to compute ("ccs"). Every xe platform has at least one of
these engine classes. Remove the hardcoded "rcs" from test data and
add the detected engine name at runtime.

v2: Add igt_require_f(engine, "explanation\n") (Kamil)

Fixes: b6abdc26e01b ("tests/intel/xe_configfs: Check ctx_restore_post_bb")
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 tests/intel/xe_configfs.c | 64 +++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 755524e7c..f03cf820f 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -261,11 +261,12 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
  * SUBTEST: ctx-restore-mid-bb
  * Description: Validate ctx_restore_mid_bb attribute
  */
-static void test_ctx_restore(int configfs_device_fd, const char *type)
+static void test_ctx_restore(int configfs_device_fd, const char *type,
+			     const char *engine)
 {
 	static const struct value {
 		const char *test;
-		const char *in;
+		const char *in[3];
 		const char *out;
 		uint32_t reg[4];
 		uint32_t reg_val[4];
@@ -276,41 +277,46 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
 		 * previous execution set a specific value in the HW
 		 */
 		{ .test = "cmd-single",
-		  .in = "rcs cmd 11000001 4F100 DEA0BEE0",
-		  .out = "rcs: 11000001 0004f100 dea0bee0\n",
+		  .in = { "cmd 11000001 4F100 DEA0BEE0" },
+		  .out = "11000001 0004f100 dea0bee0",
 		  .reg = { 0x4f100 },
 		  .reg_val = { 0xdea0bee0 },
 		},
 		{ .test = "cmd-single-multi-values",
-		  .in = "rcs cmd 11000003 4F100 DEA1BEE1 4F104 DEA2BEE2",
-		  .out = "rcs: 11000003 0004f100 dea1bee1 0004f104 dea2bee2\n",
+		  .in = { "cmd 11000003 4F100 DEA1BEE1 4F104 DEA2BEE2" },
+		  .out = "11000003 0004f100 dea1bee1 0004f104 dea2bee2",
 		  .reg = { 0x4f100, 0x4f104 },
 		  .reg_val = { 0xdea1bee1, 0xdea2bee2 },
 		},
 		{ .test = "cmd-multi",
-		  .in = "rcs cmd 11000001 4F100 DEA3BEE3\n"
-			"rcs cmd 11000001 4F104 DEA4BEE4",
-		  .out = "rcs: 11000001 0004f100 dea3bee3 11000001 0004f104 dea4bee4\n",
+		  .in = { "cmd 11000001 4F100 DEA3BEE3",
+			  "cmd 11000001 4F104 DEA4BEE4" },
+		  .out = "11000001 0004f100 dea3bee3 11000001 0004f104 dea4bee4",
 		  .reg = { 0x4f100, 0x4f104 },
 		  .reg_val = { 0xdea3bee3, 0xdea4bee4 },
 		},
 		{ .test = "reg-single",
-		  .in = "rcs reg 4F100 DEA5BEE5",
-		  .out = "rcs: 11000001 0004f100 dea5bee5\n",
+		  .in = { "reg 4F100 DEA5BEE5" },
+		  .out = "11000001 0004f100 dea5bee5",
 		  .reg = { 0x4f100 },
 		  .reg_val = { 0xdea5bee5 },
 		},
 		{ .test = "reg-multi",
-		  .in = "rcs reg 4F100 DEA6BEE6\n"
-			"rcs reg 4F104 DEA7BEE7",
-		  .out = "rcs: 11000001 0004f100 dea6bee6 11000001 0004f104 dea7bee7\n",
+		  .in = { "reg 4F100 DEA6BEE6",
+			  "reg 4F104 DEA7BEE7" },
+		  .out = "11000001 0004f100 dea6bee6 11000001 0004f104 dea7bee7",
 		  .reg = { 0x4f100, 0x4f104 },
 		  .reg_val = { 0xdea6bee6, 0xdea7bee7 },
 		},
 	};
+	char in[4096] = { };
+	char out[4096] = { };
 	char buf[4096] = { };
 	char file[64] = { };
 
+	igt_require_f(engine,
+		      "No render or compute engine available for ctx-restore test\n");
+
 	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -319,14 +325,19 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
 		igt_audio_driver_unload(NULL);
 		igt_kmod_unbind("xe", bus_addr);
 
+		for (int j = 0, off = 0; v->in[j]; j++)
+			off += snprintf(in + off, sizeof(in) - off, "%s %s\n",
+					engine, v->in[j]);
+		snprintf(out, sizeof(out), "%s: %s\n", engine, v->out);
+
 		igt_info("Test %s\n", v->test);
-		igt_debug("bb '%s'\n", v->in);
-		igt_assert(igt_sysfs_set(configfs_device_fd, file, v->in));
+		igt_debug("bb '%s'\n", in);
+		igt_assert(igt_sysfs_set(configfs_device_fd, file, in));
 
 		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
 					  sizeof(buf) - 1));
-		if (strcmp(v->out, buf)) {
-			igt_debug("Expecting '%s' but found '%s'\n", v->out, buf);
+		if (strcmp(out, buf)) {
+			igt_debug("Expecting '%s' but found '%s'\n", out, buf);
 			igt_fail(IGT_EXIT_FAILURE);
 		}
 
@@ -364,12 +375,25 @@ int igt_main()
 	int fd, configfs_fd, configfs_device_fd;
 	uint32_t devid;
 	bool is_vf_device;
+	const char *engine = NULL;
 
 	igt_fixture() {
+		struct drm_xe_engine_class_instance *hwe;
+
 		fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(fd);
 		is_vf_device = intel_is_vf_device(fd);
 		set_bus_addr(fd);
+
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
+				engine = "rcs";
+				break;
+			}
+			if (!engine && hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+				engine = "ccs";
+		}
+
 		drm_close_driver(fd);
 
 		configfs_fd = igt_configfs_open("xe");
@@ -419,7 +443,7 @@ int igt_main()
 	igt_subtest("ctx-restore-post-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_ctx_restore(configfs_device_fd, "post");
+		test_ctx_restore(configfs_device_fd, "post", engine);
 		close_configfs_group(configfs_fd, configfs_device_fd);
 	}
 
@@ -435,7 +459,7 @@ int igt_main()
 	igt_subtest("ctx-restore-mid-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_ctx_restore(configfs_device_fd, "mid");
+		test_ctx_restore(configfs_device_fd, "mid", engine);
 		close_configfs_group(configfs_fd, configfs_device_fd);
 	}
 
-- 
2.50.1

