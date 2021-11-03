Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6D673C00
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 18:18:36 +0000 (UTC)
Message-ID: <613560d4-7cb9-3796-79e7-b686099a3ce3@intel.com>
Date: Wed, 3 Nov 2021 11:18:30 -0700
Content-Language: en-GB
References: <cover.1635895537.git.ashutosh.dixit@intel.com>
 <247012b2502789db5a2d171fb84c33e257b02021.1635895537.git.ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <247012b2502789db5a2d171fb84c33e257b02021.1635895537.git.ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] Remove "semaphores" submission
 method
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 11/2/2021 16:30, Ashutosh Dixit wrote:
> As part of cleaning up the submission library functions, remove the
> "semaphores" submission method. Semaphores are not a "submission method",
> semaphores can be used with GuC, execlists or legacy ring buffer submission.
>
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   lib/i915/gem_submission.c | 36 ++----------------------------------
>   lib/i915/gem_submission.h |  2 --
>   2 files changed, 2 insertions(+), 36 deletions(-)
>
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 2627b802cfb..a84a5d3eda8 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -52,22 +52,8 @@
>    * currently used hardware submission method. Different generations of hardware
>    * support different submission backends, currently we're distinguishing 3
>    * different methods: legacy ringbuffer submission, execlists, GuC submission.
> - * For legacy ringbuffer submission, there's also a variation where we're using
> - * semaphores for synchronization between engines.
>    */
>   
> -static bool has_semaphores(int fd, int dir)
> -{
> -	int val = 0;
> -	struct drm_i915_getparam gp = {
> -		gp.param = I915_PARAM_HAS_SEMAPHORES,
> -		gp.value = &val,
> -	};
> -	if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp) < 0)
> -		val = igt_sysfs_get_boolean(dir, "semaphores");
> -	return val;
> -}
> -
>   /**
>    * gem_submission_method:
>    * @fd: open i915 drm file descriptor
> @@ -90,13 +76,8 @@ unsigned gem_submission_method(int fd)
>   		goto out;
>   	}
>   
> -	if (gen >= 8) {
> +	if (gen >= 8)
>   		flags |= GEM_SUBMISSION_EXECLISTS;
> -		goto out;
> -	}
> -
> -	if (has_semaphores(fd, dir))
> -		flags |= GEM_SUBMISSION_SEMAPHORES;
>   
>   out:
>   	close(dir);
> @@ -128,20 +109,7 @@ void gem_submission_print_method(int fd)
>   		return;
>   	}
>   
> -	igt_info("Using Legacy submission%s\n",
> -		 flags & GEM_SUBMISSION_SEMAPHORES ? ", with semaphores" : "");
> -}
> -
> -/**
> - * gem_has_semaphores:
> - * @fd: open i915 drm file descriptor
> - *
> - * Feature test macro to query whether the driver is using semaphores for
> - * synchronization between engines.
> - */
> -bool gem_has_semaphores(int fd)
> -{
> -	return gem_submission_method(fd) & GEM_SUBMISSION_SEMAPHORES;
> +	igt_info("Using Legacy submission\n");
>   }
>   
>   /**
> diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
> index 38dd24a99a4..55bcfc09965 100644
> --- a/lib/i915/gem_submission.h
> +++ b/lib/i915/gem_submission.h
> @@ -28,12 +28,10 @@
>   
>   #include "intel_ctx.h"
>   
> -#define GEM_SUBMISSION_SEMAPHORES	(1 << 0)
>   #define GEM_SUBMISSION_EXECLISTS	(1 << 1)
>   #define GEM_SUBMISSION_GUC		(1 << 2)
>   unsigned gem_submission_method(int fd);
>   void gem_submission_print_method(int fd);
> -bool gem_has_semaphores(int fd);
>   bool gem_has_execlists(int fd);
>   bool gem_has_guc_submission(int fd);
>   bool gem_engine_has_mutable_submission(int fd, unsigned int engine);
