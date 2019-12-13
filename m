Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78A86E12B
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 03:06:57 +0000 (UTC)
Date: Thu, 12 Dec 2019 19:08:19 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <20191213030818.GB27115@intel.com>
References: <20191209035118.6658-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209035118.6658-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_tiled_display: Request a
 mode on resolution that matches tile size
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Thank you for the patch, pushed to igt

On Mon, Dec 09, 2019 at 09:21:18AM +0530, Karthik B S wrote:
> Loop through the connector's modes for both the tiled connectors and 
> find a mode that matches the tile h size and tile v size.
> Request a modeset on this mode for both tiled connectors.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_dp_tiled_display.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
> index 175ff12f..c86a055e 100644
> --- a/tests/kms_dp_tiled_display.c
> +++ b/tests/kms_dp_tiled_display.c
> @@ -207,9 +207,10 @@ static void test_cleanup(data_t *data)
>  
>  static void setup_mode(data_t *data)
>  {
> -	int count = 0, prev = 0;
> -	bool pipe_in_use = false;
> +	int count = 0, prev = 0, i = 0;
> +	bool pipe_in_use = false, found = false;
>  	enum pipe pipe;
> +	drmModeModeInfo *mode;
>  	igt_output_t *output;
>  	data_connector_t *conns = data->conns;
>  
> @@ -226,6 +227,8 @@ static void setup_mode(data_t *data)
>  
>  		for_each_pipe(data->display, pipe) {
>  			pipe_in_use = false;
> +			found = false;
> +
>  			if (count > 0) {
>  				for (prev = count - 1; prev >= 0; prev--) {
>  					if (pipe == conns[prev].pipe) {
> @@ -247,6 +250,17 @@ static void setup_mode(data_t *data)
>  			}
>  		}
>  		igt_require(conns[count].pipe != PIPE_NONE);
> +
> +		for (i = 0; i < conns[count].connector->count_modes; i++) {
> +			mode = &conns[count].connector->modes[i];
> +			if (mode->vdisplay == conns[count].tile.tile_v_size &&
> +			    mode->hdisplay == conns[count].tile.tile_h_size) {
> +				found = true;
> +				break;
> +			}
> +		}
> +		igt_require(found);
> +		igt_output_override_mode(output, mode);
>  	}
>  	igt_display_commit_atomic(data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
>  				  NULL);
> -- 
> 2.22.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
