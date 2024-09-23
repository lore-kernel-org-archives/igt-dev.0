Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B2CF9C73
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 22:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1225110E4AB;
	Mon, 23 Sep 2024 22:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jU+pX942";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F1E10E4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 22:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727129518; x=1758665518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VHpS4zdJ82K3i2gQ1httl70qGhXxjqZNTYQrmdhFSh8=;
 b=jU+pX942Kj9sel11tD2cgeuAYiF5Y1GF5eI5kU7m3u1cTwOLTiCt+MTn
 wio/J4X+zZktvzjvhLVGZiHf7jrfjBWt2PStgCozwGiNOFNeyK6E7Qp6b
 jHOI4xt9uhPg+infRniKLigpKERLcb/k8rgc+Afn9y8Mn89IydbM6ZoGk
 EoJNOkgG60Bem5VKp+AnomYsQyxJgXmVPsHYBqNEolN4pCXyb9ylN9NIb
 5b+PFFTTb1XVZBX5C9EPMSxyjE47HVtN+BD4pHReYaZIGcl2i0imiQOg2
 nWXemwOI5eEiZtXYdinsk9BpH60VcTuhaByyRkk9yvq+x1om++F1XhIEz w==;
X-CSE-ConnectionGUID: 6lGrYHhQRYqCE431u9pwRg==
X-CSE-MsgGUID: Prh2dod2RoWuL4rPUD4o1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43615589"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43615589"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:57 -0700
X-CSE-ConnectionGUID: QxZ84V9bTwa5VuTFt/hhCg==
X-CSE-MsgGUID: jiBz5fycTUqU5krGHHZQ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71244262"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.110.192])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/5] treewide: Fix intel_register_access_init()
Date: Mon, 23 Sep 2024 17:11:45 -0500
Message-ID: <20240923221146.125848-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923221146.125848-1-lucas.demarchi@intel.com>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
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

In several places intel_register_access_init() is called with fd == -1
as argument, even if it's passing a certain pci_dev, as e.g. the one
returned by intel_get_pci_device().  Those don't actually operate for
the same device. The fd is used for taking the forcewake, however if
fd == -1, then it always use <debugfs>/dri/0, which is not correct.

intel_get_pci_device() may not be the right function to use, but this
can be fixed later - for now it will at least use the same pci device
for taking the forcewake.

For intel_reg,

Before:
$ # with runtime pm already taken
$ sudo ./build/tools/intel_reg read 0x2358
                                    (0x00002358): 0x00000000
$ # without runtime pm
$ sudo ./build/tools/intel_reg read 0x2358
                                    (0x00002358): 0xffffffff

After:
$ sudo ./build/tools/intel_reg read 0x2358
                                    (0x00002358): 0xc3945002

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 benchmarks/gem_latency.c       |  2 +-
 lib/intel_io.h                 |  2 +-
 lib/intel_mmio.c               |  6 +++---
 tests/intel/gem_exec_endless.c |  2 +-
 tests/intel/gem_exec_latency.c |  2 +-
 tests/intel/gen7_exec_parse.c  |  2 +-
 tests/intel/xe_oa.c            |  3 +--
 tools/intel_display_poller.c   |  2 +-
 tools/intel_forcewaked.c       |  4 ++--
 tools/intel_infoframes.c       |  2 +-
 tools/intel_l3_parity.c        |  2 +-
 tools/intel_panel_fitter.c     |  2 +-
 tools/intel_perf_counters.c    |  2 +-
 tools/intel_reg.c              |  6 +++---
 tools/intel_watermark.c        | 16 ++++++++--------
 15 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/benchmarks/gem_latency.c b/benchmarks/gem_latency.c
