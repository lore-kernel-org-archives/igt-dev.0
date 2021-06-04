Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF22A6E405
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 20:39:45 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri,  4 Jun 2021 13:39:22 -0700
Message-Id: <20210604203927.494340-2-matthew.d.roper@intel.com>
In-Reply-To: <20210604203927.494340-1-matthew.d.roper@intel.com>
References: <20210604203927.494340-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/6] lib/i915: Split 'gen' into graphics
 version and display version
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Going forward, platforms may have separate architecture versions for
graphics and display and should no longer utilize a single 'gen'
version.

While doing this, let's change the versions to raw version values rather
than BIT(v) as we were doing in the past.  It looks like some of the
existing uses of devinfo->gen were already misinterpreting this field
and failing to pass the value through ffs(), so this change may also fix
some bugs.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/i915/perf.c                      |   4 +-
 lib/i915/perf.h                      |   2 +-
 lib/i915/perf_data_reader.c          |   6 +-
 lib/igt_device_scan.c                |   2 +-
 lib/igt_gt.c                         |  10 +-
 lib/intel_chipset.h                  |   7 +-
 lib/intel_device_info.c              | 131 ++++++++++++++++++---------
 tests/i915/gem_exec_store.c          |   4 +-
 tests/i915/i915_pciid.c              |   4 +-
 tools/i915-perf/i915_perf_configs.c  |   2 +-
 tools/i915-perf/i915_perf_reader.c   |   5 +-
 tools/i915-perf/i915_perf_recorder.c |   6 +-
 12 files changed, 114 insertions(+), 69 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 5644a346..9d5ab7a5 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -169,7 +169,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 	 * 2x6 does not have 2 samplers).
 	 */
 	perf->devinfo.devid = device_id;
-	perf->devinfo.gen = devinfo->gen;
+	perf->devinfo.graphics_ver = devinfo->graphics_ver;
 	perf->devinfo.revision = revision;
 	perf->devinfo.timestamp_frequency = timestamp_frequency;
 	perf->devinfo.gt_min_freq = gt_min_freq;
@@ -183,7 +183,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 	/* On Gen11+ the equations from the xml files expect an 8bits
 	 * mask per subslice, versus only 3bits on prior Gens.
 	 */
