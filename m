Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750BC6E1F5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 10:34:05 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201214071612.5953-1-petri.latvala@intel.com>
References: <20201214071612.5953-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 14 Dec 2020 10:34:01 +0000
Message-ID: <160794204154.13039.13648526136984639364@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] core_setmaster: Load modules before
 accessing device files
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-12-14 07:16:12)
> core_setmaster does special trickery to the dri device files before it
> calls drm_open_device. Now that drm_load_module() exists for just
> loading the modules without the other things that drm_open_device()
> does, use it to ensure the files exist.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/91
> ---
>  tests/core_setmaster.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 20e4defb..470f9441 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -125,6 +125,15 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
>  
>  igt_main
>  {
> +       igt_fixture {
> +               /*
> +                * We're operating on the device files themselves
> +                * before opening them, make sure the drivers are
> +                * loaded.
> +                */
> +               drm_load_module(DRIVER_ANY);
> +       }

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
