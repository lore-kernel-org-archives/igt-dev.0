Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07906E0A5
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 06:54:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  8 Oct 2021 08:54:26 +0200
Message-Id: <20211008065432.15482-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
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
index f1af4f97c..459ee21f9 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -472,3 +472,35 @@ bool gem_has_relocations(int i915)
 
 	return has_relocs;
 }
+
+/**
+ * gem_allows_passing_alignment
+ * @fd: opened i915 drm file descriptor
+ *
+ * Check does i915 driver allows passing alignment in exec object to
+ * handle in kernel and adjust object offset accordingly.
+ *
+ * Returns: true if kernel supports setting offset to be aligned, otherwise
+ * false.
+ */
+bool gem_allows_passing_alignment(int fd)
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
index 9b3e2a4e5..9f1ee8125 100644
--- a/lib/i915/gem_submission.h
+++ b/lib/i915/gem_submission.h
@@ -55,5 +55,6 @@ unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
 
 void gem_test_all_engines(int fd);
 bool gem_has_relocations(int fd);
+bool gem_allows_passing_alignment(int fd);
 
 #endif /* GEM_SUBMISSION_H */
-- 
2.26.0
