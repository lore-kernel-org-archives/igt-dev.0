Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D0310E405
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 07:18:07 +0000 (UTC)
Message-ID: <d778af1c-e805-1e8b-bfa2-dce8a52ed500@intel.com>
Date: Wed, 6 Sep 2023 12:47:45 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230826050538.1184370-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230826050538.1184370-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/feature_discovery: detect mst
 configuration
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

Hi Swati,

On Sat-26-08-2023 10:35 am, Swati Sharma wrote:
> Add test to detect if we have mst configuration.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/feature_discovery.c | 14 ++++++++++++++

It is out of scope of this patch, but why don't we rename this test to 
kms_feature_discovery? since it is having display specific tests only.

>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/feature_discovery.c b/tests/feature_discovery.c
> index d1f4b1633..c160a51de 100644
> --- a/tests/feature_discovery.c
> +++ b/tests/feature_discovery.c
> @@ -113,5 +113,19 @@ igt_main {
>   		igt_subtest("psr2") {
>   			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2));
>   		}
> +
> +		igt_describe("Make sure that we have DP-MST configuration.");
> +		igt_subtest("dp-mst") {
> +			igt_output_t *output;
> +			enum pipe pipe;
> +			int ret;
> +			for_each_valid_output_on_pipe(&display, pipe, output) {
> +				igt_output_set_pipe(output, pipe);

Do we really need to set the output to pipe?
I think, we just need to iterate through connected outputs 
(for_each_connected_output) & check for the encoder (by parsing the 
'PATH' prop blob) is enough.

> +				ret = igt_check_output_is_dp_mst(output);

For me it looks like this change is trying to validate the IGT lib.

I can feel, it would be good to read the 'PATH' property blob & search 
for the encoder name to make sure it is a MST.

- Bhanu

> +				if (ret != 0)
> +					break;
> +			}
> +			igt_require(ret != 0);
> +		}
>   	}
>   }
