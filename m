Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CCA6E5B9
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 10:54:10 +0000 (UTC)
References: <20210813073858.1360821-1-mika.kahola@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <1278fcf3-2516-13ac-c374-799a45844dc4@intel.com>
Date: Fri, 13 Aug 2021 16:23:55 +0530
In-Reply-To: <20210813073858.1360821-1-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Limit plane
 testing to 3 planes by default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 8/13/2021 1:08 PM, Mika Kahola wrote:
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

I think we can remove the VLK reference.

With that, looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
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

