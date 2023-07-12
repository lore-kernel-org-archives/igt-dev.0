Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BE910E5AD
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:13:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:23 +0200
Message-Id: <20230712171231.290555-14-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 13/21] lib/xe_util: Add vm bind/unbind
 helper for Xe
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

Before calling exec we need to prepare vm to contain valid entries.
Bind/unbind in xe expects single bind_op or vector of bind_ops what
makes preparation of it a little bit inconvinient. Add function
which iterates over list of xe_object (auxiliary structure which
describes bind information for object) and performs the bind/unbind
in one step. It also supports passing syncobj in/out to work in
pipelined executions.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
--
v3: - Drop priv field in the structure
---
 lib/xe/xe_util.c | 125 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h |  17 +++++++
 2 files changed, 142 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 5f0f69a8c6..7d78065a13 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -102,3 +102,128 @@ char *xe_memregion_dynamic_subtest_name(int xe, struct igt_collection *set)
 	return name;
 }
 
+#ifdef XEBINDDBG
+#define bind_info igt_info
+#define bind_debug igt_debug
+#else
+#define bind_info(...) {}
+#define bind_debug(...) {}
+#endif
+
+static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_list,
+						   uint32_t *num_ops)
+{
+	struct drm_xe_vm_bind_op *bind_ops, *ops;
+	struct xe_object *obj;
+	uint32_t num_objects = 0, i = 0, op;
+
+	igt_list_for_each_entry(obj, obj_list, link)
+		num_objects++;
+
+	*num_ops = num_objects;
+	if (!num_objects) {
+		bind_info(" [nothing to bind]\n");
+		return NULL;
+	}
+
+	bind_ops = calloc(num_objects, sizeof(*bind_ops));
+	igt_assert(bind_ops);
+
+	igt_list_for_each_entry(obj, obj_list, link) {
+		ops = &bind_ops[i];
+
+		if (obj->bind_op == XE_OBJECT_BIND) {
+			op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
+			ops->obj = obj->handle;
+		} else {
+			op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
+		}
+
+		ops->op = op;
+		ops->obj_offset = 0;
+		ops->addr = obj->offset;
+		ops->range = obj->size;
+		ops->region = 0;
+
+		bind_info("  [%d]: [%6s] handle: %u, offset: %llx, size: %llx\n",
+			  i, obj->bind_op == XE_OBJECT_BIND ? "BIND" : "UNBIND",
+			  ops->obj, (long long)ops->addr, (long long)ops->range);
+		i++;
+	}
+
+	return bind_ops;
+}
+
+/**
+ * xe_bind_unbind_async:
+ * @xe: drm fd of Xe device
+ * @vm: vm to bind/unbind objects to/from
+ * @bind_engine: bind engine, 0 if default
+ * @obj_list: list of xe_object
+ * @sync_in: sync object (fence-in), 0 if there's no input dependency
+ * @sync_out: sync object (fence-out) to signal on bind/unbind completion,
+ *            if 0 wait for bind/unbind completion.
+ *
+ * Function iterates over xe_object @obj_list, prepares binding operation
+ * and does bind/unbind in one step. Providing sync_in / sync_out allows
+ * working in pipelined mode. With sync_in and sync_out set to 0 function
+ * waits until binding operation is complete.
+ */
+void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
+			  struct igt_list_head *obj_list,
+			  uint32_t sync_in, uint32_t sync_out)
+{
+	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_sync tabsyncs[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ, .handle = sync_in },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, .handle = sync_out },
+	};
+	struct drm_xe_sync *syncs;
+	uint32_t num_binds = 0;
+	int num_syncs;
+
+	bind_info("[Binding to vm: %u]\n", vm);
+	bind_ops = xe_alloc_bind_ops(obj_list, &num_binds);
+
+	if (!num_binds) {
+		if (sync_out)
+			syncobj_signal(xe, &sync_out, 1);
+		return;
+	}
+
+	if (sync_in) {
+		syncs = tabsyncs;
+		num_syncs = 2;
+	} else {
+		syncs = &tabsyncs[1];
+		num_syncs = 1;
+	}
+
+	/* User didn't pass sync out, create it and wait for completion */
+	if (!sync_out)
+		tabsyncs[1].handle = syncobj_create(xe, 0);
+
+	bind_info("[Binding syncobjs: (in: %u, out: %u)]\n",
+		  tabsyncs[0].handle, tabsyncs[1].handle);
+
+	if (num_binds == 1) {
+		if ((bind_ops[0].op & 0xffff) == XE_VM_BIND_OP_MAP)
+			xe_vm_bind_async(xe, vm, bind_engine, bind_ops[0].obj, 0,
+					bind_ops[0].addr, bind_ops[0].range,
+					syncs, num_syncs);
+		else
+			xe_vm_unbind_async(xe, vm, bind_engine, 0,
+					   bind_ops[0].addr, bind_ops[0].range,
+					   syncs, num_syncs);
+	} else {
+		xe_vm_bind_array(xe, vm, bind_engine, bind_ops,
+				 num_binds, syncs, num_syncs);
+	}
+
+	if (!sync_out) {
+		igt_assert_eq(syncobj_wait_err(xe, &tabsyncs[1].handle, 1, INT64_MAX, 0), 0);
+		syncobj_destroy(xe, tabsyncs[1].handle);
+	}
+
+	free(bind_ops);
+}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 9f56fa9898..61511dd97f 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -27,4 +27,21 @@ __xe_get_memory_region_set(int xe, uint32_t *mem_regions_type, int num_regions);
 
 char *xe_memregion_dynamic_subtest_name(int xe, struct igt_collection *set);
 
+enum xe_bind_op {
+	XE_OBJECT_BIND,
+	XE_OBJECT_UNBIND,
+};
+
+struct xe_object {
+	uint32_t handle;
+	uint64_t offset;
+	uint64_t size;
+	enum xe_bind_op bind_op;
+	struct igt_list_head link;
+};
+
+void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
+			  struct igt_list_head *obj_list,
+			  uint32_t sync_in, uint32_t sync_out);
+
 #endif /* XE_UTIL_H */
-- 
2.34.1
