Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733588930B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Dec 2023 04:54:25 +0000 (UTC)
Message-ID: <2b4f115c-f084-499f-976d-365b791ea3d8@intel.com>
Date: Wed, 27 Dec 2023 10:24:13 +0530
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking:
 Cleanup pipe crc
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
References: <20231206083136.16099-1-nidhi1.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231206083136.16099-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 06-Dec-23 2:01 PM, Nidhi Gupta wrote:
> Before testing FBC on next pipe, cleanup pipe CRCs
> to avoid any mismatch.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 1daf27d2e..e10803b62 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -4532,6 +4532,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   					continue;
>   				}
>   
> +				pipe_crc = NULL;
> +				setup_crcs();
> +
>   				for_each_valid_output_on_pipe(&drm.display, pipe, output) {
>   					init_mode_params(&prim_mode_params, output, pipe);
>   					setup_fbc();
