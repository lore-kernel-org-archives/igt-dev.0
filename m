Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8032A10E9E8
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Sep 2022 19:29:53 +0000 (UTC)
Date: Wed, 14 Sep 2022 21:29:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YyIrsf/SuQWfL/NH@kamilkon-desk1>
References: <20220912181552.2224231-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220912181552.2224231-1-adrian.larumbe@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/2] lib/i915/i915_drm_local: Remove
 COMPUTE class engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adrian.larumbe@collabora.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-09-12 at 19:15:51 +0100, Adrian Larumbe wrote:
> Remove local compute engine definition as it was already synchronised into
> include/drm-uapi/i915_drm.h from the kernel sources in a past commit.
> 
> Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>

imho you can still add r-b from Petri.

Regards,
Kamil

> ---
>  lib/i915/i915_drm_local.h | 2 --
>  1 file changed, 2 deletions(-)
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
> -- 
> 2.37.0
> 
