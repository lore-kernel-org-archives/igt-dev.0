Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C8F10E2F6
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 15:50:08 +0000 (UTC)
Message-ID: <67551ede-6f15-4746-937e-beb756aa6116@intel.com>
Date: Wed, 22 Nov 2023 21:20:03 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231121082047.2037754-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231121082047.2037754-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/intel/kms_psr: Use blitter if
 rendercopy isn't present
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

On 21-Nov-23 1:50 PM, Bhanuprakash Modem wrote:
> As Rendercopy support in IGT is not present for few latest
> platforms. So, fallback to use Blitter if Rendercopy isn't
> present.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_psr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index 6b80f6f4b..afd74eaff 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -957,7 +957,7 @@ igt_main
>   				igt_display_reset(&data.display);
>   				data.output = output;
>   				igt_dynamic_f("%s", data.output->name) {
> -					data.op = RENDER;
> +					data.op = igt_get_render_copyfunc(data.devid) ? RENDER : BLT;
>   					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
>   					test_setup(&data);
>   					dpms_off_on(&data);
