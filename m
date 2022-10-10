Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C309C10E6E2
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 18:13:11 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 18:12:54 +0000
Message-Id: <20221010181300.513297-29-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
References: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 28/34] lib/i915/perf-config: extend the
 device info
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

This will allow equations to check for finer information on the
topology. Also add EuDualSubslicesSlice0123Count.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/codegen.py |  1 +
 lib/i915/perf.c                  | 31 ++++++++++++
 lib/i915/perf.h                  | 85 +++++++++++++++++++++++++++++++-
 lib/meson.build                  |  4 +-
 4 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index 8268c606..93a2df4a 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
@@ -169,6 +169,7 @@ class Gen:
             "$EuSlicesTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
             "$EuSubslicesTotalCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
             "$EuDualSubslicesTotalCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
+            "$EuDualSubslicesSlice0123Count": { 'c': "perf->devinfo.n_eu_sub_slices_half_slices" },
             "$EuThreadsCount": { 'c': "perf->devinfo.eu_threads_count" },
             "$SliceMask": { 'c': "perf->devinfo.slice_mask" },
             "$DualSubsliceMask": { 'c': "perf->devinfo.subslice_mask" },
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 05730d64..298e4d0e 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -153,6 +153,10 @@ intel_perf_for_devinfo(uint32_t device_id,
 {
 	const struct intel_device_info *devinfo = intel_get_device_info(device_id);
 	struct intel_perf *perf;
+	uint32_t subslice_mask_len;
+	uint32_t eu_mask_len;
+	uint32_t half_max_subslices;
+	uint64_t half_subslices_mask;
 	int bits_per_subslice;
 
 	if (!devinfo)
@@ -180,6 +184,25 @@ intel_perf_for_devinfo(uint32_t device_id,
 			 "%s", devinfo->codename);
 	}
 
+	/* Store i915 topology. */
+	perf->devinfo.max_slices = topology->max_slices;
+	perf->devinfo.max_subslices_per_slice = topology->max_subslices;
+	perf->devinfo.max_eu_per_subslice = topology->max_eus_per_subslice;
+
+	subslice_mask_len =
+		topology->max_slices * topology->subslice_stride;
+	assert(sizeof(perf->devinfo.subslice_masks) >= subslice_mask_len);
+	memcpy(perf->devinfo.subslice_masks,
+	       &topology->data[topology->subslice_offset],
+	       subslice_mask_len);
+
+	eu_mask_len = topology->eu_stride *
+		topology->max_subslices * topology->max_slices;
+	assert(sizeof(perf->devinfo.eu_masks) >= eu_mask_len);
+	memcpy(perf->devinfo.eu_masks,
+	       &topology->data[topology->eu_offset],
+	       eu_mask_len);
+
 	/* On Gen11+ the equations from the xml files expect an 8bits
 	 * mask per subslice, versus only 3bits on prior Gens.
 	 */
@@ -205,6 +228,14 @@ intel_perf_for_devinfo(uint32_t device_id,
 	perf->devinfo.n_eu_slices = __builtin_popcount(perf->devinfo.slice_mask);
 	perf->devinfo.n_eu_sub_slices = __builtin_popcount(perf->devinfo.subslice_mask);
 
+	/* Compute number of subslices/dualsubslices in first half of
+	 * the GPU.
+	 */
+	half_max_subslices = topology->max_subslices / 2;
+	half_subslices_mask = perf->devinfo.subslice_mask &
+		((1 << half_max_subslices) - 1);
+	perf->devinfo.n_eu_sub_slices_half_slices = __builtin_popcount(half_subslices_mask);
+
 	/* Valid on most generations except Gen9LP. */
 	perf->devinfo.eu_threads_count = 7;
 
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 6803c149..1493da47 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -32,7 +32,11 @@ extern "C" {
 
 #include "igt_list.h"
 
-struct intel_device_info;
+#define DIV_ROUND_UP(a, b)  (((a) + (b) - 1) / (b))
+
+#define INTEL_DEVICE_MAX_SLICES           (6)  /* Maximum on gfx10 */
+#define INTEL_DEVICE_MAX_SUBSLICES        (8)  /* Maximum on gfx11 */
+#define INTEL_DEVICE_MAX_EUS_PER_SUBSLICE (16) /* Maximum on gfx12 */
 
 struct intel_perf_devinfo {
 	char devname[20];
@@ -77,12 +81,66 @@ struct intel_perf_devinfo {
 	uint64_t n_eu_slices;
 	/* Total number of subslices/dualsubslices */
 	uint64_t n_eu_sub_slices;
+	/* Number of subslices/dualsubslices in the first half of the
+	 * slices.
+	 */
+	uint64_t n_eu_sub_slices_half_slices;
 	/* Mask of available subslices/dualsubslices */
 	uint64_t subslice_mask;
 	/* Mask of available slices */
 	uint64_t slice_mask;
 	/* Number of threads in one EU */
 	uint64_t eu_threads_count;
+
+	/**
+	 * Maximu number of slices present on this device (can be more than
+	 * num_slices if some slices are fused).
+	 */
+	uint16_t max_slices;
+
+	/**
+	 * Maximu number of subslices per slice present on this device (can be more
+	 * than the maximum value in the num_subslices[] array if some subslices are
+	 * fused).
+	 */
+	uint16_t max_subslices_per_slice;
+
+	/**
+	 * Stride to access subslice_masks[].
+	 */
+	uint16_t subslice_slice_stride;
+
+	/**
+	 * Maximum number of EUs per subslice (can be more than
+	 * num_eu_per_subslice if some EUs are fused off).
+	 */
+	uint16_t max_eu_per_subslice;
+
+	/**
+	 * Strides to access eu_masks[].
+	 */
+	uint16_t eu_slice_stride;
+	uint16_t eu_subslice_stride;
+
+	/**
+	 * A bit mask of the slices available.
+	 */
+	uint8_t slice_masks[DIV_ROUND_UP(INTEL_DEVICE_MAX_SLICES, 8)];
+
+	/**
+	 * An array of bit mask of the subslices available, use subslice_slice_stride
+	 * to access this array.
+	 */
+	uint8_t subslice_masks[INTEL_DEVICE_MAX_SLICES *
+			       DIV_ROUND_UP(INTEL_DEVICE_MAX_SUBSLICES, 8)];
+
+	/**
+	 * An array of bit mask of EUs available, use eu_slice_stride &
+	 * eu_subslice_stride to access this array.
+	 */
+	uint8_t eu_masks[INTEL_DEVICE_MAX_SLICES *
+			 INTEL_DEVICE_MAX_SUBSLICES *
+			 DIV_ROUND_UP(INTEL_DEVICE_MAX_EUS_PER_SUBSLICE, 8)];
 };
 
 typedef enum {
@@ -232,6 +290,31 @@ struct intel_perf {
 struct drm_i915_perf_record_header;
 struct drm_i915_query_topology_info;
 
+static inline bool
+intel_perf_devinfo_slice_available(const struct intel_perf_devinfo *devinfo,
+				   int slice)
+{
+	return (devinfo->slice_masks[slice / 8] & (1U << (slice % 8))) != 0;
+}
+
+static inline bool
+intel_perf_devinfo_subslice_available(const struct intel_perf_devinfo *devinfo,
+				      int slice, int subslice)
+{
+	return (devinfo->subslice_masks[slice * devinfo->subslice_slice_stride +
+					subslice / 8] & (1U << (subslice % 8))) != 0;
+}
+
+static inline bool
+intel_perf_devinfo_eu_available(const struct intel_perf_devinfo *devinfo,
+				int slice, int subslice, int eu)
+{
+	unsigned subslice_offset = slice * devinfo->eu_slice_stride +
+		subslice * devinfo->eu_subslice_stride;
+
+	return (devinfo->eu_masks[subslice_offset + eu / 8] & (1U << eu % 8)) != 0;
+}
+
 struct intel_perf *intel_perf_for_fd(int drm_fd);
 struct intel_perf *intel_perf_for_devinfo(uint32_t device_id,
 					  uint32_t revision,
diff --git a/lib/meson.build b/lib/meson.build
index b51cf23c..b319a3c8 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -308,7 +308,7 @@ lib_igt_i915_perf_build = shared_library(
   dependencies: lib_igt_chipset,
   include_directories : inc,
   install: true,
-  soversion: '1.4')
+  soversion: '1.5')
 
 lib_igt_i915_perf = declare_dependency(
   link_with : lib_igt_i915_perf_build,
@@ -329,7 +329,7 @@ pkgconf.set('prefix', get_option('prefix'))
 pkgconf.set('exec_prefix', '${prefix}')
 pkgconf.set('libdir', '${prefix}/@0@'.format(get_option('libdir')))
 pkgconf.set('includedir', '${prefix}/@0@'.format(get_option('includedir')))
-pkgconf.set('i915_perf_version', '1.4.0')
+pkgconf.set('i915_perf_version', '1.5.0')
 
 configure_file(
   input : 'i915-perf.pc.in',
-- 
2.25.1
