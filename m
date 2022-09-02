Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA06D10E889
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Sep 2022 15:23:28 +0000 (UTC)
Date: Fri, 2 Sep 2022 17:23:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YxIf6thvFarZ2xaT@kamilkon-desk1>
References: <20220902134014.45069-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220902134014.45069-1-adrian.larumbe@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/2] lib/i915/i915_drm_local: Remove
 COMPUTE class engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Adrian Larumbe <adrian.larumbe@collabora.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-09-02 at 14:40:13 +0100, Adrian Larumbe wrote:
> gem_ctx_isolation@preservation needs to take into account the shared reset
> domain between RCS and CCS engines.

Drop gem_ctx_isolation... part from this patch.

> 
> Remove local compute engine definition as it was already synchronised into
> include/drm-uapi/i915_drm.h from the kernel sources in a past commit.
> 
> Signed-Off-By: Adrian Larumbe <adrian.larumbe@collabora.com>
> ---
>  lib/i915/i915_drm_local.h      | 2 --
>  tests/i915/gem_ctx_isolation.c | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index ac35abf6af76..696e5aa05048 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -19,8 +19,6 @@ extern "C" {
>   * or local_ prefix and without any #ifndef's. Attempt should be made to
>   * clean these up when kernel uapi headers are sync'd.
>   */
> -#define I915_ENGINE_CLASS_COMPUTE 4
> -
>  #define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
>  
>  /*
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 95d13969fa61..4233ea5784dc 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -164,6 +164,8 @@ static const struct named_register {
>  
>  	{ "xCS_GPR", GEN9, ALL, 0x600, 32, .relative = true },
>  
> +        /* TODO: add CCS0 registers */
> +

What is it here ? This should be in your 2nd patch, not here.

--
Kamil

>  	{}
>  }, ignore_registers[] = {
>  	{ "RCS timestamp", GEN6, ~0u, 0x2358 },
> -- 
> 2.37.0
> 