index d3ebab005..b4e2afbf5 100644
--- a/benchmarks/gem_latency.c
+++ b/benchmarks/gem_latency.c
@@ -457,7 +457,7 @@ static int run(int seconds,
 		return IGT_EXIT_SKIP; /* Needs BCS timestamp */
 
 	intel_register_access_init(&mmio_data,
-				   igt_device_get_pci_device(fd), false, fd);
+				   igt_device_get_pci_device(fd), false);
 
 	if (gen == 6)
 		timestamp_reg = REG(RCS_TIMESTAMP);
diff --git a/lib/intel_io.h b/lib/intel_io.h
index e8dfd930b..66be7ede0 100644
--- a/lib/intel_io.h
+++ b/lib/intel_io.h
@@ -65,7 +65,7 @@ void intel_mmio_use_dump_file(struct intel_mmio_data *mmio_data, char *file);
 void intel_mmio_unmap_dump_file(struct intel_mmio_data *mmio_data);
 
 int intel_register_access_init(struct intel_mmio_data *mmio_data,
-			       struct pci_device *pci_dev, int safe, int fd);
+			       struct pci_device *pci_dev, int safe);
 void intel_register_access_fini(struct intel_mmio_data *mmio_data);
 uint32_t intel_register_read(struct intel_mmio_data *mmio_data, uint32_t reg);
 void intel_register_write(struct intel_mmio_data *mmio_data, uint32_t reg,
diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
index 31975727e..267d07b39 100644
--- a/lib/intel_mmio.c
+++ b/lib/intel_mmio.c
@@ -219,7 +219,7 @@ release_forcewake_lock(int fd)
  * Users are expected to call intel_register_access_fini() after use.
  */
 int
-intel_register_access_init(struct intel_mmio_data *mmio_data, struct pci_device *pci_dev, int safe, int fd)
+intel_register_access_init(struct intel_mmio_data *mmio_data, struct pci_device *pci_dev, int safe)
 {
 	int ret;
 
@@ -236,8 +236,8 @@ intel_register_access_init(struct intel_mmio_data *mmio_data, struct pci_device
 	/* Find where the forcewake lock is. Forcewake doesn't exist
 	 * gen < 6, but the debugfs should do the right things for us.
 	 */
-	ret = igt_open_forcewake_handle(fd);
-	if (ret == -1)
+	ret = igt_open_forcewake_handle_for_pcidev(pci_dev);
+	if (ret < 0)
 		mmio_data->key = FAKEKEY;
 	else
 		mmio_data->key = ret;
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index 6b2c56382..e7647e22e 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -363,7 +363,7 @@ igt_main
 
 			intel_register_access_init(&mmio,
 						   igt_device_get_pci_device(i915),
-						   false, i915);
+						   false);
 
 			sysfs = igt_sysfs_open(i915);
 			pin_rps(sysfs);
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index 3492f8503..a95c4890c 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -949,7 +949,7 @@ igt_main
 		if (ring_size > 1024)
 			ring_size = 1024;
 
-		intel_register_access_init(&mmio_data, igt_device_get_pci_device(device), false, device);
+		intel_register_access_init(&mmio_data, igt_device_get_pci_device(device), false);
 		rcs_clock = clockrate(device, 0x2000 + TIMESTAMP);
 		igt_info("RCS timestamp clock: %.0fKHz, %.1fns\n",
 			 rcs_clock / 1e3, 1e9 / rcs_clock);
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index d0dd21d08..3a37604e5 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -608,7 +608,7 @@ igt_main
 #undef REG
 
 		igt_fixture {
-			intel_register_access_init(&mmio_data, igt_device_get_pci_device(fd), 0, fd);
+			intel_register_access_init(&mmio_data, igt_device_get_pci_device(fd), 0);
 		}
 
 		for (int i = 0; i < ARRAY_SIZE(lris); i++) {
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index aae9be2c4..9be4fd633 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3937,8 +3937,7 @@ static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hw
 	mmio_base = oa_get_mmio_base(hwe);
 
 	intel_register_access_init(&mmio_data,
-				   igt_device_get_pci_device(drm_fd),
-				   0, drm_fd);
+				   igt_device_get_pci_device(drm_fd), 0);
 	stream_fd = __perf_open(drm_fd, &param, false);
 
 	dump_whitelist(mmio_base, "oa whitelisted");
diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index 30d9242c8..6089be3f1 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -1607,7 +1607,7 @@ int main(int argc, char *argv[])
 		break;
 	}
 
-	intel_register_access_init(&mmio_data ,intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	printf("%s?\n", test_name(test, pipe, bit, test_pixelcount));
 
diff --git a/tools/intel_forcewaked.c b/tools/intel_forcewaked.c
index 87b26d43a..571c829b0 100644
--- a/tools/intel_forcewaked.c
+++ b/tools/intel_forcewaked.c
@@ -81,7 +81,7 @@ int main(int argc, char *argv[])
 		INFO_PRINT("started daemon");
 	}
 
-	ret = intel_register_access_init(&mmio_data, intel_get_pci_device(), 1, -1);
+	ret = intel_register_access_init(&mmio_data, intel_get_pci_device(), 1);
 	if (ret) {
 		INFO_PRINT("Couldn't init register access\n");
 		exit(1);
@@ -92,7 +92,7 @@ int main(int argc, char *argv[])
 		if (!is_alive(&mmio_data)) {
 			INFO_PRINT("gpu reset? restarting daemon\n");
 			intel_register_access_fini(&mmio_data);
-			ret = intel_register_access_init(&mmio_data, intel_get_pci_device(), 1, -1);
+			ret = intel_register_access_init(&mmio_data, intel_get_pci_device(), 1);
 			if (ret)
 				INFO_PRINT("Reg access init fail\n");
 		}
diff --git a/tools/intel_infoframes.c b/tools/intel_infoframes.c
index d4bf528c2..aefb7fc15 100644
--- a/tools/intel_infoframes.c
+++ b/tools/intel_infoframes.c
@@ -1109,7 +1109,7 @@ int main(int argc, char *argv[])
 	       " perfectly: the Kernel might undo our changes.\n");
 
 	pci_dev = intel_get_pci_device();
-	intel_register_access_init(&mmio_data, pci_dev, 0, -1);
+	intel_register_access_init(&mmio_data, pci_dev, 0);
 	intel_check_pch();
 
 	if (IS_GEN4(pci_dev->device_id))
diff --git a/tools/intel_l3_parity.c b/tools/intel_l3_parity.c
index 8225b272d..947117d38 100644
--- a/tools/intel_l3_parity.c
+++ b/tools/intel_l3_parity.c
@@ -195,7 +195,7 @@ int main(int argc, char *argv[])
 
 	assert(intel_register_access_init(&mmio_data,
 					  igt_device_get_pci_device(device),
-					  0, device) == 0);
+					  0) == 0);
 
 	dir = igt_sysfs_open(device);
 
