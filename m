Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740386E150
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 08:19:40 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 14 Oct 2021 10:19:11 +0200
Message-Id: <20211014081917.15977-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211014081917.15977-1-zbigniew.kempczynski@intel.com>
References: <20211014081917.15977-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/7] lib/gem_submission: Add kernel exec
 object alignment capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

v2: rename to gem_allows_obj_alignment() (Ashutosh)

With newer gens passing non-zero alignment will be forbidden.
Add check which detects kernel supports it or not.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_submission.c | 32 ++++++++++++++++++++++++++++++++
 lib/i915/gem_submission.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index f1af4f97c..2627b802c 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -472,3 +472,35 @@ bool gem_has_relocations(int i915)
 
 	return has_relocs;
 }
+
+/**
+ * gem_allows_obj_alignment
+ * @fd: opened i915 drm file descriptor
+ *
+ * Check does i915 driver allows setting object alignment in exec object to
+ * handle in kernel and adjust object offset accordingly.
+ *
+ * Returns: true if kernel supports setting offset to be aligned, otherwise
+ * false.
+ */
+bool gem_allows_obj_alignment(int fd)
+{
+	struct drm_i915_gem_exec_object2 obj = {
+		.handle = gem_create(fd, 4096),
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+	};
+	bool ret;
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+
+	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
+	gem_execbuf(fd, &execbuf);
+
+	obj.alignment = 0x2000;
+	ret = __gem_execbuf(fd, &execbuf) == 0;
+	gem_close(fd, obj.handle);
+
+	return ret;
+}
diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
index 9b3e2a4e5..38dd24a99 100644
--- a/lib/i915/gem_submission.h
+++ b/lib/i915/gem_submission.h
@@ -55,5 +55,6 @@ unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
 
 void gem_test_all_engines(int fd);
 bool gem_has_relocations(int fd);
+bool gem_allows_obj_alignment(int fd);
 
 #endif /* GEM_SUBMISSION_H */
-- 
2.26.0
