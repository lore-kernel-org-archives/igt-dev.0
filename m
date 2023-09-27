Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A64B10E4BB
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 09:26:38 +0000 (UTC)
Message-ID: <9ed8126f-0730-1c6f-e170-8bba76efb73d@intel.com>
Date: Wed, 27 Sep 2023 14:56:05 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230927080013.514326-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230927080013.514326-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/kms_psr2_su: fix
 igt_require_f() print message
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


On Wed-27-09-2023 01:30 pm, Swati Sharma wrote:
> The condition holds for display 13+ platforms. Fix print message.
> 
> v2: -fixed subject
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_psr2_su.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
> index 321144d6b..834fec1ec 100644
> --- a/tests/intel/kms_psr2_su.c
> +++ b/tests/intel/kms_psr2_su.c
> @@ -331,7 +331,7 @@ igt_main
>   			      "Sink does not support PSR2\n");
>   
>   		igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 13,
> -			      "Registers used by this test do not work on display 13\n");
> +			      "Registers used by this test do not work on display 13+\n");
>   
>   		display_init(&data);
>   
