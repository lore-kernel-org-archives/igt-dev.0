Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66FB10E1B1
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 15:01:00 +0000 (UTC)
Date: Thu, 2 Feb 2023 16:00:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230202150053.5xnn6juv2xatklhf@kamilkon-desk1>
References: <20230202060115.29259-1-nidhi1.gupta@intel.com>
 <20230202070044.29881-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230202070044.29881-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH v5 4/7] tests/kms_plane_alpha_blend: Limit the
 execution to single pipe & two planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-02-02 at 12:30:44 +0530, Nidhi Gupta wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> As the execution is taking more time, limit the execution to single pipe
> and two (first & last) planes.
> 

This is version 5, please put here description of your changes.

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 48 +++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 38272ccb..39d321bf 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -26,6 +26,8 @@
>  
>  #include "igt.h"
>  
> +static bool extended = false;
> +
>  IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
>  
>  typedef struct {
> @@ -482,8 +484,10 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
>  {
>  	igt_display_t *display = &data->display;
>  	igt_plane_t *plane;
> +	int first_plane = -1;
> +	int last_plane = -1;
>  
> -	for_each_plane_on_pipe(display, pipe, plane) {
> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
>  		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
>  			continue;
>  
> @@ -496,6 +500,19 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
>  		if (must_multiply && !has_multiplied_alpha(data, plane))
>  			continue;
>  
> +		if (first_plane < 0)
> +			first_plane = j__;
> +
> +		last_plane = j__;
> +	}
> +
> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
> +		if (igt_run_in_simulation() &&
> +		    j__ != first_plane && j__ != last_plane)
> +			continue;
> +
> +		/* reset plane alpha properties between each plane */
> +		reset_alpha(display, pipe);
>  		igt_info("Testing plane %u\n", plane->index);
>  		test(data, pipe, plane);
>  		igt_plane_set_fb(plane, NULL);
> @@ -615,12 +632,23 @@ static void run_subtests(data_t *data)
>  {
>  	igt_output_t *output;
>  	enum pipe pipe;
> +	enum pipe active_pipes[IGT_MAX_PIPES];
> +	uint32_t last_pipe = 0;
> +
> +	/* Get active pipes. */
> +	for_each_pipe(&data->display, pipe)

You cannot do this here, init this inside igt_fixture.
GitLab warns you that there is error, you may check it yourself with:

./kms_plane_alpha_blend --list-subtests

> +		active_pipes[last_pipe++] = pipe;
> +	last_pipe--;
>  
>  	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
>  		igt_describe_f("%s\n", subtests[i].desc);
>  
>  		igt_subtest_with_dynamic(subtests[i].name) {
>  			for_each_pipe_with_single_output(&data->display, pipe, output) {
> +				if (igt_run_in_simulation() && !extended &&
> +				    pipe != active_pipes[0] &&
> +				    pipe != active_pipes[last_pipe])

The same code is repeated here and below, maybe create new function
and make it one-liner here ? For example:
				if (limit_on_simulation(data))
					continue;

Regards,
Kamil

> +					continue;
>  				prepare_crtc(data, output, pipe);
>  				if (!pipe_check(data, pipe, subtests[i].blend, subtests[i].must_multiply))
>  					continue;
> @@ -633,7 +661,23 @@ static void run_subtests(data_t *data)
>  	}
>  }
>  
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +		case 'e':
> +			extended = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -e \tExtended tests.\n";
> +
> +igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
>  	data_t data = {};
>  
> -- 
> 2.39.0
> 
