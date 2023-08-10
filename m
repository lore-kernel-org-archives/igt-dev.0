Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785F010E192
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 12:58:55 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Date: Thu, 10 Aug 2023 12:58:51 +0000
Message-ID: <SN6PR11MB34247EC6D7F5D2D93DCDBA24D013A@SN6PR11MB3424.namprd11.prod.outlook.com>
References: <20230807035805.1054349-1-janga.rahul.kumar@intel.com>
 <20230807035805.1054349-4-janga.rahul.kumar@intel.com>
In-Reply-To: <20230807035805.1054349-4-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/igt_gt: Extend hang library
 support to XE
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
>Sent: Monday, August 7, 2023 9:28 AM
>To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
><ramadevi.gandi@intel.com>; Kumar, Janga Rahul
><janga.rahul.kumar@intel.com>
>Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Joshi, Kunal1
><kunal1.joshi@intel.com>; kamil.konieczny@linux.intel.com; Karas, Anna
><anna.karas@intel.com>
>Subject: [PATCH i-g-t 3/3] lib/igt_gt: Extend hang library support to XE
>
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
>Extend hang library support to XE driver and update the documentation.
>
>Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>Cc: Kunal Joshi <kunal1.joshi@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Cc: Anna Karas <anna.karas@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>Tested-by: Kunal Joshi <kunal1.joshi@intel.com>
>---
> lib/igt_gt.c | 26 ++++++++++++++++++++++----
> 1 file changed, 22 insertions(+), 4 deletions(-)
>

You Might have missed extending igt_force_gpu_reset() to your change xe_for=
ce_gt_reset_all,=20
Rest looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

>diff --git a/lib/igt_gt.c b/lib/igt_gt.c index d4a825e66..245984f7f 100644
>--- a/lib/igt_gt.c
>+++ b/lib/igt_gt.c
>@@ -44,6 +44,7 @@
> #include "intel_reg.h"
> #include "intel_chipset.h"
> #include "igt_dummyload.h"
>+#include "xe/xe_gt.h"
>
> /**
>  * SECTION:igt_gt
>@@ -179,6 +180,12 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx,
>unsigned flags)
> 	 */
> 	if (!igt_check_boolean_env_var("IGT_HANG", true))
> 		igt_skip("hang injection disabled by user [IGT_HANG=3D0]\n");
>+
>+	if (is_xe_device(fd)) {
>+		igt_require(has_gpu_reset(fd));
>+		return (struct igt_hang){ 0, ctx, 0, flags };
>+	}
>+
> 	gem_context_require_bannable(fd);
>
> 	if (flags & HANG_WANT_ENGINE_RESET)
>@@ -215,6 +222,9 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx,
>unsigned flags)
>
> void igt_disallow_hang(int fd, igt_hang_t arg)  {
>+	if (is_xe_device(fd))
>+		return;
>+
> 	context_set_ban(fd, arg.ctx, arg.ban);
>
> 	if ((arg.flags & HANG_ALLOW_CAPTURE) =3D=3D 0) { @@ -269,8 +279,8 @@
>static bool has_ctx_exec(int fd, unsigned ring, uint32_t ctx)
>
> /**
>  * igt_hang_ring_ctx:
>- * @fd: open i915 drm file descriptor
>- * @ctx: the contxt specifier
>+ * @fd: open i915/xe drm file descriptor
>+ * @ctx: the context specifier
>  * @ring: execbuf ring flag
>  * @flags: set of flags to control execution
>  * @offset: The resultant gtt offset of the exec obj @@ -290,6 +300,9 @@
>static igt_hang_t __igt_hang_ctx(int fd, uint64_t ahnd, uint32_t ctx, int =
ring,
> 	igt_spin_t *spin;
> 	unsigned ban;
>
>+	if (is_xe_device(fd))
>+		return xe_hang_ring(fd, ahnd, ctx, ring, flags);
>+
> 	igt_require_hang_ring(fd, ctx, ring);
>
> 	/* check if non-default ctx submission is allowed */ @@ -334,7 +347,7
>@@ igt_hang_t igt_hang_ctx_with_ahnd(int fd, uint64_t ahnd, uint32_t ctx,
>int ring,
>
> /**
>  * igt_hang_ring:
>- * @fd: open i915 drm file descriptor
>+ * @fd: open i915/xe drm file descriptor
>  * @ring: execbuf ring flag
>  *
>  * This helper function injects a hanging batch into @ring. It returns a =
@@ -
>357,7 +370,7 @@ igt_hang_t igt_hang_ring_with_ahnd(int fd, int ring,
>uint64_t ahnd)
>
> /**
>  * igt_post_hang_ring:
>- * @fd: open i915 drm file descriptor
>+ * @fd: open i915/xe drm file descriptor
>  * @arg: hang state from igt_hang_ring()
>  *
>  * This function does the necessary post-processing after a gpu hang inje=
cted
>@@ -368,6 +381,11 @@ void igt_post_hang_ring(int fd, igt_hang_t arg)
> 	if (!arg.spin)
> 		return;
>
>+	if (is_xe_device(fd)) {
>+		igt_spin_free(fd, arg.spin);
>+		xe_post_hang_ring(fd, arg);
>+	}
>+
> 	gem_sync(fd, arg.spin->handle); /* Wait until it hangs */
> 	igt_spin_free(fd, arg.spin);
>
>--
>2.25.1
