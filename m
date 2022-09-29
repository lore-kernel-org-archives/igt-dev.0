Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D7010E57C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 10:21:21 +0000 (UTC)
Message-ID: <b17f2395-ab87-ad30-38c4-913647605b8e@intel.com>
Date: Thu, 29 Sep 2022 15:51:03 +0530
Content-Language: en-US
To: Ananya Sharma <ananya.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220919102654.667916-1-ananya.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220919102654.667916-1-ananya.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_aux_dev: Convert test to
 dynamic
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

On Mon-19-09-2022 03:56 pm, Ananya Sharma wrote:
> Modified kms_dp_aux_dev to include dynamic test cases.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_dp_aux_dev.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index d3249fa3..ac12b500 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -118,7 +118,7 @@ static bool test(int drm_fd, uint32_t connector_id)
>   	return false;
>   }
>   
> -igt_simple_main
> +igt_main
>   {
>   	int valid_connectors = 0;
>   	drmModeRes *res;
> @@ -129,8 +129,13 @@ igt_simple_main
>   	res = drmModeGetResources(drm_fd);
>   	igt_require(res);

Move this drm resources part to igt_fixture

>   
> -	for (int i = 0; i < res->count_connectors; i++)
> -		valid_connectors += test(drm_fd, res->connectors[i]);
> +	igt_subtest_with_dynamic("basic") {
> +		for (int i = 0; i < res->count_connectors; i++)
> +			igt_dynamic_f("subtest-%d", i) {

Please use the connector name for dynamic subtest.

Example:
igt_dynamic_f("%s-%d",
	kmstest_connector_type_str(connector->connector_type),
	connector->connector_type_id)

> +				valid_connectors += test(drm_fd, res->connectors[i]);
> +			}
> +	}
> +
>   	igt_require(valid_connectors);

This check is not required in case of dynamic subtests, IGT will throw 
the SKIP if igt_dynamic() is not executed at least once.

>   
>   	drmModeFreeResources(res);

Move this part to igt_fixture.

- Bhanu
