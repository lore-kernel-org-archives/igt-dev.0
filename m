Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1131B6E159
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2020 13:43:35 +0000 (UTC)
Date: Tue, 16 Jun 2020 16:43:32 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200616134332.GB20883@platvala-desk.ger.corp.intel.com>
References: <20200610193724.16436-1-mohammed.khajapasha@intel.com>
 <20200610193724.16436-2-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610193724.16436-2-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [[RFC] i-g-t 1/1] lib/igt_kms: Add support for
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 01:07:24AM +0530, Mohammed Khajapasha wrote:
> Add support for non-contiguous pipe display by allocating
> upper bound pipes array for display. Set the pipe enum name
> to igt pipe for enabled pipes in drm.
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  lib/igt_kms.c | 30 +++++++++++++++++++++++++-----
>  lib/igt_kms.h | 13 ++++++++-----
>  2 files changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index afef5939..2b1cf878 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1921,10 +1921,26 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	 * We cache the number of pipes, that number is a physical limit of the
>  	 * hardware and cannot change of time (for now, at least).
>  	 */
> -	display->n_pipes = resources->count_crtcs;
> -	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
> +	display->n_pipes = IGT_MAX_PIPES;
> +	display->pipes = calloc(sizeof(igt_pipe_t), IGT_MAX_PIPES);
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
> +		pipe = &display->pipes[get_pipe.pipe];
> +		pipe->pipe = get_pipe.pipe;
> +		pipe->enabled = true;
> +		pipe->crtc_id = resources->crtcs[i];
> +	}
> +

You need to eventually make sure to only do this dancing for i915
devices. Might as well get that done early. For non-i915 devices you
need to make pipe->pipe equal to i directly, and so on.

You also need to store i in the pipe objects. possible_crtcs from a
drm plane refers to the value of i, not the pipe enum. That also needs
to be handled correctly futher down.


>  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>  	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>  		display->is_atomic = 1;
> @@ -1959,9 +1975,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		int j, type;
>  		uint8_t last_plane = 0, n_planes = 0;
>  
> -		pipe->crtc_id = resources->crtcs[i];
>  		pipe->display = display;
> -		pipe->pipe = i;
>  		pipe->plane_cursor = -1;
>  		pipe->plane_primary = -1;
>  		pipe->planes = NULL;
> @@ -2409,12 +2423,18 @@ static bool output_is_internal_panel(igt_output_t *output)
>  
>  igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t **chosen_outputs)
>  {
> -	unsigned full_pipe_mask = (1 << (display->n_pipes)) - 1, assigned_pipes = 0;
> +	unsigned full_pipe_mask, assigned_pipes = 0;
>  	igt_output_t *output;
>  	int i, j;
>  
>  	memset(chosen_outputs, 0, sizeof(*chosen_outputs) * display->n_pipes);
>  
> +	for( i = 0; i < display->n_pipes; i++) {
> +		igt_pipe_t *pipe = &display->pipes[i];
> +		if (pipe->enabled)
> +			full_pipe_mask |= (1 << pipe->pipe);

full_pipe_mask operates on config->valid_crtc_idx_mask later in this
function, so it's one of those that needs to operate on the index (i),
not the pipe->pipe value.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
