Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B036E10E59C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 05:18:49 +0000 (UTC)
Message-ID: <1279e768-acdf-b4eb-1c8c-cac64a2c5d84@intel.com>
Date: Fri, 13 Oct 2023 10:48:38 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231011090231.65619-1-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231011090231.65619-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/kms_flip_tiling: pipe_name
 followed by output_name
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


On 10/11/2023 2:32 PM, Swati Sharma wrote:
> Use pipe_name followed by output_name.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_flip_tiling.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index 44121d7cf..295f097ec 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -229,9 +229,9 @@ igt_main
>   					if (plane->formats[j] != data.testformat)
>   						continue;
>   
> -					igt_dynamic_f("%s-pipe-%s-%s-to-%s",
> -						      igt_output_name(output),
> +					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
>   						      kmstest_pipe_name(pipe),
> +						      igt_output_name(output),
>   						      igt_fb_modifier_name(modifier[0]),
>   						      igt_fb_modifier_name(modifier[1]))
>   						test_flip_tiling(&data, pipe, output, modifier);
