Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8AC10E6AC
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 08:49:12 +0000 (UTC)
Date: Fri, 24 Feb 2023 09:49:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230224084907.tswgjezbrg4w7egv@kamilkon-desk1>
References: <20230221182557.725785-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230221182557.725785-1-hersenxs.wu@amd.com>
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_dp_dsc: fix basic
 and bpc test be skipped
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersen wu <hersenxs.wu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Hersen,

On 2023-02-21 at 13:25:57 -0500, hersen wu wrote:
> pipe is valid with display->pipes[i].enable be true when i is within
> [0, n_outputs). working on invalid pipe, will cause assert and let
> test be skipped.

Please improve description, you fixed a bug but you do not need
to write 1:1 about your code, just describe problem and that
you fixed it. For example:

Pipe max value was used instead of output one. Fixed that.

You can also give gitlab ticket or tag for commit which you fixed
or some error logs (but not too big).

> 
> Signed-off-by: hersen wu <hersenxs.wu@amd.com>
---------------- ^      ^
This should be uppercase:
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>

> ---
>  tests/amdgpu/amd_dp_dsc.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index e6b5a43b..a950789c 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -49,7 +49,7 @@ static void test_fini(data_t *data)
>  	igt_display_t *display = &data->display;
>  	int i;
>  
> -	for (i = 0; i < display->n_pipes; ++i) {
> +	for_each_pipe(display, i) {

Drop this, do not mix improvements with fixes.

>  		igt_pipe_crc_free(data->pipe_crc[i]);
>  	}
>  
> @@ -61,19 +61,19 @@ static void test_fini(data_t *data)
>  static void test_init(data_t *data)
>  {
>  	igt_display_t *display = &data->display;
> -	int i, n;
> +	int i, n, max_pipes = display->n_pipes;

Drop this.

>  
> -	for (i = 0; i < display->n_pipes; ++i) {
> +	for_each_pipe(display, i) {

Drop this.

>  		data->pipe_id[i] = PIPE_A + i;
>  		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
>  		data->primary[i] = igt_pipe_get_plane_type(
>  				data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>  		data->pipe_crc[i] =
> -				igt_pipe_crc_new(data->fd, data->pipe_id[i],
> -						 IGT_PIPE_CRC_SOURCE_AUTO);
> +			igt_pipe_crc_new(data->fd, data->pipe_id[i],
> +						IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>  
> -	for (i = 0, n = 0; i < display->n_outputs && n < display->n_pipes; ++i) {
> +	for (i = 0, n = 0; i < display->n_outputs && n < max_pipes; ++i) {

Drop this.

>  		igt_output_t *output = &display->outputs[i];
>  		data->output[n] = output;
>  
> @@ -110,7 +110,7 @@ static void test_dsc_enable(data_t *data)
>  	test_init(data);
>  	igt_enable_connectors(data->fd);
>  
> -	for (i = 0; i < display->n_pipes; i++) {
> +	for (i = 0; i < display->n_outputs; i++) {

Nice catch, this starts real fixes.

Please keep only fixes and resend v2 with r-b from Alex.

Regards,
Kamil

>  		/* Setup the output */
>  		output = data->output[i];
>  		if (!output || !igt_output_is_connected(output))
> @@ -248,7 +248,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>  	test_init(data);
>  	igt_enable_connectors(data->fd);
>  
> -	for (i = 0; i < display->n_pipes; i++) {
> +	for (i = 0; i < display->n_outputs; i++) {
>  		/* Setup the output */
>  		output = data->output[i];
>  		if (!output || !igt_output_is_connected(output))
> @@ -341,7 +341,7 @@ static void test_dsc_link_settings(data_t *data)
>      test_init(data);
>  
>      /* Setup all outputs */
> -	for (i = 0; i < display->n_pipes; i++) {
> +	for (i = 0; i < display->n_outputs; i++) {
>  		output = data->output[i];
>  		if (!output || !igt_output_is_connected(output))
>  			continue;
> @@ -358,7 +358,7 @@ static void test_dsc_link_settings(data_t *data)
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
>      /* Collect reference CRCs */
> -	for (i = 0; i < display->n_pipes; i++) {
> +	for (i = 0; i < display->n_outputs; i++) {
>  		output = data->output[i];
>  		if (!output || !igt_output_is_connected(output))
>  			continue;
> @@ -369,7 +369,7 @@ static void test_dsc_link_settings(data_t *data)
>  	for (lc = 0; lc < ARRAY_SIZE(lane_count_vals); lc++) {
>  		for (lr = 0; lr < ARRAY_SIZE(link_rate_vals); lr++) {
>  			/* Write new link_settings */
> -			for (i = 0; i < display->n_pipes; i++) {
> +			for (i = 0; i < display->n_outputs; i++) {
>  				output = data->output[i];
>  				if (!output || !igt_output_is_connected(output))
>  					continue;
> @@ -387,7 +387,7 @@ static void test_dsc_link_settings(data_t *data)
>  			/* Trigger commit after writing new link settings */
>  			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  
> -			for (i = 0; i < display->n_pipes; i++) {
> +			for (i = 0; i < display->n_outputs; i++) {
>  				output = data->output[i];
>  				if (!output || !igt_output_is_connected(output))
>  					continue;
> @@ -416,7 +416,7 @@ static void test_dsc_link_settings(data_t *data)
>  	}
>  
>  	/* Cleanup all fbs */
> -	for (i = 0; i < display->n_pipes; i++) {
> +	for (i = 0; i < display->n_outputs; i++) {
>  		output = data->output[i];
>  		if (!output || !igt_output_is_connected(output))
>  			continue;
> @@ -439,7 +439,7 @@ static void test_dsc_bpc(data_t *data)
>      test_init(data);
>  
>  	/* Find max supported bpc */
> -	for (i = 0; i < display->n_pipes; i++) {
> +	for (i = 0; i < display->n_outputs; i++) {
>  		output = data->output[i];
>  		if (!output || !igt_output_is_connected(output))
>  			continue;
> @@ -451,7 +451,7 @@ static void test_dsc_bpc(data_t *data)
>  	for (bpc = 0; bpc < ARRAY_SIZE(bpc_vals); bpc++) {
>  		igt_info("Testing bpc = %d\n", bpc_vals[bpc]);
>  
> -		for (i = 0; i < display->n_pipes; i++) {
> +		for (i = 0; i < display->n_outputs; i++) {
>  			output = data->output[i];
>  			if (!output || !igt_output_is_connected(output))
>  				continue;
> @@ -474,7 +474,7 @@ static void test_dsc_bpc(data_t *data)
>  
>  		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
> -		for (i = 0; i < display->n_pipes; i++) {
> +		for (i = 0; i < display->n_outputs; i++) {
>  			output = data->output[i];
>  			if (!output || !igt_output_is_connected(output))
>  				continue;
> @@ -501,7 +501,7 @@ static void test_dsc_bpc(data_t *data)
>  		}
>  
>  		/* Cleanup all fbs */
> -		for (i = 0; i < display->n_pipes; i++) {
> +		for (i = 0; i < display->n_outputs; i++) {
>  			output = data->output[i];
>  			if (!output || !igt_output_is_connected(output))
>  				continue;
> -- 
> 2.25.1
> 
