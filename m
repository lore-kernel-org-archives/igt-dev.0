Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5B910E30B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 15:10:17 +0000 (UTC)
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 20 Jun 2023 15:09:56 +0000
Message-ID: <IA1PR11MB6418F9119B318FCBEB864F49C15CA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230620145737.601858-1-swati2.sharma@intel.com>
 <20230620145737.601858-2-swati2.sharma@intel.com>
In-Reply-To: <20230620145737.601858-2-swati2.sharma@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] i915/kms_busy: Free spinners after
 use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Wilson, Chris P" <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: Sharma, Swati2 <swati2.sharma@intel.com>
>Sent: Tuesday, June 20, 2023 10:58 AM
>To: igt-dev@lists.freedesktop.org
>Cc: Wilson, Chris P <chris.p.wilson@intel.com>; Ruhl, Michael J
><michael.j.ruhl@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
>Subject: [PATCH i-g-t 1/3] i915/kms_busy: Free spinners after use
>
>From: Chris Wilson <chris.p.wilson@intel.com>
>
>Avoid leaking GEM objects between subtests, eventually leading to
>warnings for leaking kernel resources at exit.
>
>Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
>Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>---
> tests/i915/kms_busy.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
>index 3b838cb8..ad96d6b9 100644
>--- a/tests/i915/kms_busy.c
>+++ b/tests/i915/kms_busy.c
>@@ -219,7 +219,7 @@ static void test_atomic_commit_hang(igt_display_t
>*dpy, igt_plane_t *primary,
>
> 	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) =3D=3D sizeof(ev));
>
>-	igt_spin_end(t);
>+	igt_spin_free(dpy->drm_fd, t);
> 	put_ahnd(ahnd);
> }
>
>@@ -304,9 +304,8 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
>
> 	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) =3D=3D sizeof(ev));
>
>-	igt_spin_end(t);
> 	put_ahnd(ahnd);
>-
>+	igt_spin_free(dpy->drm_fd, t);

Why are you moving this one?

Is there a dependency between the ahnd and the spinner (I don't know how th=
is stuff works...).

This does look like a good clean up,

Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Thanks,

M


> 	igt_remove_fb(dpy->drm_fd, &fb);
> }
>
>--
>2.25.1
