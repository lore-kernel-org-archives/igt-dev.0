Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096846E451
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 12:15:58 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200224092418.1450732-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200224092418.1450732-1-lionel.g.landwerlin@intel.com>
Message-ID: <158254655397.15220.2982057383454296913@skylake-alporthouse-com>
Date: Mon, 24 Feb 2020 12:15:53 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915/perf: fix loading
 configurations
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-02-24 09:24:17)
> The configuration ID created is returned not passed by argument.
> 
> This would lead the verify first test in the perf tests to fail.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: 3fd64d9fb8 ("lib/i915-perf: Add support for loading perf configurations")
> ---
>  lib/i915/perf.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 35b9aff9..1adf1393 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -427,7 +427,7 @@ static void
>  load_metric_set_config(struct intel_perf_metric_set *metric_set, int drm_fd)
>  {
>         struct drm_i915_perf_oa_config config;
> -       uint64_t config_id = 0;
> +       int ret;

Hmm, the syscall return is a long, but glibc ioctl() is only an int.
That bodes well for the future :(

>         memset(&config, 0, sizeof(config));
>  
> @@ -442,10 +442,11 @@ load_metric_set_config(struct intel_perf_metric_set *metric_set, int drm_fd)
>         config.n_flex_regs = metric_set->n_flex_regs;
>         config.flex_regs_ptr = (uintptr_t) metric_set->flex_regs;
>  
> -       while (ioctl(drm_fd, DRM_IOCTL_I915_PERF_ADD_CONFIG, &config) < 0 &&
> +       while ((ret = ioctl(drm_fd, DRM_IOCTL_I915_PERF_ADD_CONFIG, &config)) < 0 &&
>                (errno == EAGAIN || errno == EINTR));

ret = igt_ioctl(drm_fd, ADD_CONFIG, &config);

That will eat the EAGAIN/EINTR for you.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
