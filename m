Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Jun 2023 12:48:17 +0100
Message-Id: <20230602114817.849486-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_intel_bb: ensure valid next page
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Due to over-fetch, recommendation is to ensure we have a single valid
extra page beyond the batch. We currently lack this which seems to
explain why xe_intel_bb@full-batch generates CAT errors.

Currently we allow using the last GTT page, but this looks to be no-go,
since the next page will be beyond the actual GTT, in the case of
full-batch. The i915 path looks to already account for this. However
even with that fixed, Xe doesn't use scratch pages by default so the
next page will still not be valid.

With Xe rather expect that callers know about HW over-fetch, ensuring
that the batch has an extra page, if needed. Alternatively we could
apply the DRM_XE_VM_CREATE_SCRATCH_PAGE when creating the vm, but really
we want to get away from such things.

Bspec: 60223
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/262
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_batchbuffer.c | 6 ++++++
 tests/xe/xe_intel_bb.c  | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3cd680072..035facfc4 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -881,6 +881,12 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * passed in. If this is the case, it copies the information over to the
  * newly created batch buffer.
  *
+ * NOTE: On Xe scratch pages are not used by default. Due to over-fetch (~512
+ * bytes) there might need to be a valid next page to avoid hangs or CAT errors
+ * if the batch is quite large and approaches the end boundary of the batch
+ * itself.  Inflate the @size to ensure there is a valid next page in such
+ * cases.
+ *
  * Returns:
  *
  * Pointer the intel_bb, asserts on failure.
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 755cc530e..af8462af5 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -952,7 +952,13 @@ static void full_batch(struct buf_ops *bops)
 	struct intel_bb *ibb;
 	int i;
 
-	ibb = intel_bb_create(xe, PAGE_SIZE);
+	/*
+	 * Add an extra page to ensure over-fetch always sees a valid next page,
+	 * which includes not going beyond the actual GTT, and ensuring we have
+	 * a valid GTT entry, given that on xe we don't use scratch pages by
+	 * default.
+	 */
+	ibb = intel_bb_create(xe, 2 * PAGE_SIZE);
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
 
-- 
2.40.1
