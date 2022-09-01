Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5727310E6E9
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 12:36:31 +0000 (UTC)
Date: Thu, 1 Sep 2022 15:35:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Message-ID: <YxCnGdpNgs1z3itk@platvala-desk.ger.corp.intel.com>
References: <20220819195218.983998-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819195218.983998-1-adrian.larumbe@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] i915_drm.h sync uapi engine
 class enum with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 19, 2022 at 08:52:17PM +0100, Adrian Larumbe wrote:
> gem_ctx_isolation@preservation needs to take into account the shared reset
> domain between RCS and CCS engines.
> 
> Remove local compute engine definition as it's no longer necessary.
> 
> Taken from ecf8eca51f33 ("drm/i915/xehp: Add compute engine ABI")

There's no longer any uapi header changes here, you need to rewrite
this commit message.

-- 
Petri Latvala


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
>  	{}
>  }, ignore_registers[] = {
>  	{ "RCS timestamp", GEN6, ~0u, 0x2358 },
> -- 
> 2.37.0
> 
