Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <300de67d-dba0-d753-2c86-df51026a6497@intel.com>
Date: Thu, 31 Aug 2023 17:39:33 +0530
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
References: <20230830233836.477940-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230830233836.477940-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_freq_api: Test s2idle
 instead of S3
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



On 8/31/2023 5:08 AM, Vinay Belgaumkar wrote:
> Test skips whenever S3 is not supported, use s2idle instead, which is
> widely enabled.
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/i915/i915_pm_freq_api.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
> index 2912287c4..03bd0d05b 100644
> --- a/tests/i915/i915_pm_freq_api.c
> +++ b/tests/i915/i915_pm_freq_api.c
> @@ -125,7 +125,7 @@ static void test_suspend(int i915, int dirfd, int gt)
>   		igt_assert_eq(req_freq, rpn);
>   
>   	/* Manually trigger a suspend */
> -	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
> +	igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
>   				      SUSPEND_TEST_NONE);
>   
>   	req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
