Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8C610E281
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 16:09:28 +0000 (UTC)
Date: Mon, 9 Oct 2023 18:09:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231009160923.6c44e65uyp3wn5wv@kamilkon-desk.igk.intel.com>
References: <20231008222306.145122-1-helen.koike@collabora.com>
 <20231008222306.145122-2-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231008222306.145122-2-helen.koike@collabora.com>
Subject: Re: [igt-dev] [PATCH 2/2] core_getversion: drop unused assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, Helen Koike <helen.koike@collabora.com>,
 emma@anholt.net
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Helen,
On 2023-10-08 at 19:23:06 -0300, Helen Koike wrote:
> If IGT_FORCE_DRIVER is used, open_device() already checks if the name
> matches, so igt_assert_fd(fd) is already enough.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/core_getversion.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 8c8e0c9a3..9945c3855 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -48,7 +48,6 @@ igt_simple_main
>  {
>  	int fd;
>  	drmVersionPtr v;
> -	const char *name = getenv("IGT_FORCE_DRIVER");
>  
>  	fd = __drm_open_driver(DRIVER_ANY);
>  	igt_assert_fd(fd);
> @@ -58,11 +57,6 @@ igt_simple_main
>  	igt_assert_neq(strlen(v->desc), 0);
>  	if (is_i915_device(fd))
>  		igt_assert_lte(1, v->version_major);
> -	if (name) {
> -		igt_assert_f(!strcmp(name, v->name),
> -			     "Expected driver \"%s\" but got \"%s\"\n",
> -			     name, v->name);
> -	}
>  
>  	drmFree(v);
>  	drm_close_driver(fd);
> -- 
> 2.34.1
> 
