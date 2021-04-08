Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00A56E30D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 18:50:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so4493079wma.0
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Apr 2021 11:50:35 -0700 (PDT)
Date: Thu, 8 Apr 2021 20:50:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YG9Qd8S8gtZqHZYJ@phenom.ffwll.local>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
 <20210401021243.4147604-2-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401021243.4147604-2-jason@jlekstrand.net>
Subject: Re: [igt-dev] [RFC 01/30] lib/i915/gem_engine_topology: Expose the
 __query_engines helper
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 09:12:14PM -0500, Jason Ekstrand wrote:
> ---
>  lib/i915/gem_engine_topology.c | 20 +++++++++++---------
>  lib/i915/gem_engine_topology.h |  4 ++++
>  2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index c12cd920..5d196f59 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -62,14 +62,9 @@ static int __gem_query(int fd, struct drm_i915_query *q)
>  	return err;
>  }
>  
> -static void gem_query(int fd, struct drm_i915_query *q)
> -{
> -	igt_assert_eq(__gem_query(fd, q), 0);
> -}
> -
> -static void query_engines(int fd,
> -			  struct drm_i915_query_engine_info *query_engines,
> -			  int length)
> +int __gem_query_engines(int fd,
> +			struct drm_i915_query_engine_info *query_engines,
> +			int length)

Generally __ is supposed to be the internal version without checking, and
the non-__ version is the one everyone is supposed to use.

Also I know it wasn't you who didn't do this, but it would be really good
if you can go through all the library functions (at the end of the series,
or as you go) and
- make sure anything not used by tests is static
- anything non-static has some gtkdoc explaining wth it's for and how to
  use it. Including magic iterator macros and stuff like that, especially
  if they come in __ and ____ variants.

It's some work, but imo we really need to aim towards more maintainable
testcode here, and at least for library functions that imo should mean
reasonably documented exported functions.
-Daniel

>  {
>  	struct drm_i915_query_item item = { };
>  	struct drm_i915_query query = { };
> @@ -81,7 +76,14 @@ static void query_engines(int fd,
>  
>  	item.data_ptr = to_user_pointer(query_engines);
>  
> -	gem_query(fd, &query);
> +	return __gem_query(fd, &query);
> +}
> +
> +static void query_engines(int fd,
> +			  struct drm_i915_query_engine_info *query_engines,
> +			  int length)
> +{
> +	igt_assert_eq(__gem_query_engines(fd, query_engines, length), 0);
>  }
>  
>  static void ctx_map_engines(int fd, struct intel_engine_data *ed,
> diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
> index f5edcb5d..76b7cd4d 100644
> --- a/lib/i915/gem_engine_topology.h
> +++ b/lib/i915/gem_engine_topology.h
> @@ -29,6 +29,10 @@
>  
>  #define GEM_MAX_ENGINES		I915_EXEC_RING_MASK + 1
>  
> +int __gem_query_engines(int fd,
> +			struct drm_i915_query_engine_info *query_engines,
> +			int length);
> +
>  struct intel_engine_data {
>  	uint32_t nengines;
>  	uint32_t n;
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
