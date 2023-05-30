Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E4410E11F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 05:40:19 +0000 (UTC)
Message-ID: <04813d07-c9b4-53fa-2068-6648ca5328a4@intel.com>
Date: Tue, 30 May 2023 11:10:06 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230518052722.249768-1-swati2.sharma@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230518052722.249768-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: add has_dsc()
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


On 5/18/2023 10:57 AM, Swati Sharma wrote:
> Instead of assuming dsc is supported gen11+, lets use has_dsc
> flag in i915_capability to check h/w support.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 3ce28f84..ad698f27 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -253,6 +253,24 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
>   	}
>   }
>   
> +static bool has_dsc(data_t *data)
> +{
> +	char buf[4096];
> +	int dir, res;
> +
> +	dir = igt_debugfs_dir(data->drm_fd);
> +	igt_assert(dir >= 0);
> +
> +	igt_require_intel(data->drm_fd);
> +
> +	res = igt_debugfs_simple_read(dir, "i915_capabilities",
> +				      buf, sizeof(buf));
> +	igt_require(res > 0);
> +	close(dir);
> +
> +	return strstr(buf, "has_dsc: yes");
> +}

Looks good to me.

I suggest we can have it in lib igt_kms,  and re-use this in 
kms_invalid_mode.c . There too we are checking for display version to 
get DSC support from source.

Regards,

Ankit


> +
>   igt_main
>   {
>   	data_t data = {};
> @@ -265,7 +283,7 @@ igt_main
>   		igt_install_exit_handler(kms_dsc_exit_handler);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> -		igt_require(data.disp_ver >= 11);
> +		igt_require(has_dsc(&data));
>   	}
>   
>   	igt_describe("Tests basic display stream compression functionality if supported "