-	bits_per_subslice = devinfo->gen >= 11 ? 8 : 3;
+	bits_per_subslice = devinfo->graphics_ver >= 11 ? 8 : 3;
 	for (uint32_t s = 0; s < topology->max_slices; s++) {
 		if (!slice_available(topology, s))
 			continue;
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 6a39be92..d2429c47 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -50,7 +50,7 @@ struct intel_perf_devinfo {
 	 * Their values are build up from the topology fields.
 	 */
 	uint32_t devid;
-	uint32_t gen;
+	uint32_t graphics_ver;
 	uint32_t revision;
 	uint64_t timestamp_frequency;
 	uint64_t gt_min_freq;
diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index 79cb50f4..e69189ac 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -45,11 +45,11 @@ oa_report_ctx_is_valid(const struct intel_perf_devinfo *devinfo,
 {
 	const uint32_t *report = (const uint32_t *) _report;
 
-	if (devinfo->gen < 8) {
+	if (devinfo->graphics_ver < 8) {
 		return false; /* TODO */
-	} else if (devinfo->gen == 8) {
+	} else if (devinfo->graphics_ver == 8) {
 		return report[0] & (1ul << 25);
-	} else if (devinfo->gen > 8) {
+	} else if (devinfo->graphics_ver > 8) {
 		return report[0] & (1ul << 16);
 	}
 
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 2b7d9a3a..3c23fe0e 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -208,7 +208,7 @@ static char *devname_intel(uint16_t vendor, uint16_t device)
 		if (devname) {
 			devname[0] = toupper(devname[0]);
 			igt_assert(asprintf(&s, "Intel %s (Gen%u)", devname,
-					    ffs(info->gen)) != -1);
+					    info->graphics_ver) != -1);
 			free(devname);
 		}
 	}
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index f601d726..b1415178 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -552,18 +552,18 @@ bool gem_class_can_store_dword(int fd, int class)
 {
 	uint16_t devid = intel_get_drm_devid(fd);
 	const struct intel_device_info *info = intel_get_device_info(devid);
-	const int gen = ffs(info->gen);
+	const int ver = info->graphics_ver;
 
-	if (info->gen == 0) /* unknown, assume it just works */
+	if (ver == 0) /* unknown, assume it just works */
 		return true;
 
-	if (gen <= 2) /* requires physical addresses */
+	if (ver <= 2) /* requires physical addresses */
 		return false;
 
-	if (gen == 3 && (info->is_grantsdale || info->is_alviso))
+	if (ver == 3 && (info->is_grantsdale || info->is_alviso))
 		return false; /* only supports physical addresses */
 
-	if (gen == 6 && class == I915_ENGINE_CLASS_VIDEO)
+	if (ver == 6 && class == I915_ENGINE_CLASS_VIDEO)
 		return false; /* broken, unbelievably broken */
 
 	if (info->is_broadwater)
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index f766021e..8e81ffa9 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -37,7 +37,8 @@ struct pci_device *intel_get_pci_device(void);
 uint32_t intel_get_drm_devid(int fd);
 
 struct intel_device_info {
-	unsigned gen;
+	unsigned graphics_ver;
+	unsigned display_ver;
 	unsigned gt; /* 0 if unknown */
 	bool is_mobile : 1;
 	bool is_whitney : 1;
@@ -179,8 +180,8 @@ void intel_check_pch(void);
 #define IS_DG1(devid)		(intel_get_device_info(devid)->is_dg1)
 #define IS_ALDERLAKE_S(devid)	(intel_get_device_info(devid)->is_alderlake_s)
 
-#define IS_GEN(devid, x)	(intel_get_device_info(devid)->gen & (1u << ((x)-1)))
-#define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->gen & -(1u << ((x)-1)))
+#define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
+#define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
 
 #define IS_GEN2(devid)		IS_GEN(devid, 2)
 #define IS_GEN3(devid)		IS_GEN(devid, 3)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index e07fdf6f..4ab236e4 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -4,154 +4,180 @@
 #include <strings.h> /* ffs() */
 
 static const struct intel_device_info intel_generic_info = {
-	.gen = 0,
+	.graphics_ver = 0,
+	.display_ver = 0,
 };
 
 static const struct intel_device_info intel_i810_info = {
-	.gen = BIT(0),
+	.graphics_ver = 1,
+	.display_ver = 1,
 	.is_whitney = true,
 	.codename = "solano" /* 815 == "whitney" ? or vice versa? */
 };
 
 static const struct intel_device_info intel_i815_info = {
-	.gen = BIT(0),
+	.graphics_ver = 1,
+	.display_ver = 1,
 	.is_whitney = true,
 	.codename = "whitney"
 };
 
 static const struct intel_device_info intel_i830_info = {
-	.gen = BIT(1),
+	.graphics_ver = 2,
+	.display_ver = 2,
 	.is_almador = true,
 	.codename = "almador"
 };
 static const struct intel_device_info intel_i845_info = {
-	.gen = BIT(1),
+	.graphics_ver = 2,
+	.display_ver = 2,
 	.is_brookdale = true,
 	.codename = "brookdale"
 };
 static const struct intel_device_info intel_i855_info = {
-	.gen = BIT(1),
+	.graphics_ver = 2,
+	.display_ver = 2,
 	.is_mobile = true,
 	.is_montara = true,
 	.codename = "montara"
 };
 static const struct intel_device_info intel_i865_info = {
-	.gen = BIT(1),
+	.graphics_ver = 2,
+	.display_ver = 2,
 	.is_springdale = true,
 	.codename = "spingdale"
 };
 
 static const struct intel_device_info intel_i915_info = {
-	.gen = BIT(2),
+	.graphics_ver = 3,
+	.display_ver = 3,
 	.is_grantsdale = true,
 	.codename = "grantsdale"
 };
 static const struct intel_device_info intel_i915m_info = {
-	.gen = BIT(2),
+	.graphics_ver = 3,
+	.display_ver = 3,
 	.is_mobile = true,
 	.is_alviso = true,
 	.codename = "alviso"
 };
 static const struct intel_device_info intel_i945_info = {
-	.gen = BIT(2),
+	.graphics_ver = 3,
+	.display_ver = 3,
 	.is_lakeport = true,
 	.codename = "lakeport"
 };
 static const struct intel_device_info intel_i945m_info = {
-	.gen = BIT(2),
+	.graphics_ver = 3,
+	.display_ver = 3,
 	.is_mobile = true,
 	.is_calistoga = true,
 	.codename = "calistoga"
 };
 
 static const struct intel_device_info intel_g33_info = {
-	.gen = BIT(2),
+	.graphics_ver = 3,
+	.display_ver = 3,
 	.is_bearlake = true,
 	.codename = "bearlake"
 };
 
 static const struct intel_device_info intel_pineview_g_info = {
-	.gen = BIT(2),
+	.graphics_ver = 3,
+	.display_ver = 3,
 	.is_pineview = true,
 	.codename = "pineview"
 };
 
 static const struct intel_device_info intel_pineview_m_info = {
-	.gen = BIT(2),
+	.graphics_ver = 3,
+	.display_ver = 3,
 	.is_mobile = true,
 	.is_pineview = true,
 	.codename = "pineview"
 };
 
 static const struct intel_device_info intel_i965_info = {
-	.gen = BIT(3),
+	.graphics_ver = 4,
+	.display_ver = 4,
 	.is_broadwater = true,
 	.codename = "broadwater"
 };
 
 static const struct intel_device_info intel_i965m_info = {
-	.gen = BIT(3),
+	.graphics_ver = 4,
+	.display_ver = 4,
 	.is_mobile = true,
 	.is_crestline = true,
 	.codename = "crestline"
 };
 
 static const struct intel_device_info intel_g45_info = {
-	.gen = BIT(3),
+	.graphics_ver = 4,
+	.display_ver = 4,
 	.is_eaglelake = true,
 	.codename = "eaglelake"
 };
 static const struct intel_device_info intel_gm45_info = {
-	.gen = BIT(3),
+	.graphics_ver = 4,
+	.display_ver = 4,
 	.is_mobile = true,
 	.is_cantiga = true,
 	.codename = "cantiga"
 };
 
 static const struct intel_device_info intel_ironlake_info = {
-	.gen = BIT(4),
+	.graphics_ver = 5,
+	.display_ver = 5,
 	.is_ironlake = true,
 	.codename = "ironlake" /* clarkdale? */
 };
 static const struct intel_device_info intel_ironlake_m_info = {
-	.gen = BIT(4),
+	.graphics_ver = 5,
+	.display_ver = 5,
 	.is_mobile = true,
 	.is_arrandale = true,
 	.codename = "arrandale"
 };
 
 static const struct intel_device_info intel_sandybridge_info = {
-	.gen = BIT(5),
+	.graphics_ver = 6,
+	.display_ver = 6,
 	.is_sandybridge = true,
 	.codename = "sandybridge"
 };
 static const struct intel_device_info intel_sandybridge_m_info = {
-	.gen = BIT(5),
+	.graphics_ver = 6,
+	.display_ver = 6,
 	.is_mobile = true,
 	.is_sandybridge = true,
 	.codename = "sandybridge"
 };
 
 static const struct intel_device_info intel_ivybridge_info = {
-	.gen = BIT(6),
+	.graphics_ver = 7,
+	.display_ver = 7,
 	.is_ivybridge = true,
 	.codename = "ivybridge"
 };
 static const struct intel_device_info intel_ivybridge_m_info = {
-	.gen = BIT(6),
+	.graphics_ver = 7,
+	.display_ver = 7,
 	.is_mobile = true,
 	.is_ivybridge = true,
 	.codename = "ivybridge"
 };
 
 static const struct intel_device_info intel_valleyview_info = {
-	.gen = BIT(6),
+	.graphics_ver = 7,
+	.display_ver = 7,
 	.is_valleyview = true,
 	.codename = "valleyview"
 };
 
 #define HASWELL_FIELDS \
-	.gen = BIT(6), \
+	.graphics_ver = 7, \
+	.display_ver = 7, \
 	.is_haswell = true, \
 	.codename = "haswell"
 
@@ -171,7 +197,8 @@ static const struct intel_device_info intel_haswell_gt3_info = {
 };
 
 #define BROADWELL_FIELDS \
-	.gen = BIT(7), \
+	.graphics_ver = 8, \
+	.display_ver = 8, \
 	.is_broadwell = true, \
 	.codename = "broadwell"
 
@@ -195,13 +222,15 @@ static const struct intel_device_info intel_broadwell_unknown_info = {
 };
 
 static const struct intel_device_info intel_cherryview_info = {
-	.gen = BIT(7),
+	.graphics_ver = 8,
+	.display_ver = 8,
 	.is_cherryview = true,
 	.codename = "cherryview"
 };
 
 #define SKYLAKE_FIELDS \
-	.gen = BIT(8), \
+	.graphics_ver = 9, \
+	.display_ver = 9, \
 	.codename = "skylake", \
 	.is_skylake = true
 
@@ -226,13 +255,15 @@ static const struct intel_device_info intel_skylake_gt4_info = {
 };
 
 static const struct intel_device_info intel_broxton_info = {
-	.gen = BIT(8),
+	.graphics_ver = 9,
+	.display_ver = 9,
 	.is_broxton = true,
 	.codename = "broxton"
 };
 
 #define KABYLAKE_FIELDS \
-	.gen = BIT(8), \
+	.graphics_ver = 9, \
+	.display_ver = 9, \
 	.is_kabylake = true, \
 	.codename = "kabylake"
 
@@ -257,13 +288,15 @@ static const struct intel_device_info intel_kabylake_gt4_info = {
 };
 
 static const struct intel_device_info intel_geminilake_info = {
-	.gen = BIT(8),
+	.graphics_ver = 9,
+	.display_ver = 9,
 	.is_geminilake = true,
 	.codename = "geminilake"
 };
 
 #define COFFEELAKE_FIELDS \
-	.gen = BIT(8), \
+	.graphics_ver = 9, \
+	.display_ver = 9, \
 	.is_coffeelake = true, \
 	.codename = "coffeelake"
 
@@ -283,7 +316,8 @@ static const struct intel_device_info intel_coffeelake_gt3_info = {
 };
 
 #define COMETLAKE_FIELDS \
-	.gen = BIT(8), \
+	.graphics_ver = 9, \
+	.display_ver = 9, \
 	.is_cometlake = true, \
 	.codename = "cometlake"
 
@@ -298,57 +332,66 @@ static const struct intel_device_info intel_cometlake_gt2_info = {
 };
 
 static const struct intel_device_info intel_cannonlake_info = {
-	.gen = BIT(9),
+	.graphics_ver = 10,
+	.display_ver = 10,
 	.is_cannonlake = true,
 	.codename = "cannonlake"
 };
 
 static const struct intel_device_info intel_icelake_info = {
-	.gen = BIT(10),
+	.graphics_ver = 11,
+	.display_ver = 11,
 	.is_icelake = true,
 	.codename = "icelake"
 };
 
 static const struct intel_device_info intel_elkhartlake_info = {
-	.gen = BIT(10),
+	.graphics_ver = 11,
+	.display_ver = 11,
 	.is_elkhartlake = true,
 	.codename = "elkhartlake"
 };
 
 static const struct intel_device_info intel_jasperlake_info = {
-	.gen = BIT(10),
+	.graphics_ver = 11,
+	.display_ver = 11,
 	.is_jasperlake = true,
 	.codename = "jasperlake"
 };
 
 static const struct intel_device_info intel_tigerlake_gt1_info = {
-	.gen = BIT(11),
+	.graphics_ver = 12,
+	.display_ver = 12,
 	.is_tigerlake = true,
 	.codename = "tigerlake",
 	.gt = 1,
 };
 
 static const struct intel_device_info intel_tigerlake_gt2_info = {
-	.gen = BIT(11),
+	.graphics_ver = 12,
+	.display_ver = 12,
 	.is_tigerlake = true,
 	.codename = "tigerlake",
 	.gt = 2,
 };
 
 static const struct intel_device_info intel_rocketlake_info = {
-	.gen = BIT(11),
+	.graphics_ver = 12,
+	.display_ver = 12,
 	.is_rocketlake = true,
 	.codename = "rocketlake"
 };
 
 static const struct intel_device_info intel_dg1_info = {
-	.gen = BIT(11),
+	.graphics_ver = 12,
+	.display_ver = 12,
 	.is_dg1 = true,
 	.codename = "dg1"
 };
 
 static const struct intel_device_info intel_alderlake_s_info = {
-	.gen = BIT(11),
+	.graphics_ver = 12,
+	.display_ver = 12,
 	.is_alderlake_s = true,
 	.codename = "alderlake_s"
 };
@@ -490,5 +533,5 @@ out:
  */
 unsigned intel_gen(uint16_t devid)
 {
-	return ffs(intel_get_device_info(devid)->gen) ?: -1u;
+	return intel_get_device_info(devid)->graphics_ver ?: -1u;
 }
diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index 99ffc9ab..2df0b27f 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -310,7 +310,7 @@ static int print_welcome(int fd)
 	int err;
 
 	igt_info("Running on %s (pci-id %04x, gen %d)\n",
-		 info->codename, devid, ffs(info->gen));
+		 info->codename, devid, info->graphics_ver);
 	igt_info("Can use MI_STORE_DWORD(virtual)? %s\n",
 		 gem_can_store_dword(fd, 0) ? "yes" : "no");
 
@@ -320,7 +320,7 @@ static int print_welcome(int fd)
 	igt_info("GPU operation? %s [errno=%d]\n",
 		 err == 0 ? "yes" : "no", err);
 
-	return ffs(info->gen);
+	return info->graphics_ver;
 }
 
 #define test_each_engine(T, i915, e)  \
diff --git a/tests/i915/i915_pciid.c b/tests/i915/i915_pciid.c
index fe4db405..7de44ff2 100644
--- a/tests/i915/i915_pciid.c
+++ b/tests/i915/i915_pciid.c
@@ -49,13 +49,13 @@ static bool has_known_intel_chipset(int fd)
 		return false;
 	}
 
-	if (!info->gen) {
+	if (!info->graphics_ver) {
 		igt_warn("Unknown PCI-ID: %04x\n", devid);
 		return false;
 	}
 
 	igt_info("PCI-ID: %#04x, gen %d, %s\n",
-		 devid, ffs(info->gen), info->codename);
+		 devid, info->graphics_ver, info->codename);
 	return true;
 }
 
