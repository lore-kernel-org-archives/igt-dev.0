Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FADA6EB8E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 13:11:36 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 27 Jan 2020 15:11:31 +0200
Message-Id: <20200127131131.1440949-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200127131131.1440949-1-lionel.g.landwerlin@intel.com>
References: <20200127131131.1440949-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 1/1] tests/i915-query: add new tests for
 perf configurations queries
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

These new tests allow to list the available configurations and also to
query the data that makes up a configuration.

v2: Verify uuid queries (Lionel)

v3: Fix mistake with missing pointer value (Lionel)

v4: Add igt_describe() (Lionel)

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/i915_query.c | 613 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 613 insertions(+)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 71807425..2d83427a 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -22,6 +22,7 @@
  */
 
 #include "igt.h"
+#include "igt_sysfs.h"
 
 #include <limits.h>
 
@@ -735,6 +736,600 @@ static void engines(int fd)
 	free(engines);
 }
 
+static bool query_perf_config_supported(int fd)
+{
+	struct drm_i915_query_item item = {
+		.query_id = DRM_I915_QUERY_PERF_CONFIG,
+		.flags = DRM_I915_QUERY_PERF_CONFIG_LIST,
+	};
+
+	return __i915_query_items(fd, &item, 1) == 0 && item.length > 0;
+}
+
+/*
+ * Verify that perf configuration queries for list of configurations
+ * rejects invalid parameters.
+ */
+static void test_query_perf_config_list_invalid(int fd)
+{
+	struct drm_i915_query_perf_config *query_config_ptr, dummy_query_config;
+	struct drm_i915_query_item item;
+	size_t len;
+	void *data;
+
+	/* Verify invalid flags for perf config queries */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = 42; /* invalid */
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EINVAL);
+
+	/*
+	 * A too small data length is invalid. We should have at least
+	 * the test config list.
+	 */
+	memset(&item, 0, sizeof(item));
+	memset(&dummy_query_config, 0, sizeof(dummy_query_config));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.data_ptr = to_user_pointer(&dummy_query_config);
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_LIST;
+	item.length = sizeof(struct drm_i915_query_perf_config); /* invalid */
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EINVAL);
+
+	/* Flags on the query config data are invalid. */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_LIST;
+	item.length = 0;
+	i915_query_items(fd, &item, 1);
+	igt_assert(item.length > sizeof(struct drm_i915_query_perf_config));
+
+	query_config_ptr = calloc(1, item.length);
+	query_config_ptr->flags = 1; /* invalid */
+	item.data_ptr = to_user_pointer(query_config_ptr);
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EINVAL);
+	free(query_config_ptr);
+
+	/*
+	 * A NULL data pointer is invalid when the length is long
+	 * enough for i915 to copy data into the pointed memory.
+	 */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_LIST;
+	item.length = 0;
+	i915_query_items(fd, &item, 1);
+	igt_assert(item.length > sizeof(struct drm_i915_query_perf_config));
+
+	i915_query_items(fd, &item, 1); /* leaves data ptr to null */
+	igt_assert_eq(item.length, -EFAULT);
+
+	/* Trying to write into read only memory will fail. */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_LIST;
+	item.length = 0;
+	i915_query_items(fd, &item, 1);
+	igt_assert(item.length > sizeof(struct drm_i915_query_perf_config));
+
+	len = ALIGN(item.length, 4096);
+	data = mmap(0, len, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
+	memset(data, 0, len);
+	mprotect(data, len, PROT_READ);
+	item.data_ptr = to_user_pointer(data); /* invalid with read only data */
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EFAULT);
+
+	munmap(data, len);
+}
+
+static int query_perf_config_id_data(int fd, int length,
+				     struct drm_i915_query_perf_config *query)
+{
+	struct drm_i915_query_item item;
+
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID;
+	item.length = length;
+	item.data_ptr = to_user_pointer(query);
+	i915_query_items(fd, &item, 1);
+
+	return item.length;
+}
+
+static int query_perf_config_uuid_data(int fd, int length,
+				       struct drm_i915_query_perf_config *query)
+{
+	struct drm_i915_query_item item;
+
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID;
+	item.length = length;
+	item.data_ptr = to_user_pointer(query);
+	i915_query_items(fd, &item, 1);
+
+	return item.length;
+}
+
+/*
+ * Verify that perf configuration queries for configuration data
+ * rejects invalid parameters.
+ */
+static void test_query_perf_config_data_invalid(int fd)
+{
+	struct {
+		struct drm_i915_query_perf_config query;
+		struct drm_i915_perf_oa_config oa;
+	} query;
+	struct drm_i915_query_item item;
+	size_t len;
+	void *data;
+
+	/* Flags are invalid for perf config queries */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID + 1; /* invalid */
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EINVAL);
+
+	/*
+	 * A too small data length is invalid. We should have at least
+	 * the test config list.
+	 */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID;
+	item.length = sizeof(struct drm_i915_query_perf_config); /* invalid */
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EINVAL);
+
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID;
+	item.length = sizeof(struct drm_i915_query_perf_config) +
+		sizeof(struct drm_i915_perf_oa_config) - 1; /* invalid */
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EINVAL);
+
+	/* Flags on the query config data are invalid. */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID;
+	item.length = 0;
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, sizeof(query));
+
+	memset(&query, 0, sizeof(query));
+	query.query.flags = 1; /* invalid */
+	item.data_ptr = to_user_pointer(&query.query);
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EINVAL);
+
+	/* Invalid UUID. */
+	memset(&item, 0, sizeof(item));
+	memset(&query, 0, sizeof(query));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID;
+	item.data_ptr = to_user_pointer(&query);
+	item.length = sizeof(query);
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -ENOENT);
+
+	/*
+	 * A NULL data pointer is invalid when the length is long
+	 * enough for i915 to copy data into the pointed memory.
+	 */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID;
+	item.length = 0;
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, sizeof(query));
+
+	i915_query_items(fd, &item, 1); /* leaves data ptr to null */
+	igt_assert_eq(item.length, -EFAULT);
+
+	item.data_ptr = ULONG_MAX; /* invalid pointer */
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EFAULT);
+
+	/* Trying to write into read only memory will fail. */
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID;
+	item.length = 0;
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, sizeof(query));
+
+	len = ALIGN(item.length, 4096);
+	data = mmap(0, len, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
+	memset(data, 0, len);
+	((struct drm_i915_query_perf_config *)data)->config = 1; /* test config */
+	mprotect(data, len, PROT_READ);
+	item.data_ptr = to_user_pointer(data); /* invalid with read only data */
+	i915_query_items(fd, &item, 1);
+	igt_assert_eq(item.length, -EFAULT);
+
+	munmap(data, len);
+
+	/* Invalid memory (NULL) for configuration registers. */
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query),
+		      query_perf_config_id_data(fd, sizeof(query), &query.query));
+
+	igt_debug("Queried test config %.*s\n",
+		  (int)sizeof(query.oa.uuid), query.oa.uuid);
+	igt_debug("  n_mux_regs=%u, n_boolean_regs=%u, n_flex_regs=%u\n",
+		  query.oa.n_mux_regs, query.oa.n_boolean_regs,
+		  query.oa.n_flex_regs);
+	igt_assert_eq(-EFAULT,
+		      query_perf_config_id_data(fd, sizeof(query), &query.query));
+
+	/* Invalid memory (ULONG max) for configuration registers. */
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query), query_perf_config_id_data(fd, 0, &query.query));
+
+	if (query.oa.n_mux_regs > 0) {
+		query.oa.mux_regs_ptr = ULONG_MAX;
+		query.oa.n_boolean_regs = 0;
+		query.oa.n_flex_regs = 0;
+		igt_assert_eq(-EFAULT, query_perf_config_id_data(fd, sizeof(query),
+								 &query.query));
+	}
+
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query),
+		      query_perf_config_id_data(fd, 0, &query.query));
+
+	if (query.oa.n_boolean_regs > 0) {
+		query.oa.boolean_regs_ptr = ULONG_MAX;
+		query.oa.n_mux_regs = 0;
+		query.oa.n_flex_regs = 0;
+		igt_assert_eq(-EFAULT, query_perf_config_id_data(fd, sizeof(query),
+								 &query.query));
+	}
+
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query),
+		      query_perf_config_id_data(fd, 0, &query.query));
+
+	if (query.oa.n_flex_regs > 0) {
+		query.oa.flex_regs_ptr = ULONG_MAX;
+		query.oa.n_mux_regs = 0;
+		query.oa.n_boolean_regs = 0;
+		igt_assert_eq(-EFAULT, query_perf_config_id_data(fd, sizeof(query),
+								 &query.query));
+	}
+
+	/* Too small number of registers to write. */
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query), query_perf_config_id_data(fd, 0, &query.query));
+
+	if (query.oa.n_mux_regs > 0) {
+		query.oa.n_mux_regs--;
+		igt_assert_eq(-EINVAL, query_perf_config_id_data(fd, sizeof(query),
+								 &query.query));
+	}
+
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query),
+		      query_perf_config_id_data(fd, 0, &query.query));
+
+	if (query.oa.n_boolean_regs > 0) {
+		query.oa.n_boolean_regs--;
+		igt_assert_eq(-EINVAL, query_perf_config_id_data(fd, sizeof(query),
+								 &query.query));
+	}
+
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query), query_perf_config_id_data(fd, 0, &query.query));
+
+	if (query.oa.n_flex_regs > 0) {
+		query.oa.n_flex_regs--;
+		igt_assert_eq(-EINVAL, query_perf_config_id_data(fd, sizeof(query),
+								 &query.query));
+	}
+
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query),
+		      query_perf_config_id_data(fd, 0, &query.query));
+
+	if (query.oa.n_boolean_regs > 0) {
+		query.oa.boolean_regs_ptr = ULONG_MAX;
+		query.oa.n_mux_regs = 0;
+		query.oa.n_flex_regs = 0;
+		igt_assert_eq(-EFAULT, query_perf_config_id_data(fd, sizeof(query),
+								 &query.query));
+	}
+
+	/* Read only memory for registers. */
+	memset(&query, 0, sizeof(query));
+	query.query.config = 1; /* test config */
+	igt_assert_eq(sizeof(query),
+		      query_perf_config_id_data(fd, sizeof(query), &query.query));
+
+	len = ALIGN(query.oa.n_mux_regs * sizeof(uint32_t) * 2, 4096);
+	data = mmap(0, len, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
+	memset(data, 0, len);
+	mprotect(data, len, PROT_READ);
+	query.oa.mux_regs_ptr = to_user_pointer(data);
+	igt_assert_eq(-EFAULT,
+		      query_perf_config_id_data(fd, sizeof(query), &query.query));
+
+	munmap(data, len);
+}
+
+static uint64_t create_perf_config(int fd,
+				   const char *uuid,
+				   uint32_t **boolean_regs,
+				   uint32_t *n_boolean_regs,
+				   uint32_t **flex_regs,
+				   uint32_t *n_flex_regs,
+				   uint32_t **mux_regs,
+				   uint32_t *n_mux_regs)
+{
+	struct drm_i915_perf_oa_config config;
+	int devid = intel_get_drm_devid(fd);
+	int i, ret;
+
+	*n_boolean_regs = rand() % 50;
+	*boolean_regs = calloc(*n_boolean_regs, sizeof(uint32_t) * 2);
+	*n_mux_regs = rand() % 50;
+	*mux_regs = calloc(*n_mux_regs, sizeof(uint32_t) * 2);
+	if (intel_gen(devid) < 8) {
+		/* flex register don't exist on gen7 */
+		*n_flex_regs = 0;
+		*flex_regs = NULL;
+	} else {
+		*n_flex_regs = rand() % 50;
+		*flex_regs = calloc(*n_flex_regs, sizeof(uint32_t) * 2);
+	}
+
+	for (i = 0; i < *n_boolean_regs; i++) {
+		if (rand() % 2) {
+			/* OASTARTTRIG[1-8] */
+			(*boolean_regs)[i * 2] =
+				0x2710 + ((rand() % (0x2730 - 0x2710)) / 4) * 4;
+			(*boolean_regs)[i * 2 + 1] = rand();
+		} else {
+			/* OAREPORTTRIG[1-8] */
+			(*boolean_regs)[i * 2] =
+				0x2740 + ((rand() % (0x275c - 0x2744)) / 4) * 4;
+			(*boolean_regs)[i * 2 + 1] = rand();
+		}
+	}
+
+	for (i = 0; i < *n_mux_regs; i++) {
+		(*mux_regs)[i * 2] = 0x9800;
+		(*mux_regs)[i * 2 + 1] = rand();
+	}
+
+	for (i = 0; i < *n_flex_regs; i++) {
+		const uint32_t flex[] = {
+			0xe458,
+			0xe558,
+			0xe658,
+			0xe758,
+			0xe45c,
+			0xe55c,
+			0xe65c
+		};
+		(*flex_regs)[i * 2] = flex[rand() % ARRAY_SIZE(flex)];
+		(*flex_regs)[i * 2 + 1] = rand();
+	}
+
+	memset(&config, 0, sizeof(config));
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+
+	config.n_boolean_regs = *n_boolean_regs;
+	config.boolean_regs_ptr = to_user_pointer(*boolean_regs);
+	config.n_flex_regs = *n_flex_regs;
+	config.flex_regs_ptr = to_user_pointer(*flex_regs);
+	config.n_mux_regs = *n_mux_regs;
+	config.mux_regs_ptr = to_user_pointer(*mux_regs);
+
+	ret = igt_ioctl(fd, DRM_IOCTL_I915_PERF_ADD_CONFIG, &config);
+	igt_assert(ret > 1); /* Config 0/1 should be used by the kernel */
+
+	igt_debug("created config id=%i uuid=%s:\n", ret, uuid);
+	igt_debug("\tn_boolean_regs=%u n_flex_regs=%u n_mux_regs=%u\n",
+		  config.n_boolean_regs, config.n_flex_regs,
+		  config.n_mux_regs);
+
+	return ret;
+}
+
+static void remove_perf_config(int fd, uint64_t config_id)
+{
+	igt_assert_eq(0, igt_ioctl(fd, DRM_IOCTL_I915_PERF_REMOVE_CONFIG,
+				   &config_id));
+}
+
+static uint64_t get_config_id(int fd, const char *uuid)
+{
+	char rel_path[100];
+	uint64_t ret;
+	int sysfs;
+
+	sysfs = igt_sysfs_open(fd);
+	igt_assert_lte(0, sysfs);
+
+	snprintf(rel_path, sizeof(rel_path), "metrics/%s/id", uuid);
+
+	if (igt_sysfs_scanf(sysfs, rel_path, "%lu", &ret) < 0)
+		ret = 0;
+
+	close(sysfs);
+	return ret;
+}
+
+/*
+ * Verifies that created configurations appear in the query of list of
+ * configuration and also verify the content of the queried
+ * configurations matches with what was created.
+ */
+static void test_query_perf_configs(int fd)
+{
+	struct {
+		uint64_t id;
+
+		char uuid[40];
+
+		uint32_t *boolean_regs;
+		uint32_t n_boolean_regs;
+		uint32_t *flex_regs;
+		uint32_t n_flex_regs;
+		uint32_t *mux_regs;
+		uint32_t n_mux_regs;
+	} configs[5];
+	struct {
+		struct drm_i915_query_perf_config query;
+		uint64_t config_ids[];
+	} *list_query;
+	struct drm_i915_query_item item;
+	int i;
+
+	srand(time(NULL));
+
+	for (i = 0; i < ARRAY_SIZE(configs); i++) {
+		uint64_t prev_config_id;
+
+		snprintf(configs[i].uuid, sizeof(configs[i].uuid),
+			 "01234567-%04u-0123-0123-0123456789ab", i);
+
+		prev_config_id = get_config_id(fd, configs[i].uuid);
+		if (prev_config_id)
+			remove_perf_config(fd, prev_config_id);
+
+		configs[i].id =
+			create_perf_config(fd, configs[i].uuid,
+					   &configs[i].boolean_regs,
+					   &configs[i].n_boolean_regs,
+					   &configs[i].flex_regs,
+					   &configs[i].n_flex_regs,
+					   &configs[i].mux_regs,
+					   &configs[i].n_mux_regs);
+	}
+
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_PERF_CONFIG;
+	item.flags = DRM_I915_QUERY_PERF_CONFIG_LIST;
+	item.length = 0;
+	i915_query_items(fd, &item, 1);
+	igt_assert(item.length > sizeof(struct drm_i915_query_perf_config));
+
+	list_query = malloc(item.length);
+	memset(list_query, 0, item.length);
+	item.data_ptr = to_user_pointer(list_query);
+	i915_query_items(fd, &item, 1);
+	igt_assert(item.length > sizeof(struct drm_i915_query_perf_config));
+
+	igt_debug("listed configs:\n");
+	for (i = 0; i < list_query->query.config; i++)
+		igt_debug("\tid=%lu\n", list_query->config_ids[i]);
+
+	/* Verify that all created configs are listed. */
+	for (i = 0; i < ARRAY_SIZE(configs); i++) {
+		int j;
+		bool found = false;
+
+		for (j = 0; j < list_query->query.config; j++) {
+			if (list_query->config_ids[j] == configs[i].id) {
+				found = true;
+				break;
+			}
+		}
+
+		igt_assert(found);
+	}
+
+	/* Verify the content of the configs. */
+	for (i = 0; i < ARRAY_SIZE(configs); i++) {
+		struct {
+			struct drm_i915_query_perf_config query;
+			struct drm_i915_perf_oa_config oa;
+		} query;
+		uint32_t *boolean_regs = NULL, *flex_regs = NULL, *mux_regs = NULL;
+
+		/* First query with configuration id. */
+		memset(&query, 0, sizeof(query));
+		query.query.config = configs[i].id;
+		igt_assert_eq(sizeof(query),
+			      query_perf_config_id_data(fd, sizeof(query),
+							&query.query));
+
+		igt_debug("queried config data id=%lu uuid=%s:\n",
+			  configs[i].id, configs[i].uuid);
+		igt_debug("\tn_boolean_regs=%u n_flex_regs=%u n_mux_regs=%u\n",
+			  query.oa.n_boolean_regs, query.oa.n_flex_regs,
+			  query.oa.n_mux_regs);
+
+		igt_assert_eq(query.oa.n_boolean_regs, configs[i].n_boolean_regs);
+		igt_assert_eq(query.oa.n_flex_regs, configs[i].n_flex_regs);
+		igt_assert_eq(query.oa.n_mux_regs, configs[i].n_mux_regs);
+
+		/* Query again with configuration uuid. */
+		memset(&query, 0, sizeof(query));
+		memcpy(query.query.uuid, configs[i].uuid,
+		       sizeof(query.query.uuid));
+		igt_assert_eq(sizeof(query),
+			      query_perf_config_uuid_data(fd, sizeof(query),
+							  &query.query));
+
+		igt_assert_eq(query.oa.n_boolean_regs, configs[i].n_boolean_regs);
+		igt_assert_eq(query.oa.n_flex_regs, configs[i].n_flex_regs);
+		igt_assert_eq(query.oa.n_mux_regs, configs[i].n_mux_regs);
+
+		/* Now get the register programming values. */
+		boolean_regs = calloc(query.oa.n_boolean_regs * 2, sizeof(uint32_t));
+		if (query.oa.n_flex_regs > 0)
+			flex_regs = calloc(query.oa.n_flex_regs * 2, sizeof(uint32_t));
+		mux_regs = calloc(query.oa.n_mux_regs * 2, sizeof(uint32_t));
+
+		query.oa.boolean_regs_ptr = to_user_pointer(boolean_regs);
+		query.oa.flex_regs_ptr = to_user_pointer(flex_regs);
+		query.oa.mux_regs_ptr = to_user_pointer(mux_regs);
+
+		igt_assert_eq(sizeof(query),
+			      query_perf_config_uuid_data(fd, sizeof(query),
+							  &query.query));
+
+		igt_assert_eq(0, memcmp(configs[i].boolean_regs,
+					boolean_regs,
+					configs[i].n_boolean_regs * 2 * sizeof(uint32_t)));
+		igt_assert_eq(0, memcmp(configs[i].flex_regs,
+					flex_regs,
+					configs[i].n_flex_regs * 2 * sizeof(uint32_t)));
+		igt_assert_eq(0, memcmp(configs[i].mux_regs,
+					mux_regs,
+					configs[i].n_mux_regs * 2 * sizeof(uint32_t)));
+
+		free(boolean_regs);
+		free(flex_regs);
+		free(mux_regs);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(configs); i++) {
+		remove_perf_config(fd, configs[i].id);
+
+		free(configs[i].boolean_regs);
+		free(configs[i].flex_regs);
+		free(configs[i].mux_regs);
+	}
+}
+
 igt_main
 {
 	int fd = -1;
@@ -794,6 +1389,24 @@ igt_main
 			engines(fd);
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(query_perf_config_supported(fd));
+		}
+
+		igt_describe("Test invalid parameters when listing OA configurations");
+		igt_subtest("query-perf-config-list-invalid")
+			test_query_perf_config_list_invalid(fd);
+
+		igt_describe("Test invalid parameters when querying OA configuration data");
+		igt_subtest("query-perf-config-data-invalid")
+			test_query_perf_config_data_invalid(fd);
+
+		igt_describe("Test listing & querying OA configurations");
+		igt_subtest("query-perf-configs")
+			test_query_perf_configs(fd);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
