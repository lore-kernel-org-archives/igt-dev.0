Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A41310E811
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 16:47:39 +0000 (UTC)
Message-ID: <a4c2cc23-6bfd-5e55-b863-e5379b3a324c@intel.com>
Date: Thu, 7 Sep 2023 22:17:13 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230907143214.1280453-1-swati2.sharma@intel.com>
 <20230907143214.1280453-4-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230907143214.1280453-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_feature_discovery: detect
 mst configuration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Swati,

On Thu-07-09-2023 08:02 pm, Swati Sharma wrote:
> Add test to detect if we have mst configuration.
> 
> v2: -use for_each_connected_output() (Bhanu)
>      -don't use helper (Bhanu)
>      -add documentation
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_feature_discovery.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 49958fd88..a178010d6 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -71,6 +71,14 @@
>    * Run type: FULL
>    * Test category: functionality test
>    *
> + * SUBTEST: dp-mst
> + * Description: Make sure that we have DP-MST configuration.
> + * Driver requirement: i915, xe
> + * Functionality: feature_discovery, mst
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
>    * arg[1].values: 2, 3, 4
>    */
>   
> @@ -164,5 +172,23 @@ igt_main {
>   		igt_subtest("psr2") {
>   			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2));
>   		}
> +
> +		igt_describe("Make sure that we have DP-MST configuration.");
> +		igt_subtest("dp-mst") {
> +			struct kmstest_connector_config config;
> +			igt_output_t *output;
> +			const char *encoder;
> +			int ret;
----------------------------^
Please initialize 'ret' with -1, otherwise test will send a false 
positive on headless configs.

> +
> +			for_each_connected_output(&display, output) {
> +				kmstest_get_connector_config(fd, output->config.connector->connector_id, -1, &config);
> +				encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
> +
> +				ret = strcmp(encoder, "DP MST");
> +				if (ret == 0)
> +					break;
> +			}
> +			igt_require(ret == 0);

Please add some meaningful message on skip.

- Bhanu

> +		}
>   	}
>   }
