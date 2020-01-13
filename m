Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DDB89B70
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2020 17:50:24 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200113172120.32553-1-imre.deak@intel.com>
References: <20200113172120.32553-1-imre.deak@intel.com>
Message-ID: <157893780917.27314.7143019011032309969@skylake-alporthouse-com>
Date: Mon, 13 Jan 2020 17:50:09 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915: Add test for unaligned
 detiler fences
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Imre Deak (2020-01-13 17:21:20)
> Add a test to check the detiling on a buffer with a size that isn't
> aligned to the detiler fence stride we add for the buffer. While writes
> beyond the last full tile row may target an address beyond the buffer's
> size, we still expect that such writes will not lead to a corruption
> on memory pages that are not owned by the process performing the write.
> 
> The reason for this test: on TGL such writes lead to random memory
> corruption in memory not belonging to the process. This should be
> prevented ensuring that we keep pages that user space can access
> (padding the object size to be tile-row size aligned) reserved in the
> GTT address space until userspace can write through the fenced region.

This is going through a different IP block and driver paths than the
original bug. When we are using a fence, we create a vma that is
sufficient to include the last tile row. When we create a vma for the
display, we don't ask for that...

--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -344,19 +344,24 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 	 * put it anyway and hope that userspace can cope (but always first
 	 * try to preserve the existing ABI).
 	 */
-	vma = ERR_PTR(-ENOSPC);
-	if ((flags & PIN_MAPPABLE) == 0 &&
-	    (!view || view->type == I915_GGTT_VIEW_NORMAL))
-		vma = i915_gem_object_ggtt_pin(obj, view, 0, alignment,
-					       flags |
-					       PIN_MAPPABLE |
-					       PIN_NONBLOCK);
-	if (IS_ERR(vma))
-		vma = i915_gem_object_ggtt_pin(obj, view, 0, alignment, flags);
+	vma = i915_vma_instance(obj, &i915->ggtt.vm, view);
 	if (IS_ERR(vma))
 		return vma;

-	vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
+	alignment = max(vma->display_alignment, alignment);
+
+	ret = -ENOSPC;
+	if ((flags & PIN_MAPPABLE) == 0 &&
+	    vma->ggtt_view.type == I915_GGTT_VIEW_NORMAL)
+		ret = i915_vma_pin(vma,
+				   alignment, vma->fence_size,
+				   flags | PIN_MAPPABLE | PIN_NONBLOCK);
+	if (ret == -ENOSPC)
+		ret = i915_vma_pin(vma, alignment, vma->fence_size, flags);
+	if (ret)
+		return ERR_PTR(ret);
+
+	vma->display_alignment = alignment;

 	i915_gem_object_flush_if_display(obj);

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 17d7c525ea5c..57df22b809fa 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -619,7 +619,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));

 	size = max(size, vma->size);
-	alignment = max(alignment, vma->display_alignment);
+	alignment = max_t(typeof(alignment), alignment, vma->display_alignment);
 	if (flags & PIN_MAPPABLE) {
 		size = max_t(typeof(size), size, vma->fence_size);
 		alignment = max_t(typeof(alignment),
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index e0942efd5236..2cf642ecbd7d 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -182,7 +182,6 @@ struct i915_vma {
 	struct i915_fence_reg *fence;

 	u64 size;
-	u64 display_alignment;
 	struct i915_page_sizes page_sizes;

 	/* mmap-offset associated with fencing for this vma */
@@ -190,6 +189,7 @@ struct i915_vma {

 	u32 fence_size;
 	u32 fence_alignment;
+	u32 display_alignment;

 	/**
 	 * Count of the number of times this vma has been opened by different

The partial fencing interaction with HW and peeking at the pages behind
should be covered by selftests -- as we want to peek at physical pages.
Mostly done already.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
