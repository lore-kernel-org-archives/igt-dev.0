Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B496EB25
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 05:45:54 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Wed, 24 Mar 2021 22:45:38 -0700
Message-Id: <20210325054549.465386-5-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
References: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 04/15] Add PXP attribute support in
 batchbuffer and buffer_ops libs
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Eventually when we get to testing PXP rendering capability,
we shall reuse lib's rendercopy feature. Rendercopy libraries
shall retrieve information about PXP-session-enablement and
which buffers are protected from these new flags.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/intel_batchbuffer.c | 21 +++++++++++++++++++++
 lib/intel_batchbuffer.h | 28 ++++++++++++++++++++++++++++
 lib/intel_bufops.h      | 15 +++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 8118dc94..be9fc2ad 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1980,6 +1980,27 @@ uint64_t intel_bb_offset_reloc_to_object(struct intel_bb *ibb,
 				  delta, offset, presumed_offset);
 }
 
+/*
+ * @intel_bb_set_pxp:
+ * @ibb: pointer to intel_bb
+ * @new_state: enable or disable pxp session
+ * @apptype: pxp session input identifies what type of session to enable
+ * @appid: pxp session input provides which appid to use
+ *
+ * This function merely stores the pxp state and session information to
+ * be retrieved and programmed later by supporting libraries such as
+ * gen12_render_copy that must program the HW within the same dispatch
+ */
+void intel_bb_set_pxp(struct intel_bb *ibb,
+			bool new_state, uint32_t apptype, uint32_t appid)
+{
+	igt_assert(ibb);
+
+	ibb->pxp.enabled = new_state;
+	ibb->pxp.apptype = new_state ? apptype : 0;
+	ibb->pxp.appid   = new_state ? appid : 0;
+}
+
 static void intel_bb_dump_execbuf(struct intel_bb *ibb,
 				  struct drm_i915_gem_execbuffer2 *execbuf)
 {
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 76989eaa..66af6e09 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -437,6 +437,12 @@ typedef void (*igt_media_spinfunc_t)(int i915,
 igt_media_spinfunc_t igt_get_media_spinfunc(int devid);
 
 
+struct igt_pxp {
+	bool     enabled;
+	uint32_t apptype;
+	uint32_t appid;
+};
+
 /*
  * Batchbuffer without libdrm dependency
  */
@@ -459,6 +465,7 @@ struct intel_bb {
 	bool supports_48b_address;
 
 	uint32_t ctx;
+	struct igt_pxp pxp;
 
 	/* Cache */
 	void *root;
@@ -573,6 +580,27 @@ static inline void intel_bb_out(struct intel_bb *ibb, uint32_t dword)
 	igt_assert(intel_bb_offset(ibb) <= ibb->size);
 }
 
+void intel_bb_set_pxp(struct intel_bb *ibb,
+		bool new_state, uint32_t apptype, uint32_t appid);
+
+static inline bool intel_bb_pxp_enabled(struct intel_bb *ibb)
+{
+	igt_assert(ibb);
+	return ibb->pxp.enabled;
+}
+
+static inline uint32_t intel_bb_pxp_apptype(struct intel_bb *ibb)
+{
+	igt_assert(ibb);
+	return ibb->pxp.apptype;
+}
+
+static inline uint32_t intel_bb_pxp_appid(struct intel_bb *ibb)
+{
+	igt_assert(ibb);
+	return ibb->pxp.appid;
+}
+
 struct drm_i915_gem_exec_object2 *
 intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint32_t size,
 		    uint64_t offset, bool write);
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 8debe7f2..2c3a9a58 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -41,6 +41,9 @@ struct intel_buf {
 	uint32_t *ptr;
 	bool cpu_write;
 
+	/* Content Protection*/
+	bool is_protected;
+
 	/* For debugging purposes */
 	char name[INTEL_BUF_NAME_MAXSIZE + 1];
 };
@@ -138,6 +141,18 @@ struct intel_buf *intel_buf_create_using_handle(struct buf_ops *bops,
 
 void intel_buf_destroy(struct intel_buf *buf);
 
+static inline void intel_buf_set_pxp(struct intel_buf *buf, bool new_pxp_state)
+{
+	igt_assert(buf);
+	buf->is_protected = new_pxp_state;
+}
+
+static inline bool intel_buf_pxp(const struct intel_buf *buf)
+{
+	igt_assert(buf);
+	return buf->is_protected;
+}
+
 void *intel_buf_cpu_map(struct intel_buf *buf, bool write);
 void *intel_buf_device_map(struct intel_buf *buf, bool write);
 void intel_buf_unmap(struct intel_buf *buf);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
