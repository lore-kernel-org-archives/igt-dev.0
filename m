Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B82D10E4CD
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 00:00:07 +0000 (UTC)
Date: Tue, 12 Apr 2022 17:00:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20220413000006.b4rszky3oc4xyjx4@ldmartin-desk2>
References: <20220412032819.482550-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220412032819.482550-1-matthew.d.roper@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_query: Test new
 DRM_I915_QUERY_GEOMETRY_SUBSLICES query
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 08:28:19PM -0700, Matt Roper wrote:
>Ensure we get sensible responses for both valid and invalid usage of
>this query item.
>
>Note that unlike the traditional topology query we do not try to compare
>the values returned against the old I915_PARAM ioctl.  Xe_HP already
>uses a full 32-bit mask for subslices and we expect upcoming platforms
>to increase the mask size to 64 or beyond (i.e., the hardware starts
>using multiple registers to express the mask); since the old I915_PARAM
>ioctl can only return a 32-bit value it will be unable to express the
>full mask for upcoming platforms.

Are you adding a "Test-with" in a patch series to kernel?

>
>Cc: Matt Atwood <matthew.s.atwood@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> lib/i915/i915_drm_local.h |  2 ++
> tests/i915/i915_query.c   | 75 +++++++++++++++++++++++++++++++++++++++
> 2 files changed, 77 insertions(+)
>
>diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
>index 9e82c9688b..9a2273c4e4 100644
>--- a/lib/i915/i915_drm_local.h
>+++ b/lib/i915/i915_drm_local.h
>@@ -21,6 +21,8 @@ extern "C" {
>  */
> #define I915_ENGINE_CLASS_COMPUTE 4
>
>+#define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
>+
> #if defined(__cplusplus)
> }
> #endif
>diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
>index 3c791b8ba5..246a979af7 100644
>--- a/tests/i915/i915_query.c
>+++ b/tests/i915/i915_query.c
>@@ -244,6 +244,15 @@ static bool query_topology_supported(int fd)
> 	return __i915_query_items(fd, &item, 1) == 0 && item.length > 0;
> }
>
>+static bool query_geometry_subslices_supported(int fd)
>+{
>+	struct drm_i915_query_item item = {
>+		.query_id= DRM_I915_QUERY_GEOMETRY_SUBSLICES,
>+	};
>+
>+	return __i915_query_items(fd, &item, 1) == 0 && item.length > 0;
>+}
>+
> static void test_query_topology_unsupported(int fd)
> {
> 	struct drm_i915_query_item item = {
>@@ -842,6 +851,67 @@ static void engines(int fd)
> 	free(engines);
> }
>
>+static void test_query_geometry_subslices(int fd)
>+{
>+	const struct intel_execution_engine2 *e;
>+	struct drm_i915_query_item item = {};
>+	struct drm_i915_query_topology_info *topo_info;
>+
>+	/*
>+	 * Submit an initial request with an invalid engine.  Should return
>+	 * -EINVAL via item.length.
>+	 */
>+	item.query_id = DRM_I915_QUERY_GEOMETRY_SUBSLICES;
>+	item.flags = ~0;
>+	i915_query_items(fd, &item, 1);
>+	igt_assert_eq(item.length, -EINVAL);
>+
>+	for_each_physical_engine(fd, e) {
>+		memset(&item, 0, sizeof(item));
>+
>+		/* Obtain the necessary topology buffer size */
>+		item.query_id = DRM_I915_QUERY_GEOMETRY_SUBSLICES;
>+		item.flags =  e->class | (e->instance << 16);

maybe we also need a test with inexistent class / instance?


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		i915_query_items(fd, &item, 1);
>+
>+		/* Non-render engines should return -EINVAL */
>+		if (e->class != I915_ENGINE_CLASS_RENDER) {
>+			igt_assert_eq(item.length, -EINVAL);
>+			continue;
>+		}
>+		igt_assert(item.length > 0);
>+
>+		/* Re-submit with a properly allocated buffer */
>+		topo_info = calloc(1, item.length);
>+		igt_assert(topo_info);
>+		item.data_ptr = to_user_pointer(topo_info);
>+		i915_query_items(fd, &item, 1);
>+
>+		igt_assert(topo_info->max_subslices > 0);
>+		igt_assert(topo_info->max_eus_per_subslice > 0);
>+
>+		igt_assert(topo_info->subslice_offset >=
>+			   DIV_ROUND_UP(topo_info->max_slices, 8));
>+		igt_assert(topo_info->eu_offset >=
>+			   topo_info->subslice_offset + DIV_ROUND_UP(topo_info->max_subslices, 8));
>+
>+		igt_assert(topo_info->subslice_stride >=
>+			   DIV_ROUND_UP(topo_info->max_subslices, 8));
>+		igt_assert(topo_info->eu_stride >=
>+			   DIV_ROUND_UP(topo_info->max_eus_per_subslice, 8));
>+
>+		/*
>+		 * This query is only supported on Xe_HP and beyond, and all
>+		 * such platforms don't have slices; we should just get a
>+		 * hardcoded 0x1 for the slice mask.
>+		 */
>+		igt_assert_eq(topo_info->max_slices, 1);
>+		igt_assert_eq(((char*)topo_info->data)[0], 0x1);
>+
>+		free(topo_info);
>+	}
>+}
>+
> igt_main
> {
> 	int fd = -1;
>@@ -889,6 +959,11 @@ igt_main
> 		test_query_topology_known_pci_ids(fd, devid);
> 	}
>
>+	igt_subtest("test-query-geometry-subslices") {
>+		igt_require(query_geometry_subslices_supported(fd));
>+		test_query_geometry_subslices(fd);
>+	}
>+
> 	igt_subtest("query-regions-garbage-items") {
> 		igt_require(query_regions_supported(fd));
> 		test_query_regions_garbage_items(fd);
>-- 
>2.34.1
>
