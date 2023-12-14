Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B6210E0F8
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 17:50:08 +0000 (UTC)
Message-ID: <3bb30a92-ba3d-49fa-9bcc-18d3ff09cf87@intel.com>
Date: Thu, 14 Dec 2023 09:50:01 -0800
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/intel/xe_guc_pc: Fix
 freq_low_max test
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231124102946.2650848-1-badal.nilawar@intel.com>
 <20231124102946.2650848-3-badal.nilawar@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20231124102946.2650848-3-badal.nilawar@intel.com>
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
List-ID: <igt-dev@lists.freedesktop.org>


On 11/24/2023 2:29 AM, Badal Nilawar wrote:
> freq_low_max test is intended to validate GuC PC (SLPC) behaviour
> when max freq set to less than min freq. As workloads are not being
> run validating cur freq is enough.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_guc_pc.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
> index c23017501..70548ba0e 100644
> --- a/tests/intel/xe_guc_pc.c
> +++ b/tests/intel/xe_guc_pc.c
> @@ -220,7 +220,6 @@ static void test_freq_low_max(int fd, int gt_id)
>   	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
>   	usleep(ACT_FREQ_LATENCY_US);
>   	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
> -	igt_assert(get_freq(fd, gt_id, "act") == rpe);

might be worth keeping this check with if (!in_rc6()). We hardly check 
for actual frequency, this will be a good way to ensure we can even get 
efficient freq.

Thanks,

Vinay.

>   }
>   
>   /**
