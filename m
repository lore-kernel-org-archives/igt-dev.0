Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D396E05A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 08:34:02 +0000 (UTC)
Date: Thu, 18 Jun 2020 11:33:58 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200618083358.GF20883@platvala-desk.ger.corp.intel.com>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
 <20200617180354.17770-2-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617180354.17770-2-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] lib/igt_kms: Add support for
 display with non-contiguous pipes
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org, kishore.kunche@intel.com, suresh.kumar.kurmi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 11:33:49PM +0530, Mohammed Khajapasha wrote:
> Add support for non-contiguous pipe display by allocating
> upper bound pipes array for display. Set the pipe enum name
> to igt pipe for enabled pipes in drm.
> 
> v2:
>     changed upper bound allocation for pipes for i915 device (Petri)
>     assigned pipe for a drm plane as per possible crtcs for plane (Petri)
>     changed full pipe mask for a output using index of i (Petri)
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  lib/igt_kms.c | 54 +++++++++++++++++++++++++++++++++++++++++++--------
>  lib/igt_kms.h | 13 ++++++++-----
>  2 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index afef5939..277d5c37 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1888,13 +1888,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  {
>  	drmModeRes *resources;
>  	drmModePlaneRes *plane_resources;
> -	int i;
> +	int i, i915_dev;
>  
>  	memset(display, 0, sizeof(igt_display_t));
>  
>  	LOG_INDENT(display, "init");
>  
>  	display->drm_fd = drm_fd;
> +	i915_dev = is_i915_device(drm_fd);
>  
>  	resources = drmModeGetResources(display->drm_fd);
>  	if (!resources)
> @@ -1921,10 +1922,33 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	 * We cache the number of pipes, that number is a physical limit of the
>  	 * hardware and cannot change of time (for now, at least).
>  	 */
> -	display->n_pipes = resources->count_crtcs;
> +	if (i915_dev)
> +		display->n_pipes = IGT_MAX_PIPES;
> +	else
> +		display->n_pipes = resources->count_crtcs;
> +
>  	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
>  	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
>  
> +	for(i = 0; i < resources->count_crtcs; i++) {
> +		igt_pipe_t *pipe;
> +		struct drm_i915_get_pipe_from_crtc_id get_pipe;
> +
> +		/* Get right pipe enum from kernel for a pipe */
> +		get_pipe.pipe = 0;
> +		get_pipe.crtc_id =  resources->crtcs[i];
> +		do_ioctl(display->drm_fd,
> +				DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID, &get_pipe);
> +
> +		if (i915_dev)
> +			pipe = &display->pipes[get_pipe.pipe];
> +		else
> +			pipe = &display->pipes[i];

For non-i915 devices, avoid calling the ioctl entirely.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