diff --git a/tools/intel_panel_fitter.c b/tools/intel_panel_fitter.c
index c6ee2101c..d9555d5c6 100644
--- a/tools/intel_panel_fitter.c
+++ b/tools/intel_panel_fitter.c
@@ -281,7 +281,7 @@ int main (int argc, char *argv[])
 	       "solution that may or may not work. Use it at your own risk.\n");
 
 	pci_dev = intel_get_pci_device();
-	intel_register_access_init(&mmio_data, pci_dev, 0, -1);
+	intel_register_access_init(&mmio_data, pci_dev, 0);
 	devid = pci_dev->device_id;
 
 	if (!HAS_PCH_SPLIT(devid)) {
diff --git a/tools/intel_perf_counters.c b/tools/intel_perf_counters.c
index d297f2e85..222eb9455 100644
--- a/tools/intel_perf_counters.c
+++ b/tools/intel_perf_counters.c
@@ -486,7 +486,7 @@ main(int argc, char **argv)
 		/* Forcewake */
 		intel_register_access_init(&mmio_data,
 					   igt_device_get_pci_device(fd),
-					   0, fd);
+					   0);
 
 		/* Enable performance counters */
 		intel_register_write(&mmio_data, OACONTROL,
diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index c5800cf05..bb1ab2889 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -813,7 +813,7 @@ static int intel_reg_read(struct config *config, int argc, char *argv[])
 	if (config->mmiofile)
 		intel_mmio_use_dump_file(&config->mmio_data, config->mmiofile);
 	else
-		intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
+		intel_register_access_init(&config->mmio_data, config->pci_dev, 0);
 
 	for (i = 1; i < argc; i++) {
 		struct reg reg;
@@ -843,7 +843,7 @@ static int intel_reg_write(struct config *config, int argc, char *argv[])
 		return EXIT_FAILURE;
 	}
 
-	intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
+	intel_register_access_init(&config->mmio_data, config->pci_dev, 0);
 
 	for (i = 1; i < argc; i += 2) {
 		struct reg reg;
@@ -881,7 +881,7 @@ static int intel_reg_dump(struct config *config, int argc, char *argv[])
 	if (config->mmiofile)
 		intel_mmio_use_dump_file(&config->mmio_data, config->mmiofile);
 	else
-		intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
+		intel_register_access_init(&config->mmio_data, config->pci_dev, 0);
 
 	for (i = 0; i < config->regcount; i++) {
 		reg = &config->regs[i];
diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 115ae8b2a..4ebd6eb93 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -328,7 +328,7 @@ static void skl_wm_dump(void)
 	uint32_t wm_linetime[num_pipes];
 	uint32_t arb_ctl, arb_ctl2, wm_dbg;
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	arb_ctl = read_reg(0x45000);
 	arb_ctl2 = read_reg(0x45004);
@@ -650,7 +650,7 @@ static void ilk_wm_dump(void)
 	struct ilk_plane primary[3] = {}, sprite[3] = {}, cursor[3] = {};
 	struct ilk_wm wm = {};
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	for (i = 0; i < num_pipes; i++) {
 		dspcntr[i] = read_reg(0x70180 + i * 0x1000);
@@ -863,7 +863,7 @@ static void vlv_wm_dump(void)
 	uint32_t dsp_ss_pm, ddr_setup2;
 	struct gmch_wm wms[MAX_PLANE] = {};
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	dsparb = read_reg(0x70030);
 	dsparb2 = read_reg(0x70060);
@@ -1080,7 +1080,7 @@ static void g4x_wm_dump(void)
 	uint32_t mi_arb_state;
 	struct gmch_wm wms[MAX_PLANE] = {};
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	dspacntr = read_reg(0x70180);
 	dspbcntr = read_reg(0x71180);
@@ -1167,7 +1167,7 @@ static void gen4_wm_dump(void)
 	uint32_t mi_arb_state;
 	struct gmch_wm wms[MAX_PLANE] = {};
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	dsparb = read_reg(0x70030);
 	fw1 = read_reg(0x70034);
@@ -1239,7 +1239,7 @@ static void pnv_wm_dump(void)
 	uint32_t cbr;
 	struct gmch_wm wms[MAX_PLANE] = {};
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	dsparb = read_reg(0x70030);
 	fw1 = read_reg(0x70034);
@@ -1330,7 +1330,7 @@ static void gen3_wm_dump(void)
 	uint32_t mi_arb_state;
 	struct gmch_wm wms[MAX_PLANE] = {};
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	dsparb = read_reg(0x70030);
 	instpm = read_reg(0x20c0);
@@ -1400,7 +1400,7 @@ static void gen2_wm_dump(void)
 	uint32_t mi_state;
 	struct gmch_wm wms[MAX_PLANE] = {};
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
 	dsparb = read_reg(0x70030);
 	mem_mode = read_reg(0x20cc);
-- 
2.46.1

