Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDB210E180
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 12:56:15 +0000 (UTC)
Date: Thu, 2 Jun 2022 15:54:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <Ypiy61MS536or/rv@platvala-desk.ger.corp.intel.com>
References: <20220531220313.9537-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531220313.9537-1-quic_jesszhan@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_pipe_crc_basic: Support
 custom CRC sources
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 31, 2022 at 03:03:13PM -0700, Jessica Zhang wrote:
> Add a custom command line option that allows user to set a custom CRC
> source. This will allow different drivers to test their own CRC sources
> instead of just the "auto" option.
> 
> Example usage: `./kms_pipe_crc_basic -s intf`
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_pipe_crc_basic.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)

While this sounds useful, why only kms_pipe_crc_basic?

How about checking an environment variable in igt_pipe_crc_new*() and
overriding the source string based on that, if the parameter is
"auto"? That would bring this capability to other tests as well.


-- 
Petri Latvala


> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 0861c46dbd9b..6a593aec4c6c 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -36,6 +36,7 @@ typedef struct {
>  	int debugfs;
>  	igt_display_t display;
>  	struct igt_fb fb;
> +	char *crc_source;
>  } data_t;
>  
>  static struct {
> @@ -104,7 +105,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
>  		if (flags & TEST_NONBLOCK) {
>  			igt_pipe_crc_t *pipe_crc;
>  
> -			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
> +			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe, data->crc_source);
>  			igt_wait_for_vblank(data->drm_fd, display->pipes[pipe].crtc_offset);
>  			igt_pipe_crc_start(pipe_crc);
>  
> @@ -119,7 +120,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
>  		} else {
>  			igt_pipe_crc_t *pipe_crc;
>  
> -			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
> +			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, data->crc_source);
>  			igt_pipe_crc_start(pipe_crc);
>  
>  			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS, &crcs);
> @@ -202,8 +203,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
>  	igt_plane_set_fb(primary, &fb0);
>  	igt_display_commit(display);
>  
> -	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
> -				    INTEL_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, data->crc_source);
>  	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>  
>  	/* Flip FB1 with the Primary plane & compare the CRC with ref CRC. */
> @@ -265,9 +265,25 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
>  	igt_remove_fb(data->drm_fd, &data->fb);
>  }
>  
> -data_t data = {0, };
> +data_t data = {0, .crc_source = "auto"};
>  
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +	case 's':
> +		data.crc_source = optarg;
> +		igt_debug("Setting CRC source to %s\n", data.crc_source);
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char help_str[] =
> +	"  -s\tPass in a custom source for crc test (default is \"auto\")\n";
> +
> +
> +igt_main_args("s:", NULL, help_str, opt_handler, NULL)
>  {
>  	enum pipe pipe;
>  
> -- 
> 2.31.0
> 
