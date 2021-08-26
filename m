Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C4089AC9
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Aug 2021 05:51:48 +0000 (UTC)
Date: Thu, 26 Aug 2021 08:54:43 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YScso2OdJf/n99dc@platvala-desk.ger.corp.intel.com>
References: <20210825053109.336142-1-alan.previn.teres.alexis@intel.com>
 <20210825053109.336142-3-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825053109.336142-3-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v7 02/17] Update IOCTL wrapper with
 DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 24, 2021 at 10:30:54PM -0700, Alan Previn wrote:
> Update IOCTL wrapper with DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/ioctl_wrappers.c | 34 ++++++++++++++++++++++++++++++++++
>  lib/ioctl_wrappers.h |  2 ++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 09eb3ce7..5c59a259 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -706,6 +706,40 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
>  	igt_assert_eq(__gem_execbuf_wr(fd, execbuf), 0);
>  }
>  
> +/**
> + * __gem_ctx_create_ext:
> + * @fd: open i915 drm file descriptor
> + * @ctx_ext: context_create_ext data structure
> + *
> + * This wraps the GEM_CONTEXT_CREATE_EXT ioctl, which allocates gem context based on
> + * additional drm_i915_gem_context_create_ext_setparam input extensions. This is
> + * allowed to fail, with -errno returned
> + */
> +int __gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext *ctx_ext)
> +{
> +	int err = 0;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT, ctx_ext)) {
> +		err = -errno;
> +		igt_assume(err != 0);
> +	}
> +	errno = 0;
> +	return err;
> +}
> +
> +/**
> + * gem_ctx_create_ext:
> + * @fd: open i915 drm file descriptor
> + * @ctx_ext: context_create_ext data structure
> + *
> + * This wraps the GEM_CONTEXT_CREATE_EXT ioctl, which allocates gem context based on
> + * additional drm_i915_gem_context_create_ext_setparam input extensions.
> + */
> +void gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext *ctx_ext)
> +{
> +	igt_assert_eq(__gem_ctx_create_ext(fd, ctx_ext), 0);
> +}

lib/i915/gem_context.c already has gem_context_create_ext() and pals.


-- 
Petri Latvala



> +
>  /**
>   * gem_madvise:
>   * @fd: open i915 drm file descriptor
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 9a897fec..6f7fbf1a 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -84,6 +84,8 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
>  int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
>  void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
>  int __gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
> +int __gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext *ctx_ext);
> +void gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext *ctx_ext);
>  
>  #ifndef I915_GEM_DOMAIN_WC
>  #define I915_GEM_DOMAIN_WC 0x80
> -- 
> 2.25.1
> 
