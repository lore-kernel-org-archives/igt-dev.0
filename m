Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 22 Nov 2022 09:26:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Message-ID: <Y3yHnztPiGNNWPuw@kamilkon-desk1>
References: <20221115072834.2115985-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221115072834.2115985-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [i-g-t] tests/kms_plane: skip memory
 demanding modes in test_plane_panning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Andrzej,

On 2022-11-15 at 08:28:34 +0100, Andrzej Hajda wrote:
> test_plane_panning requires about 10 times bigger amount of memory than
> memory required by framebuffer in default display mode. In case of some
> configurations it can exceed available memory (4k modes on small-bar
> systems), causing test aborts.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6824
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/kms_plane.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 8a54ba6645c..fc530d2cfd3 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -342,14 +342,14 @@ test_plane_panning_with_output(data_t *data,
>  	drmModeModeInfo *mode;
>  	igt_crc_t crc;
>  
> -	igt_info("Testing connector %s using pipe %s\n",
> -		 igt_output_name(output), kmstest_pipe_name(pipe));
> -
>  	igt_output_set_pipe(output, pipe);
>  
>  	mode = igt_output_get_mode(output);
>  	primary = igt_output_get_plane(output, 0);
>  
> +	igt_info("Testing connector %s using pipe %s, mode %s\n",
> +		 igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
> +
>  	create_fb_for_mode_panning(data, mode, &primary_fb);
>  	igt_plane_set_fb(primary, &primary_fb);
>  
> @@ -381,6 +381,8 @@ test_plane_panning_with_output(data_t *data,
>  static void
>  test_plane_panning(data_t *data, enum pipe pipe)
>  {
> +	bool mode_found = false;
> +	uint64_t mem_size = 0;
>  	igt_output_t *output;
>  	igt_crc_t ref_crc;
>  
> @@ -389,6 +391,26 @@ test_plane_panning(data_t *data, enum pipe pipe)
>  
>  	test_init(data, pipe);
>  
> +	for_each_memory_region(r, data->drm_fd)
> +		if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
> +			mem_size = r->cpu_size;

imho either max(mem_size, r->cpu_size) or just break after
assign but maybe I overcomplicate this, so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +
> +	for_each_connector_mode(output) {
> +		drmModeModeInfo *m = &output->config.connector->modes[j__];
> +		uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
> +
> +		/* test allocates 2 double-dim fbs, add one more, to be safe */
> +		if (mem_size && 3 * 4 * fb_size > mem_size) {
> +			igt_debug("Skipping mode %s due to low memory\n", m->name);
> +			continue;
> +		}
> +
> +		igt_output_override_mode(output, m);
> +		mode_found = true;
> +		break;
> +	}
> +	igt_require(mode_found);
> +
>  	if (data->flags & TEST_PANNING_TOP_LEFT)
>  		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
>  	else
> -- 
> 2.34.1
> 
