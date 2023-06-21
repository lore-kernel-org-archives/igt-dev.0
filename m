Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4BC10E05C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 07:09:11 +0000 (UTC)
Date: Wed, 21 Jun 2023 09:08:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230621070859.3r67bofjic4xmk5x@kamilkon-desk1>
References: <20230620145737.601858-1-swati2.sharma@intel.com>
 <20230620145737.601858-2-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620145737.601858-2-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] i915/kms_busy: Free spinners after
 use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Swati,

On 2023-06-20 at 20:27:35 +0530, Swati Sharma wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Avoid leaking GEM objects between subtests, eventually leading to
> warnings for leaking kernel resources at exit.
> 
> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/i915/kms_busy.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
> index 3b838cb8..ad96d6b9 100644
> --- a/tests/i915/kms_busy.c
> +++ b/tests/i915/kms_busy.c
> @@ -219,7 +219,7 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
>  
>  	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
>  
> -	igt_spin_end(t);
> +	igt_spin_free(dpy->drm_fd, t);
>  	put_ahnd(ahnd);
>  }
>  
> @@ -304,9 +304,8 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
>  
>  	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
>  
> -	igt_spin_end(t);

Why not do it like in previous change? imho here:
	igt_spin_free(dpy->drm_fd, t);

Regards,
Kamil

>  	put_ahnd(ahnd);
> -
> +	igt_spin_free(dpy->drm_fd, t);
>  	igt_remove_fb(dpy->drm_fd, &fb);
>  }
>  
> -- 
> 2.25.1
> 
