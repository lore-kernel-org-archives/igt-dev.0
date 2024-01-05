Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f22b744c-df29-4f88-9cc5-899c79c50487@intel.com>
Date: Fri, 5 Jan 2024 21:19:47 +0530
Subject: Re: [v2] tests/intel/kms_dsc: add new constraint
References: <20240105090243.58192-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240105090243.58192-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Message-ID: <20240105154947.U1Za-fRcjU-pc5Vso7AMTQUDY_ifaCxw2s9BDtDKjjg@z>


On 1/5/2024 2:32 PM, Swati Sharma wrote:
> If output max bpc is less than min dsc bpc (8) which is supported
> by intel driver, don't execute test.
>
> v2: -club all checks together (Ankit)
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1066
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

> ---
>   tests/intel/kms_dsc.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 3433e0907..b5c0fa6ab 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -63,6 +63,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   #define LEN		20
>   #define DEFAULT_BPC	0
> +#define MIN_DSC_BPC	8
>   
>   #define TEST_DSC_BASIC		(0<<0)
>   #define TEST_DSC_BPC		(1<<0)
> @@ -279,8 +280,9 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		data->output = output;
>   		data->pipe = pipe;
>   
> -		if (!(is_dsc_supported_by_sink(data->drm_fd, data->output) &&
> -		      check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe)))
> +		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> +		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe) ||
> +		     igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
>   			continue;
>   
>   		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
