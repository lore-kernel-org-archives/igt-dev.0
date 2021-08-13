Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA4C6E5B9
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 10:48:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k29so12655878wrd.7
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 03:48:14 -0700 (PDT)
References: <20210813073858.1360821-1-mika.kahola@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <ad896c78-ab2f-5243-0679-7742342ff956@gmail.com>
Date: Fri, 13 Aug 2021 13:48:06 +0300
MIME-Version: 1.0
In-Reply-To: <20210813073858.1360821-1-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Limit plane
 testing to 3 planes by default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 13.8.2021 10.38, Mika Kahola wrote:
> To speed up test execution, let's limit planes to be tested to 3
> by default. This reduces the test execution time especially in case
> of platforms that offer higher number of overlay planes.
> 
> For example, the subtest atomic-pipe-A-tiling-x the execution times
> on ADL-P
> 
> With 6 planes:
> Testing connector eDP-1 using pipe A with 6 planes for 1 iteration with seed 1
> Subtest atomic-pipe-A-tiling-x: SUCCESS (2,168s)
> 
> With 3 planes:
> Testing connector eDP-1 using pipe A with 3 planes for 1 iteration with seed 1
> Subtest atomic-pipe-A-tiling-x: SUCCESS (1,878s)
> 
> The downside of this is of course the reduced test coverage as all
> available planes are not tested by default simultaneusly.
> 
> For VLK-11391
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

Look ok to me.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> ---
>   tests/kms_plane_multiple.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index bfeb8c07b..45cabb500 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -35,6 +35,7 @@ IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
>   #define SIZE_PLANE      256
>   #define SIZE_CURSOR     128
>   #define LOOP_FOREVER     -1
> +#define DEFAULT_N_PLANES  3
>   
>   typedef struct {
>   	float red;
> @@ -56,8 +57,10 @@ struct {
>   	int iterations;
>   	unsigned int seed;
>   	bool user_seed;
> +	bool all_planes;
>   } opt = {
>   	.iterations = 1,
> +	.all_planes = false,
>   };
>   
>   /*
> @@ -361,7 +364,8 @@ static void
>   test_plane_position(data_t *data, enum pipe pipe, uint64_t tiling)
>   {
>   	igt_output_t *output;
> -	int n_planes = data->display.pipes[pipe].n_planes;
> +	int n_planes = opt.all_planes ?
> +			data->display.pipes[pipe].n_planes : DEFAULT_N_PLANES;
>   
>   	output = igt_get_single_output_for_pipe(&data->display, pipe);
>   	igt_require(output);
> @@ -401,6 +405,9 @@ static data_t data;
>   static int opt_handler(int option, int option_index, void *input)
>   {
>   	switch (option) {
> +	case 'a':
> +		opt.all_planes = true;
> +		break;
>   	case 'i':
>   		opt.iterations = strtol(optarg, NULL, 0);
>   
> @@ -423,11 +430,13 @@ static int opt_handler(int option, int option_index, void *input)
>   
>   const char *help_str =
>   	"  --iterations Number of iterations for test coverage. -1 loop forever, default 64 iterations\n"
> -	"  --seed       Seed for random number generator\n";
> +	"  --seed       Seed for random number generator\n"
> +	"  --all-planes Test with all available planes";
>   
>   struct option long_options[] = {
>   	{ "iterations", required_argument, NULL, 'i'},
>   	{ "seed",    required_argument, NULL, 's'},
> +	{ "all-planes", no_argument, NULL, 'a'},
>   	{ 0, 0, 0, 0 }
>   };
>   
> 
