Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6692B10E3FE
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 15:43:19 +0000 (UTC)
Message-ID: <81ed0dd1-49ef-ce96-4129-8f7d4d927666@intel.com>
Date: Tue, 26 Sep 2023 21:12:54 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230925142621.479730-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230925142621.479730-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/kms_psr2_su: fix
 igt_require_f() condition
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


On Mon-25-09-2023 07:56 pm, Swati Sharma wrote:
> The condition holds for display 13+ platforms. Fix that.

This patch is fixing the print message not the condition. Please update 
the commit subject & message.

- Bhanu

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
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