diff --git a/tools/i915-perf/i915_perf_configs.c b/tools/i915-perf/i915_perf_configs.c
index 2a0283c9..bce3bd0f 100644
--- a/tools/i915-perf/i915_perf_configs.c
+++ b/tools/i915-perf/i915_perf_configs.c
@@ -228,7 +228,7 @@ main(int argc, char *argv[])
 		return EXIT_FAILURE;
 	}
 
-	fprintf(stdout, "Device gen=%i gt=%i\n", devinfo->gen, devinfo->gt);
+	fprintf(stdout, "Device graphics_ver=%i gt=%i\n", devinfo->graphics_ver, devinfo->gt);
 
 	perf = intel_perf_for_fd(drm_fd);
 	if (!perf) {
diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
index 3e4a6530..e51f5a5d 100644
--- a/tools/i915-perf/i915_perf_reader.c
+++ b/tools/i915-perf/i915_perf_reader.c
@@ -220,8 +220,9 @@ main(int argc, char *argv[])
 
 	devinfo = intel_get_device_info(reader.devinfo.devid);
 
-	fprintf(stdout, "Recorded on device=0x%x(%s) gen=%i\n",
-		reader.devinfo.devid, devinfo->codename, reader.devinfo.gen);
+	fprintf(stdout, "Recorded on device=0x%x(%s) graphics_ver=%i\n",
+		reader.devinfo.devid, devinfo->codename,
+		reader.devinfo.graphics_ver);
 	fprintf(stdout, "Metric used : %s (%s) uuid=%s\n",
 		reader.metric_set->symbol_name, reader.metric_set->name,
 		reader.metric_set->hw_config_guid);
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 3a8ee46a..00195290 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -317,14 +317,14 @@ get_device_timestamp_frequency(const struct intel_device_info *devinfo, int drm_
 	if (perf_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp) == 0)
 		return timestamp_frequency;
 
-	if (devinfo->gen > 9) {
+	if (devinfo->graphics_ver > 9) {
 		fprintf(stderr, "Unable to query timestamp frequency from i915, please update kernel.\n");
 		return 0;
 	}
 
 	fprintf(stderr, "Warning: unable to query timestamp frequency from i915, guessing values...\n");
 
-	if (devinfo->gen <= 8)
+	if (devinfo->graphics_ver <= 8)
 		return 12500000;
 	if (devinfo->is_broxton)
 		return 19200000;
@@ -878,7 +878,7 @@ main(int argc, char *argv[])
 	}
 
 	fprintf(stdout, "Device name=%s gen=%i gt=%i id=0x%x\n",
-		ctx.devinfo->codename, ctx.devinfo->gen, ctx.devinfo->gt, ctx.devid);
+		ctx.devinfo->codename, ctx.devinfo->graphics_ver, ctx.devinfo->gt, ctx.devid);
 
 	ctx.topology = get_topology(ctx.drm_fd, &ctx.topology_size);
 	if (!ctx.topology) {
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
