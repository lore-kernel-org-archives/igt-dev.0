Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8416E10E599
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 09:24:03 +0000 (UTC)
Message-ID: <56dde28c-e484-0732-9ed9-d71794d49031@intel.com>
Date: Wed, 23 Mar 2022 14:53:49 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220323072223.566016-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220323072223.566016-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Limit the execution
 on simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 3/23/2022 12:52 PM, Bhanuprakash Modem wrote:
> Restrict the execution of all subtests to two pipes on simulation
> environment.
>
> If we want to execute on all pipes, need to pass an extra flag "-e"
> as a command line argument.
>
> Example: ./build/tests/kms_setmode -e --r basic
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_setmode.c | 38 +++++++++++++++++++++++++++++---------
>   1 file changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index d5cb45d438..5f879fb633 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -37,10 +37,14 @@
>   /* max combinations with repetitions */
>   #define MAX_COMBINATION_ELEMS   MAX_CRTCS
>   
> +/* restricted pipe count */
> +#define CRTC_RESTRICT_CNT 2
> +
>   static int drm_fd;
>   static drmModeRes *drm_resources;
>   static int filter_test_id;
>   static bool dry_run;
> +static bool extended = false;
>   
>   const drmModeModeInfo mode_640_480 = {
>   	.name		= "640x480",
> @@ -801,6 +805,18 @@ static void get_combinations(int n, int k, bool allow_repetitions,
>   	iterate_combinations(n, k, allow_repetitions, 0, 0, &comb, set);
>   }
>   
> +static int get_crtc_count(int count_crtcs, bool extend)
> +{
> +	if (igt_run_in_simulation()) {

Hi,

I agree with this idea of restricting the execution to 2 pipes. IMHO, we 
could remove this simulation check also and restrict the execution to 2 
pipes in all cases to optimize execution time on CI. Otherwise the 
execution time on CI for this test will be very high, especially if we 
configurations in which we have displays connected to all the pipes.

Thanks,

Karthik.B.S

> +		if ((count_crtcs <= CRTC_RESTRICT_CNT) || extend)
> +			return count_crtcs;
> +		else
> +			return CRTC_RESTRICT_CNT;
> +	}
> +
> +	return count_crtcs;
> +}
> +
>   static void test_combinations(const struct test_config *tconf,
>   			      int connector_count)
>   {
> @@ -808,6 +824,7 @@ static void test_combinations(const struct test_config *tconf,
>   	struct combination_set crtc_combs;
>   	struct connector_config *cconfs;
>   	int i;
> +	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
>   
>   	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
>   		return;
> @@ -815,17 +832,15 @@ static void test_combinations(const struct test_config *tconf,
>   	igt_assert(tconf->resources);
>   
>   	connector_combs.capacity = pow(tconf->resources->count_connectors,
> -				       tconf->resources->count_crtcs + 1);
> -	crtc_combs.capacity = pow(tconf->resources->count_crtcs,
> -				  tconf->resources->count_crtcs + 1);
> -
> +				       crtc_count + 1);
> +	crtc_combs.capacity = pow(crtc_count,
> +				  crtc_count + 1);
>   	connector_combs.items = malloc(connector_combs.capacity * sizeof(struct combination));
>   	crtc_combs.items = malloc(crtc_combs.capacity * sizeof(struct combination));
>   
>   	get_combinations(tconf->resources->count_connectors, connector_count,
>   			 false, &connector_combs);
> -	get_combinations(tconf->resources->count_crtcs, connector_count,
> -			 true, &crtc_combs);
> +	get_combinations(crtc_count, connector_count, true, &crtc_combs);
>   
>   	igt_info("Testing: %s %d connector combinations\n", tconf->name,
>   		 connector_count);
> @@ -866,9 +881,10 @@ free_cconfs:
>   static void run_test(const struct test_config *tconf)
>   {
>   	int connector_num;
> +	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
>   
>   	connector_num = tconf->flags & TEST_CLONE ? 2 : 1;
> -	for (; connector_num <= tconf->resources->count_crtcs; connector_num++)
> +	for (; connector_num <= crtc_count; connector_num++)
>   		test_combinations(tconf, connector_num);
>   }
>   
> @@ -878,6 +894,9 @@ static int opt_handler(int opt, int opt_index, void *data)
>   	case 'd':
>   		dry_run = true;
>   		break;
> +	case 'e':
> +		extended = true;
> +		break;
>   	case 't':
>   		filter_test_id = atoi(optarg);
>   		break;
> @@ -890,9 +909,10 @@ static int opt_handler(int opt, int opt_index, void *data)
>   
>   const char *help_str =
>   	"  -d\t\tDon't run any test, only print what would be done. (still needs DRM access)\n"
> -	"  -t <test id>\tRun only the test with this id.";
> +	"  -t <test id>\tRun only the test with this id\n"
> +	"  -e \t\tRun on all pipes. (Default it will Run only two pipes)\n";
>   
> -igt_main_args("dt:", NULL, help_str, opt_handler, NULL)
> +igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>   {
>   	const struct {
>   		enum test_flags flags;

