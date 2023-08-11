Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DCA10E09A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 09:21:18 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Date: Fri, 11 Aug 2023 09:21:09 +0000
Message-ID: <SN6PR11MB3424917C8DDF81F6E4B2925AD010A@SN6PR11MB3424.namprd11.prod.outlook.com>
References: <20230810212521.1405970-1-janga.rahul.kumar@intel.com>
 <20230810212521.1405970-3-janga.rahul.kumar@intel.com>
In-Reply-To: <20230810212521.1405970-3-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/xe: Add hang library support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



>-----Original Message-----
>From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
>Sent: Friday, August 11, 2023 2:55 AM
>To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
><ramadevi.gandi@intel.com>; Kumar, Janga Rahul
><janga.rahul.kumar@intel.com>
>Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Joshi, Kunal1
><kunal1.joshi@intel.com>; kamil.konieczny@linux.intel.com; Karas, Anna
><anna.karas@intel.com>
>Subject: [PATCH i-g-t 2/3] lib/xe: Add hang library support
>
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
>Add helper library support to submit hanging batch and clean state post
>hang.
>
>An hanging batch is a spinning batch that never gets stopped.
>
>Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>Cc: Kunal Joshi <kunal1.joshi@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Cc: Anna Karas <anna.karas@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>Tested-by: Kunal Joshi <kunal1.joshi@intel.com>
>---
> lib/xe/xe_gt.c | 69
>++++++++++++++++++++++++++++++++++++++++++++++++++
> lib/xe/xe_gt.h |  7 ++++-
> 2 files changed, 75 insertions(+), 1 deletion(-)
>
>diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c index a72f9bcc9..10ffb00d5 10=
0644
>--- a/lib/xe/xe_gt.c
>+++ b/lib/xe/xe_gt.c
>@@ -59,3 +59,72 @@ void xe_force_gt_reset_all(int xe_fd)
> 		xe_force_gt_reset(xe_fd, gt);
> }
>
>+/**
>+ * xe_hang_ring:
>+ * @fd: open xe drm file descriptor
>+ * @ring: execbuf ring flag
>+ *
>+ * This helper function injects a hanging batch into @ring. It returns
>+a
>+ * #igt_hang_t structure which must be passed to xe_post_hang_ring()
>+for
>+ * hang post-processing (after the gpu hang interaction has been tested.
Close the Parentheses here.
Rest looks good to me with the above fix.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>+ *
>+ * Returns:
>+ * Structure with helper internal state for xe_post_hang_ring().
>+ */
>+igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
>+				unsigned int flags)
>+{
>+	uint16_t class;
>+	uint32_t vm;
>+	unsigned int exec_queue;
>+	igt_spin_t *spin_t;
>+
>+	vm =3D xe_vm_create(fd, 0, 0);
>+
>+	switch (ring) {
>+	case I915_EXEC_DEFAULT:
>+		if (IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
>+			class =3D DRM_XE_ENGINE_CLASS_COPY;
>+		else
>+			class =3D DRM_XE_ENGINE_CLASS_RENDER;
>+		break;
>+	case I915_EXEC_RENDER:
>+		if (IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
>+			igt_skip("Render engine not supported on this
>platform.\n");
>+		else
>+			class =3D DRM_XE_ENGINE_CLASS_RENDER;
>+		break;
>+	case I915_EXEC_BLT:
>+		class =3D DRM_XE_ENGINE_CLASS_COPY;
>+		break;
>+	case I915_EXEC_BSD:
>+		class =3D DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>+		break;
>+	case I915_EXEC_VEBOX:
>+		class =3D DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>+		break;
>+	default:
>+		igt_assert_f(false, "Unknown engine: %x", (uint32_t) flags);
>+	}
>+
>+	exec_queue =3D xe_exec_queue_create_class(fd, vm, class);
>+
>+	spin_t =3D igt_spin_new(fd, .ahnd =3D ahnd, .engine =3D exec_queue, .vm =
=3D
>vm,
>+				.flags =3D IGT_SPIN_NO_PREEMPTION);
>+	return (igt_hang_t){ spin_t, exec_queue, 0, flags }; }
>+
>+/**
>+ * xe_post_hang_ring:
>+ * @fd: open xe drm file descriptor
>+ * @arg: hang state from xe_hang_ring()
>+ *
>+ * This function does the necessary post-processing after a gpu hang
>+injected
>+ * with xe_hang_ring().
>+ */
>+void xe_post_hang_ring(int fd, igt_hang_t arg) {
>+	xe_exec_queue_destroy(fd, arg.ctx);
>+	xe_vm_destroy(fd, arg.spin->vm);
>+}
>+
>diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h index e075ebf62..26bbe23d4
>100644
>--- a/lib/xe/xe_gt.h
>+++ b/lib/xe/xe_gt.h
>@@ -12,6 +12,9 @@
>
> #include "igt_core.h"
> #include "igt_sysfs.h"
>+#include "lib/igt_gt.h"
>+#include "lib/intel_chipset.h"
>+#include "xe_spin.h"
> #include "xe_ioctl.h"
> #include "xe_query.h"
>
>@@ -24,4 +27,6 @@
>
> bool has_xe_gt_reset(int fd);
> void xe_force_gt_reset_all(int fd);
>-
>+igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
>+				unsigned int flags);
>+void xe_post_hang_ring(int fd, igt_hang_t arg);
>--
>2.25.1
