Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 10 Jun 2021 14:52:47 -0700
Message-Id: <20210610215247.2996757-3-John.C.Harrison@Intel.com>
In-Reply-To: <20210610215247.2996757-1-John.C.Harrison@Intel.com>
References: <20210610215247.2996757-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 2/2] tests/i915/query: Add test for L3
 bank count
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Various UMDs need to know the L3 bank count. So a query API has been
added for it. Test that query.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 include/drm-uapi/i915_drm.h |  1 +
 tests/i915/i915_query.c     | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 5c34ab759..191820532 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2234,6 +2234,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_PERF_CONFIG      3
 #define DRM_I915_QUERY_MEMORY_REGIONS   4
 #define DRM_I915_QUERY_HWCONFIG_TABLE   5
+#define DRM_I915_QUERY_L3_BANK_COUNT    6
 /* Must be kept compact -- no holes and well documented */
 
 	/**
diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index eef4afb05..17948e0d8 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -849,6 +849,38 @@ static void query_parse_and_validate_hwconfig_table(int i915)
 	free(data);
 }
 
+static int query_engine_l3_bank_count(int fd)
+{
+	uint32_t *banks;
+	struct drm_i915_query_item size = {
+		.query_id = DRM_I915_QUERY_L3_BANK_COUNT,
+	};
+	struct drm_i915_query_item query = {
+		.query_id = DRM_I915_QUERY_L3_BANK_COUNT,
+	};
+	int num_counts, i;
+
+	i915_query_items(fd, &size, 1);
+	igt_require(size.length > 0);
+
+	num_counts = size.length / sizeof(*banks);
+	igt_info("size = %d, count = %d => %ld\n", size.length, num_counts, num_counts * sizeof(*banks));
+	igt_assert(size.length == (num_counts * sizeof(*banks)));
+
+	banks = malloc(size.length);
+	igt_assert(banks);
+	query.data_ptr = to_user_pointer(banks);
+	query.length = size.length;
+
+	i915_query_items(fd, &query, 1);
+	igt_assert(query.length == size.length);
+	for (i = 0; i < num_counts; i++)
+		igt_info("Bank count #%d: %d\n", i, banks[i]);
+
+	free(banks);
+	return 0;
+}
+
 igt_main
 {
 	int fd = -1;
@@ -911,6 +943,9 @@ igt_main
 	igt_subtest("hwconfig_table")
 		query_parse_and_validate_hwconfig_table(fd);
 
+	igt_subtest("l3_banks")
+		query_engine_l3_bank_count(fd);
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
